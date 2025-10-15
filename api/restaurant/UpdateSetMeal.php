<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php'; 

$setID = 14;
$setName = 'Super Set Meal';
$price = 399.00;
$foodIDs = [1, 2, 3];
$quantities = [2, 2, 2];

$conn->begin_transaction();

try {
    $sql1 = "UPDATE SetMeal SET SetName = ?, Price = ? WHERE SetID = ?";
    $stmt1 = $conn->prepare($sql1);
    $stmt1->bind_param("sdi", $setName, $price, $setID);
    $stmt1->execute();

    $sqlDelete = "DELETE FROM SetMealItem WHERE SetID = ?";
    $stmtDel = $conn->prepare($sqlDelete);
    $stmtDel->bind_param("i", $setID);
    $stmtDel->execute();

    $sqlInsert = "INSERT INTO SetMealItem (SetID, FoodItemID, Quantity) VALUES (?, ?, ?)";
    $stmtInsert = $conn->prepare($sqlInsert);

    for ($i = 0; $i < count($foodIDs); $i++) {
        $foodID = $foodIDs[$i];
        $quantity = $quantities[$i];
        $stmtInsert->bind_param("iii", $setID, $foodID, $quantity);
        $stmtInsert->execute();
    }

    $conn->commit();
    echo json_encode(["message" => "Update Successfully"]);

} catch (Exception $e) {
    $conn->rollback();
    echo json_encode(["message" => $e->getMessage()]);
}

$conn->close();
?>