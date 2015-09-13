<?php
echo CHtml::link('Back', array('/employees/admin/'.$model->id), array('class'=>'additionalBtn', 'title'=>'Back To Manage Page'));
echo CHtml::link('Edit', array('/employees/update/'.$model->id), array('class'=>'additionalBtn', 'title'=>'Edit Info'));
?>
<?php
//$this->widget('zii.widgets.jui.CJuiTabs', array(
//    'id' => 'tabsDetailsView',
//    'tabs'=>array(
//        'Basic'=>$this->renderPartial('_employeeBasicView',array('model'=>$model),TRUE),
//        'Photo'=>$this->renderPartial('_employeePhotoView',array('model'=>$model),TRUE),
//        'Academic'=>$this->renderPartial('_employeeAcademicView',array('model'=>$model),TRUE),
//        'Present Employement'=>$this->renderPartial('_employeeOfficialView',array('model'=>$model),TRUE),
//        'Local Training'=>$this->renderPartial('_employeeInSrvcLclTrngInfView',array('model'=>$model),TRUE),
//        'Foreign Training'=>$this->renderPartial('_employeeFrgnTrngInfView',array('model'=>$model),TRUE),
//        'Foreign Travels'=>$this->renderPartial('_employeeInSrvcFrgnTrvlView',array('model'=>$model),TRUE),
//        'Skills'=>$this->renderPartial('_employeeSkillsView',array('model'=>$model),TRUE),
//        'Publications'=>$this->renderPartial('_employeePublicationsView',array('model'=>$model),TRUE),
//        'Awards/Honours'=>$this->renderPartial('_employeeAwardsView',array('model'=>$model),TRUE),
//        'Prev.Employeement'=>$this->renderPartial('_employeePreviousEmployeementView',array('model'=>$model),TRUE),
//        'Disciplinary Action/Criminal Record'=>$this->renderPartial('_employeeDscplnryCrmnlActnView',array('model'=>$model),TRUE),
//         ),
//    // additional javascript options for the tabs plugin
//    'options'=>array(
//        'collapsible'=>true,
//    ),
//));
?>

<div class="formDiv">
    <fieldset>
        <?php
        $this->widget('CTabView', array(
            'tabs' => array(
                'tab1' => array(
                    'title' => 'Basic',
                    'view' => '_employeeBasicView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab2' => array(
                    'title' => 'Photo',
                    'view' => '_employeePhotoView',
                    'data' => array(
                        'model'=>$model,
                        
                    ),
                ),
                'tab3' => array(
                    'title' => 'Academic',
                    'view' => '_employeeAcademicView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab4' => array(
                    'title' => 'Present Employement',
                    'view' => '_employeeOfficialView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab5' => array(
                    'title' => 'Local Training',
                    'view' => '_employeeInSrvcLclTrngInfView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab6' => array(
                    'title' => 'Foreign Training',
                    'view' => '_employeeFrgnTrngInfView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab7' => array(
                    'title' => 'Foreign Travels',
                    'view' => '_employeeInSrvcFrgnTrvlView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab8' => array(
                    'title' => 'Skills',
                    'view' => '_employeeSkillsView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab9' => array(
                    'title' => 'Publications',
                    'view' => '_employeePublicationsView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab10' => array(
                    'title' => 'Awards/Honours',
                    'view' => '_employeeAwardsView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab11' => array(
                    'title' => 'Prev.Employment',
                    'view' => '_employeePreviousEmployeementView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab12' => array(
                    'title' => 'Disciplinary Action/Criminal Record',
                    'view' => '_employeeDscplnryCrmnlActnView',
                    'data' => array(
                        'model' => $model,
                        
                    ),
                ),
                'tab13' => array(
                    'title' => 'Children',
                    'view' => '_employeeChildrenView',
                    'data' => array(
                        'model' => $model,
                    ),
                ),
            ),
        ));
        ?>
    </fieldset>
    </div>
<style>
    .yiiTab ul.tabs {
        font: 12px Verdana,sans-serif;
    }
    .yiiTab ul.tabs a{
        padding: 2px;
        border-radius: 4px 4px 0 2px;
    }
    fieldset{
        border: none;
    }
</style>

<script>
//    $(function() {
//        $( "#tabsDetailsView" ).tabs();
//    });
</script>
