<?php
$this->breadcrumbs=array(
	'Bonus Amounts'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List BonusAmounts', 'url'=>array('index')),
	array('label'=>'Manage BonusAmounts', 'url'=>array('admin')),
);
?>

<h1>Create BonusAmounts</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>