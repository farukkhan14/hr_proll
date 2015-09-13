<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'ah-proll-form',
            'enableAjaxValidation' => false,
            'enableClientValidation' => true,
            'clientOptions' => array('validateOnSubmit' => true),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend><?php echo ($model->isNewRecord ? 'Add New Earning/Deduction Heade' : 'Update Earning/Deduction Head Info'); ?></legend>
        <table>   
            <tr>
                <td><?php echo $form->labelEx($model, 'title'); ?></td>
                <td><?php echo $form->textField($model, 'title', array('maxlength' => 255)); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'title'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'is_basic_salary'); ?></td>
                <td><?php echo $form->checkBox($model, 'is_basic_salary', array('id'=>'AhProll_is_basic_salary2')); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'is_basic_salary'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'is_provident_fund'); ?></td>
                <td><?php echo $form->checkBox($model, 'is_provident_fund', array('id'=>'AhProll_is_provident_fund2')); ?></td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'is_provident_fund'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'paygrade_id'); ?></td>
                <td>
                    <?php
                    echo $form->dropDownList(
                            $model, 'paygrade_id', CHtml::listData(PayGrades::model()->findAll(), 'id', 'title'), array(
                        'prompt' => 'Select',
                        'style' => 'width: 167px;'
                    ));
                    ?>
                </td>            
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'paygrade_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'ac_type'); ?></td>
                <td>
                    <?php echo $form->dropDownList($model, 'ac_type', Lookup::items('ac_type'), array('prompt' => 'select')); ?>
                </td>    
            </tr>
            <tr>
                <td></td>
                <td><?php echo $form->error($model, 'ac_type'); ?></td>
            </tr>
        </table>
    </fieldset>

    <fieldset class="tblFooters">
        <span id="ajaxLoaderMR" style="display: none; float: left;"><img src="<?php echo Yii::app()->theme->baseUrl; ?>/images/ajax-loader.gif" /></span>
            <?php echo CHtml::submitButton($model->isNewRecord ? 'Add' : 'Update', array('onclick' => 'loadingDivDisplay();')); ?>
    </fieldset>
</div>
<script type="text/javascript">
    function loadingDivDisplay(){
        $("#ajaxLoaderMR").show();
    }
    $(document).ready(function(){
        var isBasicSalary2=document.getElementById("AhProll_is_basic_salary2");
        var isProvidentFund2=document.getElementById("AhProll_is_provident_fund2");
        $(isBasicSalary2).change(function(){
           if(isBasicSalary2.checked){
               isProvidentFund2.checked=false;
           }
        });
        $(isProvidentFund2).change(function(){
           if(isProvidentFund2.checked){
               isBasicSalary2.checked=false;
           }
        });
    })
</script>
<?php $this->endWidget(); ?>