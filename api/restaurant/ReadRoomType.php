<?php
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8"); 

include '../db.php'; 

$sql = "SELECT * FROM `roomtypecapacity`"; 

try {
    $roomtypes = array(); 

    foreach ($conn->query($sql) as $row) {
        $roomtype = array(
            'roomTypeID' => $row['RoomTypeID'],
            'roomType' => $row['RoomType'],
            'capacity' => $row['Capacity']
        );
        array_push( $roomtypes, $roomtype);
    }

    echo json_encode($roomtypes);

    $conn = null;

} catch (PDOException $e) {
    echo json_encode(array(
        "status" => "error",
        "message" => "Error: " . $e->getMessage()
    ));
    die();
}
?>