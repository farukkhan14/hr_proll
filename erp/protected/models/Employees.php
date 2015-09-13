<?php

class Employees extends CActiveRecord {

    /**
     * Returns the static model of the specified AR class.
     * @return Employees the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return 'employees';
    }

    const ACTIVE=1;
    const INACTIVE=2;
    
    public $startDate;
    public $endDate;
    public $img;
    public $dwnld_fl;

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('
                full_name, 
                designation_id, 
                department_id, 
                join_date, 
                permanent_date,
                is_active, 
                id_no, 
                dob, 
                gender,
                shift_id, 
                paygrade_id,
                blood_group,
                marital_status,
                father_name,
                mother_name,
                address,
                permanent_address,
                contact_no,
                national_id_no,
                email', 'required'),
            array('photo', 'file', 'types' => 'jpg, jpeg, png', 'allowEmpty' => TRUE),
            array('id_no, emp_id_no', 'unique', 'caseSensitive' => FALSE),
            array('designation_id, department_id, team_id, paygrade_id, is_active, gender, marital_status, country_id, blood_group, section_id, branch_id, employee_type, spouse_relation, stuff_cat_id, stuff_sub_cat_id, sub_section_id, shift_id', 'numerical', 'integerOnly' => true),
            array('full_name, emp_id_no, id_no, father_name, father_occupation, mother_name, mother_occopation, bank_ac_no, bank, spouse_name, contact_no, contact_no_office, contact_no_home, national_id_no, photo', 'length', 'max' => 255),
            array('email', 'email'),
            array('email', 'length', 'max' => 50),
            array('address, 
                join_date, 
                permanent_date, 
                permanent_address, 
                dob, 
                spouse_details, 
                prev_info, 
                edu_info, 
                contact_end, 
                skills,
                in_srvc_lcl_trng_inf,
                frgn_trng_inf,
                in_srvc_frgn_trvl,
                publications,
                awards,
                dscplnry_crmnl_actn,
                childrens', 'safe'),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('emp_id_no, full_name, designation_id, department_id, is_active', 'safe', 'on' => 'search'),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'id' => 'Employee',
            'emp_id_no'=>'Employee ID',
            'full_name' => 'Full Name',
            'designation_id' => 'Designation',
            'department_id' => 'Department',
            'id_no' => 'Punch Card No',
            'contact_no' => 'Personal (Contact No)',
            'contact_no_home'=>'Home (Contact No)',
            'contact_no_office'=>'Office (Contact No)', 
            'national_id_no'=>'National ID Card No',
            'email' => 'Email',
            'address' => 'Present Address',
            'team_id' => 'Team / Line',
            'paygrade_id' => 'Paygrade',
            'join_date' => 'Join Date',
            'permanent_date' => 'Permanent Date',
            'is_active' => 'Is Active',
            'permanent_address'=>'Permanent Address',
            'father_name'=>'Father Name',
            'father_occupation'=>'Father Occupation',
            'mother_name'=>'Mother Name',
            'mother_occopation'=>'Mother Occupation',
            'spouse_name'=>'Spouse Name',
            'spouse_details'=>'Spouse Details',
            'spouse_relation'=>'Relation (with spouse)',
            'gender'=>'Gender',
            'marital_status'=>'Marital Status',
            'country_id'=>'Country',
            'blood_group'=>'Blood Group',
            'dob'=>'Date Of Birth',
            'section_id'=>'Section',
            'sub_section_id'=>'Sub-Section',
            'branch_id'=>'Branch',
            'employee_type'=>'Employee Type',
            'bank_ac_no'=>'Bank A/C No',
            'bank'=>'Bank',
            'prev_info'=>'Previous Experiences (Employment History)',
            'edu_info'=>'Academic / Educational Records',
            'contact_end'=>'Contact End',
            'skills'=>'Skill List',
            'photo'=>'Photo',
            'stuff_cat_id'=>'Stuff Category',
            'stuff_sub_cat_id'=>'Stuff Sub-Category',
            'startDate'=>'Start Date',
            'endDate'=>'End Date',
            'shift_id'=>'Shift',
            'dwnld_fl'=>'Attachments',
            'in_srvc_lcl_trng_inf'=>'In Service Local Training Informations',
            'frgn_trng_inf'=>'Foreign Training Informations',
            'in_srvc_frgn_trvl'=>'In Service Foreign Travels',
            'publications'=>'Publications',
            'awards'=>'Awards / Honours',
            'dscplnry_crmnl_actn'=>'Disciplinary Actions/ Criminal Prosecutions',
            'childrens'=>'Children',
        );
    }
    protected function afterDelete() {
        if($this->photo!=""){
            unlink(Yii::app()->basePath . '/../upload/empPhoto/' . $this->photo); //delete file
        }
    }

    public function getNameWithCardNo() {
        return $this->full_name . ' (' . $this->id_no . ')';
    }

    public function fullName($id) {
        $data = self::model()->findByPk($id);
        if ($data)
            return $data->full_name;
    }

    public function infoOfThis($id) {
        $data = self::model()->findByPk($id);
        if ($data)
            return $data;
    }

    public function statusColor($status) {
        if ($status == self::ACTIVE) {
            echo "<span class='greenColor'>ACTIVE</b></span>";
        } else {
            echo "<span class='redColor'>INACTIVE</b></span>";
        }
    }
    
    public function beforeSave() {
            if ($this->emp_id_no) {

            } else {
                $this->emp_id_no = date('Ymdhms');
            }
        
         if($this->isNewRecord){
             
         }else{
             $data=self::model()->findByPk($this->id);
             $this->photo=$data->photo;
         }
       return parent::beforeSave();
    }
    
    public function afterSave() {
        $img = CUploadedFile::getInstance($this, 'photo');
        if ($img != '') {
               $filenameReplacingWhiteSpaceWithUnderscor = str_replace(" ","_", $img);
                $img = $this->id . '_' . $filenameReplacingWhiteSpaceWithUnderscor;
            self::model()->updateByPk($this->id, array('photo' => $img));
        }
        return parent::afterSave();
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
     */
    public function search() {
        // Warning: Please modify the following code to remove attributes that
        // should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare('emp_id_no', $this->emp_id_no, true);
        $criteria->compare('full_name', $this->full_name, true);
        $criteria->compare('designation_id', $this->designation_id);
        $criteria->compare('department_id', $this->department_id);
        $criteria->compare('is_active', $this->is_active);

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
            'pagination' => array(
                'pageSize' => 50,
            ),
            'sort' => array(
                'defaultOrder' => 'department_id ASC',
            ),
        ));
    }

}