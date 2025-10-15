<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php'; 
// ใส่ ID ที่ต้องการลบ
$id = 21;

// prepared statement
$sql = "DELETE FROM fooditem WHERE FoodItemID = ?";

$stmt = $conn->prepare($sql);

if ($stmt === false) {
    echo json_encode(["error" => "Error preparing statement: " . $conn->error]);
    exit();
}

// Binding parameter
$stmt->bind_param("i", $id);  

if ($stmt->execute()) {
    echo json_encode(["message" => "Deleted successfully"]);
} else {
    echo json_encode(["error" => "Error deleting record: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
