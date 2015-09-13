<?php
$this->breadcrumbs=array(
	'Advance Pay Recvs',
);

$this->menu=array(
	array('label'=>'Create AdvancePayRecv', 'url'=>array('create')),
	array('label'=>'Manage AdvancePayRecv', 'url'=>array('admin')),
);
?>

<h1>Advance Pay Recvs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
