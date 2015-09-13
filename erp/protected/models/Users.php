<?php

class Users extends CActiveRecord {

    public $password2;
    public $userLevel;
    public $curr_password;

    public static function model($className=__CLASS__) {
        return parent::model($className);
    }

    public function tableName() {
        return 'users';
    }

    public function rules() {
        return array(
            array('employee_id, username, password, password2', 'required', 'on'=>'insert'),
            array('employee_id, username, password, password2', 'required', 'on'=>'update'),
            array('curr_password, password, password2', 'required', 'on'=>'changePassScenario'),
            array('curr_password', 'isPreviousPassMatched', 'on'=>'changePassScenario'),
            array('username', 'unique', 'caseSensitive' => FALSE, 'message' => 'Username already exist! Please choose another.'),
            array('id, employee_id', 'numerical', 'integerOnly' => true),
            array('username, password, password2, curr_password', 'length', 'max' => 20, 'min' => 6),
            array('password', 'compare', 'compareAttribute' => 'password2'),
            array('id, employee_id, username, password, create_by, create_time, update_by, update_time', 'safe', 'on' => 'search'),
        );
    }
    
    public function isPreviousPassMatched(){
        $model = Users::model()->findByPk(Yii::app()->user->getId());
        if(md5($this->curr_password)!=$model->password){
            $this->addError('curr_password', 'Wrong password !');
        }
    }

    public function relations() {
        return array(
            'stores' => array(self::HAS_MANY, 'UserStore', 'user_id'),
        );
    }

    public function validatePassword($password) {
        return $this->hashPassword($password) === $this->password;
    }

    public function hashPassword($password) {
        return md5($password);
    }

    public function beforeSave() {
        $this->password = md5($this->password);
        if ($this->isNewRecord) {
            $this->create_time = new CDbExpression('NOW()');
            $this->create_by = Yii::app()->user->getName();
        } else {
            $this->update_time = new CDbExpression('NOW()');
            $this->update_by = Yii::app()->user->getName();
        }
        return parent::beforeSave();
    }

    public function attributeLabels() {
        return array(
            'id' => 'ID',
            'userLevel' => 'User Level',
            'employee_id' => 'Employee',
            'username' => 'User Name',
            'password' => 'Password',
            'password2' => 'Repeat Password',
            'create_by' => 'Create By',
            'create_time' => 'Create Time',
            'update_by' => 'Update By',
            'update_time' => 'Update Time',
            'curr_password'=>'Current Password',
        );
    }
    
    public function fullEmpInfoOfThis($id) {
        $data = self::model()->findByPk($id);
        if ($data) {
            $empInfo = Employees::model()->findByPk($data->employee_id);
            if ($empInfo)
                return $empInfo;
        }
    }

    public function fullNameOfThis($id) {
        $data = self::model()->findByPk($id);
        if ($data) {
            $empInfo = Employees::model()->findByPk($data->employee_id);
            if ($empInfo)
                return $empInfo->full_name;
        }
    }
    
    public function userNameOfThis($id){
        $data = self::model()->findByPk($id);
        if ($data) {
            return $data->username;
        }
    }

    public function findAllRolesOfThisUser($id) {
        echo "
            <style>
                span.userLevelSpan{
                    color: #FFFFFF;
                    display: block;
                    float: left;
                    height: 100%;
                    padding: 2px;
                    width: 98%;
                }
            </style>
        ";
        if(Rights::getAuthorizer()->isSuperuser($id)===true ){
            $roles = Rights::getAssignedRoles($id);
            foreach ($roles as $role):
                echo "<span class='userLevelSpan' style='background-color: red;'>".$role->name . "</span><br>";
            endforeach;
        }else{
            $roles = Rights::getAssignedRoles($id);
            foreach ($roles as $role):
                echo "<span class='userLevelSpan' style='background-color: seagreen;'>".$role->name . "</span><br>";
            endforeach;
        }
    }

    public function allAvailableRoles() {
        Yii::import("application.modules.rights.components.dataproviders.RAuthItemDataProvider");
        $all_roles = new RAuthItemDataProvider('roles', array(
                    'type' => 2, // type 2 means all roles;
                ));
        $data = $all_roles->fetchData();
        return CHtml::dropDownList("Type", '', CHtml::listData($data, 'name', 'name'), array('prompt' => ''));
    }

    public function allUsersOfAParticularRole($roleName) {
        $data_entry_users = Yii::app()->getAuthManager()->getAssignmentsByItemName($roleName);
        $data_entry_users_id = array();
        foreach ($data_entry_users as $id => $assignment):
            $data_entry_users_id[] = $id;
        endforeach;
        
        return $data_entry_users_id;
    }
    
    public function isSuperAdmin(){
        if(Rights::getAuthorizer()->isSuperuser(Yii::app()->user->getId())===true )
            return true;
        else
            return false;
    }

    public function search() {
        $criteria = new CDbCriteria;
        $criteria->compare('id', $this->id);
        $criteria->compare('employee_id', $this->employee_id);
        $criteria->compare('username', $this->username, true);
        $criteria->compare('password', $this->password, true);
        $criteria->compare('create_by', $this->create_by, true);
        $criteria->compare('create_time', $this->create_time, true);
        $criteria->compare('update_by', $this->update_by, true);
        $criteria->compare('update_time', $this->update_time, true);

        return new CActiveDataProvider($this, array(
            'criteria' => $criteria,
            'pagination' => array(
                'pageSize' => 10,
            ),
            'sort' => array(
                'defaultOrder' => 'id DESC',
            ),
        ));
    }

}