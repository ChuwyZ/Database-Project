<?php
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

include '../db.php';

$sql = "SELECT 
    oi.OrderItemID,
    oi.OrderID,
    oi.FoodItemID,
    CASE 
        WHEN oi.FoodItemID IS NOT NULL THEN fi.FoodName
        ELSE NULL
    END AS FoodName,
    oi.SetID,
    CASE 
        WHEN oi.SetID IS NOT NULL THEN sm.SetName
        ELSE NULL
    END AS SetName,
    oi.Quantity,
    CASE 
        WHEN oi.FoodItemID IS NOT NULL THEN oi.Quantity * fi.Price
        WHEN oi.SetID IS NOT NULL THEN oi.Quantity * sm.Price
        ELSE 0
    END AS TotalPrice
FROM 
    orderitem oi
LEFT JOIN 
    fooditem fi ON oi.FoodItemID = fi.FoodItemID
LEFT JOIN 
    setmeal sm ON oi.SetID = sm.SetID;";

try {
    $orderItems = array();
    foreach ($conn->query($sql) as $row) {
        $orderItem = array(
            'orderItemID' => $row['OrderItemID'],
            'orderID' => $row['OrderID'],
            'foodItemID' => $row['FoodItemID'],
            'foodName' => $row['FoodName'],  
            'setID' => $row['SetID'],
            'setName' => $row['SetName'], 
            'quantity' => $row['Quantity'],
            'totalPrice' => $row['TotalPrice']
        );

        array_push($orderItems, $orderItem);
    }

    echo json_encode($orderItems);

    $conn = null; 

} catch (PDOException $e) {
    echo json_encode(array(
        "status" => "error",
        "message" => "Error: " . $e->getMessage()
    ));
    die();
}
?>
