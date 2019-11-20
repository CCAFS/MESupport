<?php
use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../src/config/db.php';

// Loading services
require_once('../src/services/SupportPackService.php');


$settings = [
    'settings' => [
        // Slim Settings
        'determineRouteBeforeAppMiddleware' => false,
        'displayErrorDetails' => true,
    ],
];

$app = new \Slim\App($settings);

/******************************************************************************/
// Get container
$container = $app->getContainer();

// Register component on container
$container['view'] = function ($container) {
    $view = new \Slim\Views\Twig('views');

    // Instantiate and add Slim specific extension
    $basePath = rtrim(str_ireplace('index.php', '', $container['request']->getUri()->getBasePath()), '/');
    $view->addExtension(new Slim\Views\TwigExtension($container['router'], $basePath));

    return $view;
};

/******************************************************************************/

// Homepage
require '../src/routes/application.php';

// API Routes
require '../src/routes/api/guidelines.php';
require '../src/routes/api/person.php';
require '../src/routes/api/zipfile.php';

$app->run();
