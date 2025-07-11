<?php
require_once __DIR__ . '/api_init.php';

$_SESSION = array();

// Destroy the session
session_destroy();

// Clear the session cookie
$params = session_get_cookie_params();
setcookie(session_name(), '', time() - 42000,
    $params["path"], $params["domain"],
    $params["secure"], $params["httponly"]
);

echo json_encode(["success" => true, "message" => "Logged out successfully"]);
?>