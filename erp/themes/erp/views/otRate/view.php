<?php
$this->breadcrumbs=array(
	'Ot Rates'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List OtRate', 'url'=>array('index')),
	array('label'=>'Create OtRate', 'url'=>array('create')),
	array('label'=>'Update OtRate', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete OtRate', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage OtRate', 'url'=>array('admin')),
);
?>

<h1>View OtRate #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'paygrade_id',
		'percentage_of_ah_proll_id',
		'amount_adj',
	),
)); ?>
