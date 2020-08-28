<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;



// Home
$app->get('/', function ($request, $response, $args) {
  // Managers
  $supportPackService = new \services\SupportPackService();

  return $this->view->render($response, 'index.html', [
    'title' => "",
    'roles' => $supportPackService->getRoles(),
    'stages' => $supportPackService->getStages(),
    'categories' => $supportPackService->getCategories(),
    'regions' => $supportPackService->getRegions(),
  ]);
})->setName('index');


// Guidelines
$app->get('/guidelines', function ($request, $response, $args) {
  // Managers
  $supportPackService = new \services\SupportPackService();

  return $this->view->render($response, 'guidelines.html', [
    'guidelines' => $supportPackService->getGuidelines(),
    'roles' => $supportPackService->getRoles(),
    'stages' => $supportPackService->getStages(),
    'categories' => $supportPackService->getCategories()
  ]);
})->setName('guidelines');

// Admin
$app->get('/admin', function ($request, $response, $args) {
  // Managers
  $supportPackService = new \services\SupportPackService();
  return $this->view->render($response, 'admin.html', [
    'guidelines' => $supportPackService->getGuidelines(),
    'roles' => $supportPackService->getRoles(),
    'stages' => $supportPackService->getStages(),
    'categories' => $supportPackService->getCategories()
  ]);
})->setName('admin');

// Request upload resource
$app->get('/upload-resource', function ($request, $response, $args) {
  // Managers
  $supportPackService = new \services\SupportPackService();
  return $this->view->render($response, 'upload-resource.html', [
    'guidelines' => $supportPackService->getGuidelines(),
    'roles' => $supportPackService->getRoles(),
    'stages' => $supportPackService->getStages(),
    'categories' => $supportPackService->getCategories()
  ]);
})->setName('admin');

// Render Twig template in route
$app->get('/stats', function ($request, $response, $args) {
  return $this->view->render($response, 'stats.html');
})->setName('stats');

// Widget
$app->get('/widget/main.js', function ($request, $response, $args) {

  $requestScheme = $this->get('environment')['REQUEST_SCHEME'];
  $httpHost = $this->get('environment')['HTTP_HOST'];
  $basePath = $request->getUri()->getBasePath();
  $baseOrigin = $requestScheme. "://". $httpHost;
  $baseURL = $baseOrigin . "" .$basePath;

  $this->view->render($response,  'widget.twig', [
    'sectionsJson' => json_encode($sections),
    'baseOrigin' => $baseOrigin,
    'baseURL' => $baseURL
  ]);

  return $response->withHeader('Content-type', 'text/javascript');
})->setName('widget');

/******************************* FUNCTIONS *******************************/

$function = new Twig_SimpleFunction('getImportanceLevel', function ($guidelineID, $stageID, $roleID) {
  return "G".$guidelineID."-S".$stageID."-R".$roleID;
});
$container->get('view')->getEnvironment()->addFunction($function);
