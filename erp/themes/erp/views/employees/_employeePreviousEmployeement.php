<fieldset>
    <legend>Previous Employment</legend>
    <table>
        <tr>
            <td style="text-align: center;"><?php echo $form->labelEx($model, 'prev_info'); ?></td>
        </tr>
        <tr>
            <td>
                <?php
                if($model->prev_info){
                    
                }else{
                    $model->prev_info='<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>Employer</strong></th>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>Address</strong></th>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>Position</strong></th>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>Type Of Service</strong></th>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>From Date</strong></th>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>To Date</strong></th>
		</tr>
		<tr>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
		</tr>
	</tbody>
</table>';
                }
                $this->widget('ext.editMe.widgets.ExtEditMe', array(
                    'model' => $model,
                    'attribute' => 'prev_info',
                    'width' => '1200',
                    'height' => '426',
                    'resizeMode' => false,
                    'toolbar' => array(
                        array(
                            'PasteFromWord'
                        ),
                        array(
                            'Bold', 'Italic', 'Underline'
                        ),
                        array(
                            'NumberedList', 'BulletedList'
                        ),
                        array(
                            'Table',
                        ),
                    ),
                ));
                ?>
            </td>
        </tr>
    </table>
</fieldset>