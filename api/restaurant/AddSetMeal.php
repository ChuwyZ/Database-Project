<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php'; 

$setName = 'Super Set Meal';
$price = 499.00;
$foodIDs = [1, 2, 3];
$quantities = [1, 1, 1];

$conn->begin_transaction();

try {
    $sql1 = "INSERT INTO SetMeal (SetName, Price) VALUES (?, ?)";
    $stmt1 = $conn->prepare($sql1);
    $stmt1->bind_param("sd", $setName, $price);
    $stmt1->execute();

    $setID = $conn->insert_id;

    $sql2 = "INSERT INTO SetMealItem (SetID, FoodItemID, Quantity) VALUES (?, ?, ?)";
    $stmt2 = $conn->prepare($sql2);

    for ($i = 0; $i < count($foodIDs); $i++) {
        $foodID = $foodIDs[$i];
        $quantity = $quantities[$i];
        $stmt2->bind_param("iii", $setID, $foodID, $quantity);
        $stmt2->execute();
    }

    $conn->commit();

    echo json_encode(["message" => "Insert Successfully"]);

} catch (Exception $e) {
    $conn->rollback();
    echo json_encode(["message" => $e->getMessage()]);
}

$conn->close();
?>