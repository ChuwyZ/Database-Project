<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php';

try {
    // Query to get the room data, including availability
    $sql = "
        SELECT t.TableID, t.RoomID, rtc.RoomType, t.IsAvailable
        FROM tableroom t
        INNER JOIN room r ON t.RoomID = r.RoomID
        INNER JOIN roomtypecapacity rtc ON r.RoomTypeID = rtc.RoomTypeID";
    
    $result = $conn->query($sql);
    
    $tableRooms = array();
    
    foreach ($result as $row) {
        $roomType = $row['RoomType'] === 'Private' ? 'Private' : 'Normal';
        
        $tableRoom = array(
            'TableID' => $row['TableID'],
            'RoomID' => $row['RoomID'],
            'RoomType' => $roomType, 
            'IsAvailable' => $row['IsAvailable']  
        );
        
        array_push($tableRooms, $tableRoom);
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