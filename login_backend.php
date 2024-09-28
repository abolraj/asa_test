<?php
session_start();

// Handle CSRF 
if(!isset($_SESSION["csrf_token"]))
    $_SESSION["csrf_token"] = md5(time().$_SERVER["HTTP_USER_AGENT"]);

// Connect to DB
$conn = mysqli_connect("127.0.0.1:3306", "root", 123456, "asa_db");

if($conn->connect_errno){
    echo "Error to connect to DB";
}

// Handle the request from client
if(isset($_SERVER["REQUEST_METHOD"]) && $_SERVER["REQUEST_METHOD"] === "POST"){

    // Handle CSRF
    $csrf_token = filter_input(INPUT_POST, "csrf_token");
    if($_SESSION["csrf_token"]!==$csrf_token){
        echo "You are not allowed!";
        header("Location:".$_SERVER["HTTP_REFERER"],true,400);
    }


    $username = filter_input(INPUT_POST, "username");
    $password = filter_input(INPUT_POST, "password");

    // Sanitize slashes to prevent XSS injection
    $username = filter_var($username, FILTER_SANITIZE_ADD_SLASHES);
    $password = filter_var($password, FILTER_SANITIZE_ADD_SLASHES);

    $hashPassword = md5($password);

    $stmt = $conn->prepare("SELECT * FROM `users` WHERE `username` = ? AND `password` = ?");
    $stmt->bind_param("ss", $username, $password);
    $stmt->execute();
    $q = $stmt->get_result();
    $user = $q->fetch_assoc();
    if($user){
        // var_dump($user);
        echo "Welcome Dear. " . $user["name"];
    }else{
        echo "The credentails do not match !";
    }


    // Comeback to preferer
    // header("Location:".$_SERVER["HTTP_REFERER"]);
}
