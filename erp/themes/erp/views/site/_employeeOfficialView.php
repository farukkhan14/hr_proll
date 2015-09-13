<fieldset>
    <legend>Official Informations</legend>
    <table class="reportTab">
        <tr class="odd">
            <th class="textAlgnLeft">Join Date</th>
            <td class="textAlgnLeft"><?php echo $model->join_date; ?></td>
            <th class="textAlgnLeft">Permanent Date</th>
            <td class="textAlgnLeft"><?php echo $model->permanent_date; ?></td>
        </tr>
        <tr class="even">
            <th class="textAlgnLeft">Punch Card No</th>
            <td class="textAlgnLeft"><?php echo $model->id_no; ?></td>
            <th class="textAlgnLeft">Employee Type</th>
            <td class="textAlgnLeft"><?php echo Lookup::item('employee_type', $model->employee_type); ?></td>
        </tr>
        <tr class="odd">
            <th class="textAlgnLeft">Designation</th>
            <td class="textAlgnLeft"><?php echo Designations::model()->infoOfThis($model->designation_id); ?></td>
            <th class="textAlgnLeft">Department</th>
            <td class="textAlgnLeft"><?php echo Departments::model()->nameOfThis($model->department_id); ?></td>
        </tr>
        <tr class="even">
            <th class="textAlgnLeft">Section</th>
            <td class="textAlgnLeft"><?php echo Sections::model()->nameOfThis($model->section_id); ?></td>
            <th class="textAlgnLeft">Sub-Section</th>
            <td class="textAlgnLeft"><?php echo SectionsSub::model()->nameOfThis($model->sub_section_id); ?></td>
        </tr>
        <tr class="odd">
            <th class="textAlgnLeft">Team / Line</th>
            <td class="textAlgnLeft"><?php echo Teams::model()->infoOfThis($model->team_id); ?></td>
            <th class="textAlgnLeft">Branch</th>
            <td class="textAlgnLeft"><?php echo Branches::model()->nameOfThis($model->branch_id); ?></td>
        </tr>
        <tr class="even">
            <th class="textAlgnLeft">Stuff Category</th>
            <td class="textAlgnLeft"><?php echo StuffCat::model()->nameOfThis($model->stuff_cat_id); ?></td>
            <th class="textAlgnLeft">Stuff Sub-Category</th>
            <td class="textAlgnLeft"><?php echo StuffSubCat::model()->nameOfThis($model->stuff_sub_cat_id); ?></td>
        </tr>
        <tr class="odd">
            <th class="textAlgnLeft">Bank A/C No</th>
            <td class="textAlgnLeft"><?php echo $model->bank_ac_no; ?></td>
            <th class="textAlgnLeft">Bank</th>
            <td class="textAlgnLeft"><?php echo $model->bank; ?></td>
        </tr>
        <tr class="even">
            <th class="textAlgnLeft">Shift</th>
            <td class="textAlgnLeft"><?php echo ShiftHeads::model()->detailsOfThis($model->shift_id); ?></td>
            <th class="textAlgnLeft">Contact End</th>
            <td class="textAlgnLeft"><?php echo $model->contact_end; ?></td>
        </tr>
        <tr class="odd">
            <th class="textAlgnLeft">Paygrade- <?php echo PayGrades::model()->nameOfThis($model->paygrade_id); ?></th>
            <td class="textAlgnLeft" colspan="3">
                <?php
                    echo PayGrades::model()->detailsOfThisPayGrade($model->paygrade_id);
                ?>
            </td>
        </tr>
    </table>
</fieldset>