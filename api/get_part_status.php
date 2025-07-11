<?php
require_once __DIR__ . '/api_init.php';
require_once __DIR__ . '/session_auth.php'; // session authentication
require_once __DIR__ . '/connection.php';

$email = getCurrentUserEmail();

$sql = "SELECT up.*  FROM user_part_status up 
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
