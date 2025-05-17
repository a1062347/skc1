-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 21, 2025 at 05:28 AM
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
-- Database: `scims`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(20) NOT NULL,
  `brand_active` varchar(20) NOT NULL,
  `brand_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`brand_id`, `brand_name`, `brand_active`, `brand_status`) VALUES
(1, 'MONIN', '1', '1'),
(2, 'Da Vinci', '1', '1'),
(21, 'OTHERS', '1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categories_id` int(11) NOT NULL,
  `categories_name` varchar(20) NOT NULL,
  `categories_active` varchar(20) NOT NULL,
  `categories_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categories_id`, `categories_name`, `categories_active`, `categories_status`) VALUES
(1, 'SAUCE & SYRUP', '1', 1),
(2, 'POWDERS', '1', 1),
(3, 'OTHERS', '1', 1),
(4, 'BASILUR TEA', '1', 1),
(5, 'ITEMS BAR', '1', 1),
(6, 'COCKTAILS', '1', 1),
(7, 'GARNISH', '1', 1),
(8, 'ITEMS KITCHEN PANTRY', '1', 1),
(9, 'SAUCE & DRESSINGS', '1', 2),
(10, 'CAN', '1', 1),
(11, 'DRY & CONDIMENTS', '1', 2),
(12, 'EGG', '1', 2),
(13, 'MEAT', '1', 1),
(14, 'TAKEOUT CONTAINERS', '1', 1),
(15, 'BUTANE', '1', 1),
(16, 'RUBBER HANDGLOVES', '1', 1),
(17, 'SOUP', '1', 1),
(18, 'CLEANING MATERIALS', '1', 1),
(19, 'SANDWICH', '1', 1),
(20, 'BOTTLES AND GALLONS', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL,
  `order_date` date NOT NULL,
  `client_name` varchar(50) NOT NULL,
  `client_contact` varchar(50) NOT NULL,
  `sub_total` int(11) NOT NULL,
  `vat` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL,
  `discount` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `paid` int(11) NOT NULL,
  `due` int(11) NOT NULL,
  `payment_type` varchar(20) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `order_date`, `client_name`, `client_contact`, `sub_total`, `vat`, `total_amount`, `discount`, `grand_total`, `paid`, `due`, `payment_type`, `payment_status`, `order_status`) VALUES
(9, '2024-11-09', 'Ralph', '09617252971', 3000, 390, 3390, 100, 3290, 3290, 0, '2', '1', 2),
(10, '2024-11-30', 'Awie', '103201203', 500, 65, 565, 100, 465, 465, 0, '2', '1', 2),
(11, '2024-12-03', 'Ralph', '09617252971', 2000, 260, 2260, 0, 2260, 2260, 0, '2', '1', 2),
(12, '2024-12-15', 'University of Makati', '1234', 5000, 650, 5650, 0, 5650, 5650, 0, '2', '1', 2),
(13, '2024-12-11', 'asd', '123', 1000, 130, 1130, 0, 1130, 0, 1130, '1', '1', 2),
(14, '2024-12-18', 'Ralph', '09617252971', 3000, 390, 3390, 0, 3390, 0, 3390, '1', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_id` int(11) NOT NULL,
  `product_id` varchar(30) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `order_item_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`order_id`, `product_id`, `quantity`, `rate`, `total`, `order_item_status`) VALUES
(1, '245432ws', 12, 22, 233, 1),
(6, '6', 1, 2, 2, 2),
(7, '7', 2, 12, 24, 2),
(8, '10', 1, 0, 0, 2),
(9, '1', 10, 100, 1000, 2),
(10, '6', 3, 100, 300, 2),
(11, '22', 2, 1000, 2000, 2),
(12, '22', 5, 1000, 5000, 2),
(13, '37', 2, 500, 1000, 2),
(14, '22', 3, 1000, 3000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_image` varchar(255) DEFAULT NULL,
  `brand_id` varchar(50) NOT NULL,
  `categories_id` varchar(50) NOT NULL,
  `quantity` int(11) NOT NULL,
  `rate` int(11) NOT NULL,
  `active` varchar(20) NOT NULL,
  `status` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `product_name`, `product_image`, `brand_id`, `categories_id`, `quantity`, `rate`, `active`, `status`) VALUES
(22, 'Caramel Sauce (1.89L) bottle', '../assests/images/stock/2032977874674e5b94e4394.jpg', '1', '1', 20, 1000, '1', 1),
(23, 'Dark Chocolate Sauce (1.89L) bottle', '../assests/images/stock/1978301324674e5baac8d71.jpg', '1', '1', 10, 1000, '1', 1),
(24, 'Raspberry Syrup (1L) bottle', '../assests/images/stock/85689909674e5bc04b5e6.jpg', '1', '1', 10, 1000, '1', 1),
(25, 'Vanilla Syrup (1L) bottle', '../assests/images/stock/614553960674e5bdeb8df5.jpg', '1', '1', 10, 1000, '1', 1),
(26, 'Strawberry Fruitmix (1L) bottle', '../assests/images/stock/1144399613674e5bf7268f0.jpg', '1', '1', 10, 1000, '1', 1),
(27, 'Blueberry Fruitmix (1L) bottle', '../assests/images/stock/153725145674e5c1066e58.jpg', '1', '1', 10, 1000, '1', 1),
(28, 'Toffeenut Syrup (1L) bottle', '../assests/images/stock/218535559674e5c2f0b4c1.jpg', '1', '1', 10, 1000, '1', 1),
(29, 'Frosted Mint (1L) bottle', '../assests/images/stock/1002839536674e5c44eb98b.jpg', '1', '1', 10, 1000, '1', 1),
(30, 'Salted Caramel (2L) bottle', '../assests/images/stock/1551472686674e5c5e0650f.jpg', '2', '1', 10, 1000, '1', 1),
(31, 'White Chocolate Sauce', '../assests/images/stock/220588183674e5c77ecaf8.jpg', '2', '1', 10, 1000, '1', 1),
(32, 'Vanilla Powder (1kg) pack', '../assests/images/stock/1440360294674e5c934f077.jpg', '1', '2', 5, 500, '1', 1),
(33, 'Yogurt Powder (1kg) pack', '../assests/images/stock/242469676674e5cb199736.jpg', '1', '2', 5, 500, '1', 1),
(34, 'Matcha Powder (1kg) pack', '../assests/images/stock/1984462772674e5cddf1836.jpg', '1', '2', 5, 500, '1', 1),
(35, 'Chocolate Powder (1kg) pack', '../assests/images/stock/1477103574674e5cf5da509.jpg', '1', '2', 5, 500, '1', 1),
(36, 'Milo Powder (1kg) pack', '../assests/images/stock/21391680674e5d0a5cb5b.jpg', '21', '2', 5, 500, '1', 1),
(37, 'Curve Coffee Beans (1kg) pack', '../assests/images/stock/332539192674e5d36164d9.jpg', '21', '3', 7, 500, '1', 1),
(38, 'Tinatangi Coffee Beans (500g) pack', '../assests/images/stock/1284122656674e5d5815b16.jpg', '21', '3', 5, 500, '1', 1),
(39, 'Muni-muni Coffee Beans (500g) pack\r\n', '../assests/images/stock/574284711674e5d75ab55b.png', '21', '3', 5, 500, '1', 1),
(40, 'Arla Full Cream Milk (1L) pack', '../assests/images/stock/1907510074674e5d9b57ec5.jpg', '21', '3', 5, 500, '1', 1),
(41, 'Condensed Milk (380g) can', '../assests/images/stock/1811258885674e5dac8249e.jpg', '21', '3', 5, 500, '1', 1),
(42, 'Ambiante Whipped Cream (1L) pack', '../assests/images/stock/317622446674e5dc214b0f.jpg', '21', '3', 5, 500, '1', 1),
(43, 'Chocolate Drops pack', '../assests/images/stock/1771661404674e5de4f0698.jpg', '21', '3', 5, 500, '1', 1),
(44, 'Raw Nuts (1/2 kilo)', '../assests/images/stock/43385467674e5df9ace82.jpg', '21', '3', 5, 500, '1', 1),
(45, 'Skippy Peanut Butter (1.36kg) jar', '../assests/images/stock/1722992304674e5e094d955.jpg', '21', '3', 5, 500, '1', 1),
(46, 'White Sugar (1kg) pack', '../assests/images/stock/1570026967674e5e209ef8c.jpg', '21', '3', 5, 500, '1', 1),
(47, 'Lotus Butter (700g) jar', '../assests/images/stock/503923213674e5e371ab0c.jpg', '21', '3', 5, 500, '1', 1),
(48, 'Lotus Biscoff Biscuit (pack)', '../assests/images/stock/1100328062674e5e5687380.jpg', '21', '3', 5, 500, '1', 1),
(49, 'Oreo Biscuits (pack)', '../assests/images/stock/1921017167674e5e6a30ebe.jpg', '21', '3', 5, 500, '1', 1),
(50, 'Lemonade (Country Time) can', '../assests/images/stock/827820054674e5eb662dcf.jpg', '21', '3', 5, 500, '1', 1),
(51, 'Vanilla Icecream (tub)', '../assests/images/stock/1274589522674e5ed61f15b.jpg', '21', '3', 5, 500, '1', 1),
(52, 'Earl Grey Tea (box)', '../assests/images/stock/1514772085674e5eef9dabd.jpg', '21', '3', 5, 500, '1', 1),
(53, 'Pure Green Tea (box)', '../assests/images/stock/454279783674e5f05a5ca1.jpg', '21', '3', 5, 500, '1', 1),
(54, 'Splenda/Equal (box)', '../assests/images/stock/872805984674e5f244f6c6.jpg', '21', '3', 5, 500, '1', 1),
(55, 'Creamer Pockets (pack)', '../assests/images/stock/786708255674e5f4986796.jpg', '21', '3', 100, 10, '1', 1),
(56, 'Brown Sugar Pockets (pack)', '../assests/images/stock/1527734965674e5f5e40558.jpg', '21', '3', 100, 10, '1', 1),
(57, 'White Sugar Pockets (pack)', '../assests/images/stock/703339090674e5f76a606e.jpg', '21', '3', 100, 10, '1', 1),
(58, 'Paper Cups Regular 12oz (pack)', '../assests/images/stock/265663740674e5f8f3865d.jpg', '21', '3', 100, 20, '1', 1),
(59, 'Paper Cups Regular 16oz (pack)', '../assests/images/stock/94655816674e5fa49d733.jpg', '21', '3', 100, 20, '1', 1),
(60, 'PET Cups Regular 12oz (pack)', '../assests/images/stock/650432208674e5fbc4bf2e.jpg', '21', '3', 100, 50, '1', 1),
(61, 'PET Cups Regular 16oz (pack)', '../assests/images/stock/1094080824674e5fcd8d003.jpg', '21', '3', 100, 50, '1', 1),
(62, 'Cofee Lids (pack)', '../assests/images/stock/1132919152674e5ff1bdad9.jpg', '21', '3', 100, 30, '1', 1),
(63, 'Dome lids (pack)', '../assests/images/stock/24676597674e60086f0cd.jpg', '21', '3', 100, 30, '1', 1),
(64, 'Flat Lids (pack)', '../assests/images/stock/626164865674e601987b5b.jpg', '21', '3', 100, 30, '1', 1),
(65, 'Stirrer 7\" (box)', '../assests/images/stock/642230931674e602fcb5e0.jpg', '21', '3', 100, 5, '1', 1),
(66, 'Straw (pack)\r\n', '../assests/images/stock/1885752487674e6044b241c.jpg', '21', '3', 50, 5, '1', 1),
(67, 'Paper Bags (Small) 200pcs/bundle\r\n', '../assests/images/stock/2102942061674e606d68384.jpg', '21', '3', 200, 1, '1', 1),
(68, 'Paper Bags (Medium) 100pcs/bundle\r\n', '../assests/images/stock/1078266799674e607fa9918.jpg', '21', '3', 200, 1, '1', 1),
(69, 'Paper Bags (Large) 50pcs/bundle\r\n', '../assests/images/stock/790381987674e6091dc653.jpg', '21', '3', 200, 1, '1', 1),
(70, 'Coffee Filter (pack)\r\n', '../assests/images/stock/1334114263674e60abf1916.jpg', '21', '3', 2, 700, '1', 1),
(71, 'Disposable Fork (150pcs/box)\r\n', '../assests/images/stock/356659689674e60ca0380e.jpg', '21', '3', 25, 25, '1', 1),
(72, 'Disposable Spoon (150pcs/box)\r\n', '../assests/images/stock/1660110199674e60df749c4.jpg', '21', '3', 25, 25, '1', 1),
(73, 'Tissue with Logo (350ply/pack)\r\n', '../assests/images/stock/600110646674e60f9db7f0.png', '21', '3', 1000, 1, '1', 1),
(74, 'Interfolded Brown Tissue (150ply/pack)\r\n', '../assests/images/stock/1071032055674e61152920c.jpg', '21', '3', 150, 50, '1', 1),
(75, 'Tissue Roll (48pcs/bundle)', '../assests/images/stock/967068008674e6133952b0.jpg', '21', '3', 96, 10, '1', 1),
(76, 'Cream Charger (Box)\r\n', '../assests/images/stock/190836400674e6156c96b7.jpg', '21', '3', 100, 10, '1', 1),
(77, 'Takeout Cup Carrier 2\'s (pack) bundle\r\n', '../assests/images/stock/664969339674e6176e488b.jpg', '21', '3', 100, 20, '1', 1),
(78, 'Takeout Cup Holder 4\'s (pack) bundle\r\n', '../assests/images/stock/1252343808674e6188da3f0.jpg', '21', '3', 100, 40, '1', 1),
(79, 'Cake Triangle Takeout (pack)\r\n', '../assests/images/stock/1762028032674e61a2157f0.jpg', '21', '3', 50, 50, '1', 1),
(80, 'Soup Bowl (25pcs/pack)', '../assests/images/stock/537105984674e61ba46c36.jpg', '21', '3', 100, 15, '1', 1),
(81, 'Thermal Roll (pack)', '../assests/images/stock/1484448461674e61cf010a0.jpg', '21', '3', 20, 100, '1', 1),
(82, 'Card Thermal Roll (pack)', '../assests/images/stock/1038535677674e61dd268ad.jpg', '21', '3', 20, 100, '1', 1),
(83, 'Alcohol (bottle)', '../assests/images/stock/1330151708674e61ff07cda.jpg', '21', '3', 10, 500, '1', 1),
(84, 'Mango & Pineapple (box)', '../assests/images/stock/1167534788674e6210b2d4f.jpg', '21', '4', 5, 500, '1', 1),
(85, 'Earl Grey (box)', '../assests/images/stock/593109279674e621e10384.jpg', '21', '4', 5, 500, '1', 1),
(86, 'English Breakfast (box)', '../assests/images/stock/99672664674e622ba1205.jpg', '21', '4', 5, 500, '1', 1),
(87, 'Sencha Green (box)', '../assests/images/stock/886514875674e6238a3a4f.jpg', '21', '4', 5, 500, '1', 1),
(88, 'Peppermint (box)', '../assests/images/stock/1400530733674e624686bfb.jpg', '21', '4', 5, 500, '1', 1),
(89, 'Jasmine Green (box)', '../assests/images/stock/1162315214674e6257703c8.jpg', '21', '4', 5, 500, '1', 1),
(90, 'Chamomile (box)', '../assests/images/stock/1612436339674e6265ee0a4.jpg', '21', '4', 5, 500, '1', 1),
(91, 'San Miguel Lychee (bottle)', '../assests/images/stock/2028838319674e62a3b174d.jpg', '21', '5', 24, 100, '1', 1),
(92, 'San Miguel Apple (bottle)', '../assests/images/stock/1110930058674e62b8b98d1.jpg', '2', '5', 24, 100, '1', 1),
(93, 'San Miguel Light (bottle)', '../assests/images/stock/56548661674e62c9ed3d5.jpg', '21', '5', 24, 100, '1', 1),
(94, 'San Miguel Super Dry (bottle)', '../assests/images/stock/1734709751674e62d9e1f6c.jpg', '21', '5', 24, 100, '1', 1),
(95, 'Heineken (bottle)', '../assests/images/stock/1390829805674e62edb9bc4.jpg', '21', '5', 24, 100, '1', 1),
(96, 'Redhorse Stallion (bottle)', '../assests/images/stock/1437751406674e62fc96478.jpg', '21', '5', 24, 100, '1', 1),
(97, 'Tiger Beer (bottle)', '../assests/images/stock/1170503256674e630f52111.jpg', '21', '3', 24, 100, '1', 1),
(98, 'Smirnoff Vodka (bottle)', '../assests/images/stock/426288452674e631ecb15a.jpg', '21', '5', 24, 100, '1', 1),
(99, 'Tanduay Dark Rhum (bottle)', '../assests/images/stock/1762753233674e633532c44.jpg', '21', '6', 10, 500, '1', 1),
(100, 'Tanduay Light Rhum (bottle)', '../assests/images/stock/548772279674e6348ec2be.jpg', '21', '6', 10, 500, '1', 1),
(101, 'El Hombre Tequila (bottle)', '../assests/images/stock/135856490674e635f9a4c7.jpg', '21', '6', 10, 500, '1', 1),
(102, 'Gilbeys Gin (bottle)', '../assests/images/stock/1507245873674e637628c1f.jpg', '21', '6', 10, 500, '1', 1),
(103, 'Alhambra Brandy (bottle)', '../assests/images/stock/809868076674e638767126.jpg', '21', '6', 10, 500, '1', 1),
(104, 'Baileys Irish Cream (bottle)', '../assests/images/stock/2119200427674e6398c8a21.jpg', '21', '6', 10, 500, '1', 1),
(105, 'Carlo Rossi (bottle)', '../assests/images/stock/296303131674e63ab756cf.jpg', '21', '6', 10, 500, '1', 1),
(106, 'Orchid Coconut Rhum (bottle)', '../assests/images/stock/664623150674e63c53fc9c.jpg', '21', '6', 10, 500, '1', 1),
(107, 'Orchid Triple Sec (bottle)', '../assests/images/stock/1608312938674e63d649c28.jpg', '21', '6', 10, 500, '1', 1),
(108, 'Orchid Blue Curacao (bottle)', '../assests/images/stock/2102106840674e63e63104b.jpg', '21', '6', 10, 500, '1', 1),
(109, 'Orchid Grenadine (bottle)', '../assests/images/stock/1987053630674e63f7b89b2.jpg', '21', '6', 10, 500, '1', 1),
(110, 'Coffee Liqueur (bottle)', '../assests/images/stock/2082599817674e640be43ab.jpg', '21', '6', 10, 500, '1', 1),
(111, 'Club Mix Lime Juice (bottle)', '../assests/images/stock/1040377445674e641bbd778.jpg', '21', '6', 10, 500, '1', 1),
(112, 'Sunquick Orange (bottle)', '../assests/images/stock/1029636260674e64317faf2.jpg', '21', '6', 10, 500, '1', 1),
(113, 'Summit Soda Water (bottle)', '../assests/images/stock/782049097674e643f9aa87.jpg', '21', '6', 10, 500, '1', 1),
(114, 'Lime (piece)', '../assests/images/stock/1269420190674e645dabf24.jpg', '21', '7', 10, 50, '1', 1),
(115, 'Mint Leaves (gram)', '../assests/images/stock/1397795507674e646b83e2a.jpg', '21', '7', 10, 50, '1', 1),
(116, 'Orange (piece)', '../assests/images/stock/1464745731674e64898f0b2.jpg', '21', '7', 10, 50, '1', 1),
(117, 'Pineapple Chunks (pack)', '../assests/images/stock/551247881674e64984ff28.jpg', '21', '7', 10, 50, '1', 1),
(118, 'Strawberry (piece)', '../assests/images/stock/990073438674e64a887192.jpg', '21', '7', 10, 50, '1', 1),
(119, 'Grapes (piece)', '../assests/images/stock/1387063735674e64b8243ad.jpg', '21', '7', 10, 50, '1', 1),
(120, 'Lemon (piece)', '../assests/images/stock/992213196674e64c6c5075.jpg', '21', '7', 10, 50, '1', 1),
(121, 'Anchor Butter (piece)', '../assests/images/stock/1576264599674e655db533f.jpg', '21', '8', 5, 100, '1', 1),
(122, 'Dari Cream (piece)', '../assests/images/stock/212096642674e65738e1d8.jpg', '21', '8', 5, 500, '1', 1),
(123, 'Mozarella Cheese (Anchor) kg', '../assests/images/stock/483581367567479abde5.jpg', '21', '8', 5, 100, '1', 1),
(124, 'Cream Cheese (Anchor) kg', '../assests/images/stock/41789613675674b7610a1.jpg', '21', '8', 5, 100, '1', 1),
(125, 'Cheddar Cheese (Chiz Boy) 350g/pack', '../assests/images/stock/2040489822675674e6e699f.jpg', '21', '8', 5, 100, '1', 1),
(126, 'Cheddar Cheese (for Sandwich) pack', '../assests/images/stock/13858417156756752594309.jpg', '21', '8', 5, 100, '1', 1),
(127, 'Parmsan Cheese (Alba Cheese) kg', '../assests/images/stock/19178692676756755bb05ba.jpg', '21', '8', 5, 100, '1', 1),
(128, 'American Cheese (Emborg) pack', '../assests/images/stock/1840972956756757e695b5.jpg', '21', '8', 5, 100, '1', 1),
(129, 'Mixed Veggies (pack)', '../assests/images/stock/1210809051675675b77b162.jpg', '21', '8', 5, 100, '1', 1),
(130, 'Pancake Syrup (Clara Ole) 355ml/bottle', '../assests/images/stock/14659125876756762b4ea92.jpg', '21', '20', 5, 100, '1', 1),
(131, 'SIRACHA SAUCE (SUNLEE) 500ml/bottle', '../assests/images/stock/1981695497675677033e33a.jpg', '21', '20', 5, 100, '1', 1),
(132, 'Sunquick Syrup (Sunquick) 330ml/bottle', '../assests/images/stock/74876864267567781dc478.jpg', '21', '20', 5, 100, '1', 1),
(133, 'Tomato Catsup (Del Monte) 120g/bottle', '../assests/images/stock/70165412675677c4ef505.jpg', '21', '20', 5, 100, '1', 1),
(134, 'Liquid Seasoning (Knorr) 2L', '../assests/images/stock/171505904767567825f0b48.jpg', '21', '20', 5, 100, '1', 1),
(135, 'Soy Sauce (Datu Puti) gallon', '../assests/images/stock/17874588156756787cab160.jpg', '21', '20', 5, 100, '1', 1),
(136, 'Vinegar (Datu Puti) gallon', '../assests/images/stock/270672744675678fdb92d2.jpg', '21', '20', 5, 100, '1', 1),
(137, 'Apple Cider Vinegar (Bragg) 946ml/bottle', '../assests/images/stock/1317208107675679521ea21.jpg', '21', '20', 5, 100, '1', 1),
(138, 'alhambra brandy', '../assests/images/stock/604503776756ed91d3e33.jpg', '21', '20', 10, 10, '2', 2),
(139, 'Hotsauce (Mothers Best) 375ml/bottle', '../assests/images/stock/16990598096756edbec1540.jpg', '21', '20', 5, 100, '1', 1),
(140, 'Pomace Olive Oil (Romoli) 5L', '../assests/images/stock/12420711556756ef1358e49.jpg', '21', '20', 5, 100, '1', 1),
(141, 'Butter Oil Substitute (Gold Bullion Bos) 20kg/gallon', '../assests/images/stock/10984772506756efb21dec3.jpg', '21', '20', 5, 100, '1', 1),
(142, 'Goldserve Vegetable Oil (Gold Serve) 17kg/gallon', '../assests/images/stock/19124956526756f064a7f58.jpg', '21', '20', 5, 100, '1', 1),
(143, 'Cheese Sauce (Magnolia) tub', '../assests/images/stock/21312684996756f0d0469bb.jpg', '21', '20', 5, 100, '1', 1),
(144, 'All Purpose Dressing (Magnolia) tub', '../assests/images/stock/5326922726756f11b3a0ef.jpg', '21', '20', 5, 100, '1', 1),
(145, 'Truffle Paste (jar)', '../assests/images/stock/20734279826756f16854e0d.jpg', '21', '20', 5, 100, '1', 1),
(146, 'Truffle Oil (250ml/bottle)', '../assests/images/stock/16136476196756f1cbdef7f.jpg', '21', '20', 5, 100, '1', 1),
(147, 'Peanut Butter (JayJays) 750g/jar', '../assests/images/stock/193539856756f2594aba3.jpg', '21', '20', 5, 100, '1', 1),
(148, 'Honey Mustard BBQ (Clara Ole) 255g/pack', '../assests/images/stock/6384427426756f2aa59b82.jpg', '21', '20', 5, 100, '1', 1),
(149, 'Black Olives Sliced (Dona Elma) 350g/jar', '../assests/images/stock/11341968016756f2f38a2a5.jpg', '21', '20', 5, 100, '1', 1),
(150, 'Barrio Fiesta Bagoong (500g/jar)', '../assests/images/stock/11719066506756f32c05d47.jpg', '21', '20', 5, 100, '1', 1),
(151, 'Fish Sauce (Datu Puti) 1L/bottle', '../assests/images/stock/5020543056756f375f0aa0.jpg', '21', '20', 5, 100, '1', 1),
(152, 'Atchara (bottle)', '../assests/images/stock/6606183146756f39f59ec6.jpg', '21', '20', 5, 100, '1', 1),
(153, 'Canned Diced Tomato (Dona Elena) 800g/can', '../assests/images/stock/850536386756f3e509b92.jpg', '21', '10', 5, 100, '1', 1),
(154, 'Peach Halves (Jolly) 200g/can ', '../assests/images/stock/12636838956756f4196f847.jpg', '21', '10', 5, 100, '1', 1),
(155, 'Mandarin Orange (Jolly) 825g/can', '../assests/images/stock/19415071126756f455ec663.jpg', '21', '10', 5, 100, '1', 1),
(156, 'Canned Mushrooms (Jolly) 200g/can', '../assests/images/stock/9469335796756f4ac44526.jpg', '21', '10', 5, 100, '1', 1),
(157, '555 Spicy Sardines Can', '../assests/images/stock/3554577076756f4f57061a.jpg', '21', '10', 5, 100, '1', 1),
(158, 'Century Tuna Can', '../assests/images/stock/19132468786756f516d0a73.jpg', '21', '10', 5, 100, '1', 1),
(159, 'Jersey Ube Condensed (390g/can)', '../assests/images/stock/21448291356756f54e61ee6.jpg', '21', '10', 5, 100, '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `type` enum('1','0','3') DEFAULT '3'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `type`) VALUES
(1, 'admin', 'admin', '1'),
(2, 'Employee', 'Employee', '0'),
(3, 'supplier', 'supplier', '3');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categories_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=160;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
