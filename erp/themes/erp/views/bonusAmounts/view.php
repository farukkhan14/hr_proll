<?php
    $bonusTitleInfo=BonusTitles::model()->findByPk($model->bonus_id);
?>
<table class="summaryTab">
    <tr>
        <td>Details</td>
        <td style="text-align: left;">
            <div class="receivedByDiv"><?php echo $bonusTitleInfo->title; ?></div>
            <pre><?php echo $bonusTitleInfo->details; ?></pre>
        </td>
    </tr>
    <tr>
        <td>Create By</td>
        <td style="text-align: left;"><?php echo Users::model()->fullNameOfThis($model->create_by); ?></td>
    </tr>
    <tr>
        <td>Create Time</td>
        <td style="text-align: left;"><?php echo $model->create_time; ?></td>
    </tr>
    <tr>
        <td>Update By</td>
        <td style="text-align: left;"><?php echo Users::model()->fullNameOfThis($model->update_by); ?></td>
    </tr>
    <tr>
        <td>Update Time</td>
        <td style="text-align: left;"><?php echo $model->update_time; ?></td>
    </tr>
</table>
