<?php

class EmpResignController extends Controller
{
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
        $condition="employee_resign_id=".$id;
        $data=  EmpResignHistory::model()->findAll(array('condition'=>$condition), 'id');
        if($data){
            echo "<table class='summaryTab'>";
            echo "<tr><td>STATUS</td><td>CHANGED BY</td><td>DATE</td></tr>";
            foreach($data as $d):
                echo "<tr>";
                echo "<td>";
                EmpResign::model()->statusColorIsAproved($d->status);
                echo "</td>";
                echo "<td style='text-align: left'>".Users::model()->fullNameOfThis($d->status_changed_by)."</td>";
                echo "<td>".$d->status_changed_time."</td>";
                echo "<tr>";
            endforeach;
            echo "</table>";
        }
    }


    public function actionApprove($id){
        EmpResign::model()->updateByPk($id, array('is_approved'=>  EmpResign::APPROVED));
        Employees::model()->updateByPk($id, array('is_active'=> Employees::INACTIVE));
        $model=new EmpResignHistory;
        $model->employee_resign_id=$id;
        $model->status=EmpResign::APPROVED;
        $model->status_changed_by=Yii::app()->user->getId();
        $model->status_changed_time= new CDbExpression('NOW()');
        $model->save();
        echo "Application approved.";
    }
    public function actionDeny($id){
        EmpResign::model()->updateByPk($id, array('is_approved'=>  EmpResign::DENIED));
        Employees::model()->updateByPk($id, array('is_active'=> Employees::ACTIVE));
        $model=new EmpResignHistory;
        $model->employee_resign_id=$id;
        $model->status=  EmpResign::DENIED;
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

    /**
     * Creates a new model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     */
    public function actionCreate() {
        $model = new EmpResign;

        // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);

        if (isset($_POST['EmpResign'])) {
            $model->attributes = $_POST['EmpResign'];
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

        if (isset($_POST['EmpResign'])) {
            $model->attributes = $_POST['EmpResign'];
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
	public function actionDelete($id)
	{
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
		$dataProvider=new CActiveDataProvider('EmpResign');
		$this->render('index',array(
			'dataProvider'=>$dataProvider,
		));
	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new EmpResign('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['EmpResign']))
			$model->attributes=$_GET['EmpResign'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=EmpResign::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='emp-resign-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
}
