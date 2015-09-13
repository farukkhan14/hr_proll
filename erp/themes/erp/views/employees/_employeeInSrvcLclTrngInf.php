<fieldset>
    <legend>In Service Local Training Informations</legend>
    <table>
        <tr>
            <td style="text-align: center;"><?php echo $form->labelEx($model, 'in_srvc_lcl_trng_inf'); ?></td>
        </tr>
        <tr>
            <td>
                <?php
                if($model->in_srvc_lcl_trng_inf){
                    
                }else{
                    $model->in_srvc_lcl_trng_inf='<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>Title</strong></th>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>Institution</strong></th>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>From Date</strong></th>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>To Date</strong></th>
			<th style="width: 106px; text-align: center; vertical-align: middle;"><strong>Grade&amp;Position</strong></th>
		</tr>
		<tr>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:109px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:109px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:109px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:109px">&nbsp;</td>
		</tr>
		<tr>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:106px">&nbsp;</td>
			<td style="width:109px">&nbsp;</td>
		</tr>
	</tbody>
</table>';
                }
                $this->widget('ext.editMe.widgets.ExtEditMe', array(
                    'model' => $model,
                    'attribute' => 'in_srvc_lcl_trng_inf',
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