<?php
  
function isLoggedIn() {
    // Check for the email or name you set during login [10]
    return isset($_SESSION['email']); 
}
  
function requireLogin() {
    if (!isLoggedIn()) {
        http_response_code(401);
        header('Content-Type: application/json');
        echo json_encode(['error' => 'Unauthorized: Login required']);
        exit;
    }
}
  
function getCurrentUserEmail() {
    return $_SESSION['email'] ?? null;
}
?>