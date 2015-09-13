<?php
Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('pay-grade-onoff-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>
<fieldset style="float: left; width: 98%;">
    <legend>Manage Pay Grade Settings</legend>
    <?php
    $this->widget('ext.groupgridview.GroupGridView', array(
        'id' => 'pay-grade-onoff-grid',
        'dataProvider' => $model->search(),
        'filter' => $model,
        'cssFile' => Yii::app()->theme->baseUrl . '/css/gridview/styles.css',
        'columns' => array( 
            'title',
            array(
                'name' => 'is_active',
                'value' => 'PayGradeOnOff::model()->statusColor($data->is_active)',
                'filter' => Lookup::items('is_active'),
            ),
            array
                (
                'htmlOptions'=>array('style'=>'width: 80px'),
                'header' => 'Options',
                'template' => '{activate}{inactivate}',
                'class' => 'CButtonColumn',
                'buttons' => array(
                    'activate' => array(
                        'label' => 'Activate',
                          'imageUrl' => Yii::app()->theme->baseUrl . '/images/activate.ico',
                        'url' => 'Yii::app()->controller->createUrl("changeStatusPayGradeOnoff",array("id"=>$data->id, "status"=>"activate"))',
//                        'click' => "function(){
//                                            $.fn.yiiGridView.update('pay-grade-onoff-grid', {
//                                                type:'POST',
//                                                url:$(this).attr('href'),
//                                                success:function(data) {
//                                                      $.fn.yiiGridView.update('pay-grade-onoff-grid'); 
//                                                }
//                                            })
//                                            return false;
//                                          }",
                    ),
                   'inactivate' => array(
                        'label' => 'Inactivate',
                         'imageUrl' => Yii::app()->theme->baseUrl . '/images/inactivate.ico',
                        'url' => 'Yii::app()->controller->createUrl("changeStatusPayGradeOnoff",array("id"=>$data->id, "status"=>"inactivate"))',
//                        'click' => "function(){
//                                            $.fn.yiiGridView.update('pay-grade-onoff-grid', {
//                                                type:'POST',
//                                                url:$(this).attr('href'),
//                                                success:function(data) {
//                                                      $.fn.yiiGridView.update('pay-grade-onoff-grid'); 
//                                                }
//                                            })
//                                            return false;
//                                          }",
                    ),
                )
            ),
        )
    ));
    ?>
</fieldset>

