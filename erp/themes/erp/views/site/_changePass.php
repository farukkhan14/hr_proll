<?php
echo CHtml::link('Change Password', "", // the link for open the dialog
        array(
            'class'=>'additionalBtn',
            'style'=>'float: right;',
    'onclick' => "{changePass(); $('#dialogChangePass').dialog('open');}"));
?>

<?php
$this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
    'id' => 'dialogChangePass',
    'options' => array(
        'title' => 'Change Password',
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
    function changePass(){
<?php
echo CHtml::ajax(array(
    'url' => array('users/changePassword'),
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
                        $('#dialogChangePass div.divForForm').html(data.div);
                        $('#dialogChangePass div.divForForm form').submit(changePass);
                    }
                    else
                    {
                        $('#dialogChangePass div.divForForm').html(data.div);
                        setTimeout(\"$('#dialogChangePass').dialog('close') \",1000);
                    }
                                            }",
))
?>;
return false; 
} 
</script>