<?php
require_once __DIR__ . '/api_init.php';
require_once __DIR__ . '/connection.php';


try {
    $sql = "SELECT
        cs.id AS section_id,
        cs.title AS activity_title,
        ROUND(COUNT(ua.id) / COUNT(DISTINCT ua.user_email), 2) AS avg_attempts
    FROM course_sections cs
    JOIN user_activity_attempts ua ON cs.id = ua.section_id
    WHERE ua.is_successful = 1
    GROUP BY cs.id, cs.title
    ORDER BY cs.id";

    $stmt = $pdo->query($sql);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    http_response_code(200);
    echo json_encode($result);
} catch (PDOException $e) {
    http_response_code(500);
    error_log("Error in get_avg_attempts.php: " . $e->getMessage());
    echo json_encode(['error' => 'Database error occurred']);
}
?>
