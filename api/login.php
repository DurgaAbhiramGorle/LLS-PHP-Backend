<?php
session_start();

require_once __DIR__ . '/connection.php';

ini_set('display_errors', 1);
error_reporting(E_ALL);

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST, OPTIONS");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}
 

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->email) || !isset($data->password)) {
    echo json_encode(["error" => "Email and Password are required"]);
    exit;
}

$email = trim($data->email);
$password = $data->password;

$stmt = $pdo->prepare("SELECT * FROM users WHERE email = ?");
$stmt->execute([$email]);
$user = $stmt->fetch();


if(!$user || !password_verify($password,$user['password'])){
    http_response_code(401);
    echo json_encode(['success' => false, 'message' => 'Invalid email or password']);
    exit;
}
// Store user information in the session
$_SESSION['email'] = $user['email'];
$_SESSION['name'] = $user['name'];

echo json_encode([
    "success" => true,
    "message" => "Login successful",
    "user" => [
        'email' => $user['email'],
        'name' => $user['name'],
    ]
    ]);
?>
