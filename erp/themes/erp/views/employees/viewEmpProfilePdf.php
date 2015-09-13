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
                    ?>
                    <img width="70" height="80" src="<?php echo Yii::getPathOfAlias('webroot.upload.empPhoto'); ?>/<?php echo $model->photo; ?>" alt="<?php echo $model->photo; ?>" />
                    <?php
                } else {
                    ?>
                    <img width="70" height="80" src="<?php echo Yii::getPathOfAlias('webroot.themes.erp'); ?>/images/preview_img.png" alt="Employee Photo" />
                    <?php
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
        background-color: #FFFFFF;
        color: #000000;
        text-align: center;
        font-size: 8px;
    }
    table.reportTab,
    table.reportTab tr, 
    table.reportTab tr td,
    table.reportTab tr th{
        border: 1px solid #C0C0C0;
    }
    table.reportTab tr td.textAlgnLeft{
        text-align: left;
    }
    table.reportTab tr td.textAlgnRight{
        text-align: right;
    }
</style>