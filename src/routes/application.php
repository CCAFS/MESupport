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

// Render Twig template in route
$app->get('/stats', function ($request, $response, $args) {
  return $this->view->render($response, 'stats.html');
})->setName('stats');


/******************************* FUNCTIONS *******************************/

$function = new Twig_SimpleFunction('getImportanceLevel', function ($guidelineID, $stageID, $roleID) {
  return "G".$guidelineID."-S".$stageID."-R".$roleID;
});
$container->get('view')->getEnvironment()->addFunction($function);

?>
