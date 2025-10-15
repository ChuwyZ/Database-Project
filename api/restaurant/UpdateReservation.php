<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php'; 
//ใส่idให้ตรงกับที่จะเปลี่ยน
$reservationID = 7;

$customerID = 34;
$roomID = 4;
$reservationDate = '2025-10-01 21:30:00';
$numberOfSeats = 10;
$tableID = 1;
$bookingStatus = 'Reserved';

$sql = "UPDATE reservationorder SET CustomerID = ?, RoomID = ?, ReservationDate = ?, NumberOfSeats = ?, TableID = ?, BookingStatus = ? WHERE ReservationID = ?";

$stmt = $conn->prepare($sql);

if ($stmt === false) {
    echo json_encode(["error" => "Error preparing statement: " . $conn->error]);
    exit();
}

$stmt->bind_param("iisiisi", $customerID, $roomID, $reservationDate, $numberOfSeats, $tableID, $bookingStatus, $reservationID);

if ($stmt->execute()) {
    echo json_encode(["message" => "Updated successfully"]);
} else {
    echo json_encode(["error" => "Error updating record: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>