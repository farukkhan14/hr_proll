<?php
Yii::app()->clientScript->registerScript('search', "
    $('.flash-success').animate({opacity:1.0},2000).fadeOut('slow');
");
?>
<?php
if (Yii::app()->user->hasFlash('success')) {
    echo '<div class="flash-success"><div class="flash-success-icon"></div>' . Yii::app()->user->getFlash('success') . '</div>';
}
if (Yii::app()->user->hasFlash('error')) {
    echo '<div class="flash-error">' . Yii::app()->user->getFlash('error') . '</div>';
}
?>
<?php echo $this->renderPartial('_form', array('model'=>$model)); ?>