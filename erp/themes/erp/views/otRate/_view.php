<div class="view">

	<b><?php echo CHtml::encode($data->getAttributeLabel('id')); ?>:</b>
	<?php echo CHtml::link(CHtml::encode($data->id), array('view', 'id'=>$data->id)); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('paygrade_id')); ?>:</b>
	<?php echo CHtml::encode($data->paygrade_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('percentage_of_ah_proll_id')); ?>:</b>
	<?php echo CHtml::encode($data->percentage_of_ah_proll_id); ?>
	<br />

	<b><?php echo CHtml::encode($data->getAttributeLabel('amount_adj')); ?>:</b>
	<?php echo CHtml::encode($data->amount_adj); ?>
	<br />


</div>