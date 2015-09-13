<?php
$this->breadcrumbs=array(
	'Emp Leaves'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List EmpLeaves', 'url'=>array('index')),
	array('label'=>'Manage EmpLeaves', 'url'=>array('admin')),
);
?>

<h1>Create EmpLeaves</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>