<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php'; 
//ใส่idให้ตรงกับที่จะเปลี่ยน
$id = 22;

$foodName = 'Coca Cola';
$price = 25.00;
$categoryID = 4; // categoryID: 1 = Appetizer, 2 = MainCourse, 3 = Dessert, 4 = Beverage

// ใช้ prepared statement เพื่อป้องกัน SQL injection
$sql = "UPDATE fooditem SET FoodName = ?, Price = ?, CategoryID = ? WHERE FoodItemID = ?";

// Prepare statement
$stmt = $conn->prepare($sql);

if ($stmt === false) {
    echo json_encode(["error" => "Error preparing statement: " . $conn->error]);
    exit();
}

// Bind parameters
$stmt->bind_param("sddi", $foodName, $price, $categoryID, $id);

if ($stmt->execute()) {
    echo json_encode(["message" => "Updated successfully"]);
} else {
    echo json_encode(["error" => "Error updating record: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>