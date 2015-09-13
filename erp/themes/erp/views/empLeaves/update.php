<?php
$this->breadcrumbs=array(
	'Emp Leaves'=>array('index'),
	$model->id=>array('view','id'=>$model->id),
	'Update',
);

$this->menu=array(
	array('label'=>'List EmpLeaves', 'url'=>array('index')),
	array('label'=>'Create EmpLeaves', 'url'=>array('create')),
	array('label'=>'View EmpLeaves', 'url'=>array('view', 'id'=>$model->id)),
	array('label'=>'Manage EmpLeaves', 'url'=>array('admin')),
);
?>

<h1>Update EmpLeaves <?php echo $model->id; ?></h1>

<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>