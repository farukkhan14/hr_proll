<?php
$this->breadcrumbs=array(
	'Stuff Sub Cats'=>array('index'),
	$model->title,
);

$this->menu=array(
	array('label'=>'List StuffSubCat', 'url'=>array('index')),
	array('label'=>'Create StuffSubCat', 'url'=>array('create')),
	array('label'=>'Update StuffSubCat', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete StuffSubCat', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage StuffSubCat', 'url'=>array('admin')),
);
?>

<h1>View StuffSubCat #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'stuff_cat_id',
		'title',
	),
)); ?>
