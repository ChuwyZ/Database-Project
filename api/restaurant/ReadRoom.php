<?php
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8"); 

include '../db.php'; 

$sql = "SELECT * FROM `room`"; 

try {
    $rooms = array(); 

    foreach ($conn->query($sql) as $row) {
        $room = array(
            'roomID' => $row['RoomID'],
            'roomTypeID' => $row['RoomTypeID'],
            'isAvailable' => $row['IsAvailable']
        );
        array_push( $rooms, $room);
    }
    echo json_encode($rooms);

    $conn = null;

} catch (PDOException $e) {
    echo json_encode(array(
        "status" => "error",
        "message" => "Error: " . $e->getMessage()
    ));
    die();
}
?>