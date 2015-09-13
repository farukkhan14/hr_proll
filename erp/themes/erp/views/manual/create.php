<?php
$this->breadcrumbs=array(
	'Manuals'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List Manual', 'url'=>array('index')),
	array('label'=>'Manage Manual', 'url'=>array('admin')),
);
?>

<h1>Create Manual</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>