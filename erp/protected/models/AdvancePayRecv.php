<?php

class AdvancePayRecv extends CActiveRecord {

    /**
     * Returns the static model of the specified AR class.
     * @return AdvancePayRecv the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return 'advance_pay_recv';
    }

    const PENDING=15;
    const APPROVED=16;
    const DENIED=17;

    public $sumPaid;
    public $sumReceived;

    const CURRENT=20;
    const LONG_TERM=21;

    const PAY=22;
    const RECEIVE=23;
    
    public $startDate;
    public $endDate;

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('payOrReceive, transaction_date, employee_id, adv_pay_type, title, amount', 'required'),
            array('installment', 'isLongTermTypeInstallMent', 'on' => 'longTermTypeScenario'),
            array('payOrReceive, employee_id, adv_pay_type, is_approved, create_by, update_by', 'numerical', 'integerOnly' => true),
            array('amount, installment, interest', 'numerical'),
            array('title', 'length', 'max' => 255),
            array('day, month', 'length', 'max' => 2),
            array('year', 'length', 'max' => 4),
            array('details, create_time, update_time, transaction_date', 'safe'),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('payOrReceive, id, transaction_date, employee_id, adv_pay_type, title, details, amount, installment, interest, is_approved, create_by, create_time, update_by, update_time', 'safe', 'on' => 'search'),
        );
    }

    public function isLongTermTypeInstallMent() {

        if ($this->adv_pay_type == self::LONG_TERM && $this->payOrReceive == self::PAY) {
            if ($this->installment == "") {
                $this->addError('installment', 'Long term plane requires EMI (Equated Monthly Installment)!');
                if ($this->interest == "")
                    $this->addError('interest', 'Long term plane requires Interest!');
            }else {
                if ($this->interest == "")
                    $this->addError('interest', 'Long term plane requires Interest!');
            }
        }
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'employee' => array(self::BELONGS_TO, 'Employees', 'employee_id'),
            'advancePayRecvHistories' => array(self::HAS_MANY, 'AdvancePayRecvHistory', 'adv_pay_recv_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'payOrReceive' => 'Pay / Receive',
            'id' => 'ID',
            'transaction_date' => 'Date',
            'employee_id' => 'Employee',
            'adv_pay_type' => 'Pay / Receive Type',
            'title' => 'Title',
            'details' => 'Details',
            'amount' => 'Amount',
            'installment' => 'EMI',
            'interest' => 'Interest (%)',
            'is_approved' => 'Is Approved',
            'create_by' => 'Create By',
            'create_time' => 'Create Time',
            'update_by' => 'Update By',
            'update_time' => 'Update Time',
            'startDate'=>'Start Date',
            'endDate'=>'End Date',
        );
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

    public function payableAmountOfThisEmp($empId, $transDate) {
        $conditionLong = "employee_id=" . $empId . " AND transaction_date < '" . $transDate . "' AND is_approved=" . self::APPROVED;
        $dataLong = self::model()->findAll(array('condition' => $conditionLong), 'id');
        $acRecvblAmountPrMnthTotal = 0;
        $amountReceivedTotal = 0;
        $amountReceivedTotalCurrent = 0;
        $acRecvblAmountPrMnthTotalCurrent = 0;
        if ($dataLong) {
            foreach ($dataLong as $dl):
                if ($dl->adv_pay_type == self::LONG_TERM) {
                    if ($dl->payOrReceive == self::PAY) {
                        $d1 = new DateTime($dl->transaction_date); // stored date
                        $d2 = new DateTime($transDate); // given date
                        $interval = $d2->diff($d1);
                        $dateDiff = $interval->format('%m');
                        if ($dateDiff <= $dl->installment) {
                            $amountWithInstallMent=($dl->amount / $dl->installment);
                            $amountWithInterest=($amountWithInstallMent * ($dl->interest/100));
                            $acRecvblAmountPrMnth = $amountWithInstallMent+$amountWithInterest;
                            $acRecvblAmountPrMnthTotal = $acRecvblAmountPrMnth + $acRecvblAmountPrMnthTotal;
                        }
                    } else {
                        $amountReceivedTotal = $dl->amount + $amountReceivedTotal;
                    }
                } else {
                    if ($dl->payOrReceive == AdvancePayRecv::PAY) {
                        $acRecvblAmountPrMnthTotalCurrent = $dl->amount + $acRecvblAmountPrMnthTotalCurrent;
                    } else {
                        $amountReceivedTotalCurrent = $dl->amount + $amountReceivedTotalCurrent;
                    }
                }
            endforeach;
        }

        $duductableAmountLong = $acRecvblAmountPrMnthTotal - $amountReceivedTotal;

        $duductableAmountLongCurrent = $acRecvblAmountPrMnthTotalCurrent - $amountReceivedTotalCurrent;

        if ($duductableAmountLong > 0)
            $duductableAmountLong = $duductableAmountLong;
        else
            $duductableAmountLong=$acRecvblAmountPrMnthTotal;

        echo "LONT TERM: " . $duductableAmountLong;
        echo "<br><br>";
        echo "CURRENT: " . $duductableAmountLongCurrent;
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
        $criteria->compare('payOrReceive', $this->payOrReceive);
        $criteria->compare('transaction_date', $this->transaction_date, true);
        $criteria->compare('employee_id', $this->employee_id);
        $criteria->compare('adv_pay_type', $this->adv_pay_type);
        $criteria->compare('title', $this->title, true);
        $criteria->compare('details', $this->details, true);
        $criteria->compare('amount', $this->amount);
        $criteria->compare('installment', $this->installment);
        $criteria->compare('interest', $this->interest);
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