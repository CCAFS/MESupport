<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

// Render Twig template in route
$app->get('/', function ($request, $response, $args) {

  $regions = array();
  $roles = array();
  $stages = array();
  $categories = array();
  try{
      // Get DB Object
      $db = new db();
      // Connect
      $db = $db->connect();

      // Get Roles
      $stmt = $db->query("SELECT * FROM mesp_roles");
      $roles = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Stages
      $stmt = $db->query("SELECT * FROM mesp_stages");
      $stages = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Categories
      $stmt = $db->query("SELECT * FROM mesp_categories");
      $categories = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Regions
      $stmt = $db->query("SELECT * FROM mesp_regions");
      $regions = $stmt->fetchAll(PDO::FETCH_OBJ);

      $db = null;
  } catch(PDOException $e){
      echo '{"error": {"text": '.$e->getMessage().'}';
  }

  return $this->view->render($response, 'index.html', [
    'title' => "",
    'roles' => $roles,
    'stages' => $stages,
    'categories' => $categories,
    'regions' => $regions,
  ]);
})->setName('index');


// Render Twig template in route
$app->get('/guidelines', function ($request, $response, $args) {
  try{
      // Get DB Object
      $db = new db();
      // Connect
      $db = $db->connect();
      // Get Roles
      $stmt = $db->query("SELECT * FROM mesp_roles");
      $roles = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Stages
      $stmt = $db->query("SELECT * FROM mesp_stages");
      $stages = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Categories
      $stmt = $db->query("SELECT * FROM mesp_categories");
      $categories = $stmt->fetchAll(PDO::FETCH_OBJ);
      // Get Guidelines
      $stmt = $db->query("SELECT * FROM mesp_guidelines ORDER BY code");
      $guidelines = $stmt->fetchAll(PDO::FETCH_OBJ);


      $db = null;
  } catch(PDOException $e){
      echo '{"error": {"text": '.$e->getMessage().'}';
  }
  return $this->view->render($response, 'guidelines.html', [
    'guidelines' => $guidelines,
    'roles' => $roles,
    'stages' => $stages,
    'categories' => $categories
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