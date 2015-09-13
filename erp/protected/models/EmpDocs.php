<?php

class EmpDocs extends CActiveRecord {

    /**
     * Returns the static model of the specified AR class.
     * @return EmpDocs the static model class
     */
    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    /**
     * @return string the associated database table name
     */
    public function tableName() {
        return 'emp_docs';
    }
    
    public $file;

    /**
     * @return array validation rules for model attributes.
     */
    public function rules() {
        // NOTE: you should only define rules for those attributes that
        // will receive user inputs.
        return array(
            array('emp_id, emp_doc_title', 'required'),
            array('emp_id', 'numerical', 'integerOnly' => true),
            array('emp_doc_file', 'file', 'types' => 'doc, docx, pdf, jpg, jpeg, png, bmp', 'allowEmpty' => FALSE, 'on' => 'insert',),
            array('emp_doc_title, emp_doc_file', 'length', 'max' => 255),
            // The following rule is used by search().
            // Please remove those attributes that should not be searched.
            array('id, emp_id, emp_doc_title, emp_doc_file', 'safe', 'on' => 'search'),
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
            'emp_id' => 'Employee',
            'emp_doc_title' => 'Doc Title',
            'emp_doc_file' => 'Attachment File',
        );
    }
    
    public function beforeSave() {
        if ($this->isNewRecord) {
            
        } else {
            $data = self::model()->findByPk($this->id);
            $this->emp_doc_file = $data->emp_doc_file;
        }
        return parent::beforeSave();
    }

    public function afterSave() {
        $file = CUploadedFile::getInstance($this, 'emp_doc_file');
        if ($file != '') {
            $filenameReplacingWhiteSpaceWithUnderscor = str_replace(" ", "_", $file);
            $file = $this->id . '_' . $filenameReplacingWhiteSpaceWithUnderscor;
            self::model()->updateByPk($this->id, array('emp_doc_file' => $file));
        }
        return parent::afterSave();
    }
    
    public function downloadableFileLink($emp_id) {

        $condition="emp_id=".$emp_id;
        $data=self::model()->findAll(array('condition'=>$condition));
        if($data){
            foreach($data as $d):
                $id=$d->id;
                $fileName=$d->emp_doc_file;
                $fname = Yii::app()->basePath . '/../upload/empDocs/' . $fileName;
                $fnameWithoutID = str_replace($id, "Download", $fileName);
                echo CHtml::link($fnameWithoutID, array('EmpDocs/downloadThisFile', 'fname' => $fname, 'id' => $id))."<br>";
            endforeach;
        }
        
    }

    public function downloadableFileLink2($id, $fileName){
        $fname = Yii::app()->basePath . '/../upload/empDocs/' . $fileName;
        $fnameWithoutID = str_replace($id, "Download", $fileName);
        echo CHtml::link($fnameWithoutID, array('EmpDocs/downloadThisFile', 'fname' => $fname, 'id' => $id))."<br>";
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
        $criteria->compare('emp_id', $this->emp_id);
        $criteria->compare('emp_doc_title', $this->emp_doc_title, true);
        $criteria->compare('emp_doc_file', $this->emp_doc_file, true);

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
        ));
    }

}