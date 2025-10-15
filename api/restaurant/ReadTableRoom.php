<?php
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8"); 

include '../db.php'; 

$sql = "SELECT * FROM tableroom"; 

try {
    $tableRooms = array();
    foreach ($conn->query($sql) as $row) {
        $tableRoom = array(
            'tableID' => $row['TableID'],
            'seats' => $row['Seats'],
            'isAvailable' => $row['IsAvailable'],
            'roomID' => $row['RoomID']
        );
       
        array_push( $tableRooms, $tableRoom);
    }

    echo json_encode($tableRooms);

    $conn = null;

} catch (PDOException $e) {
    echo json_encode(array(
        "status" => "error",
        "message" => "Error: " . $e->getMessage()
    ));
    die();
}
?>