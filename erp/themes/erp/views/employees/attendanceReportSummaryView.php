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
    <table class="reportTab">
        <tr>
            <th style="width: 200px;">Section</th>
            <th>
        <table class="reportTab">
            <tr>
                <th style="width: 100px; border-bottom: none; border-left: none; border-top: none;" rowspan="2">Line</th>
                <th style="width: 200px; border-bottom: none; border-left: none; border-top: none;" rowspan="2">Type Of Employee</th>
                <th style="width: 200px; border-bottom: none; border-left: none; border-top: none;" rowspan="2">Approved Strength</th>
                <th colspan="3" style="border-top: none;">Status</th>
                <th colspan="2" style="border-top: none; border-right: none;">Remarks</th>
            </tr>
            <tr>
                <th style="width: 70px; padding: 10px 0px; border-bottom: none; border-left: none;">Existing</th>
                <th style="width: 70px; border-bottom: none; border-left: none;">Present</th>
                <th style="width: 70px; border-bottom: none; border-left: none;">Absent</th>
                <th style="width: 200px; border-bottom: none; border-left: none;">Plus (+)</th>
                <th style="width: 200px; border-bottom: none; border-left: none; border-right: none;">Short (-)</th>
            </tr>
        </table>
        </th>
        </tr>
        <?php
        $sectionData = Sections::model()->findAll();
        if ($sectionData) {
            foreach ($sectionData as $sd):
                ?>
                <tr>
                    <td><?php echo $sd->title; ?></td>
                    <td>
                        <?php
                        $conditionLine = "section_id=" . $sd->id . " AND team_id!='' GROUP BY team_id";
                        $lineEmp = Employees::model()->findAll(array('condition' => $conditionLine), 'id');
                        if ($lineEmp) {
                            $j=1;
                            foreach ($lineEmp as $le):
                                ?>
                                <table class="reportTab">
                                    <tr>
                                        <td style="width: 100px; border-bottom: none; border-left: none; <?php if($j==1) echo "border-top: none;"; ?>">
                                            <?php echo Teams::model()->infoOfThis($le->team_id); ?>
                                        </td>
                                        <td style="border-bottom: none; border-left: none; border-right: none; <?php if($j==1) echo "border-top: none;"; ?>">
                                            <?php
                                            $conditionDesignation = "section_id=" . $sd->id . " AND team_id=" . $le->team_id . " GROUP BY designation_id";
                                            $designationEmp = Employees::model()->findAll(array('condition' => $conditionDesignation), 'id');
                                            if ($designationEmp) {
                                                $i=1;
                                                foreach ($designationEmp as $de):
                                                    $designationArray[] = $de->designation_id;
                                                    ?>
                                                    <table class="reportTab">
                                                        <tr>
                                                            <td style="width: 197px; text-align: left; padding-left: 4px; border-bottom: none; border-left: none; <?php if($i==1) echo "border-top: none;"; ?>"><?php echo Designations::model()->infoOfThis($de->designation_id); ?></td>
                                                            <?php
                                                            $conditionEmpCount = "section_id=" . $sd->id . " AND team_id=" . $le->team_id . " AND designation_id=" . $de->designation_id;
                                                            $dataEmpCount = Employees::model()->findAll(array('condition' => $conditionEmpCount), 'id');
                                                            $empPCardNos = array();
                                                            if ($dataEmpCount) {
                                                                foreach ($dataEmpCount as $dec):
                                                                    $empPCardNos[] = $dec->id_no;
                                                                endforeach;

                                                                $criteria = new CDbCriteria();
                                                                $criteria->condition = "date='" . $startDate . "'";
                                                                $criteria->addInCondition('card_no', $empPCardNos);
                                                                $empAttnd = EmpAttendance::model()->findAll($criteria);

                                                                $existing = count($dataEmpCount);
                                                                $present = count($empAttnd);
                                                                $absent = $existing - $present;
                                                            }
                                                            ?>
                                                            <td style="width: 200px; border-bottom: none; <?php if($i==1) echo "border-top: none;"; ?>"></td>
                                                            <td style="width: 70px; padding: 10px 0px; border-bottom: none; <?php if($i==1) echo "border-top: none;"; ?>">
                                                                <?php echo $existing; ?>
                                                            </td>
                                                            <td style="width: 70px; border-bottom: none; <?php if($i==1) echo "border-top: none;"; ?>">
                                                                <?php echo $present; ?>
                                                            </td>
                                                            <td style="width: 70px; border-bottom: none; <?php if($i==1) echo "border-top: none;"; ?>">
                                                                <?php echo $absent; ?>
                                                            </td>
                                                            <td style="width: 200px; border-bottom: none; <?php if($i==1) echo "border-top: none;"; ?>"></td>
                                                            <td style="width: 200px; border-bottom: none; border-right: none; <?php if($i==1) echo "border-top: none;"; ?>"></td>
                                                        </tr>
                                                    </table>
                                                    <?php
                                                    $i++;
                                                endforeach;
                                            }
                                            ?>
                                        </td>
                                    </tr>
                                </table>
                                <?php
                                $j++;
                            endforeach;
                        }
                        ?>
                    </td>
                </tr>
                <?php
            endforeach;
        }
        ?>
    </table>
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
    table.reportTab, table.reportTab tr{
        border: none;
    }
    table.reportTab tr td,table.reportTab tr th{
        padding: 0px;
    }
</style>