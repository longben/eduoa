<?php
class CurriculumSchedulesController extends AppController {

	var $name = 'CurriculumSchedules';
	var $helpers = array('Html', 'Form', 'Javascript');
	var $uses = array('Hour', 'Week', 'CurriculumSchedule');

	function index() {
		$this->CurriculumSchedule->recursive = 0;
		$this->set('hours', $this->Hour->findAll());
		$this->set('weeks', $this->Week->findAll());

		$this->set('classrooms', $this->CurriculumSchedule->Classroom->generateList(
							$conditions = null,
							$order = 'id',
							$limit = null,
							$KeyPath = '{n}.Classroom.id',
							$valuePath = '{n}.Classroom.classroom_name')
		);
		$this->set('courses', $this->CurriculumSchedule->Course->generateList(
							$conditions = null,
							$order = 'id',
							$limit = null,
							$KeyPath = '{n}.Course.id',
							$valuePath = '{n}.Course.course_name')
		);
		$this->set('teachers', $this->CurriculumSchedule->Teacher->generateList(
							$conditions = null,
							$order = 'id',
							$limit = null,
							$KeyPath = '{n}.Teacher.id',
							$valuePath = '{n}.Teacher.teacher_name')
		);

		//$this->set('curriculumSchedules', $this->CurriculumSchedule->findAll());
	}

	function view($id = null) {


	}

	function add($banji_id = null, 
		         $semester_id = null, 
		         $classroom_id = null, 
		         $course_id = null, 
		         $teacher_id = null, 
		         $hour_id = null, $week_id = null) {

		$this->cleanUpFields();
		$this->data['CurriculumSchedule']['banji_id'] = $banji_id;
		$this->data['CurriculumSchedule']['semester_id'] = $semester_id;
		$this->data['CurriculumSchedule']['classroom_id'] = $classroom_id;
		$this->data['CurriculumSchedule']['course_id'] = $course_id;
		$this->data['CurriculumSchedule']['teacher_id'] = $teacher_id;
		$this->data['CurriculumSchedule']['hour_id'] = $hour_id;
		$this->data['CurriculumSchedule']['week_id'] = $week_id;

		if ($this->CurriculumSchedule->save($this->data)) {
		}

	}

	function edit($id = null) {
		if (empty($this->data)) {
			if (!$id) {
				$this->Session->setFlash('Invalid id for Curriculum Schedule');
				$this->redirect('/curriculum_schedules/index');
			}
			$this->data = $this->CurriculumSchedule->read(null, $id);
			$this->set('banjis', $this->CurriculumSchedule->Banji->generateList());
			$this->set('semesters', $this->CurriculumSchedule->Semester->generateList());
			$this->set('classrooms', $this->CurriculumSchedule->Classroom->generateList());
			$this->set('courses', $this->CurriculumSchedule->Course->generateList());
			$this->set('teachers', $this->CurriculumSchedule->Teacher->generateList());
			$this->set('hours', $this->CurriculumSchedule->Hour->generateList());
			$this->set('weeks', $this->CurriculumSchedule->Week->generateList());
		} else {
			$this->cleanUpFields();
			if ($this->CurriculumSchedule->save($this->data)) {
				$this->Session->setFlash('The CurriculumSchedule has been saved');
				$this->redirect('/curriculum_schedules/index');
			} else {
				$this->Session->setFlash('Please correct errors below.');
				$this->set('banjis', $this->CurriculumSchedule->Banji->generateList());
				$this->set('semesters', $this->CurriculumSchedule->Semester->generateList());
				$this->set('classrooms', $this->CurriculumSchedule->Classroom->generateList());
				$this->set('courses', $this->CurriculumSchedule->Course->generateList());
				$this->set('teachers', $this->CurriculumSchedule->Teacher->generateList());
				$this->set('hours', $this->CurriculumSchedule->Hour->generateList());
				$this->set('weeks', $this->CurriculumSchedule->Week->generateList());
			}
		}
	}

	function delete($banji = null, $semester = null, $hour = null, $week = null) {
		$sql  = "delete from curriculum_schedules";
		$sql .= " where banji_id = $banji and semester_id = $semester and hour_id = $hour and week_id = $week"; 
		
		if ($banji != null) {
			$this->CurriculumSchedule->execute($sql);
		}
	}

	function findFlag($banji = null, $semester = null, $hour = null, $week = null){
		$criteria = "banji_id = $banji and semester_id = $semester and hour_id = $hour and week_id = $week";
		return $this->CurriculumSchedule->find($criteria);
	}

	function findScheduleByTeacher($teacher = null, $semester = null, $hour = null, $week = null){
		$criteria = "CurriculumSchedule.teacher_id = $teacher and CurriculumSchedule.semester_id = $semester and CurriculumSchedule.hour_id = $hour and CurriculumSchedule.week_id = $week";
		return $this->CurriculumSchedule->find($criteria);
	}

	function findScheduleByBanji($banji = null, $semester = null, $hour = null, $week = null){
		$criteria = "CurriculumSchedule.banji_id = $banji and CurriculumSchedule.semester_id = $semester and CurriculumSchedule.hour_id = $hour and CurriculumSchedule.week_id = $week";
		return $this->CurriculumSchedule->find($criteria);
	}

	function findScheduleByClassroom($classroom = null, $semester = null, $hour = null, $week = null){
		$criteria = "CurriculumSchedule.classroom_id = $classroom and CurriculumSchedule.semester_id = $semester and CurriculumSchedule.hour_id = $hour and CurriculumSchedule.week_id = $week";
		return $this->CurriculumSchedule->find($criteria);
	}

	function findStatisticsByTeacher($teacher = null, $semester = null){
		$criteria = "CurriculumSchedule.teacher_id = $teacher and CurriculumSchedule.semester_id = $semester";
		return $this->CurriculumSchedule->findCount($criteria);
	}

   function teacher() {
		$this->set('semesters', $this->CurriculumSchedule->Semester->generateList(
							$conditions = null,
							$order = 'is_current desc',
							$limit = null,
							$KeyPath = '{n}.Semester.id',
							$valuePath = '{n}.Semester.semester_name')
		);
		$this->set('teachers', $this->CurriculumSchedule->Teacher->findAll());
   }

   function teacher_view() {
		$this->CurriculumSchedule->recursive = 0;
		$this->set('hours', $this->Hour->findAll());
		$this->set('weeks', $this->Week->findAll());
   }

   function banji() {
		$this->set('semesters', $this->CurriculumSchedule->Semester->generateList(
							$conditions = null,
							$order = 'is_current desc',
							$limit = null,
							$KeyPath = '{n}.Semester.id',
							$valuePath = '{n}.Semester.semester_name')
		);
		$this->set('banjis', $this->CurriculumSchedule->Banji->findAll());
   }

   function banji_view() {
		$this->CurriculumSchedule->recursive = 0;
		$this->set('hours', $this->Hour->findAll());
		$this->set('weeks', $this->Week->findAll());
   }

   function banji_view_www() {
	    $this->layout = 'site';
		$this->CurriculumSchedule->recursive = 0;
		$this->set('hours', $this->Hour->findAll());
		$this->set('weeks', $this->Week->findAll());
   }

   function classroom() {
		$this->set('semesters', $this->CurriculumSchedule->Semester->generateList(
							$conditions = null,
							$order = 'is_current desc',
							$limit = null,
							$KeyPath = '{n}.Semester.id',
							$valuePath = '{n}.Semester.semester_name')
		);
		$this->set('classrooms', $this->CurriculumSchedule->Classroom->findAll());
   }

   function classroom_view() {
		$this->CurriculumSchedule->recursive = 0;
		$this->set('hours', $this->Hour->findAll());
		$this->set('weeks', $this->Week->findAll());
   }

   function statistics($id = null, $semester_name = null) {
	   $this->set('semesters', $this->CurriculumSchedule->Semester->findAll());
	   if($id!=null){
		   $this->set('teachers', $this->CurriculumSchedule->Teacher->findAll());
		   $this->set('semester_name', $semester_name);
	   }else{
		   $this->set('teachers', null);
	   }
   }

}
?>