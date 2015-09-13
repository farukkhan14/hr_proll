<?php echo CHtml::link('Collapse Profile', array('#'), array('class'=>'additionalBtn', 'id'=>'profileBtn', 'title'=>'Profile', 'style'=>'float: right;')); ?>
<div id="profileDiv">
  <div class="formDiv">
    <fieldset>
        <?php
        $userInfo=  Users::model()->findByPk(Yii::app()->user->getId());
        $model=Employees::model()->findByPk($userInfo->employee_id);
        if($model){
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
        }else{
            echo "<div class='flash-error'>This user has not been assigned to any employee !</div>";
        }
        ?>
    </fieldset>
    </div>
<style>
    #profileDiv{ 
        float: left; 
        width: 100%;
    }
    .yiiTab div.view {
        border-radius: 0 0 8px 8px;
        box-shadow: 4px 4px 2px #e3e3e3;
     }
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
</div>
<script>
    $(document).ready(function(){
       $("#profileBtn").click(function(e){
            e.preventDefault();
            if($(this).html()=="Expand Profile"){
                $(this).html("Collapse Profile");
                $("#profileDiv").slideDown();
            }else{
                $(this).html("Expand Profile");
                $("#profileDiv").slideUp();
            }
       })
    });
</script>