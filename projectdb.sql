-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2025 at 04:26 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `projectdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CategoryID`, `CategoryName`) VALUES
(1, 'Appetizer'),
(2, 'Main Course'),
(3, 'Dessert'),
(4, 'Beverage');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `MembershipStatus` enum('Active','Inactive') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CustomerID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `Address`, `MembershipStatus`) VALUES
(1, 'John', 'Smith', 'john.smith@email.com', '0812345678', 'Bangkok', 'Active'),
(2, 'Emily', 'Johnson', 'emily.j@email.com', '0823456781', 'Chiang Mai', 'Inactive'),
(3, 'Michael', 'Williams', 'mike.w@email.com', '0834567890', 'Phuket', 'Active'),
(4, 'Jessica', 'Brown', 'jess.brown@email.com', '0845678912', 'Khon Kaen', 'Inactive'),
(5, 'David', 'Miller', 'david.m@email.com', '0856789123', 'Chonburi', 'Active'),
(6, 'Sarah', 'Davis', 'sarah.d@email.com', '0867891234', 'Nakhon Ratchasima', 'Inactive'),
(7, 'James', 'Wilson', 'james.w@email.com', '0878912345', 'Ubon Ratchathani', 'Active'),
(8, 'Mary', 'Moore', 'marym@email.com', '0889123456', 'Songkhla', 'Active'),
(9, 'Robert', 'Thomas', 'robert.t@email.com', '0891234567', 'Phitsanulok', 'Inactive'),
(10, 'Linda', 'Taylor', 'lindat@email.com', '0902345678', 'Lamphun', 'Active'),
(11, 'William', 'Anderson', 'will.and@email.com', '0913456789', 'Nakhon Pathom', 'Inactive'),
(12, 'Barbara', 'Jackson', 'barb.j@email.com', '0924567891', 'Rayong', 'Active'),
(13, 'Christopher', 'White', 'chris.w@email.com', '0935678912', 'Nakhon Sawan', 'Active'),
(14, 'Patricia', 'Harris', 'pat.h@email.com', '0946789123', 'Phetchaburi', 'Inactive'),
(15, 'Matthew', 'Martin', 'matt.m@email.com', '0957891234', 'Trang', 'Active'),
(16, 'Jennifer', 'Thompson', 'jenn.t@email.com', '0968912345', 'Krabi', 'Inactive'),
(17, 'Daniel', 'Garcia', 'dan.g@email.com', '0979123456', 'Surat Thani', 'Active'),
(18, 'Elizabeth', 'Martinez', 'liz.m@email.com', '0981234567', 'Pattani', 'Inactive'),
(19, 'Joshua', 'Lee', 'josh.lee@email.com', '0992345678', 'Mae Hong Son', 'Active'),
(20, 'Susan', 'Clark', 'susan.c@email.com', '0803456789', 'Saraburi', 'Active'),
(32, '้Super', 'Human', 'Super.M@gmail.com', '09999999', 'Chiang Mai', 'Inactive'),
(34, 'Best', 'Customer', 'bc1234@gmail.com', '0777777777', 'Mars', 'Inactive');

-- --------------------------------------------------------

--
-- Table structure for table `fooditem`
--

CREATE TABLE `fooditem` (
  `FoodItemID` int(11) NOT NULL,
  `FoodName` varchar(100) NOT NULL,
  `Price` decimal(6,2) NOT NULL,
  `CategoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fooditem`
--

INSERT INTO `fooditem` (`FoodItemID`, `FoodName`, `Price`, `CategoryID`) VALUES
(1, 'Garlic Bread', 49.00, 1),
(2, 'Caesar Salad', 69.00, 1),
(3, 'French Fries', 59.00, 1),
(4, 'Chicken Wings', 69.00, 1),
(5, 'Beef Steak', 299.00, 2),
(6, 'Pork Chop Steak', 259.00, 2),
(7, 'Chicken Steak', 199.00, 2),
(8, 'Fish Steak', 219.00, 2),
(9, 'Mixed Grill Platter', 399.00, 2),
(10, 'BBQ Ribs', 349.00, 2),
(11, 'Spaghetti Carbonara', 149.00, 2),
(12, 'Grilled Salmon', 369.00, 2),
(13, 'Mashed Potatoes', 59.00, 2),
(14, 'Chocolate Brownie', 69.00, 3),
(15, 'Cheesecake', 79.00, 3),
(16, 'Fruit Salad', 59.00, 3),
(17, 'Vanilla Ice Cream', 49.00, 3),
(18, 'Soft Drinks', 39.00, 4),
(19, 'Iced Lemon Tea', 49.00, 4),
(20, 'Hot Coffee', 59.00, 4),
(22, 'Coca Cola', 25.00, 4);

-- --------------------------------------------------------

--
-- Table structure for table `membership`
--

CREATE TABLE `membership` (
  `MembershipID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `Discount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `membership`
--

INSERT INTO `membership` (`MembershipID`, `CustomerID`, `Discount`) VALUES
(1, 1, 10.00),
(2, 3, 10.00),
(3, 5, 10.00),
(4, 7, 10.00),
(5, 8, 10.00),
(6, 10, 10.00),
(7, 12, 10.00),
(8, 13, 10.00),
(9, 15, 10.00),
(10, 17, 10.00),
(11, 19, 10.00),
(12, 20, 10.00);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderID` int(11) NOT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `OrderStatus` varchar(20) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `TotalPrice` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderID`, `OrderDate`, `OrderStatus`, `CustomerID`, `TotalPrice`) VALUES
(1, '2025-10-01 09:30:00', 'Completed', 1, 120.00),
(2, '2025-10-01 10:30:00', 'Pending', 2, 80.00),
(3, '2025-10-02 11:15:00', 'Completed', 3, 150.00),
(4, '2025-10-02 12:20:00', 'Canceled', 4, 200.00),
(5, '2025-10-03 13:05:00', 'Completed', 5, 100.00),
(6, '2025-10-04 14:10:00', 'Completed', 1, 220.00),
(7, '2025-10-05 15:55:00', 'Pending', 2, 95.00),
(8, '2025-10-06 16:40:00', 'Completed', 3, 160.00),
(9, '2025-10-07 17:25:00', 'Completed', 4, 180.00),
(10, '2025-10-08 18:30:00', 'Completed', 5, 110.00);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `OrderItemID` int(11) NOT NULL,
  `OrderID` int(11) DEFAULT NULL,
  `FoodItemID` int(11) DEFAULT NULL,
  `SetID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`OrderItemID`, `OrderID`, `FoodItemID`, `SetID`, `Quantity`) VALUES
(1, 1, 1, NULL, 2),
(2, 2, 2, NULL, 1),
(3, 3, NULL, 1, 1),
(4, 4, 3, NULL, 2),
(5, 5, NULL, 2, 1),
(6, 6, 4, NULL, 3),
(7, 7, 5, NULL, 2),
(8, 8, NULL, 3, 1),
(9, 9, 2, NULL, 2),
(10, 10, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservationorder`
--

CREATE TABLE `reservationorder` (
  `ReservationID` int(11) NOT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL,
  `ReservationDate` datetime DEFAULT NULL,
  `NumberOfSeats` int(11) DEFAULT NULL,
  `TableID` int(11) DEFAULT NULL,
  `BookingStatus` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservationorder`
--

INSERT INTO `reservationorder` (`ReservationID`, `CustomerID`, `RoomID`, `ReservationDate`, `NumberOfSeats`, `TableID`, `BookingStatus`) VALUES
(1, 1, 1, '2025-10-10 18:30:00', 4, 2, 'Reserved'),
(2, 3, 2, '2025-10-11 12:00:00', 10, 16, 'Reserved'),
(3, 5, 1, '2025-10-12 19:00:00', 8, 5, 'Cancelled'),
(4, 8, 3, '2025-10-15 13:00:00', 10, 17, 'Reserved'),
(5, 10, 1, '2025-10-13 11:30:00', 4, 8, 'Cancelled'),
(7, 34, 4, '2025-10-01 21:30:00', 10, 1, 'Reserved');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `RoomID` int(11) NOT NULL,
  `RoomTypeID` int(11) DEFAULT NULL,
  `IsAvailable` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`RoomID`, `RoomTypeID`, `IsAvailable`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 1),
(4, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `roomtypecapacity`
--

CREATE TABLE `roomtypecapacity` (
  `RoomTypeID` int(11) NOT NULL,
  `RoomType` varchar(20) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `roomtypecapacity`
--

INSERT INTO `roomtypecapacity` (`RoomTypeID`, `RoomType`, `Capacity`) VALUES
(1, 'Normal', 60),
(2, 'Private', 10);

-- --------------------------------------------------------

--
-- Table structure for table `setmeal`
--

CREATE TABLE `setmeal` (
  `SetID` int(11) NOT NULL,
  `SetName` varchar(100) NOT NULL,
  `Price` decimal(6,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setmeal`
--

INSERT INTO `setmeal` (`SetID`, `SetName`, `Price`) VALUES
(1, 'Classic Set', 370.00),
(2, 'Chicken Lover Set', 305.00),
(3, 'Seafood Delight Set', 285.00),
(4, 'Thai Fusion Set', 270.00),
(5, 'Value Mix Set', 235.00),
(6, 'Combo Favorite Set', 430.00),
(7, 'Family Set', 460.00),
(8, 'Western Set', 410.00),
(9, 'Steak & Sip Set', 240.00),
(10, 'BBQ Fun Set', 390.00);

-- --------------------------------------------------------

--
-- Table structure for table `setmealitem`
--

CREATE TABLE `setmealitem` (
  `SetID` int(11) NOT NULL,
  `FoodItemID` int(11) NOT NULL,
  `Quantity` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `setmealitem`
--

INSERT INTO `setmealitem` (`SetID`, `FoodItemID`, `Quantity`) VALUES
(1, 1, 1),
(1, 5, 1),
(1, 14, 1),
(2, 2, 1),
(2, 7, 1),
(2, 15, 1),
(3, 3, 1),
(3, 8, 1),
(3, 16, 1),
(4, 4, 1),
(4, 6, 1),
(4, 17, 1),
(5, 1, 1),
(5, 11, 1),
(5, 15, 1),
(6, 3, 1),
(6, 12, 1),
(6, 14, 1),
(7, 2, 1),
(7, 9, 1),
(7, 16, 1),
(8, 4, 1),
(8, 10, 1),
(8, 17, 1),
(9, 7, 1),
(9, 19, 1),
(10, 3, 1),
(10, 10, 1),
(10, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tableroom`
--

CREATE TABLE `tableroom` (
  `TableID` int(11) NOT NULL,
  `Seats` int(11) DEFAULT NULL,
  `IsAvailable` tinyint(1) DEFAULT NULL,
  `RoomID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tableroom`
--

INSERT INTO `tableroom` (`TableID`, `Seats`, `IsAvailable`, `RoomID`) VALUES
(1, 4, 1, 1),
(2, 4, 1, 1),
(3, 4, 1, 1),
(4, 4, 1, 1),
(5, 4, 1, 1),
(6, 4, 1, 1),
(7, 4, 1, 1),
(8, 4, 1, 1),
(9, 4, 1, 1),
(10, 4, 1, 1),
(11, 4, 1, 1),
(12, 4, 1, 1),
(13, 4, 1, 1),
(14, 4, 1, 1),
(15, 4, 1, 1),
(16, 10, 1, 2),
(17, 10, 1, 3),
(18, 10, 1, 4);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`CustomerID`);

--
-- Indexes for table `fooditem`
--
ALTER TABLE `fooditem`
  ADD PRIMARY KEY (`FoodItemID`),
  ADD KEY `fooditem_ibfk_1` (`CategoryID`);

--
-- Indexes for table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`MembershipID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderID`),
  ADD KEY `CustomerID` (`CustomerID`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`OrderItemID`),
  ADD KEY `OrderID` (`OrderID`),
  ADD KEY `FoodItemID` (`FoodItemID`),
  ADD KEY `SetID` (`SetID`);

--
-- Indexes for table `reservationorder`
--
ALTER TABLE `reservationorder`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `CustomerID` (`CustomerID`),
  ADD KEY `RoomID` (`RoomID`),
  ADD KEY `TableID` (`TableID`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`RoomID`),
  ADD KEY `RoomTypeID` (`RoomTypeID`);

--
-- Indexes for table `roomtypecapacity`
--
ALTER TABLE `roomtypecapacity`
  ADD PRIMARY KEY (`RoomTypeID`);

--
-- Indexes for table `setmeal`
--
ALTER TABLE `setmeal`
  ADD PRIMARY KEY (`SetID`);

--
-- Indexes for table `setmealitem`
--
ALTER TABLE `setmealitem`
  ADD PRIMARY KEY (`SetID`,`FoodItemID`),
  ADD KEY `FoodItemID` (`FoodItemID`);

--
-- Indexes for table `tableroom`
--
ALTER TABLE `tableroom`
  ADD PRIMARY KEY (`TableID`),
  ADD KEY `RoomID` (`RoomID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `CustomerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `fooditem`
--
ALTER TABLE `fooditem`
  MODIFY `FoodItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `membership`
--
ALTER TABLE `membership`
  MODIFY `MembershipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `OrderItemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reservationorder`
--
ALTER TABLE `reservationorder`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `room`
--
ALTER TABLE `room`
  MODIFY `RoomID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `roomtypecapacity`
--
ALTER TABLE `roomtypecapacity`
  MODIFY `RoomTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `setmeal`
--
ALTER TABLE `setmeal`
  MODIFY `SetID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tableroom`
--
ALTER TABLE `tableroom`
  MODIFY `TableID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fooditem`
--
ALTER TABLE `fooditem`
  ADD CONSTRAINT `fooditem_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `category` (`CategoryID`);

--
-- Constraints for table `membership`
--
ALTER TABLE `membership`
  ADD CONSTRAINT `membership_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`OrderID`) REFERENCES `order` (`OrderID`),
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`FoodItemID`) REFERENCES `fooditem` (`FoodItemID`),
  ADD CONSTRAINT `orderitem_ibfk_3` FOREIGN KEY (`SetID`) REFERENCES `setmeal` (`SetID`);

--
-- Constraints for table `reservationorder`
--
ALTER TABLE `reservationorder`
  ADD CONSTRAINT `reservationorder_ibfk_1` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`),
  ADD CONSTRAINT `reservationorder_ibfk_2` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`),
  ADD CONSTRAINT `reservationorder_ibfk_3` FOREIGN KEY (`TableID`) REFERENCES `tableroom` (`TableID`);

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `room_ibfk_1` FOREIGN KEY (`RoomTypeID`) REFERENCES `roomtypecapacity` (`RoomTypeID`);

--
-- Constraints for table `setmealitem`
--
ALTER TABLE `setmealitem`
  ADD CONSTRAINT `setmealitem_ibfk_1` FOREIGN KEY (`SetID`) REFERENCES `setmeal` (`SetID`),
  ADD CONSTRAINT `setmealitem_ibfk_2` FOREIGN KEY (`FoodItemID`) REFERENCES `fooditem` (`FoodItemID`);

--
-- Constraints for table `tableroom`
--
ALTER TABLE `tableroom`
  ADD CONSTRAINT `tableroom_ibfk_1` FOREIGN KEY (`RoomID`) REFERENCES `room` (`RoomID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
