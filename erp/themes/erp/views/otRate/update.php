<?php
$this->breadcrumbs=array(
	'Ot Rates'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List OtRate', 'url'=>array('index')),
	array('label'=>'Create OtRate', 'url'=>array('create')),
	array('label'=>'View OtRate', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage OtRate', 'url'=>array('admin')),
);
?>

<h1>Update OtRate <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>