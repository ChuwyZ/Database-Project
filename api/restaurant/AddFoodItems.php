<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php'; 

$foodName = 'Mashed Potatoe';
$price = 59.00;
$categoryID = 1;

//ใช้ prepared statement เพื่อป้องกัน SQL Injection
$sql = "INSERT INTO fooditem (FoodName, Price, CategoryID) 
        VALUES (?, ?, ?)";

// เตรียมคำสั่ง SQL
$stmt = $conn->prepare($sql);

// ตรวจสอบว่าเตรียมคำสั่ง SQL ได้หรือไม่
if ($stmt === false) {
    echo json_encode(["error" => "Error preparing statement: " . $conn->error]);
    exit();
}

//ใช้ bind parameter
$stmt->bind_param("sdd", $foodName, $price, $categoryID);

// รันคำสั่ง SQL
if ($stmt->execute()) {
    echo json_encode(["message" => "New record created successfully"]);
} else {
    echo json_encode(["error" => "Error inserting record: " . $stmt->error]);
}

// ปิด statement และการเชื่อมต่อ
$stmt->close();
$conn->close();
?>