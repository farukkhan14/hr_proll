<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'emp-leaves-form',
            'action' => $this->createUrl('empLeaves/create'),
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend>Add New Employee Leave Info</legend>
        <table>   
            <tr>
                <td><?php echo $form->labelEx($model, 'transaction_date'); ?></td>
                <td>
                    <?php
                        Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                        $dateTimePickerConfig1 = array(
                            'model' => $model, //Model object
                            'attribute' => 'transaction_date', //attribute name
                            'mode' => 'date', //use "time","date" or "datetime" (default)
                            'language' => 'en-AU',
                            'options' => array(
//                        'ampm' => true,
                                'changeMonth'=>'true', 
                                'changeYear'=>'true',
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
                        'style' => 'float: left;',
                                'ajax' => array(
                                        'type' => 'POST',
                                        'dataType' => 'json',
                                        'url' => CController::createUrl('lhAmountProll/remainingLeaveOfThisEmp'),
                                        'success' => 'function(data) {
                                                $("#remainingLeaves").html(data.leaveData);
                                         }',
                                        'data' => array(
                                            'emp_id' => 'js:jQuery("#EmpLeaves_emp_id").val()',
                                            'lh_proll_id' => 'js:jQuery("#EmpLeaves_lh_proll_id").val()',
                                        ),
                                        'beforeSend' => 'function(){
                                            if($("#EmpLeaves_emp_id").val()==""){
                                                alertify.alert("Please select an employee!");
                                                $("#EmpLeaves_lh_proll_id").val("");
                                                return false;
                                            }else{
                                                document.getElementById("remainingLeaves").style.background="url(' . Yii::app()->theme->baseUrl . '/images/ajax-loader.gif) no-repeat #FFFFFF";  
                                            }
                                         }',
                                        'complete' => 'function(){
                                            document.getElementById("remainingLeaves").style.background="#FFFFFF"; 
                                        }',
                                    ),
                    ));
                    ?>
                    <span id="remainingLeaves" style="float: right; height: 20px; width: 245px; display: table; vertical-align: middle; color: red;"></span>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'lh_proll_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'day_to_leave'); ?></td>
                <td><?php echo $form->textField($model, 'day_to_leave'); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'day_to_leave'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'hour_to_leave'); ?></td>
                <td><?php echo $form->textField($model, 'hour_to_leave'); ?></td>            
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
                <td><?php echo $form->textArea($model, 'details', array('rows' => 5, 'cols'=>100)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'details'); ?></td>
            </tr>
        </table>
    </fieldset>

    <fieldset class="tblFooters">
        <div id="ajaxLoader" style="display: none; float: left;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
        <?php
        echo CHtml::ajaxSubmitButton('Add', CHtml::normalizeUrl(array('empLeaves/create', 'render' => true)), array(
            'dataType' => 'json',
            'type' => 'post',
            'success' => 'function(data) {
                    $("#ajaxLoader").hide();  
                    if(data.status=="success"){
                        $("#formResult").fadeIn();
                        $("#formResult").html("Data saved successfully.");
                        $("#emp-leaves-form")[0].reset();
                        $("#formResult").animate({opacity:1.0},1000).fadeOut("slow");
                        $.fn.yiiGridView.update("emp-leaves-grid", {
                            data: $(this).serialize()
                        });
                    }else{
                        //$("#formResultError").html("Data not saved. Pleae solve the following errors.");
                        $.each(data, function(key, val) {
                            $("#emp-leaves-form #"+key+"_em_").html(""+val+"");                                                    
                            $("#emp-leaves-form #"+key+"_em_").show();
                        });
                    }       
                }',
            'beforeSend' => 'function(){                        
                $("#ajaxLoader").show();
             }'
        ));
        ?>
    </fieldset>
    <div id="formResult" class="ajaxTargetDiv"></div>
    <div id="formResultError" class="ajaxTargetDivErr"></div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        var dayOrHr;
        $('#EmpLeaves_day_to_leave').bind('keyup', function() {
            dayOrHr =$(this).val()*24;
            $('#EmpLeaves_hour_to_leave').val(dayOrHr);
        });
        $('#EmpLeaves_hour_to_leave').bind('keyup', function() {
            dayOrHr=$(this).val()/24;
            $('#EmpLeaves_day_to_leave').val(dayOrHr);
        });
        
        
        $("#EmpLeaves_emp_id").change(function(){
            $("#EmpLeaves_lh_proll_id").val("");
            $("#remainingLeaves").html("");
        });
    });
</script>
<?php $this->endWidget(); ?>