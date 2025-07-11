<?php
// Report all errors during development
ini_set('display_errors', 1);
error_reporting(E_ALL);

// IMPORTANT: Set this to your frontend URL. Using a wildcard '*' with credentials is not allowed by browsers.
header("Access-Control-Allow-Origin: http://localhost:5173"); 
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Credentials: true");

// Handle preflight OPTIONS request (sent by browsers to check permissions)
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Start the session if it's not already started. This should be in every file that needs session access.
if (session_status() === PHP_SESSION_NONE) {
    // Set session cookie parameters before starting the session
    session_set_cookie_params([
        'lifetime' => 3600, // 1 hour
        'path' => '/',
        'domain' => 'localhost', // TODO: Change for production
        'secure' => false,       // TODO: Set to true for HTTPS in production
        'httponly' => true,
        'samesite' => 'Lax'
    ]);
    session_start();
}