<?php
session_start();

// Handle the request from client
if (isset($_SERVER["REQUEST_METHOD"]) && $_SERVER["REQUEST_METHOD"] === "POST") {

    // Handle CSRF
    $csrf_token = filter_input(INPUT_POST, "csrf_token");
    if ($_SESSION["csrf_token"] !== $csrf_token) {
        echo "You are not allowed!";
        header("Location:" . $_SERVER["HTTP_REFERER"], true, 400);
    }

    $username = filter_input(INPUT_POST, "username");
    $password = filter_input(INPUT_POST, "password");

    // Sanitize slashes to prevent XSS injection
    $username = filter_var($username, FILTER_SANITIZE_ADD_SLASHES);
    $password = filter_var($password, FILTER_SANITIZE_ADD_SLASHES);

    $hashPassword = md5($password);

    // Request to users api to login

    $post_data = [
        "username" => $username,
        "password" => $hashPassword,
    ];

    var_dump(request_post("http://127.0.0.1:8008/users", $post_data));

    // Comeback to preferer
    // header("Location:".$_SERVER["HTTP_REFERER"]);
}

function request_post($url, $data)
{
    $curl = curl_init($url);
    curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
    $response = curl_exec($curl);
    curl_close($curl);

    return $response;
}
