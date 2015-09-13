<?php
$this->breadcrumbs=array(
	'Advance Pay Recvs'=>array('index'),
	$model->title=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List AdvancePayRecv', 'url'=>array('index')),
	array('label'=>'Create AdvancePayRecv', 'url'=>array('create')),
	array('label'=>'View AdvancePayRecv', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage AdvancePayRecv', 'url'=>array('admin')),
);
?>

<h1>Update AdvancePayRecv <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>