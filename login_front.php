<?php
session_start();
// Handle CSRF 
if (!isset($_SESSION["csrf_token"]))
    $_SESSION["csrf_token"] = md5(time() . $_SERVER["HTTP_USER_AGENT"]);

?>
<form action="./login_backend.php" method="post">
    <label for="username">
        Username
    </label>
    <input type="text" id="username" name="username" placeholder="Username" />


    <label for="password">
        Password
    </label>
    <input type="text" id="password" name="password" placeholder="Passsword" />

    <!-- CSRF -->
    <input type="hidden" name="csrf_token" value="<?= $_SESSION['csrf_token'] ?? null ?>">

    <button>Submit</button>
</form>