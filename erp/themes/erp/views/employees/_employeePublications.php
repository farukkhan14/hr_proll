<fieldset>
    <legend>Publications</legend>
    <table>
        <tr>
            <td style="text-align: center;"><?php echo $form->labelEx($model, 'publications'); ?></td>
        </tr>
        <tr>
            <td>
                <?php
                if($model->publications){
                    
                }else{
                    $model->publications='<table border="1" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<th style="width: 128px; text-align: center; vertical-align: middle;"><strong>Title</strong></th>
			<th style="width: 128px; text-align: center; vertical-align: middle;"><strong>Subject</strong></th>
			<th style="width: 128px; text-align: center; vertical-align: middle;"><strong>Date</strong></th>
			<th style="width: 128px; text-align: center; vertical-align: middle;"><strong>Details</strong></th>
		</tr>
		<tr>
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
		</tr>
		<tr>
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
		</tr>
		<tr>
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
                    'attribute' => 'publications',
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