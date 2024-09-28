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
    $username = filter_input(INPUT_POST, "username");
    $password = filter_input(INPUT_POST, "password");

    $hashPassword = md5($password);

    $q = $conn->query("SELECT * FROM `users` WHERE `username`='$username' AND `password`='$hashPassword'");
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
