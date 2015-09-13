<?php
$this->breadcrumbs=array(
	'Emp Resigns'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List EmpResign', 'url'=>array('index')),
	array('label'=>'Manage EmpResign', 'url'=>array('admin')),
);
?>

<h1>Create EmpResign</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>