<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php';

$customerID = 34;
$roomID = 4;
$reservationDate = '2025-10-30 20:30:00';
$numberOfSeats = 10;
$tableID = 18;
$bookingStatus = 'Reserved';

$sql = "INSERT INTO reservationorder (CustomerID, RoomID, ReservationDate, NumberOfSeats, TableID, BookingStatus) 
        VALUES (?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);

if ($stmt === false) {
    echo json_encode(["error" => "Error preparing statement: " . $conn->error]);
    exit();
}

$stmt->bind_param("iisiis", $customerID, $roomID, $reservationDate, $numberOfSeats, $tableID, $bookingStatus);

if ($stmt->execute()) {
    echo json_encode(["message" => "New record created successfully"]);
} else {
    echo json_encode(["error" => "Error inserting record: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>