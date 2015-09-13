<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'login-form',
            'enableClientValidation' => true,
            'clientOptions' => array(
                'validateOnSubmit' => true,
            ),
        ));
?>
<div class="loginDiv">
    <span class="ribbon"><?php echo Yii::app()->name; ?></span>
    <fieldset style="margin-top: 30px;">
        <div class="formelement">
            <table style="float: left; width: 100%;">
                <tr>
                    <td><label><?php echo $form->labelEx($model, 'username'); ?></label></td>
                    <td><?php echo $form->textField($model, 'username'); ?></td>
                </tr>
                <tr>
                    <td></td>
                    <td><?php echo $form->error($model, 'username'); ?></td>
                </tr>
                <tr>
                    <td><label><?php echo $form->labelEx($model, 'password'); ?></label></td>
                    <td><?php echo $form->passwordField($model, 'password'); ?></td>
                </tr>
                <tr>
                    <td></td>
                    <td><?php echo $form->error($model, 'password'); ?></td>
                </tr>
            </table>
        </div>
    </fieldset>
    <fieldset class="tblFooters">
        <table>
            <tr>
                <td></td>
                <td><?php echo CHtml::submitButton('Login'); ?></td>
            </tr>
        </table>       
    </fieldset>
    <span class="requirement">Minimum Requirement: Mozila Firefox Browser v26.</span>
</div>
<?php $this->endWidget(); ?>
<style>
    img {
        position: relative;
        top: -10px;
        z-index: -2000;
    }
</style>
