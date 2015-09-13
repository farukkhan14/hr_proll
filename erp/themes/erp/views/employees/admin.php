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
$('.flash-success').animate({opacity:1.0},2000).fadeOut('slow');
");
?>
<?php
if (Yii::app()->user->hasFlash('success')) {
    echo '<div class="flash-success">' . Yii::app()->user->getFlash('success') . '</div>';
}
if (Yii::app()->user->hasFlash('error')) {
    echo '<div class="flash-error">' . Yii::app()->user->getFlash('error') . '</div>';
}
?>
<fieldset style="float: left; width: 98%;">
    <legend>Manage Employees</legend>
    <?php
    $this->widget('ext.groupgridview.GroupGridView', array(
        'id' => 'employees-grid',
        'dataProvider' => $model->search(),
        'mergeColumns' => array('department_id'),
        'filter' => $model,
        'cssFile' => Yii::app()->theme->baseUrl . '/css/gridview/styles.css',
        'columns' => array(  
            'emp_id_no',
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
                'name' => 'is_active',
                'value' => 'Employees::model()->statusColor($data->is_active)',
                'filter' => Lookup::items('is_active'),
            ), 
            array
                (
                'header' => 'Options',
                'template' => '{view}{update}{delete}',
                'class' => 'CButtonColumn',
            ),
        )
    ));
    ?>
</fieldset>


