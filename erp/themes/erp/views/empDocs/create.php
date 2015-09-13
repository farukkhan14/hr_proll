<?php
$this->breadcrumbs=array(
	'Emp Docs'=>array('index'),
	'Create',
);

$this->menu=array(
	array('label'=>'List EmpDocs', 'url'=>array('index')),
	array('label'=>'Manage EmpDocs', 'url'=>array('admin')),
);
?>

<h1>Create EmpDocs</h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>