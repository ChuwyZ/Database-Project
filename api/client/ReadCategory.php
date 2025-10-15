<?php
// ตั้งค่าหัวข้อ HTTP Response เพื่อรองรับ CORS
header("Access-Control-Allow-Origin: *"); // อนุญาตให้ทุก domain สามารถเข้าถึงได้
header("Content-Type: application/json; charset=UTF-8"); // กำหนด Content-Type เป็น JSON

// เชื่อมต่อฐานข้อมูล
include '../db.php'; 

$sql = "SELECT * FROM category"; // query

try {
    $categories = array(); // สร้าง array สำหรับเก็บข้อมูล

    // เรียกใช้ query และดึงข้อมูลจากฐานข้อมูล
    foreach ($conn->query($sql) as $row) {
        // สร้าง array สำหรับแต่ละ food item
        $category = array(
            'foodItemID' => $row['CategoryID'], 
            'foodName' => $row['CategoryName']
        );
        // เพิ่มข้อมูลลงใน array
        array_push($categories, $category);
    }

    // ส่งข้อมูลกลับไปในรูปแบบ JSON
    echo json_encode($categories);

    // ปิดการเชื่อมต่อฐานข้อมูล
    $conn = null;

} catch (PDOException $e) {
    echo json_encode(array(
        "status" => "error",
        "message" => "Error: " . $e->getMessage()
    ));
    die();
}
//test
?>