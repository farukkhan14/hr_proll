<?php
$this->breadcrumbs=array(
	'Advance Pay Recvs'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List AdvancePayRecv', 'url'=>array('index')),
	array('label'=>'Manage AdvancePayRecv', 'url'=>array('admin')),
);
?>

<h1>Create AdvancePayRecv</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>