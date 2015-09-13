<?php

class LhAmountProllController extends Controller {

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

    public function actionRemainingLeaveOfThisEmp() {
        $emp_id = $_POST['emp_id'];
        $lh_proll_id = $_POST['lh_proll_id'];

        if ($emp_id != "" && $lh_proll_id != "") {
            $dataEmployee=  Employees::model()->findByPk($emp_id);
            if($dataEmployee){
                $payGradeEmployee = $dataEmployee->paygrade_id;
                $dataLhProll = LhProll::model()->findByPk($lh_proll_id);
                $payGradeLhProll = $dataLhProll->paygrade_id;
                if ($payGradeEmployee == $payGradeLhProll) {
                    $criteriaLhAmountProll = new CDbCriteria();
                    $criteriaLhAmountProll->condition = "lh_proll_id=" . $lh_proll_id . " AND is_active=" . LhAmountProll::ACTIVE;
                    $dataLhAmountProll = LhAmountProll::model()->findAll($criteriaLhAmountProll);
                    if ($dataLhAmountProll) {
                        foreach ($dataLhAmountProll as $dlhpa):
                            $assignedDay = $dlhpa->day;
                            $assignedHour = $dlhpa->hour;
                        endforeach;

                        $currYear = date('Y');
                        $criteriaSpentLeave = new CDbCriteria();
                        $criteriaSpentLeave->select = "sum(day_to_leave) as sumDay, sum(hour_to_leave) as sumHour";
                        $criteriaSpentLeave->addColumnCondition(
                                array(
                            'lh_proll_id' => $lh_proll_id,
                            'emp_id' => $emp_id,
                            'year' => $currYear,
                            'is_approved' => EmpLeaves::APPROVED), 'AND', 'AND');
                        $dataSepntLeave = EmpLeaves::model()->findAll($criteriaSpentLeave);
                        $sumDaySpent = 0;
                        $sumHourSpent = 0;
                        if ($dataSepntLeave) {
                            foreach ($dataSepntLeave as $dspntlv):
                                $sumDaySpent = $dspntlv->sumDay;
                                $sumHourSpent = $dspntlv->sumHour;
                            endforeach;
                        }

                        $remainingLeaveDay = ($assignedDay - $sumDaySpent);
                        $remainingLeaveHour = ($assignedHour - $sumHourSpent);

                        $leaveData = "Remaining Day:Hour " . $remainingLeaveDay . ":" . $remainingLeaveHour . " - current year";
                    }else {
                        $leaveData = "<div class='flash-error'>No paygrade defined for this leave!</div>";
                    }
                } else {
                    $leaveData = "<div class='flash-error'>No paygrade defined for this leave/employee!</div>";
                }
                
                
            }
        } else {
            $leaveData = "";
        }

        echo CJSON::encode(array(
            'leaveData' => $leaveData,
        ));
    }

    public function actionCreate() {
        $model = new LhAmountProll;

        // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);

        if (isset($_POST['LhAmountProll'])) {
            $model->attributes = $_POST['LhAmountProll'];
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

        if (isset($_POST['LhAmountProll'])) {
            $model->attributes = $_POST['LhAmountProll'];
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
        $dataProvider = new CActiveDataProvider('LhAmountProll');
        $this->render('index', array(
            'dataProvider' => $dataProvider,
        ));
    }

    /**
     * Manages all models.
     */
    public function actionAdmin() {
        $model = new LhAmountProll('search');
        $model->unsetAttributes();  // clear any default values
        if (isset($_GET['LhAmountProll']))
            $model->attributes = $_GET['LhAmountProll'];

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
        $model = LhAmountProll::model()->findByPk($id);
        if ($model === null)
            throw new CHttpException(404, 'The requested page does not exist.');
        return $model;
    }

    /**
     * Performs the AJAX validation.
     * @param CModel the model to be validated
     */
    protected function performAjaxValidation($model) {
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'lh-amount-proll-form') {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }
    }

}
