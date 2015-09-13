<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'emp-leaves-form',
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend>Update Employee Leave Info</legend>
        <table>   
            <tr>
                <td><?php echo $form->labelEx($model, 'transaction_date'); ?></td>
                <td>
                    <?php
                    Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                    $dateTimePickerConfig1 = array(
                        'id' => 'transaction_date2',
                        'model' => $model, //Model object
                        'attribute' => 'transaction_date', //attribute name
                        'mode' => 'date', //use "time","date" or "datetime" (default)
                        'language' => '',
                        'options' => array(
//                        'ampm' => true,
                            'changeMonth' => 'true',
                            'changeYear' => 'true',
                            'dateFormat' => 'yy-mm-dd',
                            'width' => '100',
                        ) // jquery plugin options
                    );
                    $this->widget('CJuiDateTimePicker', $dateTimePickerConfig1);
                    ?>
                </td>     
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'transaction_date'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'emp_id'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList(
                            $model, 'emp_id', CHtml::listData(Employees::model()->findAll(), 'id', 'full_name'), array(
                        'prompt' => 'Select',
                                'id'=>'EmpLeaves_emp_id2',
                    ));
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'emp_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'lh_proll_id'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList(
                            $model, 'lh_proll_id', CHtml::listData(LhProll::model()->findAll(), 'id', 'title', 'payGrade'), array(
                        'prompt' => 'Select',
                                'id'=>'EmpLeaves_lh_proll_id2',
                        'style' => 'float: left;',
                        'ajax' => array(
                            'type' => 'POST',
                            'dataType' => 'json',
                            'url' => CController::createUrl('lhAmountProll/remainingLeaveOfThisEmp'),
                            'success' => 'function(data) {
                                                $("#remainingLeaves2").html(data.leaveData);
                                         }',
                            'data' => array(
                                'emp_id' => 'js:jQuery("#EmpLeaves_emp_id2").val()',
                                'lh_proll_id' => 'js:jQuery("#EmpLeaves_lh_proll_id2").val()',
                            ),
                            'beforeSend' => 'function(){
                                            if($("#EmpLeaves_emp_id2").val()==""){
                                                alertify.alert("Please select an employee!");
                                                $("#EmpLeaves_lh_proll_id2").val("");
                                                return false;
                                            }else{
                                                document.getElementById("remainingLeaves2").style.background="url(' . Yii::app()->theme->baseUrl . '/images/ajax-loader.gif) no-repeat #FFFFFF";  
                                            }
                                         }',
                            'complete' => 'function(){
                                            document.getElementById("remainingLeaves2").style.background="#FFFFFF"; 
                                        }',
                        ),
                    ));
                    ?>
                    <span id="remainingLeaves2" style="float: right; height: 20px; width: 245px; display: table; vertical-align: middle; color: red;">
                        <?php
                        LhAmountProll::model()->remainingLeave($model->emp_id, $model->lh_proll_id);
                        ?>
                    </span>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'lh_proll_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'day_to_leave'); ?></td>
                <td><?php echo $form->textField($model, 'day_to_leave', array('id'=>'EmpLeaves_day_to_leave2')); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'day_to_leave'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'hour_to_leave'); ?></td>
                <td><?php echo $form->textField($model, 'hour_to_leave', array('id'=>'EmpLeaves_hour_to_leave2')); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'hour_to_leave'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'subj'); ?></td>
                <td><?php echo $form->textField($model, 'subj', array('maxlength' => 255)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'subj'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'details'); ?></td>
                <td><?php echo $form->textArea($model, 'details', array('rows' => 5, 'cols' => 100)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'details'); ?></td>
            </tr>
        </table>
    </fieldset>

    <fieldset class="tblFooters">
        <span id="ajaxLoaderMR" style="display: none; float: left;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></span>
            <?php echo CHtml::submitButton('Update', array('onclick' => 'loadingDivDisplay();')); ?>
    </fieldset>
</div>
<script type="text/javascript">
    function loadingDivDisplay(){
        $("#ajaxLoaderMR").show();
    }
    $(document).ready(function(){
        var dayOrHr;
        $('#EmpLeaves_day_to_leave2').bind('keyup', function() {
            dayOrHr =$(this).val()*24;
            $('#EmpLeaves_hour_to_leave2').val(dayOrHr);
        });
        $('#EmpLeaves_hour_to_leave2').bind('keyup', function() {
            dayOrHr=$(this).val()/24;
            $('#EmpLeaves_day_to_leave2').val(dayOrHr);
        });
        
        
        $("#EmpLeaves_emp_id2").change(function(){
            $("#EmpLeaves_lh_proll_id2").val("");
            $("#remainingLeaves2").html("");
        });
    });
</script>
<?php $this->endWidget(); ?>