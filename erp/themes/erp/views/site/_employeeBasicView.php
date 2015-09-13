<fieldset>
    <legend>Basic Informations</legend>
    <table class="reportTab">
        <tr class="odd">
            <th class="textAlgnLeft">Employee ID</th>
            <td class="textAlgnLeft" colspan="5"><?php echo $model->emp_id_no; ?></td>
        </tr>
        <tr class="even">
            <th class="textAlgnLeft">Full Name</th>
            <td class="textAlgnLeft"><?php echo $model->full_name; ?></td>
            <th class="textAlgnLeft">National ID Card No</th>
            <td class="textAlgnLeft"><?php echo $model->national_id_no; ?></td>
            <th class="textAlgnLeft">Date Of Birth</th>
            <td class="textAlgnLeft"><?php echo $model->dob; ?></td>
        </tr>
        <tr class="odd">
            <th class="textAlgnLeft">Personal (Contact No)</th>
            <td class="textAlgnLeft"><?php echo $model->contact_no; ?></td>
            <th class="textAlgnLeft">Home (Contact No)</th>
            <td class="textAlgnLeft"><?php echo $model->contact_no_home; ?></td>
            <th class="textAlgnLeft">Office (Contact No)</th>
            <td class="textAlgnLeft"><?php echo $model->contact_no_office; ?></td>
        </tr>
        <tr class="even">
            <th class="textAlgnLeft">Father Name</th>
            <td class="textAlgnLeft"><?php echo $model->father_name; ?></td>
            <th class="textAlgnLeft">Father Occupation</th>
            <td class="textAlgnLeft"><?php echo $model->father_occupation; ?></td>
            <th class="textAlgnLeft">Email</th>
            <td class="textAlgnLeft"><?php echo $model->email; ?></td>
        </tr>
        <tr class="odd">
            <th class="textAlgnLeft">Mother Name</th>
            <td class="textAlgnLeft"><?php echo $model->mother_name; ?></td>
            <th class="textAlgnLeft">Mother Occupation</th>
            <td class="textAlgnLeft"><?php echo $model->mother_occopation; ?></td>
            <th class="textAlgnLeft">Blood Group</th>
            <td class="textAlgnLeft"><?php echo Lookup::item('blood_group', $model->blood_group); ?></td>
        </tr>
        <tr class="even">
            <th class="textAlgnLeft">Spouse Name</th>
            <td class="textAlgnLeft"><?php echo $model->spouse_name; ?></td>
            <th class="textAlgnLeft">Relation (with spouse)</th>
            <td class="textAlgnLeft"><?php echo Lookup::item('spouse_relation', $model->spouse_relation); ?></td>
            <th class="textAlgnLeft">Gender</th>
            <td class="textAlgnLeft"><?php echo Lookup::item('gender', $model->gender); ?></td>
        </tr>
        <tr class="odd">
            <th class="textAlgnLeft">Spouse Details</th>
            <td class="textAlgnLeft"><?php echo $model->spouse_details; ?></td>
            <th class="textAlgnLeft">Present Address</th>
            <td class="textAlgnLeft"><pre><?php echo $model->address; ?></pre></td>
            <th class="textAlgnLeft">Permanent Address</th>
            <td class="textAlgnLeft"><pre><?php echo $model->permanent_address; ?></pre></td>
        </tr>
        <tr class="even">
            <th class="textAlgnLeft">Marital Status</th>
            <td class="textAlgnLeft"><?php echo Lookup::item('marital_status', $model->marital_status); ?></td>
            <th class="textAlgnLeft">Country</th>
            <td class="textAlgnLeft"><?php echo Countries::model()->nameOfThis($model->country_id); ?></td>
            <th class="textAlgnLeft">Is Active</th>
            <td class="textAlgnLeft"><?php echo Lookup::item('is_active', $model->is_active); ?></td>
        </tr>
    </table>
</fieldset>