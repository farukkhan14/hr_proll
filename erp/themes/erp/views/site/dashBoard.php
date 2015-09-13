<?php /* ?>
  <link rel='stylesheet' href='<?php echo Yii::app()->theme->baseUrl; ?>/calendar/fullcalendar.css' />
  <script src='<?php echo Yii::app()->theme->baseUrl; ?>/calendar/lib/jquery.min.js'></script>
  <script src='<?php echo Yii::app()->theme->baseUrl; ?>/calendar/lib/moment.min.js'></script>
  <script src='<?php echo Yii::app()->theme->baseUrl; ?>/calendar/fullcalendar.js'></script>
  <script src="<?php echo Yii::app()->theme->baseUrl; ?>/clock/jqClock.min.js"></script>
  <div style="float: left; width: 430px; border: 1px solid #eeeeee; margin-left: 4px; padding: 8px; box-shadow: 5px 5px 13px olivedrab;">
  <div id="dgClck" style="float: right; width: 116px; font-weight: bold; border: 2px inset White; background: Black; padding: 5px; font-size: 14px; font-family: 'Courier'; color: LightGreen; display: block;">CLOCK</div>
  <div id='calendar' style="float: left; width: 100%;"></div>
  </div>
  <script type="text/javascript">
  $(document).ready(function(){
  $('#calendar').fullCalendar({
  'firstDay':7
  })
  $("#dgClck").clock({"calendar":"false"});
  });
  </script>
  <?php */ ?>
<fieldset style="float: left; width: 98%;">
    <legend>Dashboard - Your IP Address: <?php echo Yii::app()->request->getUserHostAddress(); ?></legend>
    <?php echo $this->renderPartial('_changePass'); ?>
    <?php if (Users::model()->isSuperAdmin() == true) { ?>
        <?php echo $this->renderPartial('_profile'); ?>
        <hr/>
        <?php echo $this->renderPartial('_dashBoardBtns'); ?>
    <?php } else { ?>
        <?php echo $this->renderPartial('_profile2'); ?>
    <?php } ?>
</fieldset>
