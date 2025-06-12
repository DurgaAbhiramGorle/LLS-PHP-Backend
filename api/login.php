<?php
require 'vendor/autoload.php';
require_once __DIR__ . '/config.php';
require_once __DIR__ . '/connection.php';

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

ini_set('display_errors', 1);
error_reporting(E_ALL);

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST, OPTIONS");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit;
}
 
// include_once("connection.php");

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

$issuedAt = time();
$expirationTime = $issuedAt + 60*60*24; 
$payload = [
    'email' => $user['email'],
    'iat' => $issuedAt,
    'exp' => $expirationTime,
    'name' => $user['name'],
];
$jwt = JWT::encode($payload, JWT_SECRET, 'HS256');
echo json_encode([
    "success" => true,
    "message" => "Login successful",
    "token" => $jwt,
    "user" => [
        'email' => $user['email'],
        'name' => $user['name'],
        // Add any other fields you want to return
    ]
    ]);


// if ($user && password_verify($password, $user['password'])) {
//     $userDataToSend = [
//         'email' => $user['email'],
//         'name' => $user['name'],
//         'relationToPatient' => $user['relation_to_patient'], 
//         'location' => $user['location']
//         // Add any other fields 
//     ];
//     echo json_encode(["success" => True, "user" => $userDataToSend]);
//     $updt = $pdo->prepare("UPDATE users SET last_logged_in = NOW() WHERE email = ?");
//     $updt->execute([$email]);
// } else {
//     echo json_encode(["success" => False,"message" => "Invalid credentials"]);
// } 
