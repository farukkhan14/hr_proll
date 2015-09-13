<?php

class AdvancePayRecvController extends Controller {

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
    
    public function actionStatusChangedHistory($id){
        $condition="adv_pay_recv_id=".$id;
        $data=AdvancePayRecvHistory::model()->findAll(array('condition'=>$condition), 'id');
        if($data){
            echo "<table class='summaryTab'>";
            echo "<tr><td>STATUS</td><td>CHANGED BY</td><td>DATE</td></tr>";
            foreach($data as $d):
                echo "<tr>";
                echo "<td>";
                AdvancePayRecv::model()->statusColor($d->status);
                echo "</td>";
                echo "<td style='text-align: left'>".Users::model()->fullNameOfThis($d->status_changed_by)."</td>";
                echo "<td>".$d->status_changed_time."</td>";
                echo "<tr>";
            endforeach;
            echo "</table>";
        }
    }


    public function actionApprove($id){
        AdvancePayRecv::model()->updateByPk($id, array('is_approved'=>  AdvancePayRecv::APPROVED));
        $model=new AdvancePayRecvHistory;
        $model->adv_pay_recv_id=$id;
        $model->status=AdvancePayRecv::APPROVED;
        $model->status_changed_by=Yii::app()->user->getId();
        $model->status_changed_time= new CDbExpression('NOW()');
        $model->save();
        echo "Application approved.";
    }
    public function actionDeny($id){
        AdvancePayRecv::model()->updateByPk($id, array('is_approved'=>  AdvancePayRecv::DENIED));
        $model=new AdvancePayRecvHistory;
        $model->adv_pay_recv_id=$id;
        $model->status=AdvancePayRecv::DENIED;
        $model->status_changed_by=Yii::app()->user->getId();
        $model->status_changed_time= new CDbExpression('NOW()');
        $model->save();
        echo "Application denied.";
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

    public function actionCreate() {
        $model = new AdvancePayRecv('longTermTypeScenario');

        // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);

        if (isset($_POST['AdvancePayRecv'])) {
            $model->attributes = $_POST['AdvancePayRecv'];
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

        if (isset($_POST['AdvancePayRecv'])) {
            $model->attributes = $_POST['AdvancePayRecv'];
            $model->setScenario('longTermTypeScenario');
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
        $dataProvider = new CActiveDataProvider('AdvancePayRecv');
        $this->render('index', array(
            'dataProvider' => $dataProvider,
        ));
    }

    /**
     * Manages all models.
     */
    public function actionAdmin() {
        $model = new AdvancePayRecv('search');
        $model->unsetAttributes();  // clear any default values
        if (isset($_GET['AdvancePayRecv']))
            $model->attributes = $_GET['AdvancePayRecv'];

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
        $model = AdvancePayRecv::model()->findByPk($id);
        if ($model === null)
            throw new CHttpException(404, 'The requested page does not exist.');
        return $model;
    }

    /**
     * Performs the AJAX validation.
     * @param CModel the model to be validated
     */
    protected function performAjaxValidation($model) {
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'advance-pay-recv-form') {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }
    }

}
