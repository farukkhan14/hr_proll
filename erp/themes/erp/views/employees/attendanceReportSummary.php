<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'employees-form',
        ));
?>
<fieldset>
    <legend>Generate Attendance Report Summary</legend>
    <table class="reportTab">
        <tr>
            <td style="width: 400px;">Date</td>
            <td rowspan="2">
                <?php
                echo CHtml::submitButton('Generate', array(
                    'ajax' => array(
                        'dataType' => 'json',
                        'type' => 'POST',
                        'url' => CController::createUrl('employees/attendanceReportSummaryView'),
                        'beforeSend' => 'function(){
                                if($("#Employees_startDate").val()==""){
                                    alertify.alert("Warning! Please select a date");
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
    </table>
</fieldset>

<?php $this->endWidget(); ?>

<fieldset>
    <legend>Attendance Report Summary <div class="ajaxLoaderResultView" style="display: none; float: right;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div></legend>
    <div id="resultDiv"></div>
</fieldset>
