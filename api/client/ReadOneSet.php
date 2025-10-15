<?php
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8"); 

include '../db.php'; 

// ตรวจสอบว่าได้รับพารามิเตอร์ 'id' จาก GET หรือไม่
if (isset($_GET['id'])) {
    $setID = $_GET['id']; // ดึงค่า ID จาก query string

    // เตรียม SQL query สำหรับการดึงข้อมูล SetName, FoodName และ Quantity
    $sql = "SELECT sm.SetName, f.FoodName, si.Quantity
            FROM setmealItem si
            JOIN fooditem f ON si.FoodItemID = f.FoodItemID
            JOIN setmeal sm ON si.SetID = sm.SetID
            WHERE si.SetID = ?";
    try {
        // เตรียมคำสั่ง SQL
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $setID);
        $stmt->execute();
        $result = $stmt->get_result();

        // สร้าง array สำหรับเก็บข้อมูลเมนู
        $items = array();

        // ดึงข้อมูลจาก setmealItem fooditem setmeal
        while ($row = $result->fetch_assoc()) {
            $items[] = array(
                'setName' => $row['SetName'],
                'foodName' => $row['FoodName'],
                'quantity' => $row['Quantity']
            );
        }

        echo json_encode($items);

        // ปิดการเชื่อมต่อฐานข้อมูล
        $conn = null;

    } catch (mysqli_sql_exception $e) {
        echo json_encode(array(
            "status" => "error",
            "message" => "Error: " . $e->getMessage()
        ));
        die();
    }
} else {
    echo json_encode(array(
        "status" => "error",
        "message" => "Missing parameter: id"
    ));
}
?>