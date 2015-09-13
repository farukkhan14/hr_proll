<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('emp_id')); ?>:</b>
	<?php echo CHtml::encode($data->emp_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('emp_doc_title')); ?>:</b>
	<?php echo CHtml::encode($data->emp_doc_title); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('emp_doc_file')); ?>:</b>
	<?php echo CHtml::encode($data->emp_doc_file); ?>
	<br />


</div>