<?php
$this->breadcrumbs=array(
	'Stuff Sub Cats'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List StuffSubCat', 'url'=>array('index')),
	array('label'=>'Manage StuffSubCat', 'url'=>array('admin')),
);
?>

<h1>Create StuffSubCat</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>