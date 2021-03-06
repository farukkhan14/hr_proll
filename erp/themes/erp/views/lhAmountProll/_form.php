<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'lh-amount-proll-form',
            'action' => $this->createUrl('lhAmountProll/create'),
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend>Add New Leave Configuration</legend>
        <table>   
            <tr>
                <td><?php echo $form->labelEx($model, 'lh_proll_id'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList(
                            $model, 'lh_proll_id', CHtml::listData(LhProll::model()->findAll(), 'id', 'title', 'payGrade'), array(
                        'prompt' => 'Select',
                    ));
                    ?>
                    <?php
                    echo CHtml::link('', "", // the link for open the dialog
                            array(
                        'class' => 'add-additional-btn',
                        'onclick' => "{addCA(); $('#addCADialog').dialog('open');}"));
                    ?>

                    <?php
                    $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                        'id' => 'addCADialog',
                        'options' => array(
                            'title' => 'Add Leave Head',
                            'autoOpen' => false,
                            'modal' => true,
                            'width' => 'auto',
                            'resizable' => false,
                        ),
                    ));
                    ?>
                    <div class="divForForm">                         
                        <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>

                    </div>

                    <?php $this->endWidget(); ?>

                    <script type="text/javascript">
                        // here is the magic
                        function addCA(){
<?php
echo CHtml::ajax(array(
    'url' => array('lhProll/createLHPRFromOutSide'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
    $('.ajaxLoaderFormLoad').show();
}",
    'complete' => "function(){
    $('.ajaxLoaderFormLoad').hide();
}",
    'success' => "function(data){
                                        if (data.status == 'failure')
                                        {
                                            $('#addCADialog div.divForForm').html(data.div);
                                                  // Here is the trick: on submit-> once again this function!
                                            $('#addCADialog div.divForForm form').submit(addCA);
                                        }
                                        else
                                        {
                                            $('#addCADialog div.divForForm').html(data.div);
                                            setTimeout(\"$('#addCADialog').dialog('close') \",1000);
                                            $('#LhAmountProll_lh_proll_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                        }
                                                                }",
))
?>;
        return false; 
    } 
                    </script> 
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'lh_proll_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'day'); ?></td>
                <td><?php echo $form->textField($model, 'day'); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'day'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'hour'); ?></td>
                <td><?php echo $form->textField($model, 'hour'); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'hour'); ?></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <?php echo $form->checkBox($model, 'isPercentAmount'); ?>
                    <label>Set amount in percentage</label>
                </td>
            </tr>
            <tr class="percentageTr">
                <td><?php echo $form->labelEx($model, 'percentage_of_ah_proll_id'); ?></td>
                <td>
                    <?php echo $form->textField($model, 'percentAmount', array('style' => 'width: 45px;')); ?>
                    <label>% of</label>
                    <?php
                    echo $form->dropDownList(
                            $model, 'percentage_of_ah_proll_id', CHtml::listData(AhProll::model()->findAll(), 'id', 'acTypeWithName', 'payGrade'), array(
                        'prompt' => 'Select',
                        'ajax' => array(
                            'type' => 'POST',
                            'dataType' => 'json',
                            'url' => CController::createUrl('ahAmountProll/activeAmountOfThis'),
                            'success' => 'function(data) {
                                                $("#LhAmountProll_amount_adj").val(data.adjAmount);
                                         }',
                            'data' => array(
                                'percentageAmount' => 'js:jQuery("#LhAmountProll_percentAmount").val()',
                                'percentageAmountOf' => 'js:jQuery("#LhAmountProll_percentage_of_ah_proll_id").val()',
                            ),
                            'beforeSend' => 'function(){
                                            document.getElementById("LhAmountProll_amount_adj").style.background="url(' . Yii::app()->theme->baseUrl . '/images/ajax-loader-big.gif) no-repeat #343434 center"; 
                                         }',
                            'complete' => 'function(){
                                            document.getElementById("LhAmountProll_amount_adj").style.background="#FFFFFF"; 
                                        }',
                        ),
                    ));
                    ?>
                    <?php
                    echo CHtml::link('', "", // the link for open the dialog
                            array(
                        'id' => 'percentage_of_ah_proll_id_addBtn',
                        'class' => 'add-additional-btn',
                        'onclick' => "{addCA2(); $('#addCADialog2').dialog('open');}"));
                    ?>

                    <?php
                    $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                        'id' => 'addCADialog2',
                        'options' => array(
                            'title' => 'Add Account Head',
                            'autoOpen' => false,
                            'modal' => true,
                            'width' => 'auto',
                            'resizable' => false,
                        ),
                    ));
                    ?>
                    <div class="divForForm">                         
                        <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>

                    </div>

                    <?php $this->endWidget(); ?>

                    <script type="text/javascript">
                        // here is the magic
                        function addCA2(){
<?php
echo CHtml::ajax(array(
    'url' => array('ahProll/createAHPRFromOutSide'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
    $('.ajaxLoaderFormLoad').show();
}",
    'complete' => "function(){
    $('.ajaxLoaderFormLoad').hide();
}",
    'success' => "function(data){
                                        if (data.status == 'failure')
                                        {
                                            $('#addCADialog2 div.divForForm').html(data.div);
                                                  // Here is the trick: on submit-> once again this function!
                                            $('#addCADialog2 div.divForForm form').submit(addCA2);
                                        }
                                        else
                                        {
                                            $('#addCADialog2 div.divForForm').html(data.div);
                                            setTimeout(\"$('#addCADialog2').dialog('close') \",1000);
                                            $('#LhAmountProll_percentage_of_ah_proll_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                        }
                                                                }",
))
?>;
        return false; 
    } 
                    </script> 
                </td>            
            </tr>
            <tr class="percentageTr">
                <td></td>
                <td><?php echo $form->error($model, 'percentage_of_ah_proll_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'amount_adj'); ?></td>
                <td><?php echo $form->textField($model, 'amount_adj'); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'amount_adj'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'start_from'); ?></td>
                <td>
                    <?php
                    Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                    $dateTimePickerConfig1 = array(
                        'model' => $model, //Model object
                        'attribute' => 'start_from', //attribute name
                        'mode' => 'date', //use "time","date" or "datetime" (default)
                        'language' => 'en-AU',
                        'options' => array(
                            'changeMonth'=>'true', 
                                'changeYear'=>'true',
                            'dateFormat' => 'yy-mm-dd',
                        ),
                        'htmlOptions' => array(
                            'style' => 'width: 181px;'
                        ),
                    );
                    $this->widget('CJuiDateTimePicker', $dateTimePickerConfig1);
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'start_from'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'end_to'); ?></td>
                <td>
                    <?php
                    Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                    $dateTimePickerConfig2 = array(
                        'model' => $model, //Model object
                        'attribute' => 'end_to', //attribute name
                        'mode' => 'date', //use "time","date" or "datetime" (default)
                        'language' => 'en-AU',
                        'options' => array(
                            'changeMonth'=>'true', 
                                'changeYear'=>'true',
                            'dateFormat' => 'yy-mm-dd',
                        ),
                        'htmlOptions' => array(
                            'style' => 'width: 181px;'
                        ),
                    );
                    $this->widget('CJuiDateTimePicker', $dateTimePickerConfig2);
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'end_to'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'is_active'); ?></td>
                <td><?php echo $form->dropDownList($model, 'is_active', Lookup::items('is_active')); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'is_active'); ?></td>
            </tr>
        </table>
    </fieldset>

    <fieldset class="tblFooters">
        <div id="ajaxLoader" style="display: none; float: left;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
        <?php
        echo CHtml::ajaxSubmitButton('Add', CHtml::normalizeUrl(array('lhAmountProll/create', 'render' => true)), array(
            'dataType' => 'json',
            'type' => 'post',
            'success' => 'function(data) {
                    $("#ajaxLoader").hide();  
                    if(data.status=="success"){
                        $("#formResult").fadeIn();
                        $("#formResult").html("Data saved successfully.");
                        $("#lh-amount-proll-form")[0].reset();
                        $("#formResult").animate({opacity:1.0},1000).fadeOut("slow");
                        $.fn.yiiGridView.update("lh-amount-proll-grid", {
                            data: $(this).serialize()
                    });
                    }else{
                        //$("#formResultError").html("Data not saved. Pleae solve the following errors.");
                        $.each(data, function(key, val) {
                            $("#lh-amount-proll-form #"+key+"_em_").html(""+val+"");                                                    
                            $("#lh-amount-proll-form #"+key+"_em_").show();
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
        $(".percentageTr").hide(); 
    
        $("#LhAmountProll_isPercentAmount").change(function(){
            if($(this).is(':checked')){
                $("#LhAmountProll_amount_adj").focus(function(){
                    $(this).blur();         
                }); 
                $("#LhAmountProll_amount_adj").css("cursor", "no-drop");
                $(".percentageTr").show();
                $("#LhAmountProll_amount_adj").val("");
                $("#LhAmountProll_percentAmount").focus();
            }else{
                $("#LhAmountProll_amount_adj").focus();
                $("#LhAmountProll_amount_adj").val("");
                $("#LhAmountProll_amount_adj").css("cursor", "default");
                $(".percentageTr").hide();
                $("#LhAmountProll_percentAmount").val("");
                $("#LhAmountProll_percentage_of_ah_proll_id").val("");
            }
        });
        var dayOrHr;
        $('#LhAmountProll_day').bind('keyup', function() {
            dayOrHr =$(this).val()*24;
            $('#LhAmountProll_hour').val(dayOrHr);
        });
        $('#LhAmountProll_hour').bind('keyup', function() {
            dayOrHr=$(this).val()/24;
            $('#LhAmountProll_day').val(dayOrHr);
        });
    });
</script>
<?php $this->endWidget(); ?>