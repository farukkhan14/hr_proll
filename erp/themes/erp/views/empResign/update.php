<?php
$this->breadcrumbs=array(
	'Emp Resigns'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List EmpResign', 'url'=>array('index')),
	array('label'=>'Create EmpResign', 'url'=>array('create')),
	array('label'=>'View EmpResign', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage EmpResign', 'url'=>array('admin')),
);
?>

<h1>Update EmpResign <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>