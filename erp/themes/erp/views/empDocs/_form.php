<?php
$form = $this->beginWidget('CActiveForm', array(
            'id' => 'emp-docs-form',
            'enableAjaxValidation' => false,
            'htmlOptions' => array('enctype' => 'multipart/form-data'),
        ));
?>
<div class="formDiv">
    <fieldset>
        <legend>Upload Employee Documents</legend>
        <table>
            <tr>
                <td><?php echo $form->labelEx($model, 'emp_id'); ?></td>
                <td>
                <?php 
                if($model->isNewRecord)
                    $model->emp_id=$empId; 
                echo Employees::model()->fullName($model->emp_id);
                echo $form->hiddenField($model, 'emp_id'); 
                ?>
                </td>
                <td><?php echo $form->error($model, 'emp_id'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'emp_doc_title'); ?></td>
                <td><?php echo $form->textField($model, 'emp_doc_title', array('size' => 60, 'maxlength' => 255)); ?></td>
                <td><?php echo $form->error($model, 'emp_doc_title'); ?></td>
            </tr>
            <tr>
                <td><?php echo $form->labelEx($model, 'emp_doc_file'); ?></td>
                <td><?php echo $form->fileField($model, 'emp_doc_file', array('size' => 60, 'maxlength' => 255)); ?></td>
                <td><?php echo $form->error($model, 'emp_doc_file'); ?></td>
            </tr>
        </table> 
    </fieldset>
     <fieldset class="tblFooters">
            <?php echo CHtml::submitButton($model->isNewRecord ? 'Upload' : 'Upload'); ?>
    </fieldset>
</div>
<?php $this->endWidget(); ?>