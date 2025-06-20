<?php
session_start(); // Start the session

function isLoggedIn() {
    return isset($_SESSION['name']);
}

function requireLogin() {
    if (!isLoggedIn()) {
        http_response_code(401);
        echo json_encode(['error' => 'Unauthorized: Login required']);
        exit;
    }
}

function getCurrentUserEmail() {
    return $_SESSION['email'] ?? null;
}
?>