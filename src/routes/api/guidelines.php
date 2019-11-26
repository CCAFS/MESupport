<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

//$app = new \Slim\App;

$app->options('/{routes:.+}', function ($request, $response, $args) {
    return $response;
});

$app->add(function ($req, $res, $next) {
    error_reporting( error_reporting() & ~E_NOTICE );
    $response = $next($req, $res);
    return $response
        ->withHeader('Access-Control-Allow-Origin', '*')
        ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
        ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
});

$app->get('/api/guidelinesLevels/{role}/{stage}/{category}', function(Request $request, Response $response){
    // Set JSON Header
    $response->withHeader('Content-Type', 'application/json');

    // Managers
    $supportPackService = new \services\SupportPackService();

    $r = $request->getAttribute('role');
    $s= $request->getAttribute('stage');
    $c= $request->getAttribute('category');

    //print_r($supportPackService->getGuidelinesByRoleStageCategory($r, $s, $c));
    echo json_encode($supportPackService->getGuidelinesByRoleStageCategory($r, $s, $c));
});


// Get level of importanceLevel
$app->get('/api/getImportanceLevel/{gID}/{sID}/{rID}', function(Request $request, Response $response){
    // Set JSON Header
    $response->withHeader('Content-Type', 'application/json');

    // Managers
    $supportPackService = new \services\SupportPackService();

    // Data
    $gId = $request->getAttribute('gID');
    $sId= $request->getAttribute('sID');
    $rId= $request->getAttribute('rID');

    echo json_encode($supportPackService->getImportanceLevel($gId, $sId, $rId));

});
