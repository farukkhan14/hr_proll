<?php
$this->breadcrumbs=array(
	'Ot Rates'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List OtRate', 'url'=>array('index')),
	array('label'=>'Manage OtRate', 'url'=>array('admin')),
);
?>

<h1>Create OtRate</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>