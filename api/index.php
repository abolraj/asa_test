<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Content-Type: application/json; charset=UTF-8");

if(!isset($_SERVER) || empty($_SERVER)){
    die(402);
}

// Handle routing
$uri = parse_url($_SERVER["REQUEST_URI"], PHP_URL_PATH);
$uri = trim($uri,"/");
$api_file_name = str_replace("/", "-", $uri) . ".php";
require_once($api_file_name);