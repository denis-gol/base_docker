<?php

use App\Application;

define ('ROOT_DIR', realpath(__DIR__.'/../'));

require_once ROOT_DIR . '/vendor/autoload.php';

$app = new Application();
$app->run();
