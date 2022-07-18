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
-- Database: `luckyuni_ops`
--

-- --------------------------------------------------------

--
-- Table structure for table `assemble2021`
--

CREATE TABLE `assemble2021` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `package` int(5) UNSIGNED ZEROFILL NOT NULL,
  `warehouse` int(8) UNSIGNED ZEROFILL NOT NULL,
  `date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Table structure for table `bonus2021`
--

CREATE TABLE `bonus2021` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `trans_id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `wid_id` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `pov` float NOT NULL DEFAULT '0',
  `bonus` float NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
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

--
-- Dumping data for table `sales2021`
--

INSERT INTO `sales2021` (`id`, `item`, `qty`, `pov`, `price`, `discount`, `discount_code`, `trans_id`) VALUES
(00000001, 88803, 1, 2200, 2200, 220, 'isdistri', 00000001),
(00000002, 77726, 1, 1360, 1360, 136, 'isdistri', 00000001),
(00000003, 77729, 1, 688, 688, 68.8, 'isdistri', 00000001),
(00000004, 79828, 4, 2040, 2040, 204, 'isdistri', 00000001),
(00000005, 79827, 1, 680, 680, 68, 'isdistri', 00000001),
(00000006, 88826, 1, 2280, 2280, 228, 'isdistri', 00000001),
(00000007, 77777, 1, 0, 2900, 0, 'isdistri', 00000002),
(00000008, 77778, 2, 0, 464, 0, 'isdistri', 00000003),
(00000009, 77777, 1, 0, 2900, 0, '', 00000004),
(00000010, 88803, 1, 2200, 3055, 305.5, 'c505359a', 00000005),
(00000011, 88854, 1, 2200, 3055, 305.5, 'c505359a', 00000005),
(00000012, 88888, 5, 150, 208, 20.8, 'c505359a', 00000005),
(00000013, 77777, 1, 0, 2900, 0, 'isdistri', 00000006),
(00000014, 77726, 1, 1360, 1360, 136, 'isdistri', 00000007),
(00000015, 88826, 1, 480, 480, 48, 'isdistri', 00000007),
(00000016, 88829, 4, 2280, 2280, 228, 'isdistri', 00000007),
(00000017, 77777, 1, 0, 2900, 0, '', 00000008),
(00000018, 77777, 1, 0, 2900, 0, 'isdistri', 00000009),
(00000019, 88803, 1, 2200, 3055, 305.5, 'isdistri', 00000010),
(00000020, 79828, 4, 2040, 2833, 283.3, 'isdistri', 00000010),
(00000021, 79827, 1, 680, 944, 94.4, 'isdistri', 00000010),
(00000022, 77726, 2, 1360, 1888, 188.8, 'isdistri', 00000010),
(00000023, 88825, 1, 2280, 3166, 316.6, 'isdistri', 00000010),
(00000024, 88854, 2, 2200, 2200, 220, 'isdistri', 00000011),
(00000025, 88866, 1, 480, 480, 48, 'isdistri', 00000011),
(00000026, 79827, 1, 680, 680, 68, 'isdistri', 00000011),
(00000027, 77778, 10, 0, 464, 46.4, 'isdistri', 00000012),
(00000028, 77777, 1, 0, 2900, 0, '', 00000013),
(00000029, 88896, 5, 200, 200, 20, 'isdistri', 00000014),
(00000030, 88811, 5, 132, 132, 13.2, 'isdistri', 00000014),
(00000031, 77777, 1, 0, 2900, 0, 'isdistri', 00000015),
(00000032, 88896, 10, 200, 200, 20, 'isdistri', 00000016),
(00000033, 77777, 1, 0, 2900, 0, '', 00000018),
(00000034, 77777, 1, 0, 2900, 0, '', 00000019),
(00000035, 77777, 1, 0, 2900, 0, '', 00000020),
(00000036, 77777, 1, 0, 2900, 0, '', 00000021),
(00000037, 77777, 1, 0, 2900, 0, '', 00000023);

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
-- Table structure for table `stockistfee2021`
--

CREATE TABLE `stockistfee2021` (
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

--
-- Dumping data for table `transactions2021`
--

INSERT INTO `transactions2021` (`trans_id`, `del_receiver`, `del_address`, `del_contact`, `del_note`, `pay_out`, `pay_amount`, `pay_fee`, `pay_date`, `pay_note`, `pov`, `submitted`, `referrer`, `encoded_by`, `encoded_on`, `status`) VALUES
(00000001, 'Ruste, Zigmund Patrick', 'Tsekwa Store, #5 cor. Aquarius & Saturn St. GSIS, Matina Davao City Davao del Sur', '09566337124', '', 2, 15368, '0.00', '04172021', 'Wala pa kasali cranberry,pls pm para ma add ko, will deposit in your BPI', 15368, '2021-04-17 19:57:28', 00000474, '1', '2021-06-19 12:44:23', 3),
(00000002, 'Blaine Pelaez', 'pick-up', '09322021708', 'taken Mar 31 2021', 1, 2900, '0.00', '03312021', '', 0, '2021-05-07 13:28:01', 00000012, '1', '2021-06-19 12:44:28', 3),
(00000003, 'Mynard Porras', '86 Sabino Alley, Maysan, Valenzuela City', '09369659337', 'Grab ADR-XS4FQBTGWG74', 0, 1076, '148.00', '04152021', '', 0, '2021-05-07 13:50:52', 00000012, '1', '2021-06-19 12:44:32', 3),
(00000004, 'Rennie Wong', '17 25th Street East Bajac Olongapo City Zambales', '09989987725', '', 1, 2900, '0.00', '04162021', '', 0, '2021-05-27 20:51:14', 00000002, '1', '2021-06-19 12:44:36', 3),
(00000005, 'ALEXANDRA SY', 'Unit 1A Park Avenue and Clifton Street Vermont Park \r\nMAYAMOT, Antipolo City', '09189638443', '', 4, 6435, 'TO FOLLOW', '06082021', '', 5150, '2021-06-08 10:59:18', 00000008, NULL, NULL, 4),
(00000006, 'Empenida, Rebecca Belasa', 'Block 31 Lot 6 Sarangani Homes Phase 1 San Isidro, Lagao General Santos City South Cotabato', '09060170090', '', 1, 2900, '0.00', '06192021', '', 0, '2021-06-19 12:41:43', 00000442, '1', '2021-06-19 12:43:58', 3),
(00000007, 'Tan, Mercy', 'AB Tan Bldg National Hi way San Antonio Binan Laguna', '09178368656', '', 4, 10960, '0.00', '06272021', '', 10960, '2021-06-27 17:41:40', 00000389, '1', '2021-06-30 11:47:05', 3),
(00000008, 'Ludmilla Gadon', '49 northlane st greymarville subd Talon dos Las Pinas City Tabaco Albay', '09159425894', '', 0, 2900, '0.00', '06302021', '', 0, '2021-06-30 10:38:55', 00000434, '1', '2021-07-09 18:57:42', 3),
(00000009, 'Pingoo Edelmina', 'Zone 4 Zone 4 Capalangan, Apalit, Pampanga', '09996777500', 'Ship with 3 Packs of Spirulina', 0, 2900, '0.00', '07042021', 'Payment was deposited to M.Grace Co\'s account already', 0, '2021-07-04 07:30:04', 00000322, '1', '2021-07-09 18:58:52', 3),
(00000010, 'Ruste, Zigmund Patrick', 'Tsekwa Store, #5 cor. Aquarius & Saturn St. GSIS, Matina Davao City Davao del Sur', '09566337124', '', 0, 22273, '0.00', '07192021', '', 16040, '2021-07-19 09:26:02', 00000474, '1', '2021-08-06 22:35:33', 3),
(00000011, 'Michelle Chan', 'Lalamove', '09178873343', 'Please do not include the sales invoice in the package. Lalamove will pick up at CityLand Lobby 19July2021. Thank you.', 0, 5560, '0.00', '07192021', 'Payment to follow upon receipt of orders via BPI Grace Chua account', 5560, '2021-07-19 11:10:38', 00000472, '1', '2021-07-19 22:35:32', 3),
(00000012, 'Wong, Rennie', '17 25th Street East Bajac Olongapo City Zambales', '09989987725', '', 0, 4640, '0.00', '07192021', '', 0, '2021-07-19 22:34:44', 00000483, '1', '2021-07-23 15:40:46', 3),
(00000013, 'Ernesto Narvaez', '1187 Carola St. Brgy. 480 Manila Metro Manila', '09420426071', '', 1, 2900, '0.00', '07222021', '', 0, '2021-07-22 18:04:16', 00000410, '1', '2021-07-23 15:40:23', 3),
(00000014, 'Narvaez, Ernesto Lumaquin', '1187 Carola St. Brgy. 480 Manila Metro Manila', '09420426071', '', 2, 1660, '0.00', '07222021', '', 1660, '2021-07-22 18:19:50', 00000487, '1', '2021-07-23 15:40:34', 3),
(00000015, 'Mescallado, Aubrey', '1697 Paz St. Paco Manila City Metro Manila', '09279529318', '', 1, 2900, '0.00', '07262021', '', 0, '2021-07-26 11:11:49', 00000340, '1', '2021-07-26 16:19:35', 3),
(00000016, 'Mescallado, Aubrey', '1697 Paz St. Paco Manila City Metro Manila', '09279529318', '2 probiotics', 1, 2133, '133.00', '07262021', '', 2000, '2021-07-26 11:16:02', 00000340, '1', '2021-07-26 16:19:44', 3),
(00000017, 'Paige Yu', 'No. 2 columbia st. Ferndale villas \r\nPasong tamo Q.C.', '09175526435', '', 0, 1783.8, 'TO FOLLOW', '07312021', 'Pls. Txt me 1 day before deliver', 0, '2021-07-31 14:36:34', 00000002, NULL, NULL, 4),
(00000018, 'Maeva Chan', '94 M.L. Quezon St Parang Marikina Metro-Manila', '09176208866', '', 0, 3049, '149.00', '08072021', '', 0, '2021-08-07 00:02:47', 00000002, '1', '2021-08-07 19:02:27', 3),
(00000019, 'Maeva Chan', '94 M.L. Quezon St Parang Marikina Metro-Manila', '09176208866', '', 4, 2900, 'TO FOLLOW', '08072021', '', 0, '2021-08-07 00:19:33', 00000002, NULL, NULL, 4),
(00000020, 'Karisse Young', 'President M Roxas street Industrial Valley Marikina City METRO MANILA', '09178485812', '', 4, 3030, '130.00', '08072021', '', 0, '2021-08-07 14:28:18', 00000002, '1', '2021-08-07 19:02:18', 3),
(00000021, 'Muriel Paua', '442 Zaragosa St Tondo Manila 1 Manila Tondo Manila', '09498414992', '', 0, 3028, '128.00', '08222021', '', 0, '2021-08-22 13:27:37', 00000434, '1', '2021-08-23 08:11:24', 3),
(00000022, 'Chan, Maeva Sy', '94 M.L. Quezon St Parang Marikina Metro-Manila', '09176208866', '', 3, 149, '149.00', '09172021', '', 6080, '2021-09-16 23:57:25', 00000002, '1', '2021-10-05 20:30:54', 3),
(00000023, 'Cheryll Anne Trivino', '38 Rafael Palma st. PDP executive village BF Homes ParaÃ±aque Metro Manila', '09189390704', '', 0, 2900, '0.00', '10142021', '', 0, '2021-10-14 15:54:13', 00000429, '1', '2021-10-14 15:56:53', 3);

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
-- Table structure for table `transfers2021`
--

CREATE TABLE `transfers2021` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `item` int(5) NOT NULL,
  `transfer_qty` int(11) NOT NULL,
  `receive_qty` int(11) NOT NULL,
  `transfer_id` int(8) UNSIGNED ZEROFILL DEFAULT NULL
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
  `reorder_id` int(8) UNSIGNED ZEROFILL NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
-- Indexes for table `assemble2021`
--
ALTER TABLE `assemble2021`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `assemble2022`
--
ALTER TABLE `assemble2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonus2021`
--
ALTER TABLE `bonus2021`
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
-- Indexes for table `sales2021`
--
ALTER TABLE `sales2021`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales2022`
--
ALTER TABLE `sales2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockistfee2021`
--
ALTER TABLE `stockistfee2021`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockistfee2022`
--
ALTER TABLE `stockistfee2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey2021`
--
ALTER TABLE `survey2021`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `survey2022`
--
ALTER TABLE `survey2022`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions2021`
--
ALTER TABLE `transactions2021`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `transactions2022`
--
ALTER TABLE `transactions2022`
  ADD PRIMARY KEY (`trans_id`);

--
-- Indexes for table `transfers2021`
--
ALTER TABLE `transfers2021`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `withdrawals2021`
--
ALTER TABLE `withdrawals2021`
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
-- AUTO_INCREMENT for table `assemble2021`
--
ALTER TABLE `assemble2021`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `assemble2022`
--
ALTER TABLE `assemble2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bonus2021`
--
ALTER TABLE `bonus2021`
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
-- AUTO_INCREMENT for table `sales2021`
--
ALTER TABLE `sales2021`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `sales2022`
--
ALTER TABLE `sales2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stockistfee2021`
--
ALTER TABLE `stockistfee2021`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `stockistfee2022`
--
ALTER TABLE `stockistfee2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey2021`
--
ALTER TABLE `survey2021`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `survey2022`
--
ALTER TABLE `survey2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions2021`
--
ALTER TABLE `transactions2021`
  MODIFY `trans_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `transactions2022`
--
ALTER TABLE `transactions2022`
  MODIFY `trans_id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers2021`
--
ALTER TABLE `transfers2021`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers2022`
--
ALTER TABLE `transfers2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers_float2022`
--
ALTER TABLE `transfers_float2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals2021`
--
ALTER TABLE `withdrawals2021`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdrawals2022`
--
ALTER TABLE `withdrawals2022`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
