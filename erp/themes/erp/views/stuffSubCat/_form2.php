<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'stuff-sub-cat-form',
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend><?php echo ($model->isNewRecord ? 'Add New Stuff Sub-Category' : 'Update Stuff Sub-Category'); ?></legend>
        <table>
            <tr>
                <td><?php echo $form->labelEx($model, 'stuff_cat_id'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList(
                            $model, 'stuff_cat_id', CHtml::listData(StuffCat::model()->findAll(), 'id', 'title'), array(
                        'prompt' => 'Select',
                    ));
                    ?>
                </td>          
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'stuff_cat_id'); ?></td>
            </tr>
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
        <span id="ajaxLoaderMR" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></span>
            <?php echo CHtml::submitButton($model->isNewRecord ? 'Add' : 'Update', array('onclick' => 'loadingDivDisplay();')); ?>
    </fieldset>
</div>
<script type="text/javascript">
    function loadingDivDisplay(){
        $("#ajaxLoaderMR").show();
    }
</script>

<?php $this->endWidget(); ?>
