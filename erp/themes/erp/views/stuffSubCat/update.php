<?php
$this->breadcrumbs=array(
	'Stuff Sub Cats'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List StuffSubCat', 'url'=>array('index')),
	array('label'=>'Create StuffSubCat', 'url'=>array('create')),
	array('label'=>'View StuffSubCat', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage StuffSubCat', 'url'=>array('admin')),
);
?>

<h1>Update StuffSubCat <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>