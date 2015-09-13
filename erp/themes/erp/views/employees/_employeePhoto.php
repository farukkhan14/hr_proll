<fieldset>
    <legend>Upload Employee Photo</legend>
    <?php echo $form->fileField($model, 'photo', array('size' => 10, 'onchange' => 'javascript:loadImageFile()')); ?>
    <div class="pic_panel" align="left">            
            <img id="uploadPreview" style="width: 128px; height: 128px;" src="<?php
        if ($model->photo) {
            echo Yii::app()->baseUrl . '/upload/empPhoto/' . $model->photo;
        } else {
            echo Yii::app()->theme->baseUrl . '/images/preview_img.png';
        }
        ?>" alt="Employee_Photo" />  
    </div>
    <?php echo $form->error($model, 'photo'); ?>
</fieldset>
<script>       
    oFReader = new FileReader(), rFilter = /^(?:image\/bmp|image\/cis\-cod|image\/gif|image\/ief|image\/jpeg|image\/jpeg|image\/jpeg|image\/pipeg|image\/png|image\/svg\+xml|image\/tiff|image\/x\-cmu\-raster|image\/x\-cmx|image\/x\-icon|image\/x\-portable\-anymap|image\/x\-portable\-bitmap|image\/x\-portable\-graymap|image\/x\-portable\-pixmap|image\/x\-rgb|image\/x\-xbitmap|image\/x\-xpixmap|image\/x\-xwindowdump)$/i;

    oFReader.onload = function (oFREvent) {
        document.getElementById("uploadPreview").src = oFREvent.target.result;
    };
            
    function loadImageFile() {
        // alert("haha");
        if (document.getElementById("Employees_photo").files.length === 0) { return; }
        var oFile = document.getElementById("Employees_photo").files[0];
        if (!rFilter.test(oFile.type)) {
            alert("You must select a valid image file!");
            $('#Employees_photo').val(''); 
            return; 
        }
        oFReader.readAsDataURL(oFile);
    }
</script>