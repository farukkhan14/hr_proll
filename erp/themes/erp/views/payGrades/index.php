<?php
$this->breadcrumbs=array(
	'Pay Grades',
);

$this->menu=array(
	array('label'=>'Create PayGrades', 'url'=>array('create')),
	array('label'=>'Manage PayGrades', 'url'=>array('admin')),
);
?>

<h1>Pay Grades</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
