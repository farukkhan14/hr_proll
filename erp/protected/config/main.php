<?php
// Yii::setPathOfAlias('local','path/to/local-folder');
return array(
    'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
    'theme' => 'erp',
    'name' => 'HR & PAYROLL SYSTEM',
    'defaultController' => 'site',
// preloading 'log' component
    'preload' => array('log'),
// autoloading model and component classes
    'import' => array(
        'application.models.*',
        'application.components.*',
        'application.modules.rights.*',
        'application.modules.rights.components.*',
        'application.helpers.*',
        'application.modules.rights.models.*',
        'application.modules.TanimBangla.*',
    ),
    'modules' => array(
        'importcsv'=>array(
            'path'=>'upload/importCsv/', // path to folder for saving csv file and file with import params
        ),
        /*
        'gii' => array(
            'class' => 'system.gii.GiiModule',
            'password' => 'admin',
        ),
        */
        'rights' => array(
            'install' => FALSE,
// Enables the installer. 
        ),
        'cal'=>array('debug'=>FALSE),
    ),
// application components
    'components' => array(
        'ePdf' => array(
        'class'         => 'ext.yii-pdf.EYiiPdf',
        'params'        => array(
                'HTML2PDF' => array(
                    'librarySourcePath' => 'application.vendors.html2pdf.*',
                    'classFile'         => 'html2pdf.class.php', // For adding to Yii::$classMap
                    'defaultParams'     => array( // More info: http://wiki.spipu.net/doku.php?id=html2pdf:en:v4:accueil
                        'unicode'     => true, // TRUE means clustering the input text IS unicode (default = true)
                        'encoding'    => 'UTF-8', // charset encoding; Default is UTF-8
                    )
                )
            ),
        ),
        'image' => array(
            'class' => 'application.extensions.image.CImageComponent',
// GD or ImageMagick
            'driver' => 'GD',
// ImageMagick setup path
            'params' => array('directory' => '/opt/local/bin'),
        ),
        'cache' => array(
            'class' => 'CDbCache',
        ),
        'log' => array(
            'class' => 'CLogRouter',
            'routes' => array(
                array(
                    'class' => 'CFileLogRoute',
                    'levels' => 'error, warning',
                ),
            ),
        ),
        'user' => array(
            'allowAutoLogin' => true,
            'class' => 'RWebUser',
        ),
        'authManager' => array(
            'class' => 'RDbAuthManager',
        ),
        'urlManager' => array(
            'urlFormat' => 'path',
            'showScriptName'=>false,
            'rules' => array(
                '<controller:\w+>/<id:\d+>' => '<controller>/view',
                '<controller:\w+>/<action:\w+>/<id:\d+>' => '<controller>/<action>',
                '<controller:\w+>/<action:\w+>' => '<controller>/<action>',
            ),
        ),
        'db' => array(
            'class' => 'system.db.CDbConnection',
            'connectionString' => 'mysql:host=localhost;dbname=hrpdatabase',
            'emulatePrepare' => true,
            'username' => 'root',
            'password' => '',
            'charset' => 'utf8',
            'tablePrefix' => '',
            'schemaCachingDuration' => 0,
        ),
        'errorHandler' => array(
// use 'site/error' action to display errors
            'errorAction' => 'site/error',
        ),
        'log' => array(
            'class' => 'CLogRouter',
            'routes' => array(
                array(
                    'class' => 'CFileLogRoute',
                    'levels' => 'error, warning',
                ),
// uncomment the following to show log messages on web pages
            /*
              array(
              'class'=>'CWebLogRoute',
              ),
             */
            ),
        ),
    ),
    /* 'controllerMap'=>array(
      'node'=>array(
      'class'=>'application.controllers.CareerController.php',
      ),
      ), */
    'params' => array(
// this is used in contact page
        'dbName'=>'hrpdatabase',
        'servername'=>'localhost',
        'serverhost'=>'localhost',
        'adminEmail' => 'sayiful@gmail.com',
        'copyrightBy'=>'2014',
        'developedBy'=>'',
        'developedByUrl'=>'http://www.issit.org',
    ),
);