<fieldset>
    <legend>Present Job Informations</legend>
    <table>
        <tr>
            <td><?php echo $form->labelEx($model, 'join_date'); ?></td>
            <td>
                <?php
                Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                $dateTimePickerConfigJoin = array(
                    'model' => $model, //Model object
                    'attribute' => 'join_date', //attribute name
                    'mode' => 'date', //use "time","date" or "datetime" (default)
                    'language' => 'en-AU',
                    'options' => array(
//                        'ampm' => true,
                        'changeMonth'=>'true', 
                        'changeYear'=>'true', 
                        'dateFormat' => 'yy-mm-dd',
                        'width' => '100',
                    ) // jquery plugin options
                );
                $this->widget('CJuiDateTimePicker', $dateTimePickerConfigJoin);
                ?>
            </td>  
            <td><?php echo $form->labelEx($model, 'permanent_date'); ?></td>
            <td>
                <?php
                Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                $dateTimePickerConfigPermanent = array(
                    'model' => $model, //Model object
                    'attribute' => 'permanent_date', //attribute name
                    'mode' => 'date', //use "time","date" or "datetime" (default)
                    'language' => 'en-AU',
                    'options' => array(
//                        'ampm' => true,
                        'changeMonth'=>'true', 
                        'changeYear'=>'true', 
                        'dateFormat' => 'yy-mm-dd',
                        'width' => '100',
                    ) // jquery plugin options
                );
                $this->widget('CJuiDateTimePicker', $dateTimePickerConfigPermanent);
                ?>
            </td>  
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'join_date'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'permanent_date'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'id_no'); ?></td>
            <td><?php echo $form->textField($model, 'id_no', array('maxlength' => 20)); ?></td>
            <td><?php echo $form->labelEx($model, 'employee_type'); ?></td>
            <td>
                <?php
                echo $form->dropDownList($model, 'employee_type', Lookup::items('employee_type'), array('prompt' => 'select'));
                ?>
            </td>   
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'id_no'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'employee_type'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'designation_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'designation_id', CHtml::listData(Designations::model()->allInfos(), 'id', 'designation'), array(
                    'prompt' => 'Select',
                ));
                ?>
                <?php
                echo CHtml::link('', "", // the link for open the dialog
                        array(
                    'class' => 'add-additional-btn',
                    'onclick' => "{addSections(); $('#dialogSections').dialog('open');}"));
                ?>

                <?php
                $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                    'id' => 'dialogSections',
                    'options' => array(
                        'title' => 'Add Designation',
                        'autoOpen' => false,
                        'modal' => true,
                        'width' => 550,
                        'resizable' => false,
                    ),
                ));
                ?>
                <div class="divForForm">
                    <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
                </div>

                <?php $this->endWidget(); ?>

                <script type="text/javascript">
                    // here is the magic
                    function addSections(){
<?php
echo CHtml::ajax(array(
    'url' => array('designations/create'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
    $('.ajaxLoaderFormLoad').show();
    }",
    'complete' => "function(){
    $('.ajaxLoaderFormLoad').hide();
    }",
    'success' => "function(data){
                                    if (data.status == 'failure')
                                    {
                                        $('#dialogSections div.divForForm').html(data.div);
                                              // Here is the trick: on submit-> once again this function!
                                        $('#dialogSections div.divForForm form').submit(addSections);
                                    }
                                    else
                                    {
                                        $('#dialogSections div.divForForm').html(data.div);
                                        setTimeout(\"$('#dialogSections').dialog('close') \",1000);
                                        $('#Employees_designation_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                    }
                                                            }",
))
?>;
        return false; 
    } 
                </script> 
            </td>
            <td><?php echo $form->labelEx($model, 'department_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'department_id', CHtml::listData(Departments::model()->findAll(), 'id', 'department_name'), array(
                    'prompt' => 'Select',
                ));
                ?>
                <?php
                echo CHtml::link('', "", // the link for open the dialog
                        array(
                    'class' => 'add-additional-btn',
                    'onclick' => "{addDepartment(); $('#dialogAddDepartment').dialog('open');}"));
                ?>

                <?php
                $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                    'id' => 'dialogAddDepartment',
                    'options' => array(
                        'title' => 'Add Department',
                        'autoOpen' => false,
                        'modal' => true,
                        'width' => 550,
                        'resizable' => false,
                    ),
                ));
                ?>
                <div class="divForForm">
                    <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
                </div>

                <?php $this->endWidget(); ?>

                <script type="text/javascript">
                    // here is the magic
                    function addDepartment(){
<?php
echo CHtml::ajax(array(
    'url' => array('departments/createDepartmentFromOutSide'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
    $('.ajaxLoaderFormLoad').show();
    }",
    'complete' => "function(){
    $('.ajaxLoaderFormLoad').hide();
    }",
    'success' => "function(data){
                                    if (data.status == 'failure')
                                    {
                                        $('#dialogAddDepartment div.divForForm').html(data.div);
                                              // Here is the trick: on submit-> once again this function!
                                        $('#dialogAddDepartment div.divForForm form').submit(addDepartment);
                                    }
                                    else
                                    {
                                        $('#dialogAddDepartment div.divForForm').html(data.div);
                                        setTimeout(\"$('#dialogAddDepartment').dialog('close') \",1000);
                                        $('#Employees_department_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                    }
                                                            }",
))
?>;
        return false; 
    } 
                </script> 
            </td>
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'designation_id'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'department_id'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'section_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'section_id', CHtml::listData(Sections::model()->findAll(), 'id', 'title'), array(
                    'prompt' => 'Select',
                            'ajax' => array(
                                    'type' => 'POST',
                                    'dataType' => 'json',
                                    'url' => CController::createUrl('sectionsSub/subCatOfThisCat'),
                                    'success' => 'function(data) {
                                                $("#Employees_sub_section_id").html(data.subCatList);
                                         }',
                                    'data' => array(
                                        'catId' => 'js:jQuery("#Employees_section_id").val()',
                                    ),
                                    'beforeSend' => 'function(){
                                                    document.getElementById("Employees_sub_section_id").style.background="url(' . Yii::app()->theme->baseUrl . '/images/ajax-loader.gif) no-repeat #FFFFFF 0px 0px";   
                                         }',
                                    'complete' => 'function(){
                                            document.getElementById("Employees_sub_section_id").style.background="#FFFFFF";
                                        }',
                                ),
                ));
                ?>
                <?php
                echo CHtml::link('', "", // the link for open the dialog
                        array(
                    'class' => 'add-additional-btn',
                    'onclick' => "{addSection(); $('#dialogAddSection').dialog('open');}"));
                ?>

                <?php
                $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                    'id' => 'dialogAddSection',
                    'options' => array(
                        'title' => 'Add Section',
                        'autoOpen' => false,
                        'modal' => true,
                        'width' => 550,
                        'resizable' => false,
                    ),
                ));
                ?>
                <div class="divForForm">
                    <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
                </div>

                <?php $this->endWidget(); ?>

                <script type="text/javascript">
                    // here is the magic
                    function addSection(){
<?php
echo CHtml::ajax(array(
    'url' => array('sections/createSectionFromOutSide'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
    $('.ajaxLoaderFormLoad').show();
    }",
    'complete' => "function(){
    $('.ajaxLoaderFormLoad').hide();
    }",
    'success' => "function(data){
                                    if (data.status == 'failure')
                                    {
                                        $('#dialogAddSection div.divForForm').html(data.div);
                                              // Here is the trick: on submit-> once again this function!
                                        $('#dialogAddSection div.divForForm form').submit(addSection);
                                    }
                                    else
                                    {
                                        $('#dialogAddSection div.divForForm').html(data.div);
                                        setTimeout(\"$('#dialogAddSection').dialog('close') \",1000);
                                        $('#Employees_section_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                    }
                                                            }",
))
?>;
        return false; 
    } 
                </script> 
            </td> 
            <td><?php echo $form->labelEx($model, 'sub_section_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'sub_section_id', CHtml::listData(SectionsSub::model()->findAll(), 'id', 'title'), array(
                    'prompt' => 'Select',
                ));
                ?>
                <?php
                echo CHtml::link('', "", // the link for open the dialog
                        array(
                    'class' => 'add-additional-btn',
                    'onclick' => "{addSubSection(); $('#dialogAddSubSection').dialog('open');}"));
                ?>

                <?php
                $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                    'id' => 'dialogAddSubSection',
                    'options' => array(
                        'title' => 'Add Sub-Section',
                        'autoOpen' => false,
                        'modal' => true,
                        'width' => 550,
                        'resizable' => false,
                    ),
                ));
                ?>
                <div class="divForForm">
                    <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
                </div>

                <?php $this->endWidget(); ?>

                <script type="text/javascript">
                    // here is the magic
                    function addSubSection(){
<?php
echo CHtml::ajax(array(
    'url' => array('sectionsSub/createSectionSubFromOutSide'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
    $('.ajaxLoaderFormLoad').show();
    }",
    'complete' => "function(){
    $('.ajaxLoaderFormLoad').hide();
    }",
    'success' => "function(data){
                                    if (data.status == 'failure')
                                    {
                                        $('#dialogAddSubSection div.divForForm').html(data.div);
                                              // Here is the trick: on submit-> once again this function!
                                        $('#dialogAddSubSection div.divForForm form').submit(addSubSection);
                                    }
                                    else
                                    {
                                        $('#dialogAddSubSection div.divForForm').html(data.div);
                                        setTimeout(\"$('#dialogAddSubSection').dialog('close') \",1000);
                                        $('#Employees_sub_section_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                    }
                                                            }",
))
?>;
        return false; 
    } 
                </script> 
            </td>
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'section_id'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'sub_section_id'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'team_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'team_id', CHtml::listData(Teams::model()->findAll(), 'id', 'title'), array(
                    'prompt' => 'Select',
                ));
                ?>
                <?php
                echo CHtml::link('', "", // the link for open the dialog
                        array(
                    'class' => 'add-additional-btn',
                    'onclick' => "{addTeam(); $('#dialogAddTeam').dialog('open');}"));
                ?>

                <?php
                $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                    'id' => 'dialogAddTeam',
                    'options' => array(
                        'title' => 'Add Team',
                        'autoOpen' => false,
                        'modal' => true,
                        'width' => 550,
                        'resizable' => false,
                    ),
                ));
                ?>
                <div class="divForForm">
                    <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
                </div>

                <?php $this->endWidget(); ?>

                <script type="text/javascript">
                    // here is the magic
                    function addTeam(){
<?php
echo CHtml::ajax(array(
    'url' => array('teams/createTeamFromOutSide'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
    $('.ajaxLoaderFormLoad').show();
    }",
    'complete' => "function(){
    $('.ajaxLoaderFormLoad').hide();
    }",
    'success' => "function(data){
                                    if (data.status == 'failure')
                                    {
                                        $('#dialogAddTeam div.divForForm').html(data.div);
                                              // Here is the trick: on submit-> once again this function!
                                        $('#dialogAddTeam div.divForForm form').submit(addTeam);
                                    }
                                    else
                                    {
                                        $('#dialogAddTeam div.divForForm').html(data.div);
                                        setTimeout(\"$('#dialogAddTeam').dialog('close') \",1000);
                                        $('#Employees_team_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                    }
                                                            }",
))
?>;
        return false; 
    } 
                </script> 
            </td>
            <td><?php echo $form->labelEx($model, 'branch_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'branch_id', CHtml::listData(Branches::model()->findAll(), 'id', 'title'), array(
                    'prompt' => 'Select',
                ));
                ?>
                <?php
                echo CHtml::link('', "", // the link for open the dialog
                        array(
                    'class' => 'add-additional-btn',
                    'onclick' => "{addBranch(); $('#dialogAddBranch').dialog('open');}"));
                ?>

                <?php
                $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                    'id' => 'dialogAddBranch',
                    'options' => array(
                        'title' => 'Add Branch',
                        'autoOpen' => false,
                        'modal' => true,
                        'width' => 550,
                        'resizable' => false,
                    ),
                ));
                ?>
                <div class="divForForm">
                    <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
                </div>

                <?php $this->endWidget(); ?>

                <script type="text/javascript">
                    // here is the magic
                    function addBranch(){
<?php
echo CHtml::ajax(array(
    'url' => array('branches/createBranchFromOutSide'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
    $('.ajaxLoaderFormLoad').show();
    }",
    'complete' => "function(){
    $('.ajaxLoaderFormLoad').hide();
    }",
    'success' => "function(data){
                                    if (data.status == 'failure')
                                    {
                                        $('#dialogAddBranch div.divForForm').html(data.div);
                                              // Here is the trick: on submit-> once again this function!
                                        $('#dialogAddBranch div.divForForm form').submit(addBranch);
                                    }
                                    else
                                    {
                                        $('#dialogAddBranch div.divForForm').html(data.div);
                                        setTimeout(\"$('#dialogAddBranch').dialog('close') \",1000);
                                        $('#Employees_branch_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                    }
                                                            }",
))
?>;
        return false; 
    } 
                </script> 
            </td>
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'team_id'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'branch_id'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'stuff_cat_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'stuff_cat_id', CHtml::listData(StuffCat::model()->findAll(), 'id', 'title'), array(
                    'prompt' => 'Select',
                            'ajax' => array(
                                    'type' => 'POST',
                                    'dataType' => 'json',
                                    'url' => CController::createUrl('stuffSubCat/subCatOfThisCat'),
                                    'success' => 'function(data) {
                                                $("#Employees_stuff_sub_cat_id").html(data.subCatList);
                                         }',
                                    'data' => array(
                                        'catId' => 'js:jQuery("#Employees_stuff_cat_id").val()',
                                    ),
                                    'beforeSend' => 'function(){
                                                    document.getElementById("Employees_stuff_sub_cat_id").style.background="url(' . Yii::app()->theme->baseUrl . '/images/ajax-loader.gif) no-repeat #FFFFFF 0px 0px";   
                                         }',
                                    'complete' => 'function(){
                                            document.getElementById("Employees_stuff_sub_cat_id").style.background="#FFFFFF";
                                        }',
                                ),
                ));
                ?>
                <?php
                echo CHtml::link('', "", // the link for open the dialog
                        array(
                    'class' => 'add-additional-btn',
                    'onclick' => "{addStuffCat(); $('#dialogAddStuffCat').dialog('open');}"));
                ?>

                <?php
                $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                    'id' => 'dialogAddStuffCat',
                    'options' => array(
                        'title' => 'Add Stuff Category',
                        'autoOpen' => false,
                        'modal' => true,
                        'width' => 550,
                        'resizable' => false,
                    ),
                ));
                ?>
                <div class="divForForm">
                    <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
                </div>

                <?php $this->endWidget(); ?>

                <script type="text/javascript">
                    // here is the magic
                    function addStuffCat(){
<?php
echo CHtml::ajax(array(
    'url' => array('stuffCat/createStuffCatFromOutSide'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
    $('.ajaxLoaderFormLoad').show();
    }",
    'complete' => "function(){
    $('.ajaxLoaderFormLoad').hide();
    }",
    'success' => "function(data){
                                    if (data.status == 'failure')
                                    {
                                        $('#dialogAddStuffCat div.divForForm').html(data.div);
                                              // Here is the trick: on submit-> once again this function!
                                        $('#dialogAddStuffCat div.divForForm form').submit(addStuffCat);
                                    }
                                    else
                                    {
                                        $('#dialogAddStuffCat div.divForForm').html(data.div);
                                        setTimeout(\"$('#dialogAddStuffCat').dialog('close') \",1000);
                                        $('#Employees_stuff_cat_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                    }
                                                            }",
))
?>;
        return false; 
    } 
                </script> 
            </td>
            <td><?php echo $form->labelEx($model, 'stuff_sub_cat_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'stuff_sub_cat_id', CHtml::listData(StuffSubCat::model()->findAll(), 'id', 'title'), array(
                    'prompt' => 'Select',
                ));
                ?>
                <?php
                echo CHtml::link('', "", // the link for open the dialog
                        array(
                    'class' => 'add-additional-btn',
                    'onclick' => "{addStuffSubCat(); $('#dialogAddStuffSubCat').dialog('open');}"));
                ?>

                <?php
                $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                    'id' => 'dialogAddStuffSubCat',
                    'options' => array(
                        'title' => 'Add Stuff Sub-Category',
                        'autoOpen' => false,
                        'modal' => true,
                        'width' => 550,
                        'resizable' => false,
                    ),
                ));
                ?>
                <div class="divForForm">
                    <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
                </div>

                <?php $this->endWidget(); ?>

                <script type="text/javascript">
                    // here is the magic
                    function addStuffSubCat(){
<?php
echo CHtml::ajax(array(
    'url' => array('stuffSubCat/createStuffSubCatFromOutSide'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
    $('.ajaxLoaderFormLoad').show();
    }",
    'complete' => "function(){
    $('.ajaxLoaderFormLoad').hide();
    }",
    'success' => "function(data){
                                    if (data.status == 'failure')
                                    {
                                        $('#dialogAddStuffSubCat div.divForForm').html(data.div);
                                              // Here is the trick: on submit-> once again this function!
                                        $('#dialogAddStuffSubCat div.divForForm form').submit(addStuffSubCat);
                                    }
                                    else
                                    {
                                        $('#dialogAddStuffSubCat div.divForForm').html(data.div);
                                        setTimeout(\"$('#dialogAddStuffSubCat').dialog('close') \",1000);
                                        $('#Employees_stuff_sub_cat_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                    }
                                                            }",
))
?>;
        return false; 
    } 
                </script> 
            </td>  
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'stuff_cat_id'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'stuff_sub_cat_id'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'bank_ac_no'); ?></td>
            <td><?php echo $form->textField($model, 'bank_ac_no', array('maxlength' => 255)); ?></td> 
            <td><?php echo $form->labelEx($model, 'bank'); ?></td>
            <td><?php echo $form->textField($model, 'bank', array('maxlength' => 255)); ?></td>
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'bank_ac_no'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'bank'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'shift_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'shift_id', CHtml::listData(ShiftHeads::model()->findAll(), 'id', 'titleWithInOutTime'), array(
                    'prompt' => 'Select',
                ));
                ?>
                <?php
                echo CHtml::link('', "", // the link for open the dialog
                        array(
                    'class' => 'add-additional-btn',
                    'onclick' => "{addShiftHead(); $('#addShiftHeadDialog').dialog('open');}"));
                ?>

                <?php
                $this->beginWidget('zii.widgets.jui.CJuiDialog', array(// the dialog
                    'id' => 'addShiftHeadDialog',
                    'options' => array(
                        'title' => 'Add New Shift Head',
                        'autoOpen' => false,
                        'modal' => true,
                        'width' => 'auto',
                        'resizable' => false,
                    ),
                ));
                ?>
                <div class="divForForm">
                    <div class="ajaxLoaderFormLoad" style="display: none;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></div>
                </div>

                <?php $this->endWidget(); ?>

                <script type="text/javascript">
                    // here is the magic
                    function addShiftHead(){
<?php
echo CHtml::ajax(array(
    'url' => array('shiftHeads/createSHFromOutSide'),
    'data' => "js:$(this).serialize()",
    'type' => 'post',
    'dataType' => 'json',
    'beforeSend' => "function(){
$('.ajaxLoaderFormLoad').show();
}",
    'complete' => "function(){
$('.ajaxLoaderFormLoad').hide();
}",
    'success' => "function(data){
                                    if (data.status == 'failure')
                                    {
                                        $('#addShiftHeadDialog div.divForForm').html(data.div);
                                              // Here is the trick: on submit-> once again this function!
                                        $('#addShiftHeadDialog div.divForForm form').submit(addShiftHead);
                                    }
                                    else
                                    {
                                        $('#addShiftHeadDialog div.divForForm').html(data.div);
                                        setTimeout(\"$('#addShiftHeadDialog').dialog('close') \",1000);
                                        $('#Employees_shift_id').append('<option selected value='+data.value+'>'+data.label+'</option>');
                                    }
                                                            }",
))
?>;
        return false; 
    } 
                </script> 
            </td>  
            <td><?php echo $form->labelEx($model, 'contact_end'); ?></td>
            <td>
                <?php
                Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                $dateTimePickerConfigContactEnd = array(
                    'model' => $model, //Model object
                    'attribute' => 'contact_end', //attribute name
                    'mode' => 'date', //use "time","date" or "datetime" (default)
                    'language' => 'en-AU',
                    'options' => array(
//                        'ampm' => true,
                        'changeMonth'=>'true', 
                        'changeYear'=>'true', 
                        'dateFormat' => 'yy-mm-dd',
                        'width' => '100',
                    ) // jquery plugin options
                );
                $this->widget('CJuiDateTimePicker', $dateTimePickerConfigContactEnd);
                ?>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'shift_id'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'contact_end'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'paygrade_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'paygrade_id', CHtml::listData(PayGrades::model()->findAll(), 'id', 'title'), array(
                    'prompt' => 'Select',
                    'ajax' => array(
                        'type' => 'POST',
                        'dataType' => 'json',
                        'url' => CController::createUrl('payGrades/payGradeDetails'),
                        'success' => 'function(data) {
                                        $("#payGradeInfo").html(data.payGradeData);
                                 }',
                        'data' => array(
                            'paygrade_id' => 'js:jQuery("#Employees_paygrade_id").val()',
                        ),
                        'beforeSend' => 'function(){
                                    document.getElementById("Employees_paygrade_id").style.background="url(' . Yii::app()->theme->baseUrl . '/images/ajax-loader.gif) no-repeat #FFFFFF center center";  
                                 }',
                        'complete' => 'function(){
                                    document.getElementById("Employees_paygrade_id").style.background="#FFFFFF"; 
                                }',
                    ),
                ));
                ?>
            </td>   
            <td colspan="2">
                <span id="payGradeInfo">
                    <div class='flash-notice'>Please select a paygrade!</div>
                </span>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'paygrade_id'); ?></td>
            <td></td>
            <td></td>
        </tr>
    </table>
</fieldset>
