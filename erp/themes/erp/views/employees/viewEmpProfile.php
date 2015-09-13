<?php
echo "<div class='printBtn'>";
$this->widget('ext.mPrint.mPrint', array(
    'title' => ' ', //the title of the document. Defaults to the HTML title
    'tooltip' => 'Print', //tooltip message of the print icon. Defaults to 'print'
    'text' => '', //text which will appear beside the print icon. Defaults to NULL
    'element' => '.printAllTableForThisReport', //the element to be printed.
    'exceptions' => array(//the element/s which will be ignored
    ),
    'publishCss' => FALSE, //publish the CSS for the whole page?
    'visible' => Yii::app()->user->checkAccess('print'), //should this be visible to the current user?
    'alt' => 'print', //text which will appear if image can't be loaded
    'debug' => FALSE, //enable the debugger to see what you will get
    'id' => 'print-div'         //id of the print link
));
echo CHtml::link('', array('/employees/createPdfDoc/'.$model->id), array('class'=>'pdfLnkImg', 'title'=>'Save as PDF'));
echo "</div>";
?>
<div class='printAllTableForThisReport'>
    <table class="reportTab">
        <tr>
            <td colspan="2" class="textAlgnLeft" style="vertical-align: top; border-right: none;">
                <b>Profile Of <i><?php echo $model->full_name; ?></i></b><br/>
                NID: <?php echo $model->national_id_no; ?><br/>
                CELL: <?php echo $model->contact_no; ?> | E-Mail: <?php echo $model->email; ?>
            </td>
            <td colspan="2" class="textAlgnRight" style="vertical-align: top; border-left: none;">
                <?php
                if ($model->photo != "") {
                    echo "<img id='thumb' src='" . Yii::app()->request->baseUrl . "/upload/empPhoto/" . $model->photo . "' alt='" . $model->photo . "' height='130' width='130'>";
                } else {
                    echo "<img id='thumb' src='" . Yii::app()->theme->baseUrl . "/images/preview_img.png' alt='Employee Photo' height='130' width='130'>";
                }
                ?>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="padding: 10px 0px; font-weight: bold;">Official Information</td>
            <td colspan="2" style="padding: 10px 0px; font-weight: bold;">Personal Information</td>
        </tr>
        <tr>
            <td class="textAlgnLeft">Employee ID</td>
            <td class="textAlgnLeft"><?php echo $model->emp_id_no; ?></td>
            <td class="textAlgnLeft">Full Name</td>
            <td class="textAlgnLeft"><?php echo $model->full_name; ?></td>
        </tr>
        <tr>
            <td class="textAlgnLeft">Team / Unit</td>
            <td class="textAlgnLeft"><?php echo Teams::model()->infoOfThis($model->team_id); ?></td>
            <td class="textAlgnLeft">Father's Name</td>
            <td class="textAlgnLeft"><?php echo $model->father_name; ?></td>
        </tr>
        <tr>
            <td class="textAlgnLeft">Joining Date</td>
            <td class="textAlgnLeft"><?php echo $model->join_date; ?></td>
            <td class="textAlgnLeft">Mother's Name</td>
            <td class="textAlgnLeft"><?php echo $model->mother_name; ?></td>
        </tr>
        <tr>
            <td class="textAlgnLeft">Department</td>
            <td class="textAlgnLeft"><?php echo Departments::model()->nameOfThis($model->department_id); ?></td>
            <td class="textAlgnLeft">Gender</td>
            <td class="textAlgnLeft"><?php echo Lookup::item('gender', $model->gender); ?></td>
        </tr>
        <tr>
            <td class="textAlgnLeft">Section</td>
            <td class="textAlgnLeft"><?php echo Sections::model()->nameOfThis($model->section_id); ?></td>
            <td class="textAlgnLeft">Is Active</td>
            <td class="textAlgnLeft"><?php echo Lookup::item('is_active', $model->is_active); ?></td>
        </tr>
        <tr>
            <td class="textAlgnLeft">Designation</td>
            <td class="textAlgnLeft"><?php echo Designations::model()->infoOfThis($model->designation_id); ?></td>
            <td class="textAlgnLeft">Date Of Birth</td>
            <td class="textAlgnLeft"><?php echo $model->dob; ?></td>
        </tr>
        <tr>
            <td class="textAlgnLeft" rowspan="2">Paygrade Details</td>
            <td class="textAlgnLeft" rowspan="2">
                <?php /* ?>
                <b>Paygrade: </b><?php echo PayGrades::model()->nameOfThis($model->paygrade_id); ?>
                <?php
                    echo PayGrades::model()->detailsOfThisPayGrade($model->paygrade_id);
                ?>
                 <?php */ ?>
            </td>
            <td class="textAlgnLeft">Blood Group</td>
            <td class="textAlgnLeft"><?php echo Lookup::item('blood_group', $model->blood_group); ?></td>
        </tr>
        <tr>
            <td class="textAlgnLeft">Permanent Address</td>
            <td class="textAlgnLeft"><pre><?php echo $model->permanent_address; ?></pre></td>
        </tr>
        <tr>
            <td colspan="4" style="padding: 10px 0px; font-weight: bold;">Academic Information</td>
        </tr>
        <tr>
            <td colspan="4">
                <pre><?php echo $model->edu_info; ?></pre>
            </td>
        </tr>
    </table>
</div>
<style>
    table.reportTab{
        float: left;
        width: 100%;
        border-collapse: collapse;
        background-color: rgba(0, 0, 0, 0);
        color: #000000;
        text-align: center;
        font-size: 12px;
    }
    table.reportTab,
    table.reportTab tr, 
    table.reportTab tr td,
    table.reportTab tr th{
        border: 1px solid #C0C0C0;
    }
    table.reportTab tr.odd{
        background-color: #FFFFDC;
    }
    table.reportTab tr.even{
        background-color: #FFFFFF;
    }
    table.reportTab tr td{
        padding:4px;
    }
    table.reportTab tr td.textAlgnLeft{
        text-align: left;
    }
    table.reportTab tr td.textAlgnRight{
        text-align: right;
    }
    table.reportTab tr td.heightLight{
        background-color: #FFFF00;
    }
    table.reportTab tr td.bold{
        font-weight: bold;
    }
    table.reportTab tr td.red{
        color: red;
    }
    table.reportTab tr td.blue{
        color: blue;
    }
    table.reportTabNoBorder, table.reportTabNoBorder tr, table.reportTabNoBorder tr td{
        border: none;
    }
    span.reportTitle{
        float: left;
        width: 100%;
        text-align: center;
        font-weight: bold;
        font-size: 16px;
        margin-bottom: 10px;
    }
    table.reportTab, table.reportTab tr{
        border: none;
    }
</style>