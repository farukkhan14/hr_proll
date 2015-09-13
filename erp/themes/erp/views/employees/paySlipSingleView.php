<?php
echo "<div class='printBtn'>";
$this->widget('ext.mPrint.mPrint', array(
    'title' => ' ', //the title of the document. Defaults to the HTML title
    'tooltip' => 'Print', //tooltip message of the print icon. Defaults to 'print'
    'text' => '', //text which will appear beside the print icon. Defaults to NULL
    'element' => '.printAllTableForThisReport', //the element to be printed.
    'exceptions' => array(//the element/s which will be ignored
    ),
    'publishCss' => FALSE, //publish the CSS for the whole page?
    'visible' => Yii::app()->user->checkAccess('print'), //should this be visible to the current user?
    'alt' => 'print', //text which will appear if image can't be loaded
    'debug' => FALSE, //enable the debugger to see what you will get
    'id' => 'print-div'         //id of the print link
));
echo "</div>";
?>
<?php if($empId!="No_Employee"){ ?>
<?php
$empInfo = Employees::model()->findByPk($empId);
$conditionEarning = "paygrade_id=" . $empInfo->paygrade_id . " AND ac_type=" . AhProll::EARNING;
$dataEarning = AhProll::model()->findAll(array('condition' => $conditionEarning));
$conditionDeduction = "paygrade_id=" . $empInfo->paygrade_id . " AND ac_type=" . AhProll::DEDUCTION;
$dataDeduction = AhProll::model()->findAll(array('condition' => $conditionDeduction));
$companyDetails = YourCompany::model()->activeInfo();

$shiftData = ShiftHeads::model()->findByPk($empInfo->shift_id);
$addFiveMin = 5 * 60; // 5 min to 5 X 60 = 300 sec
$shiftStartInSec = strtotime($shiftData->in_time) + $addFiveMin;
//$shiftEntryTime= date('h:i', $shiftStartInSec);
$shiftEndInSec = strtotime($shiftData->out_time);

$criteria = new CDbCriteria();
$criteria->addColumnCondition(array('card_no' => $empInfo->id_no), 'AND');
$criteria->addBetweenCondition('date', $startDate, $endDate);
$attendanceData = EmpAttendance::model()->findAll($criteria);
$countPresentDay = 0;
$countAttnBonus = 0;
$overTime = 0;
if ($attendanceData) {
    foreach ($attendanceData as $ad):
        $entryTime = strtotime($ad->out_time);
        $leaveTime = strtotime($ad->out_time);

        if ($entryTime <= $shiftStartInSec) {
            $countAttnBonus++;
        }
        if ($leaveTime > $shiftEndInSec) {
            $overTime = ($leaveTime - $shiftEndInSec) + $overTime;
        }
        $countPresentDay++;
    endforeach;
}

$conditionLeave = "emp_id=" . $empInfo->id . " AND month=" . $monthFetch . " AND year=" . $yearFetch;
$dataLeave = EmpLeaves::model()->findAll(array('condition' => $conditionLeave));
$countApprovedLv = 0;
$countUnApprovedLv = 0;
if ($dataLeave) {
    foreach ($dataLeave as $dl):
        if ($dl->is_approved == EmpLeaves::APPROVED)
            $countApprovedLv++;
        else
            $countUnApprovedLv++;
    endforeach;
}
$countAbsentDay = ($working_day - $countPresentDay);
$actualAbsentDay = ($countAbsentDay - $countApprovedLv) + $countUnApprovedLv;

$presentBonus = 0;
$conditionPresentBonus = $working_day - 2;
if ($countAttnBonus == $conditionPresentBonus)
    $presentBonus = $presentBonus + 200;
else
    $presentBonus=$presentBonus;

$otRate = OtRate::model()->otRatesOfThis($empInfo->paygrade_id);
$otTime = ($overTime / 60) / 60;
$otSalary = ($otRate * $otTime);

$conditionLong = "employee_id=" . $empInfo->id . " AND transaction_date < '" . $endDate . "' AND is_approved=" . AdvancePayRecv::APPROVED;
$dataLong = AdvancePayRecv::model()->findAll(array('condition' => $conditionLong), 'id');
$acRecvblAmountPrMnthTotal = 0;
$amountReceivedTotal = 0;
$amountReceivedTotalCurrent = 0;
$acRecvblAmountPrMnthTotalCurrent = 0;
if ($dataLong) {
    foreach ($dataLong as $dl):
        if ($dl->adv_pay_type == AdvancePayRecv::LONG_TERM) {
            if ($dl->payOrReceive == AdvancePayRecv::PAY) {
                $d1 = new DateTime($dl->transaction_date); // stored date
                $d2 = new DateTime($endDate); // given date
                $interval = $d2->diff($d1);
                $dateDiff = $interval->format('%m');
                if ($dateDiff <= $dl->installment) {
                    $amountWithInstallMent = ($dl->amount / $dl->installment);
                    $amountWithInterest = ($amountWithInstallMent * ($dl->interest / 100));
                    $acRecvblAmountPrMnth = $amountWithInstallMent + $amountWithInterest;
                    $acRecvblAmountPrMnthTotal = $acRecvblAmountPrMnth + $acRecvblAmountPrMnthTotal;
                }
            } else {
                $amountReceivedTotal = $dl->amount + $amountReceivedTotal;
            }
        } else {
            if ($dl->payOrReceive == AdvancePayRecv::PAY) {
                $acRecvblAmountPrMnthTotalCurrent = $dl->amount + $acRecvblAmountPrMnthTotalCurrent;
            } else {
                $amountReceivedTotalCurrent = $dl->amount + $amountReceivedTotalCurrent;
            }
        }
    endforeach;
}

$duductableAmountLong = $acRecvblAmountPrMnthTotal - $amountReceivedTotal;

$duductableAmountLongCurrent = $acRecvblAmountPrMnthTotalCurrent - $amountReceivedTotalCurrent;

if ($duductableAmountLong > 0)
    $duductableAmountLong = $duductableAmountLong;
else
    $duductableAmountLong=$acRecvblAmountPrMnthTotal;

$totalLoant = $duductableAmountLong + $duductableAmountLongCurrent;
?>
<div class='printAllTableForThisReport'>
    <span class="reportTitle">
        <?php
        if ($companyDetails) {
            echo $companyDetails->company_name . "<br>";
            echo $companyDetails->location . "<br>";
            echo $message;
        }
        ?>
    </span>
    <table class="reportTab">
        <tr>
            <td class="textAlgnLeft" style="vertical-align: top;">
                <?php
                echo "নামঃ " . $empInfo->full_name . "<br>";
                echo "পদবী " . Designations::model()->infoOfThis($empInfo->designation_id) . "<br>";
                echo "ডিপার্টমেন্টঃ " . Departments::model()->nameOfThis($empInfo->department_id) . "<br>";
                echo "সেকশন / লাইনঃ " . Sections::model()->nameOfThis($empInfo->section_id) . " / " . Teams::model()->infoOfThis($empInfo->team_id);
                ?>
            </td>
            <td class="textAlgnRight" style="vertical-align: top;">
                <?php
                echo "পে-গ্রেডঃ " . PayGrades::model()->nameOfThis($empInfo->paygrade_id) . "<br>";
                echo "আইডী নাম্বারঃ " . $empInfo->emp_id_no . "<br>";
                echo "পাঞ্চ কার্ড নাম্বারঃ " . $empInfo->id_no;
                ?>
            </td>
        </tr>
        <tr>
            <td style="vertical-align: top;">
                <table class="reportTab reportTabNoBorder">
                    <?php $earnAmountTotal = 0; ?>
                    <?php $deductionAmountTotal = 0; ?>
                    <?php $basicSalary=0; ?>
                    <?php if ($dataEarning) { ?>
                        <?php foreach ($dataEarning as $de) { ?>
                            <?php
                            
                            $dataEarningAmount = AhAmountProll::model()->findByAttributes(array('ah_proll_id' => $de->id, 'is_active' => AhAmountProll::ACTIVE));
                            if ($dataEarningAmount) {
                                if ($dataEarningAmount->earn_deduct_type == AhAmountProll::MONTHLY_BASIS) {
                                    $earnAmount = $dataEarningAmount->amount_adj;
                                } else {
                                    $earnAmount = $countPresentDay*$dataEarningAmount->amount_adj;
                                }
                                if ($de->is_basic_salary==AhProll::BASIC_SALARY) {
                                    $basicSalary = $dataEarningAmount->amount_adj;
                                }
                            } else {
                                $earnAmount = 0;
                            }
                            $earnAmountTotal = $earnAmount + $earnAmountTotal;
                            ?>
                            <tr>
                                <td class="textAlgnLeft blue"><?php echo $de->title; ?></td>
                                <td class="textAlgnLeft blue"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($earnAmount), 2)); ?></td>
                            </tr>
                        <?php } ?>
                    <?php } ?>
                    <tr>
                        <td class="textAlgnLeft heightLight bold">মাসিক বেতন</td>
                        <td class="textAlgnLeft heightLight bold"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($earnAmountTotal), 2)); ?></td>
                    </tr>
                    <tr>
                        <td class="textAlgnLeft">মোট কার্য দিবস / দিন</td>
                        <td class="textAlgnLeft"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger($working_day); ?></td>
                    </tr>
                    <tr>
                        <td class="textAlgnLeft">উপস্থিতি / দিন</td>
                        <td class="textAlgnLeft"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger($countPresentDay); ?></td>
                    </tr>
                    <tr>
                        <td class="textAlgnLeft">অনুমোদিত ছুটি / দিন</td>
                        <td class="textAlgnLeft"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger($countApprovedLv); ?></td>
                    </tr>
                    <tr>
                        <td class="textAlgnLeft">অনুনোমোদিত ছুটি / দিন</td>
                        <td class="textAlgnLeft"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger($countUnApprovedLv); ?></td>
                    </tr>
                    <tr>
                        <td class="textAlgnLeft">অনুপস্থিতি / দিন</td>
                        <td class="textAlgnLeft"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger($actualAbsentDay); ?></td>
                    </tr>
                    <tr>
                        <td class="textAlgnLeft">ওটি রেট / ঘন্টা</td>
                        <td class="textAlgnLeft"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($otRate), 2)); ?></td>
                    </tr>
                    <tr>
                        <td class="textAlgnLeft">ওটি / ঘন্টা</td>
                        <td class="textAlgnLeft"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($otTime), 2)); ?></td>
                    </tr>
                </table>
            </td>
            <td style="vertical-align: top;">
                <table class="reportTab reportTabNoBorder">
                    <tr>
                        <td class="textAlgnLeft blue">হাজিরা বোনাস</td>
                        <td class="textAlgnLeft blue"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($presentBonus), 2)); ?></td>
                    </tr>
                    <tr>
                        <td class="textAlgnLeft blue">ওটি বেতন</td>
                        <td class="textAlgnLeft blue"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($otSalary), 2)); ?></td>
                    </tr>
                    <tr>
                        <td class="textAlgnLeft red" style="padding-top: 30px;">অগ্রিম কর্তন</td>
                        <td class="textAlgnLeft red" style="padding-top: 30px;"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($totalLoant), 2)); ?></td>
                    </tr>
                    <?php
                        $actualAbsentDeduction = ($basicSalary/$working_day)*$actualAbsentDay;
                    ?>
                    <tr>
                        <td class="textAlgnLeft red">অনুপস্থিতি কর্তন</td>
                        <td class="textAlgnLeft red"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($actualAbsentDeduction), 2)); ?></td>
                    </tr>
                    <?php if ($dataDeduction) { ?>
                        <?php foreach ($dataDeduction as $dd) { ?>
                            <?php
                            $dataDeductionAmount = AhAmountProll::model()->findByAttributes(array('ah_proll_id' => $dd->id, 'is_active' => AhAmountProll::ACTIVE));
                            if ($dataDeductionAmount) {
                                if ($dataDeductionAmount->earn_deduct_type == AhAmountProll::MONTHLY_BASIS) {
                                    $deductionAmount = $dataDeductionAmount->amount_adj;
                                } else {
                                    $earnAmount = $countPresentDay*$dataEarningAmount->amount_adj;
                                }
                            } else {
                                $deductionAmount = 0;
                            }
                            $deductionAmountTotal = $deductionAmount + $deductionAmountTotal;
                            ?>
                            <tr>
                                <td class="textAlgnLeft red"><?php echo $dd->title; ?></td>
                                <td class="textAlgnLeft red"><b> : </b><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($deductionAmount), 2)); ?></td>
                            </tr>
                        <?php } ?>
                    <?php } ?>
                    <?php
                    $totalDeduction = $deductionAmountTotal + $totalLoant+ $actualAbsentDeduction;
                    $totalEarning=$earnAmountTotal + $otSalary + $presentBonus;
                    $totalSalary = ($totalEarning-$totalDeduction);
                    ?>
                </table>
            </td>
        </tr>
        <tr>
            <td class="heightLight bold">সর্বমোট প্রদেয় বেতন</td>
            <td class="heightLight bold"><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($totalSalary), 2)); ?></td>
        </tr>
    </table>
</div>
<?php } ?>
<style>
    table.reportTab{
    float: left;
    width: 100%;
    border-collapse: collapse;
    background-color: rgba(0, 0, 0, 0);
    color: #8B4513;
    text-align: center;
    font-size: 12px;
}
table.reportTab,
table.reportTab tr, 
table.reportTab tr td,
table.reportTab tr th{
    border: 1px solid #C0C0C0;
}
table.reportTab tr.odd{
    background-color: #FFFFDC;
}
table.reportTab tr.even{
    background-color: #FFFFFF;
}
table.reportTab tr td{
    padding:4px;
}
table.reportTab tr td.textAlgnLeft{
    text-align: left;
}
table.reportTab tr td.textAlgnRight{
    text-align: right;
}
table.reportTab tr td.heightLight{
    background-color: #FFFF00;
}
table.reportTab tr td.bold{
    font-weight: bold;
}
table.reportTab tr td.red{
    color: red;
}
table.reportTab tr td.blue{
    color: blue;
}
table.reportTabNoBorder, table.reportTabNoBorder tr, table.reportTabNoBorder tr td{
    border: none;
}
span.reportTitle{
    float: left;
    width: 100%;
    text-align: center;
    font-weight: bold;
    font-size: 16px;
    margin-bottom: 10px;
}
table.reportTab tr td.diagonal{
    /* Rotate div */
    -ms-transform: rotate(-45deg); /* IE 9 */
    -webkit-transform: rotate(-45deg); /* Chrome, Safari, Opera */
    transform: rotate(-45deg);
    color: #000000;
}
</style>