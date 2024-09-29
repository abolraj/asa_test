<?php
if($_SERVER["REQUEST_METHOD"] !== "POST"){
    echo json_encode([
        "message" => "The request method not allowed !",
        "is_success" => false,
    ]);
    http_response_code(403);
    die();
}

// Connect to DB
$conn = mysqli_connect("127.0.0.1:3306", "root", 123456, "asa_db");

if($conn->connect_errno){
    echo json_encode([
        "message" => "Fatall !",
        "is_success" => false,
    ]);
    http_response_code(500);
    die();
}

$username = filter_input(INPUT_POST, "username");
$password = filter_input(INPUT_POST, "password");

// Sanitize slashes to prevent XSS injection
$username = filter_var($username, FILTER_SANITIZE_ADD_SLASHES);
$password = filter_var($password, FILTER_SANITIZE_ADD_SLASHES);

$stmt = $conn->prepare("SELECT * FROM `users` WHERE `username` = ?");
$stmt->bind_param("s", $username);
$stmt->execute();
$q = $stmt->get_result();
$user = $q->fetch_assoc();

if($user){
    if($user["password"] === $password){
        // Logined
        echo json_encode([
            "user" => $user,
            "is_success" => true,
        ]);
        http_response_code(200);
        die();
    }else{
        // Password is incorrect
        echo json_encode([
            "message" => "The password is incorrect !",
            "is_success" => false,
        ]);
        http_response_code(404);
        die();
    }
}else{
    echo json_encode([
        "message" => "The username is incorrect !",
        "is_success" => false,
    ]);
    http_response_code(404);
    die();
}
