<?php
$this->breadcrumbs=array(
	'Bonus Amounts',
);

$this->menu=array(
	array('label'=>'Create BonusAmounts', 'url'=>array('create')),
	array('label'=>'Manage BonusAmounts', 'url'=>array('admin')),
);
?>

<h1>Bonus Amounts</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
