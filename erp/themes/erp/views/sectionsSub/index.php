<?php
$this->breadcrumbs=array(
	'Sections Subs',
);

$this->menu=array(
	array('label'=>'Create SectionsSub', 'url'=>array('create')),
	array('label'=>'Manage SectionsSub', 'url'=>array('admin')),
);
?>

<h1>Sections Subs</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
