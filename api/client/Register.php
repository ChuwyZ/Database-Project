<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php'; 

// รับ input จาก HTML form
$fName = $_POST["firstName"];
$lName = $_POST["lastName"];
$email = $_POST["email"];
$phoneNum = $_POST["phone"];
$address = $_POST["address"];
$status = "Inactive";  // Set default ใน status


// SQL query + placeholders
$sql = "INSERT INTO Customer (FirstName, LastName, Email, PhoneNumber, Address, MembershipStatus)
        VALUES (?, ?, ?, ?, ?, ?)";

$stmt = $conn->prepare($sql);

if ($stmt === false) {
    echo json_encode(["error" => "Error preparing statement: " . $conn->error]);
    exit();
}

// Bind parameters
$stmt->bind_param("ssssss", $fName, $lName, $email, $phoneNum, $address, $status);

if ($stmt->execute()) {
    echo json_encode(["message" => "New record created successfully"]);
} else {
    echo json_encode(["error" => "Error inserting record: " . $stmt->error]);
}

$stmt->close();
$conn->close();
?>