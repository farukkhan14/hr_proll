<?php

class EmployeesController extends Controller {

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
    
    public function actionCreatePdfDoc($id) {
        $model = $this->loadModel($id);
        $html2pdf = Yii::app()->ePdf->HTML2PDF();
        $html2pdf->WriteHTML($this->renderPartial('viewEmpProfilePdf', array('model' => $model,), true));
        $content_PDF = $html2pdf->Output('profile_ '.$model->emp_id_no.'.pdf', 'D');
        
        //$content_PDF = $html2pdf->Output('', true);
    }
    
    public function actionViewEmpProfile($id) {
        $model = $this->loadModel($id);
        $this->render('viewEmpProfile', array('model' => $model));
//        if (!isset($_GET['ajax'])) {
//            $this->redirect(Yii::app()->request->urlReferrer);
//        }
    }
    
    public function actionAdminEmpDocs(){
        $model = new Employees('search');
        $model->unsetAttributes();  // clear any default values
        if (isset($_GET['Employees']))
            $model->attributes = $_GET['Employees'];

        $this->render('adminEmpDocs', array(
            'model' => $model,
        ));
    }

    public function actionAttendanceReportSummary() {
        $model = new Employees;
        $this->render('attendanceReportSummary', array(
            'model' => $model,
        ));
    }

    public function actionAttendanceReportSummaryView() {
        if(isset($_POST['Employees']['startDate'])){
            
            $startDate=$_POST['Employees']['startDate'];
            $message="Attendance Report(Summary)";
            
            echo CJSON::encode(array(
                'content' => $this->renderPartial('attendanceReportSummaryView', array(
                    'message' => $message,
                    'startDate'=>$startDate,
                        ), true, true),
            ));
        }
    }

    public function actionEmpCardNoOfThisDept() {
        $departmentId = $_POST['EmpAttendance']['department_id'];
        if ($departmentId != "") {
            $condition = "department_id=" . $departmentId . " ORDER BY full_name ASC";
        } else {
            $condition = "id!=0 ORDER BY full_name ASC";
        }

        $data = Employees::model()->findAll(array('condition' => $condition));
        $content = "";
        if ($data) {
            $i = 0;
            foreach ($data as $d) {
                $content.='<div class="cardList">';
                $content.='<input type="checkbox" id="EmpAttendance_card_no_' . $i++ . '" name="EmpAttendance[card_no][]" value="' . $d->id_no . '"/><span>' . $d->full_name . ' (' . $d->id_no . ')</span>';
                $content.='</div>';
            }
        }
        echo CJSON::encode(array(
            'content' => $content,
        ));
    }

    public function actionEmpOfThis() {
        $empIdNo = $_POST['empIdNo'];
        $empPunchCardNo = $_POST['empPunchCardNo'];
        $jsPart = '';
        $empId = "";
        if ($empIdNo != "" && $empPunchCardNo == "") {
            $data = Employees::model()->findByAttributes(array('emp_id_no' => $empIdNo));
            if ($data)
                $empId = $data->id;
        }else if ($empIdNo == "" && $empPunchCardNo != "") {
            $data = Employees::model()->findByAttributes(array('id_no' => $empPunchCardNo));
            if ($data)
                $empId = $data->id;
        }else if ($empIdNo != "" && $empPunchCardNo != "") {
            $data = Employees::model()->findByAttributes(array('emp_id_no' => $empIdNo, 'id_no' => $empPunchCardNo));
            if ($data)
                $empId = $data->id;
        }else {
            $empId = "";
        }

        $jsPart.= '<script type="text/javascript">
                   $(document).ready(function(){ 
                            var employeeId="' . $empId . '";
                            $("#Employees_id").val(employeeId);
                    });
                   </script>
                   ';

        echo CJSON::encode(array(
            'jsPart' => $jsPart,
        ));
    }

    public function actionEmployeePaySlip() {
        $model = new Employees;
        $this->render('employeePaySlip', array(
            'model' => $model,
        ));
    }

    public function actionEmployeePaySlipView() {
        if (isset($_POST['Employees']['startDate'], $_POST['Employees']['endDate'], $_POST['Employees']['paygrade_id'], $_POST['Employees']['section_id'], $_POST['Employees']['team_id'])) {
            if ($_POST['Employees']['startDate'] != "" && $_POST['Employees']['endDate'] != "" && $_POST['Employees']['paygrade_id']!="") {
                
                $startDate = $_POST['Employees']['startDate'];
                $endDate = $_POST['Employees']['endDate'];
                $paygradeId = $_POST['Employees']['paygrade_id'];
                $secId = $_POST['Employees']['section_id'];
                $teamId = $_POST['Employees']['team_id'];
            
                $monthFetch = substr($endDate, 5, 2);
                $yearFetch = substr($endDate, 0, 4);
                $monthInfo = Months::model()->findByAttributes(array('code' => $monthFetch)); // month info
                $monthId = $monthInfo->id;
                $monthName = $monthInfo->month_name;
                $monthNameBangla = $monthInfo->bangla_name;
                
                $condition = "month_id=" . $monthId . " AND year=" . $yearFetch;
                $activeWorkingDay = WorkingDay::model()->findAll(array('condition' => $condition), 'id'); // active working day info
                $working_day = 0;
                $days_of_month=0;
                foreach ($activeWorkingDay as $awd):
                    $days_of_month = $awd->days_of_month;
                    $working_day = $awd->working_day;
                endforeach;
                
                if($activeWorkingDay){
                    $message="বেতন ও ওভারটাইম শীট / ".$monthNameBangla."- ".  TanimBanglaModule::outputBanglaInteger($yearFetch);
                    echo CJSON::encode(array(
                        'content' => $this->renderPartial('employeePaySlipView', array(
                            'message' => $message,
                            'paygradeId'=>$paygradeId,
                            'secId'=>$secId,
                            'teamId'=>$teamId,
                            'startDate'=>$startDate,
                            'endDate'=>$endDate,
                            'working_day'=>$working_day,
                            'days_of_month'=>$days_of_month,
                            'monthFetch'=>$monthFetch,
                            'yearFetch'=>$yearFetch,
                                ), true, true),
                    ));
                }else{
                    $message="<div class='flash-error'>Notice! No working day is set!</div>";
                    echo CJSON::encode(array(
                        'content' => $this->renderPartial('employeePaySlipView', array(
                            'message' => $message,
                            'paygradeId'=>"No_Paygrade",
                                ), true, true),
                    ));
                }
            }
        }
    }

    public function actionPaySlipSingle() {
        $model = new Employees;
        $this->render('paySlipSingle', array(
            'model' => $model,
        ));
    }

    public function actionPaySlipSingleView() {
        if (isset($_POST['Employees']['startDate'], $_POST['Employees']['endDate'], $_POST['Employees']['id'])) {
            
            $startDate = $_POST['Employees']['startDate'];
            $endDate = $_POST['Employees']['endDate'];
            $empId = $_POST['Employees']['id'];
            
            if ($startDate != "" && $endDate != "" && $empId != "") {
                $monthFetch = substr($endDate, 5, 2);
                $yearFetch = substr($endDate, 0, 4);
                $monthInfo = Months::model()->findByAttributes(array('code' => $monthFetch)); // month info
                $monthId = $monthInfo->id;
                $monthName = $monthInfo->month_name;
                $monthNameBangla = $monthInfo->bangla_name;
                
                $condition = "month_id=" . $monthId . " AND year=" . $yearFetch;
                $activeWorkingDay = WorkingDay::model()->findAll(array('condition' => $condition), 'id'); // active working day info
                $working_day = 0;
                $days_of_month=0;
                foreach ($activeWorkingDay as $awd):
                    $days_of_month = $awd->days_of_month;
                    $working_day = $awd->working_day;
                endforeach;
                if($activeWorkingDay){
                    $message="পে স্লিপঃ / ".$monthNameBangla."- ".  TanimBanglaModule::outputBanglaInteger($yearFetch);
                    echo CJSON::encode(array(
                        'content' => $this->renderPartial('paySlipSingleView', array(
                            'message' => $message,
                            'empId'=>$empId,
                            'startDate'=>$startDate,
                            'endDate'=>$endDate,
                            'working_day'=>$working_day,
                            'days_of_month'=>$days_of_month,
                            'monthFetch'=>$monthFetch,
                            'yearFetch'=>$yearFetch,
                                ), true, true),
                    ));
                }else{
                    $message="<div class='flash-error'>Notice! No working day is set!</div>";
                    echo CJSON::encode(array(
                        'content' => $this->renderPartial('paySlipSingleView', array(
                            'message' => $message,
                            'empId'=>"No_Employee",
                                ), true, true),
                    ));
                }
            }
        }
    }

    public function actionAttendanceReport() {
        $model = new Employees;
        $this->render('attendanceReport', array(
            'model' => $model,
        ));
    }

    public function actionAttendanceReportView() {
        if (isset($_POST['Employees']['startDate'], $_POST['Employees']['endDate'], $_POST['Employees']['id'])) {
            
            $startDate = $_POST['Employees']['startDate'];
            $endDate = $_POST['Employees']['endDate'];
            $employeeId = $_POST['Employees']['id'];

            $monthFetch = substr($startDate, 5, 2);
            $yearFetch = substr($startDate, 0, 4);

            $monthCode = Months::model()->findByAttributes(array('code' => $monthFetch));
            if ($monthCode) {
                $monthId = $monthCode->id;
                $monthName = $monthCode->month_name;
                $condition = "month_id=" . $monthId . " AND year=" . $yearFetch;
                $activeWorkingDay = WorkingDay::model()->findAll(array('condition' => $condition), 'id');
                if ($activeWorkingDay) {
                    foreach ($activeWorkingDay as $awd):
                        $days_of_month = $awd->days_of_month;
                        $working_day = $awd->working_day;
                    endforeach;

                    $empData = Employees::model()->findByPk($employeeId);

                    if ($empData) {
                        $cardNo = $empData->id_no;
                        $empId = $empData->id;
                        $shiftId=$empData->shift_id;
                        $empFullName = $empData->full_name;
                        $empIdNo = $empData->emp_id_no;
                        $payGradeId=$empData->paygrade_id;
                        $empDesignation = Designations::model()->infoOfThis($empData->designation_id);
                        $empDepartment = Departments::model()->nameOfThis($empData->department_id);

                        $criteria = new CDbCriteria();
                        $criteria->addColumnCondition(array('card_no' => $cardNo), 'AND');
                        $criteria->addBetweenCondition('date', $startDate, $endDate);
                        $criteria->order = "date ASC";
                        $attendanceData = EmpAttendance::model()->findAll($criteria);
                        if ($attendanceData) {
                            $message = "<tr><td colspan='5'>Attendance Report From " . $startDate . " To " . $endDate . "</td></tr>";
                            $message.="<tr><td colspan='4' class='textAlgnLeft' style='vertical-align: top'>Name: " . $empFullName .
                                    "<br>Employee ID: " . $empIdNo .
                                    "<br>Punch Card No: " . $cardNo .
                                    "<br>Designation: " . $empDesignation .
                                    "<br>Department: " . $empDepartment . "</td>";
                            $message.="<td class='textAlgnRight' style='vertical-align: top'>Days Of This Month: " . $days_of_month .
                                    "<br>Working Day Of This Month: " . $working_day .
                                    "<br>Month/Year: " . $monthName . "/" . $yearFetch . "</td></tr>";
                                if ($payGradeId!="") {
                                    $assignedLvCond = "paygrade_id=" . $payGradeId;
                                    $assignedLeave = LhProll::model()->findAll(array('condition' => $assignedLvCond), 'id');

                                    echo CJSON::encode(array(
                                        'content' => $this->renderPartial('attendanceReportViewPayGrade', array(
                                            'message' => $message,
                                            'attendanceData' => $attendanceData,
                                            'assignedLeave' => $assignedLeave,
                                            'monthFetch' => $monthFetch,
                                            'yearFetch' => $yearFetch,
                                            'empId' => $empId,
                                            'shiftId' => $shiftId,
                                                ), true, true),
                                    ));
                                }
                        } else {
                            $message = "<tr><td colspan='5'><div class='flash-error'>Notice! NO ATTENDANCE INFO FOUND WITHIN THIS TIME RANGE!</td></tr>";
                    echo CJSON::encode(array(
                                        'content' => $this->renderPartial('attendanceReportViewPayGrade', array(
                                            'message' => $message,
                                            'attendanceData' => "",
                                            'assignedLeave' => "",
                                            'monthFetch' => $monthFetch,
                                            'yearFetch' => $yearFetch,
                                            'empId' => $empId,
                                            'shiftId' => $shiftId,
                                                ), true, true),
                                    ));
                        }
                    } else {
                        $message = "<tr><td colspan='5'><div class='flash-error'>Notice! NO EMPLOYEE INFO FOUND!</td></tr>";
                    echo CJSON::encode(array(
                                        'content' => $this->renderPartial('attendanceReportViewPayGrade', array(
                                            'message' => $message,
                                            'attendanceData' => "",
                                            'assignedLeave' => "",
                                            'monthFetch' => $monthFetch,
                                            'yearFetch' => $yearFetch,
                                            'empId' => $empId,
                                            'shiftId' => $shiftId,
                                                ), true, true),
                                    ));
                    }
                } else {
                    $message = "<tr><td colspan='5'><div class='flash-error'>Notice! No working day is set!</td></tr>";
                    echo CJSON::encode(array(
                                        'content' => $this->renderPartial('attendanceReportViewPayGrade', array(
                                            'message' => $message,
                                            'attendanceData' => "",
                                            'assignedLeave' => "",
                                            'monthFetch' => $monthFetch,
                                            'yearFetch' => $yearFetch,
                                            'empId' => $empId,
                                            'shiftId' => $shiftId,
                                                ), true, true),
                                    ));
                }
            }
        }
    }

    public function actionUpload() {

        Yii::import("ext.EAjaxUpload.qqFileUploader");

        $folder = 'upload/empPhoto/'; // folder for uploaded files
        $allowedExtensions = array("jpg", "jpeg", "png"); //array("jpg","jpeg","gif","exe","mov" and etc...
        $sizeLimit = 2 * 1024 * 1024; // maximum file size in bytes
        $uploader = new qqFileUploader($allowedExtensions, $sizeLimit);
        $result = $uploader->handleUpload($folder);
        $return = htmlspecialchars(json_encode($result), ENT_NOQUOTES);

        $fileSize = filesize($folder . $result['filename']); //GETTING FILE SIZE
        $fileName = $result['filename']; //GETTING FILE NAME

        echo $return; // it's array
    }

    /**
     * Displays a particular model.
     * @param integer $id the ID of the model to be displayed
     */
    public function actionView($id) {
        $model = $this->loadModel($id);
        $this->render('view', array('model' => $model,));
    }

    /**
     * Creates a new model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     */
    public function actionCreateEmployeeFromOutSide() {
        $model = new Employees;

        // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);

        if (isset($_POST['Employees'])) {
            $model->attributes = $_POST['Employees'];
            if ($model->save()) {
                if (Yii::app()->request->isAjaxRequest) {
                    $data = Employees::model()->findByPk($model->id);
                    echo CJSON::encode(array(
                        'status' => 'success',
                        'div' => "<div class='flash-notice'>New Employee successfully added</div>",
                        'value' => $data->id,
                        'label' => $data->full_name,
                    ));
                    exit;
                }
                else
                    $this->redirect(array('view', 'id' => $model->id));
            }
        }

        if (Yii::app()->request->isAjaxRequest) {
            $resultDiv = '';
            echo CJSON::encode(array(
                'status' => 'failure',
                'resultDiv' => $resultDiv,
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
        $model = new Employees;

        // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);

        if (isset($_POST['Employees'])) {
            $model->attributes = $_POST['Employees'];
            $model->img = CUploadedFile::getInstance($model, 'photo');
            if ($model->save()) {
                if ($model->img) {
                    $filenameReplacingWhiteSpaceWithUnderscor = str_replace(" ", "_", $model->img);
                    $model->img->saveAs(Yii::app()->basePath . '/../upload/empPhoto/' . $model->id . '_' . $filenameReplacingWhiteSpaceWithUnderscor);
                    $i = $model->id . '_' . $filenameReplacingWhiteSpaceWithUnderscor;
                    $model->img = Yii::app()->image->load(Yii::app()->basePath . '/../upload/empPhoto/' . $i);
                    $model->img->resize(130, 130)->quality(100)->sharpen(20);
                    $model->img->save();
                }
                Yii::app()->user->setFlash('success', "Employee information saved successfully.");
                $this->redirect(array('create'));
            }
        }
        $this->render('create', array(
            'model' => $model,
        ));
       
    }
    
    public function actionUpdate($id) {
        $model = $this->loadModel($id);

        // Uncomment the following line if AJAX validation is needed
        $this->performAjaxValidation($model);

        if (isset($_POST['Employees'])) {
            $model->attributes = $_POST['Employees'];
            $model->img = CUploadedFile::getInstance($model, 'photo');
            if ($model->save()) {
                if ($model->img) {
                    $filenameReplacingWhiteSpaceWithUnderscor = str_replace(" ", "_", $model->img);
                    $model->img->saveAs(Yii::app()->basePath . '/../upload/empPhoto/' . $model->id . '_' . $filenameReplacingWhiteSpaceWithUnderscor);
                    $i = $model->id . '_' . $filenameReplacingWhiteSpaceWithUnderscor;
                    $model->img = Yii::app()->image->load(Yii::app()->basePath . '/../upload/empPhoto/' . $i);
                    $model->img->resize(130, 130)->quality(100)->sharpen(20);
                    $model->img->save();
                }
                Yii::app()->user->setFlash('success', "Employee information saved successfully.");
                $this->redirect(array('admin'));
            }
        }
            $this->render('update', array(
                'model' => $model,
            ));
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
        $dataProvider = new CActiveDataProvider('Employees');
        $this->render('index', array(
            'dataProvider' => $dataProvider,
        ));
    }

    /**
     * Manages all models.
     */
    public function actionAdmin() {
        $model = new Employees('search');
        $model->unsetAttributes();  // clear any default values
        if (isset($_GET['Employees']))
            $model->attributes = $_GET['Employees'];

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
        $model = Employees::model()->findByPk($id);
        if ($model === null)
            throw new CHttpException(404, 'The requested page does not exist.');
        return $model;
    }

    /**
     * Performs the AJAX validation.
     * @param CModel the model to be validated
     */
    protected function performAjaxValidation($model) {
        if (isset($_POST['ajax']) && $_POST['ajax'] === 'employees-form') {
            echo CActiveForm::validate($model);
            Yii::app()->end();
        }
    }

}
