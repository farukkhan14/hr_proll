<?php

class PayGrades extends CActiveRecord {

    /**
     * Returns the static model of the specified AR class.
     * @return PayGrades the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return 'pay_grades';
    }
    
    const ACTIVE=1;
    const INACTIVE=2;

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('title', 'required'),
            array('title', 'length', 'max' => 255),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('id, title', 'safe', 'on' => 'search'),
        );
    }

    /**
     * @return array relational rules.
     */
    public function relations() {
        // NOTE: you may need to adjust the relation name and the related
        // class name for the relations automatically generated below.
        return array(
            'ahProlls' => array(self::HAS_MANY, 'AhProll', 'paygrade_id'),
            'lhProlls' => array(self::HAS_MANY, 'LhProll', 'paygrade_id'),
        );
    }

    /**
     * @return array customized attribute labels (name=>label)
     */
    public $detailsOfThisPayGrade;
    
    public function attributeLabels() {
        return array(
            'id' => 'ID',
            'title' => 'Title',
            'detailsOfThisPayGrade'=>'Details (Active)',
        );
    }
    
    public function nameOfThis($id){
        $data=self::model()->findByPk($id);
        if($data)
            return $data->title;
    }
    
    public function detailsOfThisPayGrade2($id){
        $payGradeData="";
        $payGradeData.="<table class='reportTab'>";
        // account head informations
        $criteria1=new CDbCriteria();
        $criteria1->select="id";
        $criteria1->condition="paygrade_id=".$id;
        $data1=AhProll::model()->findAll($criteria1);
        $i=0;
        if($data1){
            $payGradeData.="<tr><td colspan='4'>EARNINGS-DEDUCTTIONS</td></tr>";
            foreach($data1 as $d1):
                $criteria2=new CDbCriteria();
                $criteria2->select="ah_proll_id, amount_adj, percentage_of_ah_proll_id";
                $criteria2->condition="ah_proll_id=".$d1->id." AND is_active=".self::ACTIVE;
                $data2=  AhAmountProll::model()->findAll($criteria2);
                if($data2){
                    foreach($data2 as $d2):
                    if($i%2==0)
                        $payGradeData.="<tr class='even'>";
                    else
                        $payGradeData.="<tr class='odd'>";
                        $payGradeData.="<td>".AhProll::model()->nameOfThis($d2->ah_proll_id)."</td>";
                        $payGradeData.="<td>".Lookup::item("earn_deduct_type", $d2->earn_deduct_type)."</td>";
                        $payGradeData.="<td>".$d2->amount_adj."</td>";
                        $payGradeData.="<td>".AhAmountProll::model()->percengateAmount($d2->percentage_of_ah_proll_id, $d2->amount_adj)."</td>";
                        $payGradeData.="</tr>";
                        $i++;
                    endforeach;
                }
            endforeach;
        }
        
        // leave head informations
        $criteria11=new CDbCriteria();
        $criteria11->select="id";
        $criteria11->condition="paygrade_id=".$id;
        $data11=  LhProll::model()->findAll($criteria11);
        $i=0;
        if($data11){
            $payGradeData.="<tr><td colspan='4'>LEAVES</td></tr>";
            foreach($data11 as $d11):
                $criteria22=new CDbCriteria();
                $criteria22->select="lh_proll_id, amount_adj, percentage_of_ah_proll_id, day, hour";
                $criteria22->condition="lh_proll_id=".$d11->id." AND is_active=".self::ACTIVE;
                $data22= LhAmountProll::model()->findAll($criteria22);
                if($data22){
                    foreach($data22 as $d22):
                        if($i%2==0)
                            $payGradeData.="<tr class='even'>";
                        else
                            $payGradeData.="<tr class='odd'>";
                        $payGradeData.="<td>".LhProll::model()->nameOfThis($d22->lh_proll_id)."</td>";
                        $payGradeData.="<td>".$d22->day.":".$d22->hour."</td>";
                        $payGradeData.="<td>".$d22->amount_adj."</td>";
                        $payGradeData.="<td>".AhAmountProll::model()->percengateAmount($d22->percentage_of_ah_proll_id, $d22->amount_adj)."</td>";
                        $payGradeData.="</tr>";
                        $i++;
                    endforeach;
                }
            endforeach;
        }
        $payGradeData.="</table>";
        return $payGradeData;
    }
    
     public function detailsOfThisPayGrade($id){
        $payGradeData="";
        $payGradeData.="<table class='reportTab'>";
        // account head informations
        $criteria1=new CDbCriteria();
        $criteria1->select="id";
        $criteria1->condition="paygrade_id=".$id;
        $data1=AhProll::model()->findAll($criteria1);
        $i=0;
        if($data1){
            $payGradeData.="<tr><td colspan='4'>EARNINGS-DEDUCTTIONS</td></tr>";
            foreach($data1 as $d1):
                $criteria2=new CDbCriteria();
                $criteria2->select="ah_proll_id, amount_adj, percentage_of_ah_proll_id";
                $criteria2->condition="ah_proll_id=".$d1->id." AND is_active=".self::ACTIVE;
                $data2=  AhAmountProll::model()->findAll($criteria2);
                if($data2){
                    foreach($data2 as $d2):
                        if($i%2==0)
                            $payGradeData.="<tr class='even'>";
                        else
                            $payGradeData.="<tr class='odd'>";
                        $payGradeData.="<td>".AhProll::model()->nameOfThis($d2->ah_proll_id)."</td>";
                        $payGradeData.="<td>".Lookup::item("earn_deduct_type", $d2->earn_deduct_type)."</td>";
                        $payGradeData.="<td>".$d2->amount_adj."</td>";
                        $payGradeData.="<td>".AhAmountProll::model()->percengateAmount($d2->percentage_of_ah_proll_id, $d2->amount_adj)."</td>";
                        $payGradeData.="</tr>";
                        $i++;
                    endforeach;
                }
            endforeach;
        }
        
        // leave head informations
        $criteria11=new CDbCriteria();
        $criteria11->select="id";
        $criteria11->condition="paygrade_id=".$id;
        $data11=  LhProll::model()->findAll($criteria11);
        $i=0;
        if($data11){
            $payGradeData.="<tr><td colspan='4'>LEAVES</td></tr>";
            foreach($data11 as $d11):
                $criteria22=new CDbCriteria();
                $criteria22->select="lh_proll_id, amount_adj, percentage_of_ah_proll_id, day, hour";
                $criteria22->condition="lh_proll_id=".$d11->id." AND is_active=".self::ACTIVE;
                $data22= LhAmountProll::model()->findAll($criteria22);
                if($data22){
                    foreach($data22 as $d22):
                        if($i%2==0)
                            $payGradeData.="<tr class='even'>";
                        else
                            $payGradeData.="<tr class='odd'>";
                        $payGradeData.="<td>".LhProll::model()->nameOfThis($d22->lh_proll_id)."</td>";
                        $payGradeData.="<td>".$d22->day.":".$d22->hour."</td>";
                        $payGradeData.="<td>".$d22->amount_adj."</td>";
                        $payGradeData.="<td>".AhAmountProll::model()->percengateAmount($d22->percentage_of_ah_proll_id, $d22->amount_adj)."</td>";
                        $payGradeData.="</tr>";
                        $i++;
                    endforeach;
                }
            endforeach;
        }
        $payGradeData.="</table>";
        echo $payGradeData;
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
        $criteria->compare('title', $this->title, true);

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
            'pagination' => array(
                'pageSize' => 100,
            ),
            'sort' => array(
                'defaultOrder' => 'id DESC',
            ),
        ));
    }

}