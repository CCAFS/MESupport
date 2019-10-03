<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;


$app->add(function ($req, $res, $next) {
	$response = $next($req, $res);
	return $response
	->withHeader('Access-Control-Allow-Origin', '*')
	->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
	->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
});

$app->POST("/api/zipfile", function(Request $request, Response $response){
	$files = array();

	$files = $_POST['files'];
	$overwrite = $_POST['overwrite'];
	try {
		zipFiles($files, $overwrite);
	} catch (Exception $e) {
		echo 'Exception: ',  $e->getMessage(), "\n";
	}
});

$app->GET("/api/zipfile/deleteFile", function(Request $request, Response $response){
	$folder = 'export';
	try {
		$file = getcwd().DIRECTORY_SEPARATOR.$folder.DIRECTORY_SEPARATOR.$_GET['file'];
		if (!unlink($file)){
		  echo ("Error deleting $file");
		}else{
		  echo ("Deleted $file");
		}
	} catch (Exception $e) {
		echo 'Excepción capturada: ',  $e->getMessage(), "\n";
	}
});


/*******************  Functions *************************************/

function zipFiles($files = array(), $overwrite = true) {
	$date = date("Ymd").date("_His");
	$folder = 'export';
	$zipName = $folder.'/guidelinesDocuments_'.$date.'.zip';


	if (!file_exists($folder)) {
    	mkdir($folder, 0777, true);
	}

	//vars
	$valid_files = array();
	// If files were passed in...
	if(is_array($files)) {
		//cycle through each file
		foreach($files as $file) {
			// Make sure the file exists
			$file = str_replace(' ', '_', $file);
			$file = str_replace('\\', '/', $file);
			$file = getcwd().DIRECTORY_SEPARATOR.$file;

			//echo "<p>".$file."</p>";

			if(file_exists($file)) {
				$valid_files[] = $file;
			}else{
				echo "File does not exist - > ".$file;
			}
		}
	}
	// If we have good files...
	if(count($valid_files)) {
		// Create the archive
		$zip = new ZipArchive();
		$createZip = $zip->open(getcwd().DIRECTORY_SEPARATOR.$zipName, ZIPARCHIVE::CREATE);
		if($createZip !==true) {
			echo "File not created: ".$createZip;
			return false;
		}

		// Add files
		for($i=0;$i<count($valid_files); $i++){
			$localfile = basename($valid_files[$i]);
			//echo "<p>".$valid_files[$i]. "</p>";
			if($zip->addFile("$valid_files[$i]", $localfile) !==true) {
				echo "No file added ->".$localfile;
			}
		}
		$zip->close();

		if(file_exists(getcwd().DIRECTORY_SEPARATOR.$zipName)){
			echo $zipName;
		}else{
			echo "File not found -> ".getcwd().DIRECTORY_SEPARATOR.$zipName;
			return false;
		}

	}else{
		echo "No valid files";
		return false;
	}
}