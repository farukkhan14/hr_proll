<?php
Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('emp-docs-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>
<?php echo CHtml::link('Back', array('/employees/adminEmpDocs'), array('class'=>'additionalBtn')); ?>
<fieldset style="float: left; width: 98%;">
    <legend>Manage Employee Docs</legend>
    <?php
    $this->widget('ext.groupgridview.GroupGridView', array(
        'id' => 'emp-docs-grid',
        'dataProvider' => $model->search(),
        'mergeColumns' => array('emp_id'),
        'filter' => $model,
        'cssFile' => Yii::app()->theme->baseUrl . '/css/gridview/styles.css',
        'columns' => array(
            array(
                'name' => 'emp_id',
                'value' => 'CHtml::encode(Employees::model()->fullName($data->emp_id))',
                'filter' => CHtml::listData(Employees::model()->findAll(), "id", "full_name"),
                'htmlOptions'=>array('style'=>'text-align: left;'),
            ),
            'emp_doc_title',
            array(
                'name' => 'emp_doc_file',
                'value' => 'CHtml::encode(EmpDocs::model()->downloadableFileLink2($data->id, $data->emp_doc_file))',     
                'filter'=>'',
            ), 
            array
                (
                'header' => 'Options',
                'template' => '{update}{delete}',
                'class' => 'CButtonColumn',
            ),
        )
    ));
    ?>
</fieldset>
