<?php
$this->breadcrumbs=array(
	'Emp Docs'=>array('index'),
	$model->id,
);

$this->menu=array(
	array('label'=>'List EmpDocs', 'url'=>array('index')),
	array('label'=>'Create EmpDocs', 'url'=>array('create')),
	array('label'=>'Update EmpDocs', 'url'=>array('update', 'id'=>$model->id)),
	array('label'=>'Delete EmpDocs', 'url'=>'#', 'linkOptions'=>array('submit'=>array('delete','id'=>$model->id),'confirm'=>'Are you sure you want to delete this item?')),
	array('label'=>'Manage EmpDocs', 'url'=>array('admin')),
);
?>

<h1>View EmpDocs #<?php echo $model->id; ?></h1>

<?php $this->widget('zii.widgets.CDetailView', array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'emp_id',
		'emp_doc_title',
		'emp_doc_file',
	),
)); ?>
