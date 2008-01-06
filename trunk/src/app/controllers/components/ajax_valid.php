<?php 
class AjaxValidComponent extends Object{
	var $controller = true;
	var $valid = true;//Valid until proven otherwise
	var $errors = array();//Where the list of errors will be stored
	var $form = array();//Where the form data will be stored
	var $return = "array";
	var $html;
	var $javascript;
	var $classFlag = false;
	var $actionUrl;
	var $method;
	function startup(&$controller){
		// This method takes a reference to the controller which is loading it.
		// Perform controller initialization here.
		$this->controller = &$controller;
	}
	function setForm($form = array(), $actionUrl = null, $method = nulll){
		$this->form = $form;
		if ($actionUrl!=null){
			if($method != null){
				$this->method = $method;
			}
			$regEx = "^(ftp|http|https)://(www.)?";
			if(!ereg($regEx,$actionUrl)){
				$regEx = "^[A-Z][a-z]+/[a-z]+$";
				if(ereg($regEx,$actionUrl)){
					$url_ar = explode('/',$actionUrl);
					$actionUrl = strrchr(ROOT, "/").'/'.Inflector::pluralize(strtolower($url_ar[0])).'/'.$url_ar[1];
				}
			}
			$this->actionUrl = $actionUrl;
		} else {
			$this->actionUrl = false;
		}
	}
	function submit(){
		if($this->valid){
			$elem = Inflector::camelize(key($this->form)." ".key($this->form[key($this->form)]));
			$submitStr = "";
			$submitStr = "<script type='text/javascript'>";
			$submitStr .= "elem = document.getElementById('".$elem."');\n";
			$submitStr .= "elem.form.action = '".$this->actionUrl."';\n";
			$submitStr .= "alert(elem.form.action);\n";
			$submitStr .= "elem.form.method='POST';\n";
			$submitStr .= "//elem.form.submit();\n";
			$submitStr .= "</script>";
			return $submitStr;
		}
	}
	function jsRedirect(){
		if($this->valid){
			$redirStr = "";
			$redirStr = "<script type='text/javascript'>";
			$redirStr .= "document.location = '".$this->actionUrl."';\n";
			$redirStr .= "</script>";
			return $redirStr;
		}
	}
	function confirm($initField = string, $fields = array(), $errormsg = string){
		$init_ar = explode("/",$initField);
		foreach($fields as $field){
			if($this->form[$init_ar[0]][$init_ar[1]] != $field){
				$this->valid = false;
				$this->errors[$initField]['confirm'] = $errormsg;
				break;
			}
		}
	}
	function required($fields = array()){
		foreach ($fields as $field){
			$field_ar = explode('/',$field);
			if(is_array($this->controller->{$field_ar[0]}->validate[$field_ar[1]])){
				foreach ($this->controller->{$field_ar[0]}->validate[$field_ar[1]] as $key => $required){
					if(!preg_match($required['expression'],$this->form[$field_ar[0]][$field_ar[1]])){
						$this->errors[$field]['required'][$key] = $required['message'];
						$this->valid = false;
					}
				}
			} else {
				if(!preg_match($this->controller->{$field_ar[0]}->validate[$field_ar[1]],$this->form[$field_ar[0]][$field_ar[1]])){
					$this->errors[$field]['required'][$field_ar[1]] = //Inflector::humanize(str_replace("_id","",$field_ar[1]))." is required.";
					Inflector::humanize(str_replace("_id","",$field_ar[1]))." 不能为空.";
					$this->valid = false;
				}
			}
		}
	}
	function unique($table = array()){
		foreach ($table as $key => $fields):
		foreach ($fields as $field):
		$field_ar = explode('/',$field);
		$model = $field_ar[0];
		$fieldName = $field_ar[1];
		$tableField = str_replace('/','.',$field);
		$result = $this->controller->User->find(array($tableField =>$this->form[$model][$fieldName]) ,$tableField);
		if(!empty($result)){
			$this->errors[$field]['unique'] = $this->form[$model][$fieldName].' already exsists in the db.';
			$this->valid = false;
		}
		endforeach;
		endforeach;
	}
	function changeClass($errorClass = string){
		$this->classFlag = $errorClass;
	}
	function changeClassFun (){
		if (!$this->valid){
			$classStr = "";
			$classStr = "<script type='text/javascript'>";
			$classStr .= "
				function errorClass(id,newClass){
					var elem_ar = document.getElementsByTagName('label');
					var classOld = '';
					var labelFor = '';
					var elem;
					for(x in elem_ar){
						labelFor = elem_ar[x].htmlFor+'';
						if(labelFor.indexOf(id) != -1){
							elem = elem_ar[x];
						}
					}
					classOld = elem.className+'';
					if(classOld.indexOf(newClass) == -1){
						elem.className = newClass+' '+classOld;
					}
				}
				function validClass(id,newClass){
					var elem_ar = document.getElementsByTagName('label');
					var classOld = '';
					var labelFor = '';
					var elem = '';
					for(x in elem_ar){
						labelFor = elem_ar[x].htmlFor+'';
						if(labelFor.indexOf(id) != -1){
							elem = elem_ar[x];
						}
					}
					if(elem!=''){
						classOld = elem.className+'';
						if(classOld.indexOf(newClass+' ') != -1){
							elem.className = classOld.replace(newClass+' ','');
						} else if (classOld.indexOf(newClass) != -1){
							elem.className = classOld.replace(newClass,'');
						}
					}
				}";
			foreach($this->form as $parentKey =>$parentVal):
			foreach ($parentVal as $childKey => $childVal):
			$childKey_cam = Inflector::camelize($childKey);
			if(!empty($this->errors[$parentKey."/".$childKey])){
				$classStr.="errorClass('".$parentKey.$childKey_cam."','".$this->classFlag."');";
			} else {
				$classStr.="validClass('".$parentKey.$childKey_cam."','".$this->classFlag."');";
			}
			endforeach;
			endforeach;
			$classStr .= "</script>" ;
			return $classStr;
		}
	}
	function validate (){
		switch ($this->return){
			case 'array':
				return $this->errors;
				break;
			case 'html':
				$this->html = '<ul class="errorsList">';
				foreach ($this->errors as $err_key => $err_val):
				$this->html .='<li>'.ucfirst(substr($err_key,strpos($err_key,'/')+1));
				$this->html .= '<ul class="errorChild">';
				foreach ($err_val as $error1):
				if(is_array($error1)){
					foreach ($error1 as $error2):
					$this->html .='<li>'.$error2.'</li>';
					endforeach;
				} else {
					$this->html .='<li>'.$error1.'</li>';
				}
				endforeach;
				$this->html .='</ul></li>';
				endforeach;
				$this->html .= '</ul>';
				if($this->classFlag != false){
					$this->html .=$this->changeClassFun();
				}
				if($this->method == 'submit'){
					$this->html .= $this->submit();
				}
				if($this->method == 'redirect'){
					$this->html .= $this->jsRedirect();
				}
				return $this->html;
				break;
			case 'javascript':
				if(!$this->valid){
					$this->javascript = '<script type="text/javascript">alert("';
					$this->javascript .= '请检查以下错误:\\n';
					foreach ($this->errors as $err_val):
					foreach ($err_val as $error1):
					if(is_array($error1)){
						foreach ($error1 as $error2):
						$this->javascript .='- '.$error2.'\\n';
						endforeach;
					} else {
						$this->javascript .='- '.$error1.'\\n';
					}
					endforeach;
					endforeach;
					$this->javascript .='");</script>';
				}
				if($this->classFlag != false){
					$this->javascript .=$this->changeClassFun();
				}
				if($this->method == 'submit'){
					$this->javascript .= $this->submit();
				}
				if($this->method == 'redirect'){
					$this->javascript .= $this->jsRedirect();
				}
				return $this->javascript;
				break;
			case 'test':
				return $this->submit();
				break;
		}
	}
}
?>