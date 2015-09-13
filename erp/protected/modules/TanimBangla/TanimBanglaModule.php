<?php

class TanimBanglaModule extends CWebModule
{
	public function init()
	{
		// this method is called when the module is being created
		// you may place code here to customize the module or the application

		// import the module-level models and components
		$this->setImport(array(
			'TanimBangla.models.*',
			'TanimBangla.components.*',
		));
	}

	public function beforeControllerAction($controller, $action)
	{
		if(parent::beforeControllerAction($controller, $action))
		{
			// this method is called before any module controller action is performed
			// you may place customized code here
			return true;
		}
		else
			return false;
	}
        
       public static function inputBanglaInteger($model) {
        $var = array();
        $var = $model->attributes;
        $array = array("১" => "1", "২" => "2", "৩" => "3", "৪" => "4", "৫" => "5", "৬" => "6", "৭" => "7", "৮" => "8", "৯" => "9", "০" => "0");
        foreach ($array as $key => $value):
            $var = str_replace("$key", "$value", $var);
        endforeach;

        foreach ($var as $v):
            $model->attributes = $var;
        endforeach;
    }
    
    public static function outputBanglaInteger($data) {
        $var = array();
        $resultVar=array();
        $var = $data;
        
        $array = array("1" => "১", "2" => "২", "3" => "৩", "4" => "৪", "5" => "৫", "6" => "৬", "7" => "৭", "8" => "৮", "9" => "৯", "0" => "০", "am"=>"সকাল", "pm"=>"বিকাল");
        foreach ($array as $key => $value):
            $var = str_replace("$key", "$value", $var);
        endforeach;

        return $var;

    }
    
     public static function filterBanglaInteger($model) {
        $var = array();
        $var = $model->attributes;
        $array = array("১" => "1", "২" => "2", "৩" => "3", "৪" => "4", "৫" => "5", "৬" => "6", "৭" => "7", "৮" => "8", "৯" => "9", "০" => "0");
        foreach ($array as $key => $value):
            $var = str_replace("$key", "$value", $var);
        endforeach;

        foreach ($var as $v):
            $model->attributes = $var;
        endforeach;

    }
    
     public static function forUpdateBanglaInteger($model) {
        $var = array();
        $rr=array();
        $var = $model->attributes;
       
        $array = array(
            "1" => "১", "2" => "২", "3" => "৩", "4" => "৪", "5" => "৫", "6" => "৬", "7" => "৭", "8" => "৮", "9" => "৯", "0" => "০", "am"=>"সকাল", "pm"=>"বিকাল",
            
            );
        foreach ($array as $key => $value):
            $var = str_replace("$key", "$value", $var);
        endforeach;

        foreach ($var as $v):
           $model->attributes = $var;
        endforeach;
       
        

    }
    
    
     public static function exceptionBanglaInteger($data) {
        $var = array();
        $resultVar=array();
        $var = $data;
        
        
        $array = array("১" => "1", "২" => "2", "৩" => "3", "৪" => "4", "৫" => "5", "৬" => "6", "৭" => "7", "৮" => "8", "৯" => "9", "০" => "0");
        foreach ($array as $key => $value):
            $var = str_replace("$key", "$value", $var);
        endforeach;

        return $var;

    }
    
 
        
}
