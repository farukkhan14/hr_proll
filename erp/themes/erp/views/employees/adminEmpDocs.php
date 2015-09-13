<?php
Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('employees-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>
<?php echo CHtml::link('Manage Attached Files', array('/empDocs/admin'), array('class'=>'additionalBtn')); ?>
<fieldset style="float: left; width: 98%;">
    <legend>Employee Docs & Profiles</legend>
    <?php
    $this->widget('ext.groupgridview.GroupGridView', array(
        'id' => 'employees-grid',
        'dataProvider' => $model->search(),
        'mergeColumns' => array('department_id'),
        'filter' => $model,
        'cssFile' => Yii::app()->theme->baseUrl . '/css/gridview/styles.css',
        'columns' => array(  
            'emp_id_no',
            'id_no',
            'full_name',
            array(
                'name' => 'designation_id',
                'value' => 'Designations::model()->infoOfThis($data->designation_id)',
                'filter' => CHtml::listData(Designations::model()->allInfos(), "id", "designation"),
            ),
             array(
                'name' => 'department_id',
                'value' => 'Departments::model()->nameOfThis($data->department_id)',
                'filter' => CHtml::listData(Departments::model()->findAll(), "id", "department_name"),
            ),
            array(
                'name' => 'branch_id',
                'value' => 'Branches::model()->nameOfThis($data->branch_id)',
                'filter' => CHtml::listData(Branches::model()->findAll(), "id", "title"),
            ),
            array(
                'name' => 'is_active',
                'value' => 'Employees::model()->statusColor($data->is_active)',
                'filter' => Lookup::items('is_active'),
            ), 
            array(
                'name' => 'dwnld_fl',
                'value' => 'CHtml::encode(EmpDocs::model()->downloadableFileLink($data->id))',     
                'filter'=>'',
            ), 
            array
                (
                'header' => 'Options',
                'template' => '{view}{upload}',
                'class' => 'CButtonColumn',
                'buttons' => array(
                    'view' => array(
                        'url' => 'Yii::app()->controller->createUrl("viewEmpProfile",array("id"=>$data->id))',
                        'options'=>array("target"=>"_blank"),
//                        'click' => "function(){
//                                    $('#viewDialog').dialog('open');
//                                    $.fn.yiiGridView.update('employees-grid', {
//                                        type:'POST',
//                                        url:$(this).attr('href'),
//                                        success:function(data) {
//                                             $('#ajaxLoaderView').hide();  
//                                              $('#AjFlash').html(data).show();
//                                              $.fn.yiiGridView.update('employees-grid');
//                                        },
//                                        beforeSend: function(){
//                                            $('#ajaxLoaderView').show();
//                                        }
//                                    })
//                                    return false;
//                              }
//                     ",
                    ),
                    'upload' => array(
                        'url' => 'Yii::app()->controller->createUrl("empDocs/create",array("empId"=>$data->id))',
                        'label' => 'Upload Attachments',
                        'imageUrl' => Yii::app()->theme->baseUrl . '/images/upload.ico',
                    ),
                )
            ),
        )
    ));
    ?>
</fieldset>

<?php
$this->beginWidget('zii.widgets.jui.CJuiDialog', array(
    'id' => 'viewDialog',
    'options' => array(
        'title' => 'Employee Profile',
        'autoOpen' => false,
        'modal' => true,
        'width' => '1200',
        'resizable'=>false,
    ),
));
?>
<div id="ajaxLoaderView" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
<div id='AjFlash' style="display:none; margin-top: 20px;">

</div>
<?php $this->endWidget('zii.widgets.jui.CJuiDialog'); ?>