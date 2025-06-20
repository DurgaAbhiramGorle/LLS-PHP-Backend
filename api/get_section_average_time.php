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
require_once __DIR__ . '/session_auth.php'; // session authentication


require_once __DIR__ . '/connection.php';

try {
    // SQL query to calculate the average time difference in seconds
    // between 'completed_at' and 'started_at' for each section_id.
    // It only considers entries where 'is_completed' is true (or 1)
    // and 'completed_at' is not NULL.
    $sql = "SELECT 
                section_id, 
                AVG(TIMESTAMPDIFF(SECOND, started_at, completed_at)) as average_time_seconds
            FROM 
                user_progress
            WHERE 
                is_completed = 1 AND completed_at IS NOT NULL
            GROUP BY 
                section_id
            ORDER BY 
                section_id ASC";

    $stmt = $pdo->prepare($sql);
    $stmt->execute();
    $results = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Ensure average_time_seconds is a number (float) for the chart
    $formattedResults = array_map(function($row) {
        return [
            'section_id' => $row['section_id'], // section_id is likely an INT, JSON will handle it.
            'average_time_seconds' => round((float)$row['average_time_seconds'], 2) // Cast to float and round
        ];
    }, $results);

    http_response_code(200); // OK
    echo json_encode($formattedResults);

} catch (PDOException $e) {
    http_response_code(500); // Internal Server Error
    error_log("API PDOException in get_section_average_time.php: " . $e->getMessage());
    echo json_encode(["error" => "An error occurred while fetching section statistics: " . $e->getMessage()]);
} catch (Exception $e) {
    http_response_code(500); // Internal Server Error
    error_log("API Exception in get_section_average_time.php: " . $e->getMessage());
    echo json_encode(["error" => "An unexpected error occurred: " . $e->getMessage()]);
}


?>




