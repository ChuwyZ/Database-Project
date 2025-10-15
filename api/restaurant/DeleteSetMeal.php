<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php'; 

$setID = 14;  

$conn->begin_transaction();

try {
    $sql2 = "DELETE FROM SetMealItem WHERE SetID = ?";
    $stmt2 = $conn->prepare($sql2);
    $stmt2->bind_param("i", $setID);
    $stmt2->execute();

    $sql1 = "DELETE FROM SetMeal WHERE SetID = ?";
    $stmt1 = $conn->prepare($sql1);
    $stmt1->bind_param("i", $setID);
    $stmt1->execute();

    $conn->commit();

    echo json_encode(["message" => "Deleted Successfully"]);

} catch (Exception $e) {
    $conn->rollback();
    echo json_encode(["message" => $e->getMessage()]);
}

$conn->close();
?>