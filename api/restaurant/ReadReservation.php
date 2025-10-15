<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php';  

$sql = "SELECT * FROM reservationorder"; 

try {
    $reservationorders = array();
    foreach ($conn->query($sql) as $row) {
        $reservationorder = array(
            'reservationID' => $row['ReservationID'],
            'customerID' => $row['CustomerID'],
            'roomID' => $row['RoomID'],
            'reservationDate' => $row['ReservationDate'],  
            'numOfSeats' => $row['NumberOfSeats'],
            'tableID' => $row['TableID'],
            'bookingStatus' => $row['BookingStatus']
        );
        
        array_push($reservationorders, $reservationorder);
    }

    echo json_encode($reservationorders);

    $conn = null;  
} catch (PDOException $e) {
    echo json_encode(array(
        "status" => "error",
        "message" => "Error: " . $e->getMessage()
    ));
    die();
}
?>