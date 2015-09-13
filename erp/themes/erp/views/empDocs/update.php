<?php
$this->breadcrumbs=array(
	'Emp Docs'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List EmpDocs', 'url'=>array('index')),
	array('label'=>'Create EmpDocs', 'url'=>array('create')),
	array('label'=>'View EmpDocs', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage EmpDocs', 'url'=>array('admin')),
);
?>

<h1>Update EmpDocs <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>