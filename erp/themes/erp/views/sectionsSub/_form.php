<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'sections-sub-form',
            'action' => $this->createUrl('sectionsSub/create'),
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>

<div id="formResult" class="ajaxTargetDiv"></div>
<div id="formResultError" class="ajaxTargetDivErr"></div>

<div class="formDiv">
    <fieldset>
        <legend><?php echo ($model->isNewRecord ? 'Add New Sub-Section' : 'Update Sub-Section'); ?></legend>
        <table>
            <tr>
                <td><?php echo $form->labelEx($model, 'section_id'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList(
                            $model, 'section_id', CHtml::listData(Sections::model()->findAll(), 'id', 'title'), array(
                        'prompt' => 'Select',
                    ));
                    ?>
                    <?php
                    echo CHtml::link('', "", // the link for open the dialog
                            array(
                        'class' => 'add-additional-btn',
                        'onclick' => "{addSection(); $('#dialogAddSection').dialog('open');}"));
                    ?>

                    <?php
                    $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                        'id' => 'dialogAddSection',
                        'options' => array(
                            'title' => 'Add Section',
                            'autoOpen' => false,
                            'modal' => true,
                            'width' => 550,
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
                        function addSection(){
<?php
echo CHtml::ajax(array(
    'url' => array('sections/createSectionFromOutSide'),
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
                                            $('#dialogAddSection div.divForForm').html(data.div);
                                                  // Here is the trick: on submit-> once again this function!
                                            $('#dialogAddSection div.divForForm form').submit(addSection);
                                        }
                                        else
                                        {
                                            $('#dialogAddSection div.divForForm').html(data.div);
                                            setTimeout(\"$('#dialogAddSection').dialog('close') \",1000);
                                            $('#SectionsSub_section_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
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
                <td><?php echo $form->error($model, 'section_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'title'); ?></td>
                <td><?php echo $form->textField($model, 'title', array('maxlength' => 255)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'title'); ?></td>
            </tr>
        </table>
        <div id="ajaxLoader" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
    </fieldset>

    <fieldset class="tblFooters">
        <?php
        echo CHtml::ajaxSubmitButton('Save', CHtml::normalizeUrl(array('sectionsSub/create', 'render' => true)), array(
            'dataType' => 'json',
            'type' => 'post',
            'success' => 'function(data) {
                $("#ajaxLoader").hide();  
                    if(data.status=="success"){
                        $("#formResult").fadeIn();
                        $("#formResult").html("Data saved successfully.");
                        $("#sections-sub-form")[0].reset();
                        $("#formResult").animate({opacity:1.0},1000).fadeOut("slow");
                        $.fn.yiiGridView.update("sections-sub-grid", {
		data: $(this).serialize()
	});
                    }else{
                        //$("#formResultError").html("Data not saved. Pleae solve the following errors.");
                        $.each(data, function(key, val) {
                            $("#sections-sub-form #"+key+"_em_").html(""+val+"");                                                    
                            $("#sections-sub-form #"+key+"_em_").show();
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

<?php $this->endWidget(); ?>
