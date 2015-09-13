<?php
$this->breadcrumbs=array(
	'Manuals'=>array('index'),
	$model->name=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List Manual', 'url'=>array('index')),
	array('label'=>'Create Manual', 'url'=>array('create')),
	array('label'=>'View Manual', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage Manual', 'url'=>array('admin')),
);
?>

<h1>Update Manual <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>