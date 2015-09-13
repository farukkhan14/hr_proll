<?php $this->beginContent('//layouts/main'); ?>
<div class="bannerLogin">
    <img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/banner.jpg" height="70"/>
</div>
<?php echo $content; ?>
<?php $this->endContent(); ?>