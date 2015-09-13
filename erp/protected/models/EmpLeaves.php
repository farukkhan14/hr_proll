<?php

class EmpLeaves extends CActiveRecord {

    /**
     * Returns the static model of the specified AR class.
     * @return EmpLeaves the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return 'emp_leaves';
    }
    
    const PENDING=15;
    const APPROVED=16;
    const DENIED=17;
    
    public $sumDay;
    public $sumHour;

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('transaction_date, emp_id, lh_proll_id, subj, day_to_leave, hour_to_leave', 'required'),
            array('emp_id, lh_proll_id, is_approved, create_by, update_by', 'numerical', 'integerOnly' => true),
            array('subj', 'length', 'max' => 255),
            array('day, month', 'length', 'max' => 2),
            array('year', 'length', 'max' => 4),
            array('day_to_leave, hour_to_leave', 'numerical'),
            array('details, create_time, update_time, transaction_date', 'safe'),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('id, transaction_date, emp_id, lh_proll_id, subj, details, is_approved, create_by, create_time, update_by, update_time, day_to_leave, hour_to_leave', 'safe', 'on' => 'search'),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'emp' => array(self::BELONGS_TO, 'Employees', 'emp_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'id' => 'ID',
            'transaction_date' => 'Date',
            'emp_id' => 'Employee',
            'lh_proll_id' => 'Head',
            'subj' => 'Subject',
            'details' => 'Details',
            'is_approved' => 'Status',
            'create_by' => 'Created By',
            'create_time' => 'Created Time',
            'update_by' => 'Updated By',
            'update_time' => 'Updated Time',
            'day_to_leave'=>'Needed Day', 
            'hour_to_leave'=>'Needed Hour',
        );
    }
    
    public function statusColor($is_approved) {
        if ($is_approved == self::PENDING)
            echo "<font style='color: orange; font-weight: bold;'>PENDING</font>";
        else if ($is_approved == self::APPROVED)
            echo "<font style='color: green; font-weight: bold;'>APPROVED</font>";
        else if ($is_approved == self::DENIED)
            echo "<font style='color: red; font-weight: bold;'>DENIED</font>";
        else
            echo "";
    }

    public function beforeSave() {
        if ($this->isNewRecord) {
            $this->create_time = new CDbExpression('NOW()');
            $this->create_by = Yii::app()->user->getId();
            $this->day = substr($this->transaction_date, 8, 2);
            $this->month = substr($this->transaction_date, 5, 2);
            $this->year = substr($this->transaction_date, 0, 4);
        } else {
            $this->update_time = new CDbExpression('NOW()');
            $this->update_by = Yii::app()->user->getId();
            $this->day = substr($this->transaction_date, 8, 2);
            $this->month = substr($this->transaction_date, 5, 2);
            $this->year = substr($this->transaction_date, 0, 4);
        }
        return parent::beforeSave();
    }

    /**
     * Retrieves a list of models based on the current search/filter conditions.
     * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
     */
    public function search() {
        // Warning: Please modify the following code to remove attributes that
        // should not be searched.

        $criteria = new CDbCriteria;

        $criteria->compare('id', $this->id);
        $criteria->compare('transaction_date', $this->transaction_date, true);
        $criteria->compare('emp_id', $this->emp_id);
        $criteria->compare('lh_proll_id', $this->lh_proll_id);
        $criteria->compare('subj', $this->subj, true);
        $criteria->compare('details', $this->details, true);
        $criteria->compare('is_approved', $this->is_approved);
        $criteria->compare('create_by', $this->create_by);
        $criteria->compare('create_time', $this->create_time, true);
        $criteria->compare('update_by', $this->update_by);
        $criteria->compare('update_time', $this->update_time, true);
        $criteria->compare('day_to_leave', $this->day_to_leave);
        $criteria->compare('hour_to_leave', $this->hour_to_leave);

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
            'pagination' => array(
                'pageSize' => 20,
            ),
            'sort' => array(
                'defaultOrder' => 'id DESC',
            ),
        ));
    }

}