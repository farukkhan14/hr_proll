<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'employees-form',
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>

<div class="formDiv">
    <fieldset>
    <?php
        $this->widget('CTabView', array(
            'tabs' => array(
                'tab1' => array(
                    'title' => 'Basic',
                    'view' => '_employeeBasic',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab2' => array(
                    'title' => 'Official',
                    'view' => '_employeeOfficial',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab3' => array(
                    'title' => 'Skills',
                    'view' => '_employeeSkills',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab4' => array(
                    'title' => 'Academic',
                    'view' => '_employeeAcademic',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab5' => array(
                    'title' => 'Photo',
                    'view' => '_employeePhoto',
                    'data' => array(
                        'model'=>$model,
                        'form' => $form,
                    ),
                ),
            ),
        ));
        echo $form->errorSummary($model);
        ?>
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
<style>
    span.heighlightSpan{
        padding: 0px;
    }
</style>
<?php $this->endWidget(); ?>
