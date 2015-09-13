<fieldset>
    <legend>Basic Informations</legend>
    <table>
        <tr>
            <td><?php echo $form->labelEx($model, 'emp_id_no'); ?></td>
            <td colspan="2"><?php echo $form->textField($model, 'emp_id_no', array('maxlength' => 255, 'style'=>'width: 99%;')); ?></td> 
            <td><span class="heighlightSpan">Keep Employee ID blank to auto generate!</span></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td></td>
            <td colspan="2"><?php echo $form->error($model, 'emp_id_no'); ?></td>
            <td></td>
            <td></td>
            <td></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'full_name'); ?></td>
            <td><?php echo $form->textField($model, 'full_name', array('maxlength' => 255)); ?></td> 
            <td><?php echo $form->labelEx($model, 'national_id_no'); ?></td>
            <td><?php echo $form->textField($model, 'national_id_no', array('maxlength' => 255)); ?></td>
            <td><?php echo $form->labelEx($model, 'dob'); ?></td>
            <td>
                <?php
                Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                $dateTimePickerConfigDob = array(
                    'model' => $model, //Model object
                    'attribute' => 'dob', //attribute name
                    'mode' => 'date', //use "time","date" or "datetime" (default)
                    'language' => 'en-AU',
                    'options' => array(
//                        'ampm' => true,
                        'dateFormat' => 'yy-mm-dd',
                        'changeMonth'=>'true', 
                        'changeYear'=>'true', 
                        'width' => '100',
                    ) // jquery plugin options
                );
                $this->widget('CJuiDateTimePicker', $dateTimePickerConfigDob);
                ?>
            </td>
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'full_name'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'national_id_no'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'dob'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'contact_no'); ?></td>
            <td><?php echo $form->textField($model, 'contact_no', array('maxlength' => 255)); ?></td>
            <td><?php echo $form->labelEx($model, 'contact_no_home'); ?></td>
            <td><?php echo $form->textField($model, 'contact_no_home', array('maxlength' => 255)); ?></td>
            <td><?php echo $form->labelEx($model, 'contact_no_office'); ?></td>
            <td><?php echo $form->textField($model, 'contact_no_office', array('maxlength' => 255)); ?></td>
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'contact_no'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'contact_no_home'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'contact_no_office'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'father_name'); ?></td>
            <td><?php echo $form->textField($model, 'father_name', array('maxlength' => 255)); ?></td> 
            <td><?php echo $form->labelEx($model, 'father_occupation'); ?></td>
            <td><?php echo $form->textField($model, 'father_occupation', array('maxlength' => 255)); ?></td> 
            <td><?php echo $form->labelEx($model, 'email'); ?></td>
            <td><?php echo $form->textField($model, 'email', array('maxlength' => 50)); ?></td>
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'father_name'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'father_occupation'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'email'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'mother_name'); ?></td>
            <td><?php echo $form->textField($model, 'mother_name', array('maxlength' => 255)); ?></td>
            <td><?php echo $form->labelEx($model, 'mother_occopation'); ?></td>
            <td><?php echo $form->textField($model, 'mother_occopation', array('maxlength' => 255)); ?></td>
            <td><?php echo $form->labelEx($model, 'blood_group'); ?></td>
            <td>
                <?php
                echo $form->dropDownList($model, 'blood_group', Lookup::items('blood_group'), array('prompt' => 'select'));
                ?>
            </td> 
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'mother_name'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'mother_occopation'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'blood_group'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'spouse_name'); ?></td>
            <td><?php echo $form->textField($model, 'spouse_name', array('maxlength' => 255)); ?></td> 
            <td><?php echo $form->labelEx($model, 'spouse_relation'); ?></td>
            <td>
                <?php
                echo $form->dropDownList($model, 'spouse_relation', Lookup::items('spouse_relation'), array('prompt' => 'select'));
                ?>
            </td> 
            <td><?php echo $form->labelEx($model, 'gender'); ?></td>
            <td>
                <?php
                echo $form->dropDownList($model, 'gender', Lookup::items('gender'), array('prompt' => 'select'));
                ?>
            </td>  
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'spouse_name'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'spouse_relation'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'gender'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'spouse_details'); ?></td>
            <td><?php echo $form->textArea($model, 'spouse_details'); ?></td>
            <td><?php echo $form->labelEx($model, 'address'); ?></td>
            <td><?php echo $form->textArea($model, 'address'); ?></td>
            <td><?php echo $form->labelEx($model, 'permanent_address'); ?></td>
            <td><?php echo $form->textArea($model, 'permanent_address'); ?></td>
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'spouse_details'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'address'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'permanent_address'); ?></td>
        </tr>
        <tr>
            <td><?php echo $form->labelEx($model, 'marital_status'); ?></td>
            <td>
                <?php
                echo $form->dropDownList($model, 'marital_status', Lookup::items('marital_status'), array('prompt' => 'select'));
                ?>
            </td>   
            <td><?php echo $form->labelEx($model, 'country_id'); ?></td>
            <td>
                <?php
                echo $form->dropDownList(
                        $model, 'country_id', CHtml::listData(Countries::model()->findAll(array('order' => 'country ASC')), 'id', 'country'), array(
                    'prompt' => 'Select',
                ));
                ?>
            </td> 
            <td><?php echo $form->labelEx($model, 'is_active'); ?></td>
            <td>
                <?php
                echo $form->dropDownList($model, 'is_active', Lookup::items('is_active'));
                ?>
            </td>  
        </tr>
        <tr>
            <td></td>
            <td><?php echo $form->error($model, 'marital_status'); ?></td>
            <td></td>
            <td><?php echo $form->error($model, 'country_id'); ?></td> 
            <td></td>
            <td><?php echo $form->error($model, 'is_active'); ?></td>
        </tr>
    </table>
</fieldset>