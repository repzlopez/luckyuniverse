-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 29, 2020 at 10:17 PM
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
-- Database: `luckyuni_profiles`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `un` varchar(32) DEFAULT NULL,
  `nn` varchar(32) DEFAULT NULL,
  `descrip` varchar(64) DEFAULT NULL,
  `pw` varchar(64) DEFAULT NULL,
  `global` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `receiver` varchar(64) DEFAULT NULL,
  `address` text,
  `contact` varchar(16) DEFAULT NULL,
  `pay_out` tinyint(1) DEFAULT '0',
  `referrer` varchar(8) DEFAULT NULL,
  `pw` varchar(64) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `distributors`
--

CREATE TABLE `distributors` (
  `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `dslnam` varchar(255) DEFAULT NULL,
  `dsfnam` varchar(255) NOT NULL,
  `dsmnam` varchar(255) DEFAULT NULL,
  `dsstreet` varchar(255) NOT NULL,
  `dsbrgy` varchar(255) NOT NULL,
  `dscity` varchar(255) NOT NULL,
  `dsprov` varchar(255) NOT NULL,
  `dscontact` varchar(32) DEFAULT NULL,
  `dsemail` varchar(64) DEFAULT NULL,
  `dsfb` varchar(64) DEFAULT NULL,
  `dsbirth` varchar(8) NOT NULL,
  `dssex` tinyint(1) NOT NULL DEFAULT '0',
  `dssid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `un` varchar(64) DEFAULT NULL,
  `pw` varchar(64) DEFAULT NULL,
  `payout` tinyint(1) DEFAULT '0',
  `pay_name` varchar(64) DEFAULT NULL,
  `pay_acct` varchar(32) DEFAULT NULL,
  `dsmtype` tinyint(1) DEFAULT '0',
  `discount` varchar(8) DEFAULT NULL,
  `dsencoded` varchar(8) DEFAULT NULL,
  `dsencodedby` varchar(64) DEFAULT NULL,
  `dsstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(5) UNSIGNED ZEROFILL NOT NULL DEFAULT '00000',
  `name` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `short` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `wsp` decimal(10,2) NOT NULL DEFAULT '0.00',
  `srp` decimal(10,2) NOT NULL DEFAULT '0.00',
  `web_srp` decimal(10,2) NOT NULL DEFAULT '0.00',
  `pov` decimal(10,2) NOT NULL DEFAULT '0.00',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dataset` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `distributors`
--
ALTER TABLE `distributors`
  ADD PRIMARY KEY (`dsdid`) USING BTREE;

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
