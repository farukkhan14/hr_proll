<?php

class EmpResign extends CActiveRecord {

    /**
     * Returns the static model of the specified AR class.
     * @return EmpResign the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return 'emp_resign';
    }

    const PENDING=15;
    const APPROVED=16;
    const DENIED=17;

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('employee_id, title, date, details', 'required'),
            array('employee_id', 'unique', 'caseSensitive' => FALSE, 'message' => 'This employee has already resigned'),
            array('employee_id, is_approved, create_by, update_by', 'numerical', 'integerOnly' => true),
            array('title', 'length', 'max' => 255),
            array('details, date, create_time, update_time', 'safe'),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('id, employee_id, title, details, date, is_approved, create_by, create_time, update_by, update_time', 'safe', 'on' => 'search'),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'employee' => array(self::BELONGS_TO, 'Employees', 'employee_id'),
            'empResignHistories' => array(self::HAS_MANY, 'EmpResignHistory', 'employee_resign_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'id' => 'ID',
            'employee_id' => 'Employee',
            'title' => 'Title',
            'details' => 'Details',
            'date' => 'Date',
            'is_approved' => 'Is Approved',
            'create_by' => 'Create By',
            'create_time' => 'Create Time',
            'update_by' => 'Update By',
            'update_time' => 'Update Time',
        );
    }

    public function beforeSave() {
        if ($this->isNewRecord) {
            $this->create_time = new CDbExpression('NOW()');
            $this->create_by = Yii::app()->user->getId();
        } else {
            $this->update_time = new CDbExpression('NOW()');
            $this->update_by = Yii::app()->user->getId();
        }
        return parent::beforeSave();
    }

    public function statusColorIsAproved($is_approved) {
        if ($is_approved == self::PENDING)
            echo "<font style='color: orange; font-weight: bold;'>PENDING</font>";
        else if ($is_approved == self::APPROVED)
            echo "<font style='color: green; font-weight: bold;'>APPROVED</font>";
        else if ($is_approved == self::DENIED)
            echo "<font style='color: red; font-weight: bold;'>DENIED</font>";
        else
            echo "";
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
        $criteria->compare('employee_id', $this->employee_id);
        $criteria->compare('title', $this->title, true);
        $criteria->compare('details', $this->details, true);
        $criteria->compare('date', $this->date, true);
        $criteria->compare('is_approved', $this->is_approved);
        $criteria->compare('create_by', $this->create_by);
        $criteria->compare('create_time', $this->create_time, true);
        $criteria->compare('update_by', $this->update_by);
        $criteria->compare('update_time', $this->update_time, true);

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