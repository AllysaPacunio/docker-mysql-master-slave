-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 15, 2024 at 08:49 AM
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
-- Database: `api_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `password` varchar(100) NOT NULL,
  `shipping_add` varchar(200) NOT NULL,
  `billing_add` varchar(200) NOT NULL,
  `seller_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`id`, `full_name`, `email`, `username`, `phone`, `password`, `shipping_add`, `billing_add`, `seller_name`) VALUES
(1, 'Meibelle R. Medina', 'meibelle@gmail.com', 'hello_meibelle123', '12234567890', '24cbb7f7f2249cc74f7e4a8c98658857', 'Blk2 Lot5 ph2 Lumina Homes Pinagkuartelan Pandi, Bulacan', 'Blk2 Lot5 ph2 Lumina Homes Pinagkuartelan Pandi, Bulacan', 'Meibelle Medina'),
(2, 'Allysa Pacunio', 'allysa@gmail.com', 'hello_allysa123', '12234567890', '6fd842acc0d8a590848e5f64efbb4a7c', 'Woodbridge Poblacion, Pandi, Bulacan', 'Woodbridge Poblacion, Pandi, Bulacan', 'Allysa Pacunio'),
(3, 'Jorge Rayne David', 'jorge@gmail.com', 'hello_jorge123', '12234567890', 'b93fe3ad4f4767c485db7359a4a9001b', 'Bulacan', 'Bulacan', 'Jorge Rayne David');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `cart_item_id` int(11) NOT NULL,
  `checkout_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `cart_item_id`, `checkout_number`) VALUES
(1, 2, 123),
(2, 2, 123),
(3, 1, 123),
(4, 2, 124),
(5, 6, 234),
(6, 5, 234),
(7, 3, 324),
(8, 4, 324);

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_item`
--

INSERT INTO `cart_item` (`id`, `customer_id`, `product_id`, `qty`, `total_amount`) VALUES
(1, 1, 2, 3, 150000),
(2, 1, 3, 1, 60000),
(3, 3, 1, 5, 200000),
(4, 3, 2, 4, 200000),
(5, 2, 3, 1, 60000),
(6, 2, 1, 1, 40000);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `time` varchar(10) NOT NULL,
  `date` varchar(10) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `checkout_num` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`time`, `date`, `customer_id`, `checkout_num`) VALUES
('4:47:29 PM', '12/13/2023', 1, 123),
('5:10:16 PM', '12/13/2023', 1, 124),
('5:19:23 PM', '12/13/2023', 2, 234),
('5:20:12 PM', '12/13/2023', 3, 324);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `price` float NOT NULL,
  `stocks` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `price`, `stocks`, `seller_id`) VALUES
(1, 'Acer Laptop', 40000, 4, 1),
(2, 'Asus Laptop', 50000, 3, 2),
(3, 'Dell Laptop', 60000, 4, 3);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_category`
--

CREATE TABLE `transaction_category` (
  `id` int(11) NOT NULL,
  `category` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaction_category`
--

INSERT INTO `transaction_category` (`id`, `category`) VALUES
(1, 'SOLD'),
(2, 'BOUGHT');

-- --------------------------------------------------------

--
-- Table structure for table `transac_history`
--

CREATE TABLE `transac_history` (
  `id` int(11) NOT NULL,
  `transac_cat` int(11) NOT NULL,
  `checkout_number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transac_history`
--

INSERT INTO `transac_history` (`id`, `transac_cat`, `checkout_number`) VALUES
(1, 1, 123),
(2, 2, 123),
(3, 1, 123),
(4, 2, 123),
(5, 1, 123),
(6, 2, 123),
(9, 1, 234),
(10, 2, 234),
(11, 1, 234),
(12, 2, 234),
(13, 1, 324),
(14, 2, 324),
(15, 1, 324),
(16, 2, 324);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_order` (`checkout_number`),
  ADD KEY `fk_oder` (`cart_item_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_prod_id` (`product_id`),
  ADD KEY `FK_BuyerId` (`customer_id`) USING BTREE;

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD UNIQUE KEY `checkout_num` (`checkout_num`),
  ADD KEY `fk_customer` (`customer_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_SellerId` (`seller_id`);

--
-- Indexes for table `transaction_category`
--
ALTER TABLE `transaction_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transac_history`
--
ALTER TABLE `transac_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_cat_id` (`transac_cat`),
  ADD KEY `fk_order_id` (`checkout_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `transaction_category`
--
ALTER TABLE `transaction_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transac_history`
--
ALTER TABLE `transac_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_oder` FOREIGN KEY (`cart_item_id`) REFERENCES `cart_item` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FK_BuyerId` FOREIGN KEY (`customer_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_prod_id` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_customer` FOREIGN KEY (`customer_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ooooorder` FOREIGN KEY (`checkout_num`) REFERENCES `cart` (`checkout_number`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_SellerId` FOREIGN KEY (`seller_id`) REFERENCES `accounts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transac_history`
--
ALTER TABLE `transac_history`
  ADD CONSTRAINT `fk_cat_id` FOREIGN KEY (`transac_cat`) REFERENCES `transaction_category` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_order_id` FOREIGN KEY (`checkout_number`) REFERENCES `orders` (`checkout_num`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
