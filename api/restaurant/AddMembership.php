<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php'; 

$customerID = '32';
$discount = 50.00;

$status = 'Active';

//On inserrt
$sql = "INSERT INTO membership (CustomerID, Discount) VALUES (?, ?)";

//On update
$sqlUpdate = "UPDATE customer SET MembershipStatus = ? WHERE CustomerID = ?";
$stmtUpdate = $conn->prepare($sqlUpdate);
$stmtUpdate->bind_param("si", $status, $customerID);
$stmtUpdate->execute();

//On inserrt
$stmt = $conn->prepare($sql);
//On inserrt
$stmt->bind_param("sd", $customerID, $discount);

if ($stmt->execute()) {
    $stmt->close(); 

    if ($stmtUpdate->execute()) {
        echo json_encode(["message" => "New record created and membership status updated successfully"]);
    } else {
        echo json_encode(["error" => "Error updating membership status: " . $stmtUpdate->error]);
    }

    $stmtUpdate->close();
} else {
    echo json_encode(["error" => "Error inserting record: " . $stmt->error]);
}

$conn->close();
?>