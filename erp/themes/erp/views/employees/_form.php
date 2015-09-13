<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'employees-form',
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
            'htmlOptions' => array('enctype' => 'multipart/form-data'),
        ));
?>
<div class="formDiv">
    <fieldset>
        <?php echo $form->errorSummary($model); ?>
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
                    'title' => 'Photo',
                    'view' => '_employeePhoto',
                    'data' => array(
                        'model'=>$model,
                        'form' => $form,
                    ),
                ),
                'tab3' => array(
                    'title' => 'Academic',
                    'view' => '_employeeAcademic',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab4' => array(
                    'title' => 'Present Employement',
                    'view' => '_employeeOfficial',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab5' => array(
                    'title' => 'Local Training',
                    'view' => '_employeeInSrvcLclTrngInf',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab6' => array(
                    'title' => 'Foreign Training',
                    'view' => '_employeeFrgnTrngInf',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab7' => array(
                    'title' => 'Foreign Travels',
                    'view' => '_employeeInSrvcFrgnTrvl',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab8' => array(
                    'title' => 'Skills',
                    'view' => '_employeeSkills',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab9' => array(
                    'title' => 'Publications',
                    'view' => '_employeePublications',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab10' => array(
                    'title' => 'Awards/Honours',
                    'view' => '_employeeAwards',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab11' => array(
                    'title' => 'Prev.Employment',
                    'view' => '_employeePreviousEmployeement',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab12' => array(
                    'title' => 'Disciplinary Action/Criminal Record',
                    'view' => '_employeeDscplnryCrmnlActn',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
                'tab13' => array(
                    'title' => 'Children',
                    'view' => '_employeeChildren',
                    'data' => array(
                        'model' => $model,
                        'form' => $form,
                    ),
                ),
            ),
        ));
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
    .yiiTab ul.tabs {
        font: 12px Verdana,sans-serif;
    }
    .yiiTab ul.tabs a{
        padding: 2px;
        border-radius: 4px 4px 0 2px;
    }
    fieldset{
        border: none;
    }
</style>
<?php $this->endWidget(); ?>
