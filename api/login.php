<?php
require_once __DIR__ . '/api_init.php'; 
require_once __DIR__ . '/connection.php';
 

$data = json_decode(file_get_contents("php://input"));

if (!isset($data->email) || !isset($data->password)) {
    http_response_code(400);
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
