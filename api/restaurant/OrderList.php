<?php
header("Access-Control-Allow-Origin: *"); 
header("Content-Type: application/json; charset=UTF-8"); 

include '../db.php'; 

$sql = "SELECT * FROM `order`"; 

try {
    $orderLists = array(); 

    foreach ($conn->query($sql) as $row) {
        $orderList = array(
            'orderID' => $row['OrderID'],
            'orderDate' => $row['OrderDate'],
            'orderStatus' => $row['OrderStatus'],
            'customerID' => $row['CustomerID'],
            'totalPrice' => $row['TotalPrice']
        );
        array_push( $orderLists, $orderList);
    }

    echo json_encode($orderLists);

    $conn = null;

} catch (PDOException $e) {
    echo json_encode(array(
        "status" => "error",
        "message" => "Error: " . $e->getMessage()
    ));
    die();
}
?>