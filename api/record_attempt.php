<?php
require_once __DIR__ . '/api_init.php';
require_once __DIR__ . '/session_auth.php'; // session authentication
require_once __DIR__ . '/connection.php';


$input = json_decode(file_get_contents('php://input'), true);
if (!$input || !isset($input['email'],$input['section_code'], $input['is_successful'])) {
    http_response_code(400);
    echo json_encode(["error" => "Missing section_code or is_successful"]);
    exit();
}
$email = $input['email'] ?? getCurrentUserEmail();
$section_code = $input['section_code'];
$is_successful = $input['is_successful'] ;

// Get current attempt count for this user and section
$stmt = $pdo->prepare("SELECT COUNT(*) FROM user_activity_attempts WHERE user_email = ? AND section_id = ?");
$stmt->bindValue(1, $email, PDO::PARAM_STR);
$stmt->bindValue(2, $section_code, PDO::PARAM_STR);
$stmt->execute();
$attempt_number = $stmt->fetchColumn() + 1;

// Insert new attempt
$stmt = $pdo->prepare("INSERT INTO user_activity_attempts (user_email, section_id, attempt_number, is_successful) VALUES (?, ?, ?, ?)");
$stmt->bindValue(1, $email, PDO::PARAM_STR);
$stmt->bindValue(2, $section_code, PDO::PARAM_STR);
$stmt->bindValue(3, $attempt_number, PDO::PARAM_STR);
$stmt->bindValue(4, $is_successful, PDO::PARAM_STR);
$stmt->execute();

echo json_encode(['success' => true, 'attempt_number' => $attempt_number]);
?>
