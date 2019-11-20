<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

$app->add(function ($req, $res, $next) {
    $response = $next($req, $res);
    return $response
            ->withHeader('Access-Control-Allow-Origin', '*')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, OPTIONS');
            //->withHeader('Content-Type', 'application/json');
});

// Get Single person by email
$app->get('/api/getPersonInfo/{email}', function(Request $request, Response $response){
    // Set JSON Header
    $response->withHeader('Content-Type', 'application/json');
    // Managers
    $supportPackService = new \services\SupportPackService();

    $email = $request->getAttribute('email');
    echo json_encode($supportPackService->getPersonInfo($email));
});

// Set download
$app->post('/api/setDownload', function(Request $request, Response $response){
    // Managers
    $supportPackService = new \services\SupportPackService();

    // Set JSON Header
    $response->withHeader('Content-Type', 'application/json');

    $data = $request->getParsedBody();
    // Messages
    $messages = array();
    // Data
    $userId = $data['userId'];
    $first_name = $data['firstName'];
    $last_name =  $data['lastName'];
    $email = $data['email'];
    $instituteName = $data['instituteName'];
    $use = $data['use'];
    $guideSelected = $data['guideSelected'];
    $instituteRegions = $data['instituteRegions'];
    $researchRegions = $data['researchRegions'];

    // Set userId if does not exists
    if($userId == ""){
      if(($first_name != "") && ($last_name != "") && ($email != "")){
        $userId = $supportPackService->createPerson($first_name, $last_name, $email);
      }
    }

    // Set Download
    $downloadId = $supportPackService->setDownload($userId, $instituteName, $use);

    // Set Guidelines downloaded
    foreach ($guideSelected as $guideId) {
      $supportPackService->setDownloadedGuideline($downloadId, $guideId);
    }

    // Set region(s) where your institute is located download
    foreach ($instituteRegions as $regionId) {
      $supportPackService->setDownloadedRegion($downloadId, $regionId, "instituteRegion");
    }

    // Set region(s) of your research interest download
    foreach ($researchRegions as $regionId) {
      $supportPackService->setDownloadedRegion($downloadId, $regionId, "researchRegion");
    }

});
