<div class="wide form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
)); ?>

	<div class="row">
		<?php echo $form->label($model,'id'); ?>
		<?php echo $form->textField($model,'id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'paygrade_id'); ?>
		<?php echo $form->textField($model,'paygrade_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'percentage_of_ah_proll_id'); ?>
		<?php echo $form->textField($model,'percentage_of_ah_proll_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->label($model,'amount_adj'); ?>
		<?php echo $form->textField($model,'amount_adj'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton('Search'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- search-form -->