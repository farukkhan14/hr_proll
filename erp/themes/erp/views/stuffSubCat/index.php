<?php
$this->breadcrumbs=array(
	'Stuff Sub Cats',
);

$this->menu=array(
	array('label'=>'Create StuffSubCat', 'url'=>array('create')),
	array('label'=>'Manage StuffSubCat', 'url'=>array('admin')),
);
?>

<h1>Stuff Sub Cats</h1>

<?php $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$dataProvider,
	'itemView'=>'_view',
)); ?>
