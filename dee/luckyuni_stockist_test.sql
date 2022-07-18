-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 30, 2022 at 11:00 PM
-- Server version: 5.6.41-84.1
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `luckyuni_stockist_test`
--

DELIMITER $$
--
-- Procedures
--
$$

$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(16) UNSIGNED ZEROFILL NOT NULL,
  `reftran` varchar(16) DEFAULT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `action` tinyint(1) NOT NULL,
  `login` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reorders`
--

CREATE TABLE `reorders` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `pay_amount` float NOT NULL,
  `s_fee` float NOT NULL,
  `s_pct` int(3) NOT NULL DEFAULT '0',
  `warehouse` int(8) UNSIGNED ZEROFILL NOT NULL,
  `reorder_from` int(8) UNSIGNED ZEROFILL NOT NULL,
  `submitted` datetime DEFAULT NULL,
  `approved` datetime DEFAULT NULL,
  `approved_by` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfer_id` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `reorders`
--

INSERT INTO `reorders` (`id`, `pay_amount`, `s_fee`, `s_pct`, `warehouse`, `reorder_from`, `submitted`, `approved`, `approved_by`, `transfer_id`, `status`) VALUES
(00000001, 30980, 1549, 5, 00000022, 00000001, '2022-06-21 18:16:30', NULL, NULL, NULL, 0),
(00000002, 22200, 1110, 5, 00000022, 00000001, '2022-06-21 18:32:46', '2022-06-21 22:01:45', '00000001', NULL, 1),
(00000003, 22200, 1110, 5, 00000022, 00000012, '2022-06-21 18:34:34', NULL, NULL, NULL, 0),
(00000004, 7400, 0, 5, 00000022, 00000012, '2022-06-21 18:45:13', NULL, NULL, NULL, 0),
(00000005, 1480, 0, 5, 00000022, 00000012, '2022-06-21 18:46:43', NULL, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `setup`
--

CREATE TABLE `setup` (
  `id` varchar(8) NOT NULL DEFAULT '',
  `warehouse` varchar(5) DEFAULT NULL,
  `receiver` varchar(32) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `address` text,
  `courier` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` varchar(13) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `item` int(5) DEFAULT NULL,
  `warehouse` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `safe` int(8) DEFAULT NULL,
  `qty` int(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `stocks`
--

INSERT INTO `stocks` (`id`, `item`, `warehouse`, `safe`, `qty`) VALUES
('0000000179832', 79832, 00000001, NULL, 15),
('0000000188896', 88896, 00000001, NULL, 970),
('0000000188908', 88908, 00000001, NULL, 50),
('0000000188909', 88909, 00000001, NULL, 100),
('0000000188911', 88911, 00000001, NULL, 90);

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `transfer_from` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfer_to` varchar(9) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transfer_date` datetime NOT NULL,
  `transfer_by` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `receive_date` datetime DEFAULT NULL,
  `receive_by` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `conso_date` datetime DEFAULT NULL,
  `conso_by` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `void_by` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transfers`
--

INSERT INTO `transfers` (`id`, `transfer_from`, `transfer_to`, `transfer_date`, `transfer_by`, `receive_date`, `receive_by`, `conso_date`, `conso_by`, `void_by`) VALUES
(00000001, 'STOCK IN', '00000001', '2022-06-21 16:58:00', 'grace', '2022-06-21 16:58:00', '00000001', NULL, NULL, ''),
(00000002, '00000001', '00000022', '2022-06-21 17:54:00', 'grace', NULL, NULL, NULL, NULL, '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `reorders`
--
ALTER TABLE `reorders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setup`
--
ALTER TABLE `setup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(16) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reorders`
--
ALTER TABLE `reorders`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
