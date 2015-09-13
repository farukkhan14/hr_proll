<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'advance-pay-recv-form',
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend>Update Advance Pay / Receive Entry</legend>
        <table>   
           <tr>
                <td><?php echo $form->labelEx($model, 'transaction_date'); ?></td>
                <td>
                    <?php
                        Yii::import('application.extensions.CJuiDateTimePicker.CJuiDateTimePicker');
                        $dateTimePickerConfig1 = array(
                            'model' => $model, //Model object
                            'attribute' => 'transaction_date', //attribute name
                            'mode' => 'date', //use "time","date" or "datetime" (default)
                            'language' => '',
                            'options' => array(
//                        'ampm' => true,
                                'changeMonth'=>'true', 
                                'changeYear'=>'true', 
                                'dateFormat' => 'yy-mm-dd',
                                'width' => '100',
                            ) // jquery plugin options
                        );
                        $this->widget('CJuiDateTimePicker', $dateTimePickerConfig1);
                        ?>
                </td>     
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'transaction_date'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'employee_id'); ?></td>
                <td>
                <?php
                    echo $form->dropDownList(
                            $model, 'employee_id', CHtml::listData(Employees::model()->findAll(), 'id', 'full_name'), array(
                        'prompt' => 'Select',
                    ));
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'employee_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'payOrReceive'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList($model, 'payOrReceive', 
                            Lookup::items('payOrReceive'),
                            array('prompt'=>'select')
                            );
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'payOrReceive'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'adv_pay_type'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList($model, 'adv_pay_type', 
                            Lookup::items('adv_pay_type'),
                            array('prompt'=>'select')
                            );
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'adv_pay_type'); ?></td>
            </tr>
             <tr>
                <td><?php echo $form->labelEx($model, 'title'); ?></td>
                <td><?php echo $form->textField($model, 'title', array('maxlength' => 255)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'title'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'details'); ?></td>
                <td><?php echo $form->textArea($model, 'details', array('rows' => 5, 'cols'=>100)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'details'); ?></td>
            </tr>
             <tr>
                <td><?php echo $form->labelEx($model, 'amount'); ?></td>
                <td><?php echo $form->textField($model, 'amount'); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'amount'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'installment'); ?></td>
                <td><?php echo $form->textField($model, 'installment'); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'installment'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'interest'); ?></td>
                <td><?php echo $form->textField($model, 'interest'); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'interest'); ?></td>
            </tr>
        </table>
    </fieldset>

    <fieldset class="tblFooters">
       <span id="ajaxLoaderMR" style="display: none; float: left;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></span>
        <?php echo CHtml::submitButton($model->isNewRecord ? 'Add' : 'Update', array('onclick'=>'loadingDivDisplay();')); ?>
    </fieldset>
</div>
<script type="text/javascript">
    function loadingDivDisplay(){
       $("#ajaxLoaderMR").show();
    }
</script>
<?php $this->endWidget(); ?>
