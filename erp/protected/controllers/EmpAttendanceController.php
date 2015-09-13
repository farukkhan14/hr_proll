<?php

class EmpAttendanceController extends Controller {

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

    public function actionProcessDeviceData() {
        $fileExist=file_exists(Yii::app()->basePath . '/../upload/tempDeviceFile/deviceFile.xls');
        if($fileExist){
            Yii::import('ext.phpexcelreader.JPhpExcelReader');
        $data = new JPhpExcelReader('upload/tempDeviceFile/deviceFile.xls');
        for ($row = 2; $row < $data->rowcount(); $row++) {
            $model = new EmpAttendance;

            $valCardNo = $data->val($row, 2);
            $model->card_no = $valCardNo;

            $valDate = $data->val($row, 6);
            $year = substr($valDate, 6, 4);
            $month = substr($valDate, 0, 2);
            $day = substr($valDate, 3, 2);
            $date = $year . "-" . $month . "-" . $day;
            $model->date = $date;

            $valInTime = $data->val($row, 7);
            if ($valInTime == "--:--:--")
                $inTime = "";
            else
                $inTime=substr($valInTime, 0, 5);
            $model->in_time = $inTime;

            $valOutTime = $data->val($row, 8);
            if ($valOutTime == "--:--:--")
                $outTime = "";
            else
                $outTime=substr($valOutTime, 0, 5);
            $model->out_time = $outTime;

            $model->save();
        }
        unlink(Yii::app()->basePath . '/../upload/tempDeviceFile/deviceFile.xls'); //delete file
        Yii::app()->user->setFlash('success', "Attendance data inserted.");
        }else{
            Yii::app()->user->setFlash('error', "Device file not exist! Please upload device data file first.");
        }
        $this->redirect(array('uploadDeveiceData'));
    }

    public function actionUploadDeveiceData() {
        $model = new EmpAttendance;

        // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);

        if (isset($_POST['EmpAttendance'])) {
            $model->deviceFile = CUploadedFile::getInstance($model, 'deviceFile');

            if ($model->deviceFile) {
                if ($model->deviceFile->extensionName == "xls") {
                    //$filenameReplacingWhiteSpaceWithUnderscor = str_replace(" ", "_", $model->deviceFile);
                    $model->deviceFile->saveAs(Yii::app()->basePath . '/../upload/tempDeviceFile/deviceFile.xls');
                    Yii::app()->user->setFlash('success', "Device file uploaded.");
                    $this->redirect(array('uploadDeveiceData'));
                } else {
                    Yii::app()->user->setFlash('error', "Please upload a valid .xls file!");
                    $this->redirect(array('uploadDeveiceData'));
                }
            } else {
                Yii::app()->user->setFlash('error', "Please upload a valid .xls file!");
                $this->redirect(array('uploadDeveiceData'));
            }
        }

        $this->render('uploadDeveiceData', array(
            'model' => $model,
        ));
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

    /**
     * Creates a new model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     */
    public function actionCreate() {
        $model = new EmpAttendance;

        // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);

        if (isset($_POST['EmpAttendance'])) {
            $model->attributes = $_POST['EmpAttendance'];
            if ($model->card_no != "") {
                foreach ($model->card_no as $cardNo):
                    $model = new EmpAttendance;
                    $model->attributes = $_POST['EmpAttendance'];
                    $model->card_no = $cardNo;
                    if ($model->save())
                        $error2 = "";
                    else
                        $error2=$model->errors;
                endforeach;
                if ($error2 == "") {
                    echo CJSON::encode(array(
                        'status' => 'success',
                    ));
                } else {
                    echo CJSON::encode(array(
                        'status' => 'failure',
                        'failureMsg' => 'date, in_time, out time can not be empty',
                    ));
                }
            } else {
                $error = CActiveForm::validate($model);
                if ($error != '[]')
                    echo $error;
            }
            Yii::app()->end();
//            if ($error != '[]')
//                    echo $error;
//            Yii::app()->end();
//            $valid = $model->validate();
//            if ($valid) {
//                    foreach($model->card_no as $tempCardNo):
//                        $model = new EmpAttendance;
//                        $model->card_no=$tempCardNo;
//                        $model->date=$model->date;
//                        $model->in_time=$model->in_time;
//                        $model->out_time=$model->out_time;
//                        $model->save();
//                    endforeach;
//
//                echo CJSON::encode(array(
//                    'status' => 'success',
//                ));
//                Yii::app()->end();
//            } else {
//                $error = CActiveForm::validate($model);
//                if ($error != '[]')
//                    echo $error;
//                Yii::app()->end();
//            }
        }else {
            $this->render('_form', array(
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

        if (isset($_POST['EmpAttendance'])) {
            $model->attributes = $_POST['EmpAttendance'];
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
        $dataProvider = new CActiveDataProvider('EmpAttendance');
        $this->render('index', array(
            'dataProvider' => $dataProvider,
        ));
    }

    /**
     * Manages all models.
     */
    public function actionAdmin() {
        $model = new EmpAttendance('search');
        $model->unsetAttributes();  // clear any default values
        if (isset($_GET['EmpAttendance']))
            $model->attributes = $_GET['EmpAttendance'];

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
        $model = EmpAttendance::model()->findByPk($id);
        if ($model === null)
            throw new CHttpException(404, 'The requested page does not exist.');
        return $model;
    }

    /**
     * Performs the AJAX validation.
     * @param CModel the model to be validated
     */
    protected function performAjaxValidation($model) {
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'emp-attendance-form') {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }
    }

}
