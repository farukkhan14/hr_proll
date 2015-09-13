<?php

class OtRate extends CActiveRecord {

    /**
     * Returns the static model of the specified AR class.
     * @return OtRate the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return 'ot_rate';
    }
    
   public $percentAmount;

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('paygrade_id, amount_adj', 'required'),
            array('paygrade_id, percentage_of_ah_proll_id', 'numerical', 'integerOnly' => true),
            array('paygrade_id', 'unique', 'caseSensitive' => FALSE),
            array('amount_adj', 'numerical'),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('id, paygrade_id, percentage_of_ah_proll_id, amount_adj', 'safe', 'on' => 'search'),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'paygrade' => array(self::BELONGS_TO, 'PayGrades', 'paygrade_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public function attributeLabels() {
        return array(
            'id' => 'ID',
            'paygrade_id' => 'Paygrade',
            'percentage_of_ah_proll_id' => 'Division Of',
            'amount_adj' => 'Amount Adj',
        );
    }
    
    public function percengateAmount($percentageAmountOf, $amountAdj) {
        if ($percentageAmountOf != "" || $percentageAmountOf != 0) {
            $criteria = new CDbCriteria();
            $criteria->select = "amount_adj";
            $criteria->condition = "is_active=" . AhAmountProll::ACTIVE . " AND ah_proll_id=" . $percentageAmountOf;
            $data = AhAmountProll::model()->findAll($criteria);
            if ($data) {
                foreach ($data as $d):
                    $adjAmountFinal = $d->amount_adj;
                endforeach;
                $adjAmountFinal = ($adjAmountFinal/$amountAdj);
                $nameOfAh=AhProll::model()->nameOfThis($percentageAmountOf)." / ";
            }else {
                $adjAmountFinal = "";
                $nameOfAh="";
            }
        } else {
            $adjAmountFinal = "";
            $nameOfAh="";
        }

        return $nameOfAh.$adjAmountFinal;
    }
    
    public function otRatesOfThis($payagradeId){
        $data=self::model()->findByAttributes(array('paygrade_id'=>$payagradeId));
        if($data)
            $amount= $data->amount_adj;
        else
            $amount= 0;
        
        return $amount;
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
        $criteria->compare('paygrade_id', $this->paygrade_id);
        $criteria->compare('percentage_of_ah_proll_id', $this->percentage_of_ah_proll_id);
        $criteria->compare('amount_adj', $this->amount_adj);

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