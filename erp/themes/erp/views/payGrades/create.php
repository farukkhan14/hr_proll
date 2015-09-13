<?php
$this->breadcrumbs=array(
	'Pay Grades'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List PayGrades', 'url'=>array('index')),
	array('label'=>'Manage PayGrades', 'url'=>array('admin')),
);
?>

<h1>Create PayGrades</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>