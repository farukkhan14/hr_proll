<?php

class EmpAttendance extends CActiveRecord {

    /**
     * Returns the static model of the specified AR class.
     * @return EmpAttendance the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return 'emp_attendance';
    }
    
    public $startDate;
    public $endDate;
    
    public $sumOfPresentDay;
    
    public $department_id;
    
    public $deviceFile;

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('card_no, date, in_time, out_time', 'required'),
            array('card_no, date, in_time, out_time', 'length', 'max' => 255),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('id, card_no, date, in_time, out_time', 'safe', 'on' => 'search'),
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
            'id' => 'ID',
            'card_no' => 'Punch Card No',
            'date' => 'Date',
            'in_time' => 'In Time',
            'out_time' => 'Out Time',
            'startDate'=>'Start Date',
            'endDate'=>'End Date',
            'department_id'=>'Department',
        );
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
        $criteria->compare('card_no', $this->card_no, true);
        $criteria->compare('date', $this->date, true);
        $criteria->compare('in_time', $this->in_time, true);
        $criteria->compare('out_time', $this->out_time, true);

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
            'pagination' => array(
                'pageSize' => 200,
            ),
            'sort' => array(
                'defaultOrder' => 'id DESC',
            ),
        ));
    }

}