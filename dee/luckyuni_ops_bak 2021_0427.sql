-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 27, 2021 at 03:53 AM
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
-- Database: `luckyuni_ops_bak`
--

-- --------------------------------------------------------

--
-- Table structure for table `bonus2021`
--

CREATE TABLE `bonus2021` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `trans_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `pov` float NOT NULL DEFAULT '0',
  `bonus` float NOT NULL DEFAULT '0'
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

-- --------------------------------------------------------

--
-- Table structure for table `sales2021`
--

CREATE TABLE `sales2021` (
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

-- --------------------------------------------------------

--
-- Table structure for table `survey2021`
--

CREATE TABLE `survey2021` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `contact` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lu_fb` tinyint(1) NOT NULL DEFAULT '0',
  `dhub_fb` tinyint(1) NOT NULL DEFAULT '0',
  `lu_web` tinyint(1) NOT NULL DEFAULT '0',
  `refer` int(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions2021`
--

CREATE TABLE `transactions2021` (
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
  `encoded_by` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `encoded_on` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals2021`
--

CREATE TABLE `withdrawals2021` (
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
-- Indexes for table `bonus2021`
--
ALTER TABLE `bonus2021`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `enroll`
--
ALTER TABLE `enroll`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales2021`
--
ALTER TABLE `sales2021`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey2021`
--
ALTER TABLE `survey2021`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions2021`
--
ALTER TABLE `transactions2021`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `withdrawals2021`
--
ALTER TABLE `withdrawals2021`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bonus2021`
--
ALTER TABLE `bonus2021`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `enroll`
--
ALTER TABLE `enroll`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales2021`
--
ALTER TABLE `sales2021`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `survey2021`
--
ALTER TABLE `survey2021`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions2021`
--
ALTER TABLE `transactions2021`
  MODIFY `trans_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `withdrawals2021`
--
ALTER TABLE `withdrawals2021`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
