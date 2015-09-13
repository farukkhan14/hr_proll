
<?php
Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('emp-leaves-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>
<?php if ($model->isNewRecord) { ?>
    <?php echo $this->renderPartial('_form', array('model' => $model)); ?>
<?php } else { ?>
    <?php echo $this->renderPartial('_form2', array('model' => $model)); ?>
<?php } ?>
<div id="statusMsg"></div>
<fieldset style="float: left; width: 98%;">
    <legend>Manage Employee Leaves</legend>
    <?php
    $this->widget('ext.groupgridview.GroupGridView', array(
        'id' => 'emp-leaves-grid',
        'dataProvider' => $model->search(),
        'filter' => $model,
        'mergeColumns' => array('transaction_date'),
        'cssFile' => Yii::app()->theme->baseUrl . '/css/gridview/styles.css',
        'columns' => array(
            'transaction_date',
            array(
                'name' => 'emp_id',
                'value' => 'CHtml::encode(Employees::model()->fullName($data->emp_id))',
                'filter' => CHtml::listData(Employees::model()->findAll(), "id", "full_name"),
                'htmlOptions'=>array('style'=>'text-align: left;'),
            ),
            array(
                'name' => 'lh_proll_id',
                'value' => 'CHtml::encode(LhProll::model()->nameOfThis($data->lh_proll_id))',
                'filter' => CHtml::listData(LhProll::model()->findAll(), "id", "title"),
            ),
            'subj',
            'day_to_leave',
            'hour_to_leave',
            array(
                'name' => 'is_approved',
                'value' => 'CHtml::encode(EmpLeaves::model()->statusColor($data->is_approved))',
                'filter' => Lookup::items('is_approved'),
            ),
            array
                (
                'htmlOptions'=>array('style'=>'width: 100px;'),
                'header' => 'Options',
                'template' => '{approve}{deny}{history}{view}{update}{delete}',
                'afterDelete' => 'function(link,success,data){ if(success) $("#statusMsg").html(data); }',
                'class' => 'CButtonColumn',
                'buttons' => array(
                    'update' => array(
                        'click' => "function( e ){
                            e.preventDefault();
                            $( '#update-dialog' ).children( ':eq(0)' ).empty(); // Stop auto POST
                            updateDialog( $( this ).attr( 'href' ) );
                            $( '#update-dialog' )
                              .dialog( { title: 'Update Info' } )
                              .dialog( 'open' ); }",
                    ),
                     'approve' => array(
                        'label' => 'Approve',
                        'imageUrl' => Yii::app()->theme->baseUrl . '/images/approving.ico',
                        'url' => 'Yii::app()->controller->createUrl("approve",array("id"=>$data->id))',
                        'click' => "function(){
                                       $.fn.yiiGridView.update('emp-leaves-grid', {
                                                type:'POST',
                                                url:$(this).attr('href'),
                                                success:function(data) {
                                                      alertify.alert(data);
                                                      $.fn.yiiGridView.update('emp-leaves-grid'); 
                                                }
                                            })
                                            return false;
                              }
                     ",
                    ),
                     'deny' => array(
                        'label' => 'Deny',
                        'imageUrl' => Yii::app()->theme->baseUrl . '/images/deny.ico',
                        'url' => 'Yii::app()->controller->createUrl("deny",array("id"=>$data->id))',
                        'click' => "function(){
                                       $.fn.yiiGridView.update('emp-leaves-grid', {
                                                type:'POST',
                                                url:$(this).attr('href'),
                                                success:function(data) {
                                                      alertify.alert(data);
                                                      $.fn.yiiGridView.update('emp-leaves-grid'); 
                                                }
                                            })
                                            return false;
                              }
                     ",
                    ),
                    'history' => array(
                        'label' => 'Status Changed History',
                        'imageUrl' => Yii::app()->theme->baseUrl . '/images/history.ico',
                        'url' => 'Yii::app()->controller->createUrl("statusChangedHistory",array("id"=>$data->id))',
                        'click' => "function(){
                                    $('#viewDialog').dialog('open');
                                    $.fn.yiiGridView.update('emp-leaves-grid', {
                                        type:'POST',
                                        url:$(this).attr('href'),
                                        success:function(data) {
                                             $('#ajaxLoaderView').hide();  
                                              //$('#AjFlash').html(data).fadeIn().animate({opacity: 1.0}, 3000).fadeOut('slow');
                                              $('#AjFlash').html(data).show();
                                              $.fn.yiiGridView.update('emp-leaves-grid');
                                        },
                                        beforeSend: function(){
                                            $('#ajaxLoaderView').show();
                                        }
                                    })
                                    return false;
                              }
                     ",
                    ),
                    'view' => array(
                        'url' => 'Yii::app()->controller->createUrl("view",array("id"=>$data->id))',
                        'click' => "function(){
                                    $('#viewDialog').dialog('open');
                                    $.fn.yiiGridView.update('emp-leaves-grid', {
                                        type:'POST',
                                        url:$(this).attr('href'),
                                        success:function(data) {
                                             $('#ajaxLoaderView').hide();  
                                              //$('#AjFlash').html(data).fadeIn().animate({opacity: 1.0}, 3000).fadeOut('slow');
                                              $('#AjFlash').html(data).show();
                                              $.fn.yiiGridView.update('emp-leaves-grid');
                                        },
                                        beforeSend: function(){
                                            $('#ajaxLoaderView').show();
                                        }
                                    })
                                    return false;
                              }
                     ",
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
        'title' => 'Details Information',
        'autoOpen' => false,
        'modal' => true,
        'width' => 1030,
        'resizable' => false,
    ),
));
?>
<div id="ajaxLoaderView" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
<div id='AjFlash' style="display:none; margin-top: 20px;">

</div>
<?php $this->endWidget('zii.widgets.jui.CJuiDialog'); ?>

<?php
$this->beginWidget('zii.widgets.jui.CJuiDialog', array(
    'id' => 'update-dialog',
    'options' => array(
        'title' => 'Update Info',
        'autoOpen' => false,
        'modal' => true,
        'width' => 1030,
        'resizable' => false,
    ),
));
?>
<div class="update-dialog-content"></div>
<?php $this->endWidget(); ?>

<?php
$updateJS = CHtml::ajax(array(
            'url' => "js:url",
            'data' => "js:form.serialize() + action",
            'type' => 'post',
            'dataType' => 'json',
            'success' => "function( data )
  {
    if( data.status == 'failure' )
    {
      $( '#update-dialog div.update-dialog-content' ).html( data.content );
      $( '#update-dialog div.update-dialog-content form input[type=submit]' )
        .die() // Stop from re-binding event handlers
        .live( 'click', function( e ){ // Send clicked button value
          e.preventDefault();
          updateDialog( false, $( this ).attr( 'name' ) );
      });
    }
    else
    {
      $( '#update-dialog div.update-dialog-content' ).html( data.content );
      if( data.status == 'success' ) // Update all grid views on success
      {
        $( 'div.grid-view' ).each( function(){ // Change the selector if you use different class or element
          $.fn.yiiGridView.update( $( this ).attr( 'id' ) );
        });
      }
      setTimeout( \"$( '#update-dialog' ).dialog( 'close' ).children( ':eq(0)' ).empty();\", 1000 );
    }
  }"
        ));
?>

<?php Yii::app()->clientScript->registerScript('updateDialog', "
function updateDialog( url, act )
{
  var action = '';
  var form = $( '#update-dialog div.update-dialog-content form' );
  if( url == false )
  {
    action = '&action=' + act;
    url = form.attr( 'action' );
  }
  {$updateJS}
}"); ?>

<?php
Yii::app()->clientScript->registerScript('updateDialogCreate', "
jQuery( function($){
    $( 'a.update-dialog-create' ).bind( 'click', function( e ){
      e.preventDefault();
      $( '#update-dialog' ).children( ':eq(0)' ).empty();
      updateDialog( $( this ).attr( 'href' ) );
      $( '#update-dialog' )
        .dialog( { title: 'Create' } )
        .dialog( 'open' );
    });
});
");
?>

