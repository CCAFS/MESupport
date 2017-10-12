<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

// Render Twig template in route
$app->get('/', function ($request, $response, $args) {


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

      $db = null;
  } catch(PDOException $e){
      echo '{"error": {"text": '.$e->getMessage().'}';
  }

  return $this->view->render($response, 'index.html', [
    'title' => "",
    'roles' => $roles,
    'stages' => $stages,
    'categories' => $categories
  ]);
})->setName('index');
