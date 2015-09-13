    <table class="dashBoardTab" cellspacing="50">
        <tr>
            <td><span class="dashBoardBtnImg addEmp"></span><?php echo CHtml::link('Add Employee', array('/employees/create'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg mngEmp"></span><?php echo CHtml::link('Manage Employees', array('/employees/admin'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg rsgnEmp"></span><?php echo CHtml::link('Employee Resign', array('/empResign/admin'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg pgEmp"></span><?php echo CHtml::link('Paygrades', array('/payGrades/admin'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg edEmp"></span><?php echo CHtml::link('Earn-Deduction Configure', array('/ahAmountProll/admin'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg bonusEmp"></span><?php echo CHtml::link('Assign Bonus', array('/bonusAmounts/admin'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg advPREmp"></span><?php echo CHtml::link('Advance Pay/Receive', array('/advancePayRecv/admin'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
        </tr>
        <tr>
            <td><span class="dashBoardBtnImg lvEmp"></span><?php echo CHtml::link('Take A Leave', array('/empLeaves/admin'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg atMEmp"></span><?php echo CHtml::link('Attendance (Manual)', array('/empAttendance/create'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg atDEmp"></span><?php echo CHtml::link('Attendance (Device)', array('/empAttendance/uploadDeveiceData'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg usrEmp"></span><?php echo CHtml::link('Manage Users', array('/users/admin'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg prmEmp"></span><?php echo CHtml::link('Manage Permissions', array('/rights'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td class="noStyle"></td>
            <td class="noStyle"></td>
        </tr>
        <tr>
            <td><span class="dashBoardBtnImg reportEmp"></span><?php echo CHtml::link('Attendance Report Summery', array('/employees/attendanceReportSummary'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg reportEmp"></span><?php echo CHtml::link('Attendance Report (Single Employee)', array('#'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg reportEmp"></span><?php echo CHtml::link('Salary Sheet', array('/employees/attendanceReport'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td><span class="dashBoardBtnImg reportEmp"></span><?php echo CHtml::link('Paysleep', array('/employees/paySlipSingle'), array('class'=>'dashBoardBtn', 'target'=>'_blank')); ?></td>
            <td class="noStyle"></td>
            <td class="noStyle"></td>
            <td class="noStyle"></td>
        </tr>
    </table>
<style>
    table.dashBoardTab{
        float: left;
        width: 100%;
    }
    table.dashBoardTab tr td{
        border: none;
        border-radius: 3px;
/*        box-shadow: 1px 1px 0px #018a41;*/
        padding: 6px;
        text-align: center;
    }
    table.dashBoardTab tr td a:hover{
        text-decoration: underline;
        cursor: pointer;
    }
    .dashBoardBtnImg{
        float: left;
        width: 100%;
        height: 36px;
    }
    .dashBoardBtn{
        float: left;
        width: 100%;
        color: blue;
        
    }
    .addEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/addEmp.png) no-repeat center center;
    }
    .mngEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/mngEmp.png) no-repeat center center;
    }
    .rsgnEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/rsgnEmp.png) no-repeat center center;
    }
    .pgEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/pgEmp.png) no-repeat center center;
    }
    .edEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/edEmp.png) no-repeat center center;
    }
    .bonusEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/bonusEmp.png) no-repeat center center;
    }
    .advPREmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/advPREmp.png) no-repeat center center;
    }
    .lvEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/lvEmp.png) no-repeat center center;
    }
    .atMEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/atMEmp.png) no-repeat center center;
    }
    .atDEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/atDEmp.png) no-repeat center center;
    }
    .usrEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/usrEmp.png) no-repeat center center;
    }
    .prmEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/prmEmp.png) no-repeat center center;
    }
    .reportEmp{
        background: url(<?php echo Yii::app()->theme->baseUrl; ?>/images/reportEmp.png) no-repeat center center;
    }
</style>