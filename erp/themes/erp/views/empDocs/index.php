<?php
$this->breadcrumbs=array(
	'Emp Docs',
);

$this->menu=array(
	array('label'=>'Create EmpDocs', 'url'=>array('create')),
	array('label'=>'Manage EmpDocs', 'url'=>array('admin')),
);
?>

<h1>Emp Docs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
