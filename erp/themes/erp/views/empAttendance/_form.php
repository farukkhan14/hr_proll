<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'emp-attendance-form',
            'action' => $this->createUrl('empAttendance/create'),
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend>Employee Attendance Manual Entry</legend>
        <table>   
            <tr>
                <td><?php echo $form->labelEx($model, 'date'); ?></td>
                <td>
                    <?php
                    Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                    $dateTimePickerConfig1 = array(
                        'model' => $model, //Model object
                        'attribute' => 'date', //attribute name
                        'mode' => 'date', //use "time","date" or "datetime" (default)
                        'language' => 'en-AU',
                        'options' => array(
                            'changeMonth' => 'true',
                            'changeYear' => 'true',
                            'dateFormat' => 'yy-mm-dd',
                        ),
                    );
                    $this->widget('CJuiDateTimePicker', $dateTimePickerConfig1);
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'date'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'in_time'); ?></td>
                <td>
                    <?php
                    Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                    $dateTimePickerConfig2 = array(
                        'model' => $model, //Model object
                        'attribute' => 'in_time', //attribute name
                        'mode' => 'time', //use "time","date" or "datetime" (default)
                        'language' => 'en-AU',
                    );
                    $this->widget('CJuiDateTimePicker', $dateTimePickerConfig2);
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'in_time'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'out_time'); ?></td>
                <td>
                    <?php
                    Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                    $dateTimePickerConfig3 = array(
                        'model' => $model, //Model object
                        'attribute' => 'out_time', //attribute name
                        'mode' => 'time', //use "time","date" or "datetime" (default)
                        'language' => 'en-AU',
                    );
                    $this->widget('CJuiDateTimePicker', $dateTimePickerConfig3);
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'out_time'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'card_no'); ?></td>
                <td><input type="text" id="customCardNo"/></td>          
            </tr>
            <tr>
                <td></td>
                <td>
                    <input id="checkEmpBtn" type="submit" value="Check / Uncheck employees with punch card no" class="custom_check_button"/>
                    OR
                    <?php
                    echo $form->dropDownList(
                            $model, 'department_id', CHtml::listData(Departments::model()->findAll(), 'id', 'department_name'), array(
                        'prompt' => 'Search department wise',
                        'ajax' => array(
                            'dataType' => 'json',
                            'type' => 'POST',
                            'url' => CController::createUrl('employees/empCardNoOfThisDept'),
                            'beforeSend' => 'function(){
                                $(".empList").html("");
                                document.getElementById("empList").style.background="url(' . Yii::app()->theme->baseUrl . '/images/ajax-loader-big_trans.gif) no-repeat #FFFFFF center center";
                            }',
                            'success' => 'function(data) {
                            document.getElementById("empList").style.background="#FFFFFF"; 
                            $(".empList").html(data.content);
                        }',
                        ),
                    ));
                    ?>
                    <span id="resetBtn">Check / Uncheck All</span>
                    <script>
                        $(document).ready(function(){
                            $('.empChckBxLst').change(function() {
                                if ($(this).is(":checked")) {
                                    $(this).next('span').css({"color":"cornflowerblue", "font-weight":"bold"});
                                }else{
                                    $(this).next('span').css({"color":"#008b8b", "font-weight":"normal"});
                                }
                            }); 
                        });
                        $("#checkEmpBtn").click(function( event ) {
                            if($("#customCardNo").val()==""){
                                alert("Please enter punch card no!");
                                event.preventDefault();
                            }else{
                                $('.cardList input[type="checkbox"]').each(function() {
                                    if ($(this).val()==$("#customCardNo").val()) {
                                        if ($(this).is(":checked")) {
                                            $(this).prop( "checked", false );
                                            $(this).next('span').css({"color":"#008b8b", "font-weight":"normal"});
                                        }else{
                                            $(this).prop( "checked", true );
                                            $(this).next('span').css({"color":"cornflowerblue", "font-weight":"bold"});
                                        }
                                    }
                                });
                            }      
                        });
                        $("#resetBtn").click(function( event ) {
                            $('.cardList input[type="checkbox"]').each(function() {
                                if ($(this).is(":checked")) {
                                    $(this).prop( "checked", false );
                                    $(this).next('span').css({"color":"#008b8b", "font-weight":"normal"});
                                }else{
                                    $(this).prop( "checked", true );
                                    $(this).next('span').css({"color":"cornflowerblue", "font-weight":"bold"});
                                }
                            });    
                        });
                    </script>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="formResult" class="ajaxTargetDiv"></div>
                    <div id="formResultError" class="ajaxTargetDivErr"></div>
                </td>
                <td>
                    <div id="empList" class="empList" style="width: 1160px; float: left; overflow: scroll; height: 500px; border: 1px solid #d2d2d2;">
                        <?php
                        $condition = "id!=0 ORDER BY full_name ASC";
                        $data = Employees::model()->findAll(array('condition' => $condition));
                        ?>
                        <?php if ($data) { ?>
                            <?php $i = 0; ?>
                            <?php foreach ($data as $d) { ?>
                                <div class="cardList">
                                    <input class="empChckBxLst" type="checkbox" id="EmpAttendance_card_no_<?php echo $i++; ?>" name="EmpAttendance[card_no][]" value="<?php echo $d->id_no; ?>"/><span><?php echo $d->full_name . " (" . $d->id_no . ")"; ?></span>
                                </div>
                            <?php } ?>
                        <?php } ?>
                    </div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'card_no'); ?></td>
            </tr>
        </table>
    </fieldset>

    <fieldset class="tblFooters">
        <div id="ajaxLoader" style="display: none; float: left;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
        <?php
        echo CHtml::ajaxSubmitButton('Add', CHtml::normalizeUrl(array('empAttendance/create', 'render' => true)), array(
            'dataType' => 'json',
            'type' => 'post',
            'success' => 'function(data) {
                    $("#ajaxLoader").hide();  
                    if(data.status=="success"){
                        $("#formResultError").hide();
                        $("#formResult").fadeIn();
                        $("#formResult").html("Data saved successfully.");
                        $("#emp-attendance-form")[0].reset();
                        $("#formResult").animate({opacity:1.0},1000).fadeOut("slow");
                    }if(data.status=="failure"){
                        $("#formResultError").html(data.failureMsg);
                    }else{
                        $("#formResultError").hide();
                        $.each(data, function(key, val) {
                            $("#emp-attendance-form #"+key+"_em_").html(""+val+"");                                                    
                            $("#emp-attendance-form #"+key+"_em_").show();
                        });
                    }       
                }',
            'beforeSend' => 'function(){                        
                $("#ajaxLoader").show();
             }'
        ));
        ?>
    </fieldset>
</div>
<style>
    .cardList{
        float: left;
        width: 450px;
        color: #008b8b;
    }
</style>
<?php $this->endWidget(); ?>

