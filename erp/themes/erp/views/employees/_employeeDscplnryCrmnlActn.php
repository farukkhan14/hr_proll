<fieldset>
    <legend>Disciplinary Actions/ Criminal Prosecutions</legend>
    <table>
        <tr>
            <td style="text-align: center;"><?php echo $form->labelEx($model, 'dscplnry_crmnl_actn'); ?></td>
        </tr>
        <tr>
            <td>
                <?php
                if($model->dscplnry_crmnl_actn){
                    
                }else{
                    $model->dscplnry_crmnl_actn='<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<th style="width: 128px; text-align: center; vertical-align: middle;"><strong>Nature of Offense</strong></th>
			<th style="width: 128px; text-align: center; vertical-align: middle;"><strong>Details</strong></th>
			<th style="width: 128px; text-align: center; vertical-align: middle;"><strong>Actions</strong></th>
			<th style="width: 128px; text-align: center; vertical-align: middle;"><strong>Date</strong></th>
			<th style="width: 128px; text-align: center; vertical-align: middle;"><strong>Last Update</strong></th>
		</tr>
		<tr>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
			<td style="width:128px">&nbsp;</td>
		</tr>
	</tbody>
</table>';
                }
                $this->widget('ext.editMe.widgets.ExtEditMe', array(
                    'model' => $model,
                    'attribute' => 'dscplnry_crmnl_actn',
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