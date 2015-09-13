<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'employees-form',
        ));
?>
<fieldset>
    <legend>Generate Salary Sheet</legend>
    <table class="reportTab">
        <tr>
            <td><?php echo $form->labelEx($model, 'startDate'); ?></td>
            <td><?php echo $form->labelEx($model, 'endDate'); ?></td>
            <td><?php echo $form->labelEx($model, 'paygrade_id'); ?></td>
            <td><?php echo $form->labelEx($model, 'section_id'); ?></td>
            <td><?php echo $form->labelEx($model, 'team_id'); ?></td>
        </tr>
        <tr>
            <td>
                <?php
                Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                $dateTimePickerConfig1 = array(
                    'model' => $model,
                    'attribute' => 'startDate',
                    'mode' => 'date',
                    'language' => 'en-AU',
                    'options' => array(
                        'dateFormat' => 'yy-mm-dd',
                        'width' => '100',
                    )
                );
                $this->widget('CJuiDateTimePicker', $dateTimePickerConfig1);
                ?>
            </td>
            <td>
                <?php
                Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                $dateTimePickerConfig2 = array(
                    'model' => $model,
                    'attribute' => 'endDate',
                    'mode' => 'date',
                    'language' => 'en-AU',
                    'options' => array(
                        'dateFormat' => 'yy-mm-dd',
                        'width' => '100',
                    )
                );
                $this->widget('CJuiDateTimePicker', $dateTimePickerConfig2);
                ?>
            </td>
            <td>
                <?php
                     echo $form->dropDownList(
                        $model, 'paygrade_id', CHtml::listData(PayGrades::model()->findAll(), 'id', 'title'), array(
                    'prompt' => 'Select',
                ));
                ?>
            </td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'section_id', CHtml::listData(Sections::model()->findAll(), 'id', 'title'), array(
                    'prompt' => 'Select',
                ));
                ?>
            </td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'team_id', CHtml::listData(Teams::model()->findAll(), 'id', 'title'), array(
                    'prompt' => 'Select',
                ));
                ?>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <?php
                echo CHtml::submitButton('Generate', array(
                    'ajax' => array(
                        'dataType' => 'json',
                        'type' => 'POST',
                        'url' => CController::createUrl('employees/employeePaySlipView'),
                        'beforeSend' => 'function(){
                                if($("#Employees_startDate").val()=="" || $("#Employees_endDate").val()=="" || $("#Employees_paygrade_id").val()==""){
                                    alertify.alert("Warning! Please select date range & paygrade");
                                    return false;
                                }else{
                                    $(".ajaxLoaderResultView").show();
                                }
                            }',
                        'success' => 'function(data) {
                            $(".ajaxLoaderResultView").hide();
                            $("#resultDiv").html(data.content);
                        }',
                    ),
                    'class' => 'custom_check_button',
                        )
                );
                ?>
            </td>
            <td colspan="3"></td>
        </tr>
    </table>
</fieldset>

<?php $this->endWidget(); ?>

<fieldset>
    <legend>Salary Sheet <div class="ajaxLoaderResultView" style="display: none; float: right;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div></legend>
    <div id="resultDiv"></div>
</fieldset>
