<?php
$this->breadcrumbs=array(
	'Bonus Amounts'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List BonusAmounts', 'url'=>array('index')),
	array('label'=>'Create BonusAmounts', 'url'=>array('create')),
	array('label'=>'View BonusAmounts', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage BonusAmounts', 'url'=>array('admin')),
);
?>

<h1>Update BonusAmounts <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>