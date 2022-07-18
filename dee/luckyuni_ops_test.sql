-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 30, 2022 at 10:59 PM
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
-- Database: `luckyuni_ops_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `assemble2022`
--

CREATE TABLE `assemble2022` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `package` int(5) UNSIGNED ZEROFILL NOT NULL,
  `warehouse` int(8) UNSIGNED ZEROFILL NOT NULL,
  `qty` int(11) UNSIGNED ZEROFILL NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bonus2022`
--

CREATE TABLE `bonus2022` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `trans_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `wid_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `pov` float NOT NULL DEFAULT '0',
  `bonus` float NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `enroll`
--

CREATE TABLE `enroll` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `package` int(5) NOT NULL,
  `slot` tinyint(1) NOT NULL,
  `trans_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `enroll`
--

INSERT INTO `enroll` (`id`, `dsdid`, `package`, `slot`, `trans_id`, `date`) VALUES
(00000001, 00000012, 77777, 1, 00000002, '2021-04-01 13:55:21'),
(00000002, 00000012, 77778, 1, 00000003, '2021-05-07 13:55:27'),
(00000003, 00000012, 77778, 1, 00000003, '2021-05-07 13:55:27'),
(00000004, 00000483, 77777, 1, 00000004, '2021-04-16 20:52:31'),
(00000005, 00000442, 77777, 1, 00000006, '2021-06-19 12:43:44'),
(00000006, 00000486, 77777, 1, 00000008, '2021-06-30 16:02:43'),
(00000007, 00000322, 77777, 1, 00000009, '2021-07-05 13:43:01'),
(00000008, 00000483, 77778, 1, 00000012, '2021-07-19 22:35:17'),
(00000009, 00000483, 77778, 1, 00000012, '2021-07-19 22:35:17'),
(00000010, 00000483, 77778, 1, 00000012, '2021-07-19 22:35:17'),
(00000011, 00000483, 77778, 1, 00000012, '2021-07-19 22:35:17'),
(00000012, 00000483, 77778, 1, 00000012, '2021-07-19 22:35:17'),
(00000013, 00000483, 77778, 1, 00000012, '2021-07-19 22:35:17'),
(00000014, 00000483, 77778, 1, 00000012, '2021-07-19 22:35:17'),
(00000015, 00000483, 77778, 1, 00000012, '2021-07-19 22:35:17'),
(00000016, 00000483, 77778, 1, 00000012, '2021-07-19 22:35:17'),
(00000017, 00000483, 77778, 1, 00000012, '2021-07-19 22:35:17'),
(00000018, 00000487, 77777, 1, 00000013, '2021-07-22 18:06:12'),
(00000019, 00000340, 77777, 1, 00000015, '2021-07-26 14:49:12'),
(00000020, 00000488, 77777, 1, 00000018, '2021-08-07 00:18:48'),
(00000021, 00000489, 77777, 1, 00000020, '2021-08-07 14:32:29'),
(00000022, 00000490, 77777, 1, 00000021, '2021-08-23 08:05:25'),
(00000023, 00000491, 77777, 1, 00000023, '2021-10-14 15:56:13');

-- --------------------------------------------------------

--
-- Table structure for table `sales2022`
--

CREATE TABLE `sales2022` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `item` int(5) NOT NULL DEFAULT '0',
  `qty` int(4) NOT NULL DEFAULT '0',
  `pov` float NOT NULL DEFAULT '0',
  `price` float NOT NULL DEFAULT '0',
  `discount` float NOT NULL DEFAULT '0',
  `discount_code` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trans_id` int(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sharencare`
--

CREATE TABLE `sharencare` (
  `dsdid` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `dssid` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `trans_id` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `slot` tinyint(4) DEFAULT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sharencare`
--

INSERT INTO `sharencare` (`dsdid`, `dssid`, `trans_id`, `slot`, `date`) VALUES
(00000012, 00000001, 00000002, 1, '2021-04-01 13:55:21'),
(00000483, 00000002, 00000004, 1, '2021-04-16 20:52:31'),
(00000442, 00000394, 00000006, 1, '2021-06-19 12:43:44'),
(00000486, 00000434, 00000008, 1, '2021-06-30 16:02:43'),
(00000322, 00000002, 00000009, 1, '2021-07-05 13:43:01'),
(00000487, 00000410, 00000013, 1, '2021-07-22 18:06:12'),
(00000340, 00000013, 00000015, 1, '2021-07-26 14:49:12'),
(00000488, 00000002, 00000018, 1, '2021-08-07 00:18:48'),
(00000489, 00000002, 00000020, 1, '2021-08-07 14:32:29'),
(00000490, 00000434, 00000021, 1, '2021-08-23 08:05:25'),
(00000491, 00000429, 00000023, 1, '2021-10-14 15:56:13');

-- --------------------------------------------------------

--
-- Table structure for table `stockistfee2022`
--

CREATE TABLE `stockistfee2022` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `reorder_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `wid_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `warehouse` int(8) UNSIGNED ZEROFILL NOT NULL,
  `pov` float NOT NULL DEFAULT '0',
  `bonus` float NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `survey2022`
--

CREATE TABLE `survey2022` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `contact` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_fb` tinyint(1) NOT NULL DEFAULT '0',
  `dhub_fb` tinyint(1) NOT NULL DEFAULT '0',
  `lu_web` tinyint(1) NOT NULL DEFAULT '0',
  `refer` int(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions2022`
--

CREATE TABLE `transactions2022` (
  `trans_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `del_receiver` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_address` text COLLATE utf8_unicode_ci,
  `del_contact` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `del_note` text COLLATE utf8_unicode_ci,
  `pay_out` tinyint(1) NOT NULL DEFAULT '0',
  `pay_amount` float NOT NULL DEFAULT '0',
  `pay_fee` text COLLATE utf8_unicode_ci,
  `pay_date` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pay_note` text COLLATE utf8_unicode_ci,
  `pov` float NOT NULL DEFAULT '0',
  `submitted` datetime DEFAULT NULL,
  `referrer` int(8) UNSIGNED ZEROFILL NOT NULL,
  `customer_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `encoded_by` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encoded_on` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers2022`
--

CREATE TABLE `transfers2022` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `item` int(5) NOT NULL,
  `reorder_qty` int(11) NOT NULL,
  `transfer_qty` int(11) NOT NULL,
  `receive_qty` int(11) NOT NULL,
  `consolidate` int(11) NOT NULL,
  `transfer_id` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `reorder_id` int(8) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transfers2022`
--

INSERT INTO `transfers2022` (`id`, `item`, `reorder_qty`, `transfer_qty`, `receive_qty`, `consolidate`, `transfer_id`, `reorder_id`) VALUES
(00000001, 88911, 0, 100, 100, 0, 00000001, 00000000),
(00000002, 88909, 0, 100, 100, 0, 00000001, 00000000),
(00000003, 88908, 0, 50, 50, 0, 00000001, 00000000),
(00000004, 88896, 0, 1000, 1000, 0, 00000001, 00000000),
(00000005, 79832, 0, 20, 20, 0, 00000001, 00000000),
(00000006, 88905, 5, 0, 0, 0, NULL, 00000001),
(00000007, 88911, 10, 0, 0, 0, NULL, 00000001),
(00000008, 88896, 30, 0, 0, 0, NULL, 00000001),
(00000009, 79832, 5, 0, 0, 0, NULL, 00000001),
(00000010, 88905, 15, 0, 0, 0, NULL, 00000002),
(00000011, 88905, 15, 0, 0, 0, NULL, 00000003),
(00000012, 88911, 5, 0, 0, 0, NULL, 00000004),
(00000013, 88911, 1, 0, 0, 0, NULL, 00000005);

-- --------------------------------------------------------

--
-- Table structure for table `transfers_float2022`
--

CREATE TABLE `transfers_float2022` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `item` int(5) NOT NULL,
  `float_qty` int(11) NOT NULL,
  `transfer_date` datetime DEFAULT NULL,
  `conso_date` datetime DEFAULT NULL,
  `transfer_id` int(8) UNSIGNED ZEROFILL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `transfers_float2022`
--

INSERT INTO `transfers_float2022` (`id`, `item`, `float_qty`, `transfer_date`, `conso_date`, `transfer_id`) VALUES
(00000001, 88911, 0, '2022-06-21 16:58:00', NULL, 00000001),
(00000002, 88909, 0, '2022-06-21 16:58:00', NULL, 00000001),
(00000003, 88908, 0, '2022-06-21 16:58:00', NULL, 00000001),
(00000004, 88896, 0, '2022-06-21 16:58:00', NULL, 00000001),
(00000005, 79832, 0, '2022-06-21 16:58:00', NULL, 00000001);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals2022`
--

CREATE TABLE `withdrawals2022` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `amount` float NOT NULL DEFAULT '0',
  `purpose` tinyint(1) NOT NULL DEFAULT '0',
  `requested` datetime DEFAULT NULL,
  `released_on` datetime DEFAULT NULL,
  `released_by` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `released` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assemble2022`
--
ALTER TABLE `assemble2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonus2022`
--
ALTER TABLE `bonus2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales2022`
--
ALTER TABLE `sales2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockistfee2022`
--
ALTER TABLE `stockistfee2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey2022`
--
ALTER TABLE `survey2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions2022`
--
ALTER TABLE `transactions2022`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `transfers2022`
--
ALTER TABLE `transfers2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transfers_float2022`
--
ALTER TABLE `transfers_float2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals2022`
--
ALTER TABLE `withdrawals2022`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assemble2022`
--
ALTER TABLE `assemble2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bonus2022`
--
ALTER TABLE `bonus2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `sales2022`
--
ALTER TABLE `sales2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stockistfee2022`
--
ALTER TABLE `stockistfee2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey2022`
--
ALTER TABLE `survey2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions2022`
--
ALTER TABLE `transactions2022`
  MODIFY `trans_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers2022`
--
ALTER TABLE `transfers2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `transfers_float2022`
--
ALTER TABLE `transfers_float2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `withdrawals2022`
--
ALTER TABLE `withdrawals2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
