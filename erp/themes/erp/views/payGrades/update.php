<?php
$this->breadcrumbs=array(
	'Pay Grades'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List PayGrades', 'url'=>array('index')),
	array('label'=>'Create PayGrades', 'url'=>array('create')),
	array('label'=>'View PayGrades', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage PayGrades', 'url'=>array('admin')),
);
?>

<h1>Update PayGrades <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>