<?php
class ExamResultsController extends AppController {

	var $name = 'ExamResults';
	var $helpers = array('Html', 'Form', 'Javascript', 'Csv');
	var $uses = array('ExamResult','Banji');

	function index() {
		$this->ExamResult->recursive = 0;
		$this->set('examResults', $this->ExamResult->findAll());
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash('Invalid id for Exam Result.');
			$this->redirect('/exam_results/index');
		}
		$this->set('examResult', $this->ExamResult->read(null, $id));
	}

	function add($student_id = null, $exam_id = null, $semester_id = null, $course_id = null, $score = null) {
		$this->layout = 'ajax';
		$this->data['ExamResult']['student_id'] = $student_id;
		//$this->data['ExamResult']['exam_id'] = $exam_id;
		$this->data['ExamResult']['semester_id'] = $semester_id;
		$this->data['ExamResult']['course_id'] = $course_id;
		$this->data['ExamResult']['score'] = $score;

		$sql = "delete from exam_results where student_id = " . $this->data['ExamResult']['student_id'];
		$sql .= " and semester_id = " . $this->data['ExamResult']['semester_id'];
		//$sql .= " and exam_id = " . $this->data['ExamResult']['exam_id'];
		$sql .= " and course_id = " . $this->data['ExamResult']['course_id'];
		//echo $sql;
		$this->ExamResult->execute($sql);

		if ($this->ExamResult->save($this->data)) {
		}
	}

	function edit($id = null) {
		if (empty($this->data)) {
			if (!$id) {
				$this->Session->setFlash('Invalid id for Exam Result');
				$this->redirect('/exam_results/index');
			}
			$this->data = $this->ExamResult->read(null, $id);
			$this->set('students', $this->ExamResult->Student->generateList());
			$this->set('exams', $this->ExamResult->Exam->generateList());
			$this->set('semesters', $this->ExamResult->Semester->generateList());
			$this->set('courses', $this->ExamResult->Course->generateList());
		} else {
			$this->cleanUpFields();
			if ($this->ExamResult->save($this->data)) {
				$this->Session->setFlash('The ExamResult has been saved');
				$this->redirect('/exam_results/index');
			} else {
				$this->Session->setFlash('Please correct errors below.');
				$this->set('students', $this->ExamResult->Student->generateList());
				$this->set('exams', $this->ExamResult->Exam->generateList());
				$this->set('semesters', $this->ExamResult->Semester->generateList());
				$this->set('courses', $this->ExamResult->Course->generateList());
			}
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash('Invalid id for Exam Result');
			$this->redirect('/exam_results/index');
		}
		if ($this->ExamResult->del($id)) {
			$this->Session->setFlash('The Exam Result deleted: id '.$id.'');
			$this->redirect('/exam_results/index');
		}
	}

	function import() {
		if (empty($this->data)) {
			$this->set('semesters', $this->ExamResult->Semester->generateList(
			$conditions = null,
			$order = 'id',
			$limit = null,
			$KeyPath = '{n}.Semester.id',
			$valuePath = '{n}.Semester.semester_name')
			);
			$this->set('courses', $this->ExamResult->Course->generateList(
			$conditions = null,
			$order = 'id',
			$limit = null,
			$KeyPath = '{n}.Course.id',
			$valuePath = '{n}.Course.course_name')
			);
			$this->set('banjis', $this->Banji->generateList(
			$conditions = null,
			$order = 'id',
			$limit = null,
			$KeyPath = '{n}.Banji.id',
			$valuePath = '{n}.Banji.class_name')
			);
			$this->render();
		} else {
			$this->cleanUpFields();
			if (isset($this->params['form']['Filedata'])) {
				$fname = $this->params['form']['Filedata']['name'];
				if(copy($this->params['form']['Filedata']['tmp_name'],$fname)){
					$handle=fopen("$fname","r");
					$count = 0;
					$semester = $this->data['ExamResult']['semester']; //学期
					$banji = $this->data['ExamResult']['banji']; //班级
					$course = $this->data['ExamResult']['course']; //课程

					//在批量导入成绩前，先删除整个班级对应课程的成绩，再重新insert
					$del_sql = "delete from exam_results where course_id = ".$course." and student_id in (select id from students where banji_id =". $banji.")";
					$this->ExamResult->execute($del_sql);

					while($data=fgetcsv($handle,10000,",")){
						if($count >0){
							$sql = "insert into exam_results (student_id,semester_id,course_id,score)";
							$sql .= " values ('$data[0]','$semester', '$course', '$data[2]')";
							$this->ExamResult->execute($sql);
						}
						$count++;
					}
					$this->Session->setFlash('导入学生成绩成功！');
					$this->redirect('/exam_results/import');
					exit();
				}else{
					$this->set('semesters', $this->ExamResult->Semester->generateList(
						$conditions = null,
						$order = 'id',
						$limit = null,
						$KeyPath = '{n}.Semester.id',
						$valuePath = '{n}.Semester.semester_name')
					);
					$this->set('courses', $this->ExamResult->Course->generateList(
						$conditions = null,
						$order = 'id',
						$limit = null,
						$KeyPath = '{n}.Course.id',
						$valuePath = '{n}.Course.course_name')
					);
					$this->set('banjis', $this->Banji->generateList(
						$conditions = null,
						$order = 'id',
						$limit = null,
						$KeyPath = '{n}.Banji.id',
						$valuePath = '{n}.Banji.class_name')
					);
					$this->Session->setFlash('上传文件失败！');
					$this->redirect('/exam_results/import');
					exit();
				}
			}
		}
	}

	function change() {
		if (empty($this->data)) {
			$this->set('semesters', $this->ExamResult->Semester->generateList(
			$conditions = null,
			$order = 'id',
			$limit = null,
			$KeyPath = '{n}.Semester.id',
			$valuePath = '{n}.Semester.semester_name')
			);
			$this->set('courses', $this->ExamResult->Course->generateList(
			$conditions = null,
			$order = 'id',
			$limit = null,
			$KeyPath = '{n}.Course.id',
			$valuePath = '{n}.Course.course_name')
			);
			$this->set('banjis', $this->Banji->generateList(
			$conditions = null,
			$order = 'id',
			$limit = null,
			$KeyPath = '{n}.Banji.id',
			$valuePath = '{n}.Banji.class_name')
			);
			$this->render();
		} else {
			$this->cleanUpFields();
			if ($this->ExamResult->save($this->data)) {
				$this->Session->setFlash('The Exam Result has been saved');
				$this->redirect('/exam_results/index');
			} else {
				$this->Session->setFlash('Please correct errors below.');
				$this->set('students', $this->ExamResult->Student->generateList());
				$this->set('exams', $this->ExamResult->Exam->generateList());
				$this->set('semesters', $this->ExamResult->Semester->generateList());
				$this->set('courses', $this->ExamResult->Course->generateList());
			}
		}
	}


   function exam_query() {
		if (empty($this->data)) {
			$this->set('semesters', $this->ExamResult->Semester->generateList(
							$conditions = null,
							$order = 'id',
							$limit = null,
							$KeyPath = '{n}.Semester.id',
							$valuePath = '{n}.Semester.semester_name')
			);
			$this->set('courses', $this->ExamResult->Course->generateList(
							$conditions = null,
							$order = 'id',
							$limit = null,
							$KeyPath = '{n}.Course.id',
							$valuePath = '{n}.Course.course_name')
			);
			
			$this->Banji->recursive = 0;
			$this->set('years', $this->Banji->findAll('group by Banji.entrance_year'));

			$this->render();
		} else {
			$this->cleanUpFields();
			if ($this->ExamResult->save($this->data)) {
				$this->Session->setFlash('The Exam Result has been saved');
				$this->redirect('/exam_results/index');
			} else {
				$this->Session->setFlash('Please correct errors below.');
				$this->set('students', $this->ExamResult->Student->generateList());
				$this->set('exams', $this->ExamResult->Exam->generateList());
				$this->set('semesters', $this->ExamResult->Semester->generateList());
				$this->set('courses', $this->ExamResult->Course->generateList());
			}
		}
   }


	function download($banji_id = null, $banji_name = null, $semester_name = null, $course_name = null) {
		$this->layout = 'ajax_gb';
		$this->set('students', $this->ExamResult->Student->findAllByBanjiId($banji_id));
		$this->set('banji_name', $banji_name);
		$this->set('semester_name', $semester_name);
		$this->set('course_name', $course_name);
	}

	function student(){
		$this->ExamResult->recursive = 0;
		$this->set('students',$this->ExamResult->Student->findAll("Student.banji_id = ".$this->data['ExamResult']['banji']));
		$this->set('semester',$this->data['ExamResult']['semester']);
		$this->set('course',$this->data['ExamResult']['course']);
		$this->set('exam','1');
	}

	function findScore($student_id = null, $exam_id = null, $semester_id = null, $course_id = null){
		$conditions = "ExamResult.student_id=$student_id and ExamResult.semester_id = $semester_id";
		$conditions .= " and ExamResult.course_id = $course_id";
		return $this->ExamResult->field('score', $conditions);
    }

   function exam_list($banji_id = null, $semester_id = null, $semester_name = null) {
	   $this->set('semester_name',$semester_name);
	   $this->set('semester_id', $semester_id);
	   $this->set('students',$this->ExamResult->Student->findAllByBanjiId($banji_id));
	   $this->set('courses',$this->ExamResult->Course->findAll('order by Course.id'));
	   $this->set('banji', $this->Banji->read(null,$banji_id));
   }

   function semester($entrance_year = null, $semester_id = null, $semester_name = null){
	   $this->set('semester_name',$semester_name);
	   $this->set('semester_id', $semester_id);
	   $this->set('entrance_year', $entrance_year);
	   $this->set('students',$this->ExamResult->Student->findAll('Banji.entrance_year = '.$entrance_year));
	   $this->set('courses',$this->ExamResult->Course->findAll('order by Course.id'));
   }

   function single_list($entrance_year = null, $semester_id = null, $semester_name = null){
	   $this->set('semester_name',$semester_name);
	   $this->set('semester_id', $semester_id);
	   $this->set('entrance_year', $entrance_year);
	   $this->set('students',$this->ExamResult->Student->findAll('Banji.entrance_year = '.$entrance_year));
	   $this->set('courses',$this->ExamResult->Course->findAll('order by Course.id'));
   }

   function average($entrance_year = null, $semester_id = null, $semester_name = null) {
	   $this->set('semester_name',$semester_name);
	   $this->set('semester_id', $semester_id);
	   $this->set('entrance_year', $entrance_year);
	   $this->set('courses',$this->ExamResult->Course->findAll('order by Course.id'));
   }

   function flunk_stat($entrance_year = null, $semester_id = null, $semester_name = null) {
	   $this->set('semester_name',$semester_name);
	   $this->set('semester_id', $semester_id);
	   $this->set('entrance_year', $entrance_year);
	   $this->set('courses',$this->ExamResult->Course->findAll('order by Course.id'));
   }

   function statistics($entrance_year = null, $semester_id = null, $semester_name = null) {
	   $this->set('semester_name',$semester_name);
	   $this->set('semester_id', $semester_id);
	   $this->set('entrance_year', $entrance_year);
	   $this->set('courses',$this->ExamResult->Course->findAll('order by Course.id'));

	   $score = array(
		   array('130-140', 'score>=130 and score<140'),
		   array('120-130', 'score>=120 and score<130'),
		   array('110-120', 'score>=110 and score<120'),
		   array('90-100', 'score>=90 and score<100'),
		   array('80-90', 'score>=80 and score<90'),
		   array('70-80', 'score>=70 and score<80'),
		   array('60-70', 'score>=60 and score<70'),
		   array('50-60', 'score>=50 and score<60'),
		   array('40-50', 'score>=40 and score<50'),
		   array('30-40', 'score>=30 and score<40'),
		   array('20-30', 'score>=20 and score<30'),
		   array('0-20', 'score>=0 and score<20'),
	   );
	   $this->set('score',$score);
   }

   function flunk_list($entrance_year = null, $semester_id = null, $semester_name = null) {
	   $this->set('semester_name',$semester_name);
	   $this->set('semester_id', $semester_id);
	   $this->set('entrance_year', $entrance_year);
	   $conditions = 'exists (select * from exam_results ExamResult where ExamResult.student_id = Student.id';
	   $conditions .= ' and ExamResult.score < 60)';
	   $this->set('students',$this->ExamResult->Student->findAll($conditions));
	   $this->set('courses',$this->ExamResult->Course->findAll('order by Course.id'));
   }

   //成绩分析
   function exam_list2($banji_id = null, $entrance_year = null, $semester_id = null, $semester_name = null) {
	   $this->set('banji_id', $banji_id);
	   $this->set('semester_name', $semester_name);
	   $this->set('semester_id', $semester_id);
	   $this->set('entrance_year', $entrance_year);
	   $this->set('courses', $this->ExamResult->Course->findAll('order by Course.id'));

	   $score = array(
		   array('130-140', 'score>=130 and score<140'),
		   array('120-130', 'score>=120 and score<130'),
		   array('110-120', 'score>=110 and score<120'),
		   array('90-100', 'score>=90 and score<100'),
		   array('80-90', 'score>=80 and score<90'),
		   array('70-80', 'score>=70 and score<80'),
		   array('60-70', 'score>=60 and score<70'),
		   array('50-60', 'score>=50 and score<60'),
		   array('40-50', 'score>=40 and score<50'),
		   array('30-40', 'score>=30 and score<40'),
		   array('20-30', 'score>=20 and score<30'),
		   array('0-20', 'score>=0 and score<20'),
	   );
	   $this->set('score',$score);
   }

   //分班不分科成绩平均
   function class_average($banji_id = null, $semester_id = null, $semester_name = null) {
	   $this->set('banjis', $this->Banji->findAll());
	   $this->set('banji_id', $banji_id);
	   $this->set('semester_name', $semester_name);
	   $this->set('semester_id', $semester_id);
   } 

   //分科不分班成绩平均 
   function course_average($entrance_year = null, $semester_id = null, $semester_name = null) {
	   $this->set('semester_name', $semester_name);
	   $this->set('semester_id', $semester_id);
	   $this->set('entrance_year', $entrance_year);
	   $this->set('courses', $this->ExamResult->Course->findAll('order by Course.id'));
   }

   //分科分班平均成绩
   function class_course_average($entrance_year = null, $semester_id = null, $semester_name = null) {
	   $this->set('semester_id', $semester_id);
	   $this->set('entrance_year', $entrance_year);
	   $this->set('semester_name', $semester_name);
	   $this->set('banjis', $this->Banji->findAll());
	   $this->set('courses', $this->ExamResult->Course->findAll('order by Course.id'));
   }

   //尖子生各班所占比例
   function goodstudent($banji_id = null, $semester_id = null, $semester_name = null) {
	   $this->set('banjis', $this->Banji->findAll());
	   $this->set('banji_id', $banji_id);
	   $this->set('semester_name', $semester_name);
	   $this->set('semester_id', $semester_id);
   }

   //尖子生各班各科目所占比例
   function teacher_goodstudent($entrance_year = null, $semester_id = null, $semester_name = null) {
	   $this->set('semester_id', $semester_id);
	   $this->set('entrance_year', $entrance_year);
	   $this->set('semester_name', $semester_name);
	   $this->set('banjis', $this->Banji->findAll());
	   $this->set('courses', $this->ExamResult->Course->findAll('order by Course.id'));
   }
}
?>