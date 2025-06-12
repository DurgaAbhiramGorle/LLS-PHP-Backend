<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Access-Control-Allow-Credentials: true");

// Handle preflight OPTIONS request
if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

require_once __DIR__ . '/jwt_auth.php';
require_once __DIR__ . '/connection.php';

// Authenticate and get user info from JWT
$decoded = authenticateJWT();

// Use email from JWT
$email = $decoded->email;

$sql = "SELECT up.*, cs.section_code, cs.title, cs.part_id FROM user_progress up 
        JOIN course_sections cs ON up.section_id = cs.id 
        WHERE up.user_email = ?";
$stmt = $pdo->prepare($sql);
$stmt->bindValue(1, $email, PDO::PARAM_STR);
$stmt->execute();
$result = $stmt->fetchAll(PDO::FETCH_ASSOC);

$progress = [];
foreach($result as $row) {
    $progress[] = $row;
}

echo json_encode($progress);
?>
