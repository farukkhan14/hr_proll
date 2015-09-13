<?php

class PayGradesController extends Controller {

    /**
     * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
     * using two-column layout. See 'protected/views/layouts/column2.php'.
     */
    public $layout = '//layouts/column1';

    /**
     * @return array action filters
     */
    public function filters() {
        return array(
            'rights', // perform access control for CRUD operations
        );
    }

    public function allowedActions() {
        return '';
    }

    /**
     * Displays a particular model.
     * @param integer $id the ID of the model to be displayed
     */
    public function actionView($id) {
        $model = $this->loadModel($id);
        $this->renderPartial('view', array('model' => $model,));
        if (!isset($_GET['ajax'])) {
            $this->redirect(Yii::app()->request->urlReferrer);
        }
    }
    
    public function actionPaygradeSettings(){
        $model = new PayGradeOnoff('search');
        $model->unsetAttributes();  // clear any default values
        if (isset($_GET['PayGradeOnoff']))
            $model->attributes = $_GET['PayGradeOnoff'];

        $this->render('adminPayGradeOnoff', array(
            'model' => $model,
        ));
    }
    
    public function actionChangeStatusPayGradeOnoff($id, $status){
       
        if($status=="activate"){
            PayGradeOnoff::model()->updateAll(array('is_active' => PayGradeOnoff::ACTIVE), 'id=:id', array(':id' => $id));
        }else{
            PayGradeOnoff::model()->updateAll(array('is_active' => PayGradeOnoff::INACTIVE), 'id=:id', array(':id' => $id));
        }
        $this->redirect(array('paygradeSettings'));
    }
    
    public function actionPayGradeDetails(){
        $paygrade_id = $_POST['paygrade_id'];
        if($paygrade_id!=""){
            $payGradeData=PayGrades::model()->detailsOfThisPayGrade2($paygrade_id);
        }else{
            $payGradeData="<div class='flash-notice'>Please select a paygrade!</div>";
        }
        echo CJSON::encode(array(
                'payGradeData' => $payGradeData,
        ));
    }


    public function actionCreatePGFromOutSide() {
        $model = new PayGrades;

        // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);
        if (isset($_POST['PayGrades'])) {
            $model->attributes = $_POST['PayGrades'];
            if ($model->save()) {
                if (Yii::app()->request->isAjaxRequest) {
                    $data = PayGrades::model()->findByPk($model->id);
                    echo CJSON::encode(array(
                        'status' => 'success',
                        'div' => "<div class='flash-notice'>successfully added</div>",
                        'value' => $data->id,
                        'label' => $data->title,
                    ));
                    exit;
                }
                else
                    $this->redirect(array('view', 'id' => $model->id));
            }
        }

        if (Yii::app()->request->isAjaxRequest) {
            echo CJSON::encode(array(
                'status' => 'failure',
                'div' => $this->renderPartial('_form2', array('model' => $model), true)));
            exit;
        }
        else
            $this->render('create', array('model' => $model,));
    }

    /**
     * Creates a new model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     */
    public function actionCreate() {
        $model = new PayGrades;

        // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);

        if (isset($_POST['PayGrades'])) {
            $model->attributes = $_POST['PayGrades'];
            $valid = $model->validate();
            if ($valid) {
                $model->save();
                //do anything here

                echo CJSON::encode(array(
                    'status' => 'success',
                ));
                Yii::app()->end();
            } else {
                $error = CActiveForm::validate($model);
                if ($error != '[]')
                    echo $error;
                Yii::app()->end();
            }
        }else {
            $this->render('admin', array(
                'model' => $model,
            ));
        }
    }

    /**
     * Updates a particular model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id the ID of the model to be updated
     */
    public function actionUpdate($id) {
        $model = $this->loadModel($id);
            // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);

        if (isset($_POST['PayGrades'])) {
            $model->attributes = $_POST['PayGrades'];
                if ($model->save()) {
                    if (Yii::app()->request->isAjaxRequest) {
                        // Stop jQuery from re-initialization
                        Yii::app()->clientScript->scriptMap['jquery.js'] = false;

                        echo CJSON::encode(array(
                            'status' => 'success',
                            'content' => '<div class="flash-notice">successfully updated</div>',
                        ));
                        exit;
                    }
                    else
                        $this->redirect(array('view', 'id' => $model->id));
                }
        }

        if (Yii::app()->request->isAjaxRequest) {
            // Stop jQuery from re-initialization
            Yii::app()->clientScript->scriptMap['jquery.js'] = false;

            echo CJSON::encode(array(
                'status' => 'failure',
                'content' => $this->renderPartial('_form2', array(
                    'model' => $model), true, true),
            ));
            exit;
        }
        else
            $this->render('update', array('model' => $model));
    }

    /**
     * Deletes a particular model.
     * If deletion is successful, the browser will be redirected to the 'admin' page.
     * @param integer $id the ID of the model to be deleted
     */
    public function actionDelete($id) {
        if (Yii::app()->request->isPostRequest) {
            // we only allow deletion via POST request
            $this->loadModel($id)->delete();

            // if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
            if (!isset($_GET['ajax']))
                $this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
        }
        else
            throw new CHttpException(400, 'Invalid request. Please do not repeat this request again.');
    }

    /**
     * Lists all models.
     */
    public function actionIndex() {
        $dataProvider = new CActiveDataProvider('PayGrades');
        $this->render('index', array(
            'dataProvider' => $dataProvider,
        ));
    }

    /**
     * Manages all models.
     */
    public function actionAdmin() {
        $model = new PayGrades('search');
        $model->unsetAttributes();  // clear any default values
        if (isset($_GET['PayGrades']))
            $model->attributes = $_GET['PayGrades'];

        $this->render('admin', array(
            'model' => $model,
        ));
    }

    /**
     * Returns the data model based on the primary key given in the GET variable.
     * If the data model is not found, an HTTP exception will be raised.
     * @param integer the ID of the model to be loaded
     */
    public function loadModel($id) {
        $model = PayGrades::model()->findByPk($id);
        if ($model === null)
            throw new CHttpException(404, 'The requested page does not exist.');
        return $model;
    }

    /**
     * Performs the AJAX validation.
     * @param CModel the model to be validated
     */
    protected function performAjaxValidation($model) {
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'pay-grades-form') {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }
    }

}
