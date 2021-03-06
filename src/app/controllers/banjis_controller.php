<?php
class BanjisController extends AppController {

	var $name = 'Banjis';
	var $components = array('Acl','AjaxValid','Pagination');//Make sure you include this, it makes the magic work.
	var $helpers = array('Html', 'Javascript', 'Ajax', 'Form', 'Time','Pagination');

	function index($keyword = null, $page=1) {
		$this->Banji->recursive = 0;

		$criteria = " ";
		if($keyword == null){
			$keyword = $this->data['Banji']['keyword'];
		}		
		if($keyword != null){
			$criteria = " Banji.class_name like '%$keyword%' ";
		}

		list($order,$limit,$page) = $this->Pagination->init($criteria,null,array('ajaxDivUpdate'=>'cs','url'=> 'index/'.$keyword));
		
		$data = $this->Banji->findAll($criteria, NULL, null, $limit, $page); 			
		$this->set('banjis',$data);
	}

	function view($id = null) {
		if (!$id) {
			$this->Session->setFlash('Invalid id for Banji.');
			$this->redirect('/banjis/index');
		}
		$this->set('banji', $this->Banji->read(null, $id));
	}

	function add() {
		if (empty($this->data)) {
			/*
			$this->set('teachers', $this->Banji->Teacher->generateList());
			$this->set('academicYears', $this->Banji->AcademicYear->generateList());
			$this->set('classrooms', $this->Banji->Classroom->generateList());
			*/
			$this->set('teachers', 
					   $this->Banji->Teacher->generateList(
						 $conditions = null,
						 $order = 'id',
						 $limit = null,
						 $keyPath = '{n}.Teacher.id',
						 $valuePath = '{n}.Teacher.teacher_name')
			);
			$this->set('academicYears', 
					   $this->Banji->AcademicYear->generateList(
						 $conditions = null,
						 $order = 'id',
						 $limit = null,
						 $keyPath = '{n}.AcademicYear.id',
						 $valuePath = '{n}.AcademicYear.ay_name')
			);
			$this->set('classrooms', 
					   $this->Banji->Classroom->generateList(
						 $conditions = null,
						 $order = 'id',
						 $limit = null,
						 $keyPath = '{n}.Classroom.id',
						 $valuePath = '{n}.Classroom.classroom_name')
			);

			$keys = array();
			$vals = array();
			for($i=2000; $i<=2020; $i++) {
				$keys = array_merge($keys,array($i));
				$vals = array_merge($vals,array($i));
			}
			$selY = array_combine($keys, $vals);




			$this->set('entranceYears',$selY);
			$this->render();
		} else {
			$this->cleanUpFields();
			if ($this->Banji->save($this->data)) {
				$this->Session->setFlash('班级新增成功！');
				$this->redirect('/banjis/index');
			} else {
				$this->Session->setFlash('Please correct errors below.');
				$this->set('teachers', $this->Banji->Teacher->generateList());
				$this->set('academicYears', $this->Banji->AcademicYear->generateList());
				$this->set('classrooms', $this->Banji->Classroom->generateList());
			}
		}
	}

	function edit($id = null) {
		if (empty($this->data)) {
			if (!$id) {
				$this->Session->setFlash('Invalid id for Banji');
				$this->redirect('/banjis/index');
			}
			$this->data = $this->Banji->read(null, $id);
			$this->set('teachers', 
					   $this->Banji->Teacher->generateList(
						 $conditions = null,
						 $order = 'id',
						 $limit = null,
						 $keyPath = '{n}.Teacher.id',
						 $valuePath = '{n}.Teacher.teacher_name')
			);
			$this->set('academicYears', 
					   $this->Banji->AcademicYear->generateList(
						 $conditions = null,
						 $order = 'id',
						 $limit = null,
						 $keyPath = '{n}.AcademicYear.id',
						 $valuePath = '{n}.AcademicYear.ay_name')
			);
			$this->set('classrooms', 
					   $this->Banji->Classroom->generateList(
						 $conditions = null,
						 $order = 'id',
						 $limit = null,
						 $keyPath = '{n}.Classroom.id',
						 $valuePath = '{n}.Classroom.classroom_name')
			);

			$keys = array();
			$vals = array();
			for($i=2000; $i<=2020; $i++) {
				$keys = array_merge($keys,array($i));
				$vals = array_merge($vals,array($i));
			}
			$selY = array_combine($keys, $vals);

			$this->set('entranceYears',$selY);
		} else {
			$this->cleanUpFields();
			if ($this->Banji->save($this->data)) {
				$this->Session->setFlash('班级信息保存成功！');
				$this->redirect('/banjis/index');
			} else {
				$this->Session->setFlash('Please correct errors below.');
				$this->set('teachers', $this->Banji->Teacher->generateList());
				$this->set('academicYears', $this->Banji->AcademicYear->generateList());
				$this->set('classrooms', $this->Banji->Classroom->generateList());
			}
		}
	}

	function delete($id = null) {
		if (!$id) {
			$this->Session->setFlash('Invalid id for Banji');
			$this->redirect('/banjis/index');
		}
		if ($this->Banji->del($id)) {
			$this->Session->setFlash('删除成功！');
			$this->redirect('/banjis/index');
		}
	}

	function list_class_by_year(){
		$this->Banji->recursive = 0;
		
		$this->Banji->unbindModel(array('belongsTo' => array('Teacher','AcademicYear','Classroom')));
		$this->set('years', $this->Banji->findAll('Banji.status = 1 group by Banji.entrance_year'));

		$this->Banji->unbindModel(array('belongsTo' => array('Teacher','AcademicYear','Classroom')));
		$this->set('banjis', $this->Banji->findAll('Banji.status = 1 order by Banji.entrance_year desc,Banji.order_list'));

	}

	function vlist($keyword = null, $page=1) {
		$this->Banji->recursive = 0;

		$criteria = " ";
		if($keyword == null){
			$keyword = $this->data['Banji']['keyword'];
		}		
		if($keyword != null){
			$criteria = " Banji.class_name like '%$keyword%' ";
		}

		list($order,$limit,$page) = $this->Pagination->init($criteria,null,array('ajaxDivUpdate'=>'cs','url'=> 'vlist/'.$keyword));
		
		$data = $this->Banji->findAll($criteria, NULL, null, $limit, $page); 			
		$this->set('banjis',$data);
	}

   function graduate(){
		$this->Banji->unbindModel(array('belongsTo' => array('Teacher','AcademicYear','Classroom')));
		$this->set('years', $this->Banji->findAll('Banji.status = 1 group by Banji.entrance_year'));
   }

}
?>