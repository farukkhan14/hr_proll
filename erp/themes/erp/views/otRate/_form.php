<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'ot-rate-form',
            'action' => $this->createUrl('otRate/create'),
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend>Add New OT Rate Configuration</legend>
        <table>   
           <tr>
                <td><?php echo $form->labelEx($model, 'paygrade_id'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList(
                            $model, 'paygrade_id', CHtml::listData(PayGrades::model()->findAll(), 'id', 'title'), array(
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
                            'title' => 'Add Pay Grade',
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
    'url' => array('payGrades/createPGFromOutSide'),
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
                                            $('#OtRate_paygrade_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
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
                <td><?php echo $form->error($model, 'paygrade_id'); ?></td>
            </tr>
            <tr class="percentageTr">
                <td><?php echo $form->labelEx($model, 'percentage_of_ah_proll_id'); ?></td>
                <td>
                    <?php echo $form->textField($model, 'percentAmount', array('style' => 'width: 25px;')); ?>
                    <label> / </label>
                    <?php
                    echo $form->dropDownList(
                            $model, 'percentage_of_ah_proll_id', CHtml::listData(AhProll::model()->findAll(), 'id', 'acTypeWithName', 'payGrade'), array(
                        'prompt' => 'Select',
                        'ajax' => array(
                            'type' => 'POST',
                            'dataType' => 'json',
                            'url' => CController::createUrl('otRate/activeAmountOfThis'),
                            'success' => 'function(data) {
                                                $("#OtRate_amount_adj").val(data.adjAmount);
                                         }',
                            'data' => array(
                                'percentageAmount' => 'js:jQuery("#OtRate_percentAmount").val()',
                                'percentageAmountOf' => 'js:jQuery("#OtRate_percentage_of_ah_proll_id").val()',
                            ),
                            'beforeSend' => 'function(){
                                            document.getElementById("OtRate_amount_adj").style.background="url(' . Yii::app()->theme->baseUrl . '/images/ajax-loader-big.gif) no-repeat #343434 center"; 
                                         }',
                            'complete' => 'function(){
                                            document.getElementById("OtRate_amount_adj").style.background="#FFFFFF"; 
                                        }',
                        ),
                    ));
                    ?>
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
        </table>
    </fieldset>

    <fieldset class="tblFooters">
        <div id="ajaxLoader" style="display: none; float: left;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
        <?php
        echo CHtml::ajaxSubmitButton('Add', CHtml::normalizeUrl(array('otRate/create', 'render' => true)), array(
            'dataType' => 'json',
            'type' => 'post',
            'success' => 'function(data) {
                    $("#ajaxLoader").hide();  
                    if(data.status=="success"){
                        $("#formResult").fadeIn();
                        $("#formResult").html("Data saved successfully.");
                        $("#ot-rate-form")[0].reset();
                        $("#formResult").animate({opacity:1.0},1000).fadeOut("slow");
                        $.fn.yiiGridView.update("ot-rate-grid", {
                            data: $(this).serialize()
                    });
                    }else{
                        //$("#formResultError").html("Data not saved. Pleae solve the following errors.");
                        $.each(data, function(key, val) {
                            $("#ot-rate-form #"+key+"_em_").html(""+val+"");                                                    
                            $("#ot-rate-form #"+key+"_em_").show();
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
        $("#OtRate_amount_adj").focus(function(){
                    $(this).blur();         
        }); 
        $("#OtRate_amount_adj").css("cursor", "no-drop");
    });
</script>
<?php $this->endWidget(); ?>
