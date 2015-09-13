<?php
$this->breadcrumbs=array(
	'Ot Rates',
);

$this->menu=array(
	array('label'=>'Create OtRate', 'url'=>array('create')),
	array('label'=>'Manage OtRate', 'url'=>array('admin')),
);
?>

<h1>Ot Rates</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
