<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'bonus-amounts-form',
            'action' => $this->createUrl('bonusAmounts/create'),
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend>Assign Bonus To Employee</legend>
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
                <td><?php echo $form->error($model, 'date'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'bonus_id'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList(
                            $model, 'bonus_id', CHtml::listData(BonusTitles::model()->findAll(), 'id', 'title'), array(
                        'prompt' => 'Select',
                        'style' => 'width: 167px;'
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
                            'title' => 'Add Bonus Head',
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
    'url' => array('bonusTitles/createBonusTitlesFromOutSide'),
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
                                            $('#BonusAmounts_bonus_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
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
                <td><?php echo $form->error($model, 'bonus_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'employee_id'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList(
                            $model, 'employee_id', CHtml::listData(Employees::model()->findAll(), 'id', 'full_name'), array(
                        'prompt' => 'Select',
                    ));
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'employee_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'amount'); ?></td>
                <td><?php echo $form->textField($model, 'amount'); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'amount'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'is_active'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList($model, 'is_active', Lookup::items('is_active'), array('prompt' => 'select')
                    );
                    ?>
                </td>            
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
echo CHtml::ajaxSubmitButton('Add', CHtml::normalizeUrl(array('bonusAmounts/create', 'render' => true)), array(
    'dataType' => 'json',
    'type' => 'post',
    'success' => 'function(data) {
                    $("#ajaxLoader").hide();  
                    if(data.status=="success"){
                        $("#formResult").fadeIn();
                        $("#formResult").html("Data saved successfully.");
                        $("#bonus-amounts-form")[0].reset();
                        $("#formResult").animate({opacity:1.0},1000).fadeOut("slow");
                        $.fn.yiiGridView.update("bonus-amounts-grid", {
                            data: $(this).serialize()
                        });
                    }else{
                        //$("#formResultError").html("Data not saved. Pleae solve the following errors.");
                        $.each(data, function(key, val) {
                            $("#bonus-amounts-form #"+key+"_em_").html(""+val+"");                                                    
                            $("#bonus-amounts-form #"+key+"_em_").show();
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

<?php $this->endWidget(); ?>