<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'pay-grades-form',
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend><?php echo ($model->isNewRecord ? 'Add New Pay Grade' : 'Update Pay Grade Info'); ?></legend>
        <table>   
            <tr>
                <td><?php echo $form->labelEx($model, 'title'); ?></td>
                <td><?php echo $form->textField($model, 'title', array('maxlength' => 255)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'title'); ?></td>
            </tr>
        </table>
    </fieldset>

    <fieldset class="tblFooters">
       <span id="ajaxLoaderMR" style="display: none; float: left;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></span>
        <?php echo CHtml::submitButton($model->isNewRecord ? 'Add' : 'Update', array('onclick'=>'loadingDivDisplay();')); ?>
    </fieldset>
</div>
<script type="text/javascript">
    function loadingDivDisplay(){
       $("#ajaxLoaderMR").show();
    }
</script>
<?php $this->endWidget(); ?>
