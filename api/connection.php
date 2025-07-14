<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);
  $host = 'db';
  $db   = getenv('DB_NAME');
  $user = getenv('DB_USER');
  $pass = getenv('DB_PASS'); 
  $charset = 'utf8mb4';
  $instanceUnixSocket = getenv('INSTANCE_UNIX_SOCKET') ;
  
  $dsn = sprintf('mysql:dbname=%s;unix_socket=%s',$db,$instanceUnixSocket);
  $options = [
      PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
  ];
  
  try {
      $pdo = new PDO($dsn, $user, $pass, $options);
  } catch (PDOException $e) {
      http_response_code(500);
      echo json_encode(['error' => 'Database connection failed', 'details' => $e->getMessage()]);
      exit;
  }
  
