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
<div class='printAllTableForThisReport'>
    <?php if($paygradeId!="No_Paygrade"){ ?>
    <span class="reportTitle">
        <?php
        $companyDetails = YourCompany::model()->activeInfo();
        if ($companyDetails) {
            echo $companyDetails->company_name . "<br>";
            echo $companyDetails->location . "<br>";
            echo $message."<br>";
            echo "মোট কার্য দিবস- ".TanimBanglaModule::outputBanglaInteger($working_day).", পে-গ্রেড- ".PayGrades::model()->nameOfThis($paygradeId);
        }
        ?>
    </span>
    <table class="reportTab">
        <tr>
            <td class="diagonal" style="width: 30px;">ক্রঃনং</td>
            <td class="diagonal">নাম</td>
            <td class="diagonal">পদবী</td>
            <td class="diagonal">ডিপার্টমেন্ট</td>
            <td class="diagonal">সেকশন / লাইন</td>
            <td class="diagonal">আইডি নং</td>
            <td class="diagonal">যোগদানের তারিখ</td>
            <td class="diagonal">উপস্থিতি</td>
            <td class="diagonal">অনুপস্থিতি</td>
            <?php
            $conditionEarning = "paygrade_id=" . $paygradeId . " AND ac_type=" . AhProll::EARNING;
            $dataEarning = AhProll::model()->findAll(array('condition' => $conditionEarning));
            $conditionDeduction = "paygrade_id=" . $paygradeId . " AND ac_type=" . AhProll::DEDUCTION;
            $dataDeduction = AhProll::model()->findAll(array('condition' => $conditionDeduction));
            ?>
            <?php
            $earnArray = array();
            if ($dataEarning != "") {
                foreach ($dataEarning as $deh):
                    $earnArray[] = $deh->id;
                    if($deh->is_basic_salary==AhProll::BASIC_SALARY)
                            $basicSalaryId=$deh->id;
                    
                    ?>
                    <td class="diagonal"><?php echo $deh->title; ?></td>
                    <?php
                endforeach;
            }
            ?>
            <td class="diagonal">মোট বেতন</td>
            <td class="diagonal">হাজিরা বোনাস</td>
            <td class="red diagonal">অনুপস্থিতি কর্তন</td>
            <td class="red diagonal">অগ্রীম কর্তন</td>
            <?php
            $deductArray = array();
            if ($dataDeduction != "") {
                foreach ($dataDeduction as $ddh):
                    $deductArray[] = $ddh->id;
                    ?>
                    <td class="red diagonal"><?php echo $ddh->title; ?></td>
                    <?php
                endforeach;
            }
            ?>
            <td class="diagonal">প্রাপ্য বেতন</td>
            <td class="diagonal">ওটি রেট/ ঘন্টা</td>
            <td class="diagonal">ওটি / ঘন্টা</td>
            <td class="diagonal">ওটি বেতন</td>
            <td class="diagonal">মোট প্রাপ্য বেতন</td>
            <td class="diagonal">প্রাপ্তি স্বীকার স্বাক্ষর</td>
        </tr>
        <?php
        $countEarnArr = count($earnArray);
        $countDeductArr = count($deductArray);

        $condition = "is_active=" . Employees::ACTIVE . " AND paygrade_id=" . $paygradeId;
        if ($secId != "")
            $condition.=" AND section_id=" . $secId;
        if ($teamId != "")
            $condition.=" AND team_id=" . $teamId;
        $empData = Employees::model()->findAll(array('condition' => $condition));
        $sl = 1;
        if ($empData) {
            foreach ($empData as $empInfo) {
                ?>
                <?php
                $conditionEarning = "paygrade_id=" . $empInfo->paygrade_id . " AND ac_type=" . AhProll::EARNING;
                $dataEarning = AhProll::model()->findAll(array('condition' => $conditionEarning));
                $conditionDeduction = "paygrade_id=" . $empInfo->paygrade_id . " AND ac_type=" . AhProll::DEDUCTION;
                $dataDeduction = AhProll::model()->findAll(array('condition' => $conditionDeduction));
                
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


                <tr class="<?php
        if ($sl % 2 == 0)
            echo "even"; else
            echo "odd";
                ?>">
                    <td><?php echo TanimBanglaModule::outputBanglaInteger($sl++); ?></td>
                    <td><?php echo $empInfo->full_name; ?></td>
                    <td><?php echo Designations::model()->infoOfThis($empInfo->designation_id); ?></td>
                    <td><?php echo Departments::model()->nameOfThis($empInfo->department_id); ?></td>
                    <td><?php echo Sections::model()->nameOfThis($empInfo->section_id) . " / " . Teams::model()->infoOfThis($empInfo->team_id); ?></td>
                    <td><?php echo $empInfo->emp_id_no; ?></td>
                    <td><?php echo $empInfo->join_date; ?></td>
                    <td><?php echo TanimBanglaModule::outputBanglaInteger($countPresentDay); ?></td>
                    <td><?php echo TanimBanglaModule::outputBanglaInteger($actualAbsentDay); ?></td>
                    <?php
                    $earnAmountTotal = 0;
                    $deductionAmountTotal = 0;
                    $basicSalary = 0;
                    if ($countEarnArr > 0) {
                        for ($i = 0; $i < $countEarnArr; $i++) {
                            $dataEarningAmount = AhAmountProll::model()->findByAttributes(array('ah_proll_id' => $earnArray[$i], 'is_active' => AhAmountProll::ACTIVE));
                            if ($dataEarningAmount) {
                                if ($dataEarningAmount->earn_deduct_type == AhAmountProll::MONTHLY_BASIS) {
                                    $earnAmount = $dataEarningAmount->amount_adj;
                                } else {
                                    $earnAmount = $countPresentDay * $dataEarningAmount->amount_adj;
                                }

                                if ($earnArray[$i] == $basicSalaryId) {
                                    $basicSalary = $dataEarningAmount->amount_adj;
                                }
                            } else {
                                $earnAmount = 0;
                            }
                            $earnAmountTotal = $earnAmount + $earnAmountTotal;
                            ?>
                            <td><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($earnAmount), 2)); ?></td>
                            <?php
                        }
                    }
                    ?>
                    <td><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($earnAmountTotal), 2)); ?></td>
                    <td><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($presentBonus), 2)); ?></td>
                    <?php
                    $actualAbsentDeduction = ($basicSalary / $working_day) * $actualAbsentDay;
                    ?>
                    <td class="red"><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($actualAbsentDeduction), 2)); ?></td>
                    <td class="red"><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($totalLoant), 2)); ?></td>
                    <?php
                    if ($countDeductArr > 0) {
                        for ($i = 0; $i < $countDeductArr; $i++) {
                            $dataDeductionAmount = AhAmountProll::model()->findByAttributes(array('ah_proll_id' => $deductArray[$i], 'is_active' => AhAmountProll::ACTIVE));
                            if ($dataDeductionAmount) {
                                if ($dataDeductionAmount->earn_deduct_type == AhAmountProll::MONTHLY_BASIS) {
                                    $deductionAmount = $dataDeductionAmount->amount_adj;
                                } else {
                                    $earnAmount = $countPresentDay * $dataEarningAmount->amount_adj;
                                }
                            } else {
                                $deductionAmount = 0;
                            }
                            $deductionAmountTotal = $deductionAmount + $deductionAmountTotal;
                            ?>
                            <td class="red"><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($deductionAmount), 2)); ?></td>
                            <?php
                        }
                    }
                    ?>
                    <td>
                        <?php
                        $totalDeduction = $deductionAmountTotal + $totalLoant+ $actualAbsentDeduction;
                        $totalEarning=$earnAmountTotal + $presentBonus;
                        $totalSalary = ($totalEarning-$totalDeduction);
                        ?>
                        <?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($totalSalary), 2)); ?>
                    </td>
                    <td><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($otRate), 2)); ?></td>
                    <td><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($otTime), 2)); ?></td>
                    <td><?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($otSalary), 2)); ?></td>
                    <td>
                        <?php
                        $grossSalary = ($totalSalary + $otSalary);
                        ?>
                        <?php echo TanimBanglaModule::outputBanglaInteger(number_format(floatval($grossSalary), 2)); ?>
                    </td>
                    <td></td>
                </tr>
                <?php
            }
        }
        ?>
    </table>
    <?php }else{ echo $message."<br>"; } ?>
</div>
<style>
    table.reportTab{
    float: left;
    width: 100%;
    border-collapse: collapse;
    background-color: rgba(0, 0, 0, 0);
    color: #000000;
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