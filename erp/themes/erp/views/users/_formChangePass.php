
<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'users-form',
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit'=>true),
        ));
$model->password="";
?>
<div class="formDiv">
    <fieldset>
        <legend>Change Password</legend>
        <table>
            <tr>
                <td><?php echo $form->labelEx($model, 'curr_password'); ?><br/><font color="red">(For security)</font></td>
                <td><?php echo $form->passwordField($model, 'curr_password', array('maxlength' => 20)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'curr_password'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'password'); ?></td>
                <td><?php echo $form->passwordField($model, 'password', array('maxlength' => 20)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'password'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'password2'); ?></td>
                <td><?php echo $form->passwordField($model, 'password2', array('maxlength' => 20)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'password2'); ?></td>
            </tr>
        </table>
    </fieldset>

   <fieldset class="tblFooters">
       <span id="ajaxLoaderMR" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></span>
        <?php echo CHtml::submitButton('Change', array('onclick'=>'loadingDivDisplay();')); ?>
    </fieldset>
</div>
<script type="text/javascript">
    function loadingDivDisplay(){
       $("#ajaxLoaderMR").show();
    }
</script>
<?php $this->endWidget(); ?>