<?php
$this->breadcrumbs=array(
	'Emp Leaves',
);

$this->menu=array(
	array('label'=>'Create EmpLeaves', 'url'=>array('create')),
	array('label'=>'Manage EmpLeaves', 'url'=>array('admin')),
);
?>

<h1>Emp Leaves</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
