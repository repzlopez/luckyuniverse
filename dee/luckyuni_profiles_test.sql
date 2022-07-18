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
-- Database: `luckyuni_profiles_test`
--

DELIMITER $$
--
-- Procedures
--
$$

DELIMITER ;

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

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `un`, `nn`, `descrip`, `pw`, `global`, `status`) VALUES
(999, 'webstat', 'webStat', 'on/off Website Status', 'bfac19ef5a895bf2e4aa2dda63218c3471ee3a67', 0, 1),
(994, 'webcart', 'webCart', 'on/off Cart', '4af1b9ae2f9a7a12a00472b264e23144106dde59', 0, 1),
(990, 'repz', 'Repz Lopez', NULL, 'a9eb6e123da0cb665c0eff90aa97016a144e4fcd', 1, 1),
(997, 'weblogin', 'webLogin', 'on/off Distributor Login', 'e7fe14a9549508226d53a5d76fcc09edcf09f612', 0, 1),
(998, 'webupdate', 'webUpdate', 'on/off Update Status', '8c30020ae39c8e127fe1037dd8b08b6b031b5301', 0, 0),
(995, 'webshop', 'webShop', 'on/off Shop', '60f7832ba6a852a314a6d0607bdf1b46d57d40e0', 0, 1),
(993, 'websrp', 'webSRP', 'on/off Web SRP on Cart', 'bbdfde2c803c21e75c8d891d62d503f41bf972bf', 0, 1),
(996, 'webnotif', 'webNotif', 'on/off Notifications', 'e659dabfd78278d0f759e15889074825d0ec27d1', 0, 0),
(103, 'joyce', 'Joyce', NULL, '59ad939b68189b3b65a285546ee819de7447b7c0', 0, 1),
(123, 'grace', 'Grace', NULL, '7c03afa86cd2692a5bb663fd1c891c860bde5845', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bonuses`
--

CREATE TABLE `bonuses` (
  `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `bonus` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `bonuses`
--

INSERT INTO `bonuses` (`dsdid`, `bonus`) VALUES
(00000001, 450),
(00000002, 4730.8),
(00000013, 900),
(00000058, 250),
(00000309, 0),
(00000379, 1096),
(00000394, 250),
(00000410, 582),
(00000429, 500),
(00000434, 500);

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
  `dsmother` varchar(64) DEFAULT NULL,
  `dsstreet` varchar(255) NOT NULL,
  `dsbrgy` varchar(255) NOT NULL,
  `dscity` varchar(255) NOT NULL,
  `dsprov` varchar(255) NOT NULL,
  `dscontact` varchar(32) DEFAULT NULL,
  `dsemail` varchar(64) DEFAULT NULL,
  `dsemail_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `dsfb` varchar(64) DEFAULT NULL,
  `dsbirth` varchar(8) NOT NULL,
  `dssex` tinyint(1) NOT NULL DEFAULT '0',
  `dstin` text,
  `dssid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `un` varchar(64) DEFAULT NULL,
  `pw` varchar(64) DEFAULT NULL,
  `payout` tinyint(1) DEFAULT '0',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0',
  `pay_name` varchar(64) DEFAULT NULL,
  `pay_acct` varchar(32) DEFAULT NULL,
  `dsmtype` tinyint(1) DEFAULT '0',
  `discount` varchar(8) DEFAULT NULL,
  `dsencoded` varchar(8) DEFAULT NULL,
  `dsencodedby` varchar(64) DEFAULT NULL,
  `withheld` tinyint(1) NOT NULL DEFAULT '0',
  `dsstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributors`
--

INSERT INTO `distributors` (`dsdid`, `dslnam`, `dsfnam`, `dsmnam`, `dsmother`, `dsstreet`, `dsbrgy`, `dscity`, `dsprov`, `dscontact`, `dsemail`, `dsemail_confirm`, `dsfb`, `dsbirth`, `dssex`, `dstin`, `dssid`, `un`, `pw`, `payout`, `pay_type`, `pay_name`, `pay_acct`, `dsmtype`, `discount`, `dsencoded`, `dsencodedby`, `withheld`, `dsstatus`) VALUES
(00000011, 'De Vera', 'Charity', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'DeVeraCharity', '81bc3812f0697c17c2ac73c7783e1b34931f2516', 0, 0, 'Charity De Vera', '', 2, '1634e56a', '06192017', 'GCC', 0, 1),
(00000012, 'Pelaez', 'Blaine', 'Paragat', NULL, 'B89 L9 Matahimik St.', 'Pangarap Village', 'Caloocan', 'Metro Manila', '9322021709', 'blaine.pelaez1128@gmail.com', 0, '', '11021972', 2, NULL, 00000001, 'PelaezBlaine', '7d7adf6ea4bfbb07aea46b5f561efc6f8693426d', 0, 0, 'Blaine Pelaez', '', 2, 'cf12a667', '06202017', 'GCC', 0, 1),
(00000008, 'Sy', 'Alexandra', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'SyAlexandra', '59238e69446020206b64d9863e648c6a98d23f88', 0, 0, 'Alexandra Sy', '', 2, 'c505359a', '06152017', 'GCC', 0, 1),
(00000010, 'Estillos', 'Gerry', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000005, 'EstillosGerry', '16b4df02d6daac02cb1537ee561f0a8b680d1bab', 0, 0, 'Gerry Estillos', '', 2, 'a129246e', '06152017', 'GCC', 0, 1),
(00000009, 'Brital', 'Malyn', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000005, 'BritalMalyn', '71d685ccd599a43e12fe8ffbaebce95692f5010c', 0, 0, 'Malyn Brital', '', 2, '7218f49e', '06152017', 'GCC', 0, 1),
(00000007, 'Quitay', 'Ma. Lorelee', 'Kinikot', NULL, '37 Camachile St.', ' Western Bicutan', ' Taguig', ' Metro Manila', '9554681797', 'mlquitay@yahoo.com', 0, '', '12291975', 2, NULL, 00000001, 'QuitayLorelee', 'ac2beb71c6c085bef477f485f3212b889d3bb97d', 0, 0, 'Ma. Lorelee Quitay', '3049101502', 3, '78b87aa2', '06152017', 'GCC', 0, 1),
(00000006, 'Apat', 'Dioleta', 'Estaniel', NULL, '', 'Bagong Silang', '', 'Davao del Norte', '9097854129', '', 0, '', '10151970', 2, NULL, 00000001, 'ApatDioleta', '7ba3792c1bd02746d1fe660d5654bfa4c39b9018', 0, 0, 'Dioleta Apat', '', 2, 'cfa5bba6', '06152017', 'GCC', 0, 1),
(00000005, 'Brital', 'Gina', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'BritalGina', '2546aad1b35e1fb7fdcdb9e5c2362fff32f2577b', 0, 0, 'Gina Brital', '', 2, '1683f8ab', '06052017', 'GCC', 0, 1),
(00000004, 'Neria', 'Lorraine', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'NeriaLorraine', 'a37ddb1183cfdfd106c3845374357f2e454434e8', 0, 0, 'Lorraine Neria', '', 2, 'a19e39af', '06052017', 'GCC', 0, 1),
(00000001, 'Regulto', 'Alexis', 'Dela Cruz', NULL, 'Unit 509 Integrated Professional Offices, #14 Quezon Avenue', 'Dona Josefa', 'Quezon City', 'Metro Manila', '09423692717', 'alexisregulto@gmail.com', 0, '', '04291975', 1, NULL, 00000000, 'RegultoAlexis', 'a2bcdc8fbebd49ee9f2730503621f8e947c378b1', 0, 0, 'Alexis Regulto', '', 0, 'caf5fcb8', '06012017', 'GCC', 0, 1),
(00000002, 'Co', 'Grace', 'Chua', 'Sin Bee Lim', '35 Calvary Hill Street', 'Damayang Lagi', 'Quezon City', 'Metro Manila', '09175357033', 'grace@luckyuniverseph.com', 0, 'grace.co.dhub', '01231970', 2, '109682208000', 00000000, 'CoGrace', '6c741c3076eba33e6a4cbaccac3187e5860b2a61', 2, 0, 'Grace Co', '0219108877', 0, '13d3bfb5', '06012017', 'GCC', 0, 1),
(00000003, 'Baxinela', 'Mario', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'BaxinelaMario', '351f992f58fcc628380236c27bb5f340e1d145c3', 0, 0, 'Mario Baxinela', '', 1, 'a4ce7eb1', '09182017', 'GCC', 0, 1),
(00000037, 'Mesiderio', 'Genoveva', 'Sta. Romana', '', 'Gama Grande', 'Calinog', 'Iloilo', 'Iloilo', '9102184183', '', 0, '', '99999999', 2, '', 00000024, 'MesiderioGenoveva', '0ce54cdca885780c9412bb826d46853a26eca5b5', 0, 0, 'Genoveva Mesiderio', '', 2, 'abe791d0', '09052017', 'GCC', 0, 1),
(00000064, 'Te', 'Gerardine', 'Veloso', '', '', '', '', '', '', '', 0, '', '99999999', 2, '', 00000002, 'TeGerardine', '3981faf6dabbcbea7d36628e330ea5bfadca3015', 0, 0, 'Gerardine Te', '', 2, '0721ef4a', '10242017', 'GCC', 0, 1),
(00000018, 'Dingos', 'Raquel', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000013, 'DingosRaquel', 'c181ad8439ae0b395eb0d5838b6029bb6f8286de', 0, 0, 'Raquel Dingos', '', 0, '19c42c48', '07012017', 'GCC', 0, 1),
(00000020, 'Estayo', 'Mariel', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000013, 'EstayoMariel', '682c9f1b4ade1489f6a82c4cc67a7b248444e552', 0, 0, 'Mariel Estayo', '', 0, '7276cf1c', '07152017', 'GCC', 0, 1),
(00000021, 'Santiago', 'Maritess', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000011, 'SantiagoMaritess', '1267fbbbddcb67dec4bd84fc20d97f53b639de31', 0, 0, 'Maritess Santiago', '', 0, 'c56b0e18', '07162017', 'GCC', 0, 1),
(00000000, 'Lucky Universe', 'RCA', '', NULL, 'Unit 509 Integrated Professional Offices, #14 Quezon Avenue', 'Dona Josefa', 'Quezon City', 'Metro Manila', '09175357033', 'luckyuniverse11@gmail.com', 0, '', '09112017', 0, NULL, 00000000, 'RCA', 'bf145b230a83ca5e6fcfa1ac6a370e26c74fd290', 2, 0, 'RCA Lucky Universe', '', 0, '7de83dbc', '06012017', 'GCC', 0, 1),
(00000013, 'Nemenzo', 'Maria Lourdes', 'Haber', '', 'B9 L17 Mary Grace Sta. Rosa I', '', 'Marilao', 'Bulacan', '9109966638', '', 0, '', '05121986', 2, '', 00000001, 'NemenzoLourdes', 'e1a9d1d8e5b3a17adcd7522e8e249de867efe491', 0, 0, 'Maria Lourdes Nemenzo', '', 3, '780f6763', '06212017', 'GCC', 1, 0),
(00000014, 'Benitez', 'Joel', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000007, 'BenitezJoel', '8f210011b5c409779dc1e4f949e9dd75fd3cca8c', 0, 0, 'Joel Benitez', '', 2, '7d5f207d', '06242017', 'GCC', 0, 1),
(00000015, 'Ferreras', 'Edesa', 'Calupas', NULL, '10 Katipunan', 'Kaliwa Bagbag', 'Novaliches, Quezon City', ' Metro Manila', '9476083287', 'dessa_ferreras@yahoo.com', 0, '', '09221995', 2, NULL, 00000013, 'FerrerasEdesa', '1ae589c25aaccc6302b52942a726cdcc828ac824', 0, 0, 'Edesa Ferreras', '', 2, 'ca42e179', '06282017', 'GCC', 0, 1),
(00000016, 'Bosquillos', 'Emily', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000013, 'BosquillosEmily', '7ab70473f15dc211ef4449f4528b7b55d2f863a5', 0, 0, 'Emily Bosquillos', '', 3, '1364a274', '06302017', 'GCC', 0, 1),
(00000017, 'Co', 'Joshua Anthony', 'Chua', NULL, '35 Calvary Hill St.', 'Damayang Lagi', 'Quezon City', 'Metro Manila', '9178357055', '', 0, '', '07071995', 1, NULL, 00000423, 'CoJoshua', '0b4b82ffa5be0bd1918dba7c821e95140e5ee906', 0, 0, 'Joshua Anthony Co', '', 2, 'a4796370', '07012017', 'GCC', 0, 1),
(00000022, 'Arellano', 'Myra', 'Uclaray', '', '99 Congressional Ave.', 'Project 8', 'Quezon City', 'Metro Manila', '9175133626', 'richee1028@yahoo.com', 0, '', '10281979', 2, '', 00000001, 'ArellanoMyra', '1061f7b5d4413e395cfa788af0416bcbbaa7eab8', 0, 0, 'Myra Arellano', '2389065261', 3, '1c4d4d15', '09102017', 'GCC', 0, 1),
(00000023, 'Mancenido', 'Elizalde Jr.', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'MancenidoElizaldeJr', '1159f81869eacfaebd1477d7df4f1e5c661ee917', 0, 0, 'Elizalde Mancenido Jr.', '', 2, 'ab508c11', '07282017', 'GCC', 0, 1),
(00000024, 'Galvez', 'Maryam', '', '', 'Ramos Ext. Brgy. Purok 1 Pavia', 'Iloilo City', 'Iloilo', 'Iloilo', '9237402148', 'maryamgalvez@gmail.com', 0, '', '05101967', 2, '', 00000001, 'GalvezMaryam', 'c00d9352a378e27de5b4c7ea5ddb521522a4a124', 0, 0, 'Maryam Galvez', '', 3, 'ae00cb0f', '08022017', 'GCC', 0, 1),
(00000025, 'Barretto', 'Lourdes', 'Ang', NULL, '29-6 Araneta Avenue', ' Barangay Potrero', ' Malabon City', ' Metro Manila', '9207230437', '', 0, '', '12221955', 2, NULL, 00000002, 'BarrettoLourdes', 'ee720c39982e6f68d58afa5cad8257c834744d21', 0, 0, 'Lourdes Barretto', '', 3, '191d0a0b', '08042017', 'GCC', 0, 1),
(00000026, 'Santos', 'Teresita', 'Yap', NULL, 'B56 L60 Taurus Street', ' Heritage Homes', ' Marilao', ' Bulacan', '9054455529', 'tysantos@smg.sanmiguel.com.ph', 0, '', '05161972', 2, NULL, 00000001, 'SantosTeresita', '91beb1b90d8dabc91ec62acdc3b5e41a1d0d54a5', 0, 0, 'Aquilles Ranier Ronquilo Santos', '4169399064', 3, 'c03b4906', '08092017', 'GCC', 0, 1),
(00000027, 'Bactung', 'Geraldine', 'Betiwan', '', 'Brgy. Pandac', 'Pavia', 'Iloilo', 'Iloilo', '9561658640', 'jarahfaciuos@gmail.com', 0, '', '99999999', 2, '', 00000024, 'BactungGeraldine', 'f3c606e9c6320794f7a2f7a12c6e9ac45b0bc909', 0, 0, 'Geraldine Bactung', '', 2, '77268802', '08142017', 'GCC', 0, 1),
(00000028, 'Gumafelix', 'Cris', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000001, 'GumafelixCris', 'e435e78373f6e5ddd9bd31aeb03684f03d4c526d', 0, 0, 'Cris Gumafelix', '', 2, 'ca9bc73a', '08132017', 'GCC', 0, 1),
(00000029, 'Cayetano', 'Joy', 'Tembrevilla', NULL, 'B8 L1 Orchid St. Florvel Home', ' Oton', 'Iloilo', 'Iloilo', '9297488628', 'joytc09@yahoo.com', 0, '', '99999999', 2, NULL, 00000024, 'CayetanoJoy', 'd613c9fb8dd67a99d32ab66915512103300acb61', 0, 0, 'Joy Cayetano', '', 2, '7d86063e', '08152017', 'GCC', 0, 1),
(00000030, 'Kang', 'Clarissa', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000017, 'KangClarissa', 'ecdf3aa6b289f84e3b3559b78d04c61a8c37d467', 0, 0, 'Clarissa Kang', '', 2, 'aeb7d6ce', '08172017', 'GCC', 0, 1),
(00000031, 'Al-wahaibi', 'Jean', 'Zerrudo', NULL, 'B19 L42 P-2 Deca Homes', ' Pandac Pavia', 'Iloilo', 'Iloilo', '9159131794', 'jeanzerrudo29@gmail.com', 0, '', '99999999', 2, NULL, 00000024, 'AlwahaibiJean', 'f9819a0cef2f51066b9e845eca874ea6fc3ec8db', 0, 0, 'Jean Al-wahaibi', '', 3, '19aa17ca', '08232017', 'GCC', 0, 1),
(00000032, 'Octaviano', 'Elna', 'Pinuela', '', 'Jolaud Sur.', 'Zarraga', 'Iloilo', 'Iloilo', '9083690745', '', 0, '', '99999999', 2, '', 00000024, 'OctavianoElna', 'c822c8870ebad1fe4e8349efae58c13e1a5bb379', 0, 0, 'Elna Octaviano', '', 2, 'c08c54c7', '08312017', 'GCC', 0, 1),
(00000033, 'Depamaylo', 'Gina', 'Flores', '', 'Gomez St.', 'Zarraga', 'Iloilo', 'Iloilo', '9179450995', '', 0, '', '99999999', 2, '', 00000024, 'DepamayloGina', 'a2b5cee5b95559f8c94b9ee9df1be9c9ab317aeb', 0, 0, 'Gina Depamaylo', '', 2, '779195c3', '08312017', 'GCC', 0, 1),
(00000034, 'Domantay', 'Warren', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'DomantayWarren', 'e953a035f934629d5003d02e0b2d357f67a230c3', 0, 0, 'Warren Domantay', '', 2, '72c1d2dd', '08262017', 'GCC', 0, 1),
(00000035, 'Tanig', 'Marvin', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'TanigMarvin', '9b4092c3a0956092ebd01a2c10c5d4c79dd62c93', 0, 0, 'Marvin Tanig', '', 2, 'c5dc13d9', '08242017', 'GCC', 0, 1),
(00000036, 'Regulto', 'Peter John', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'RegultoPJ', '0c653732f2cc0330a036be82e5b36019e66a6bfe', 0, 0, 'Peter John Regulto', '', 2, '1cfa50d4', '08242017', 'GCC', 0, 1),
(00000038, '', 'Agnes', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000006, 'Agnes', '2ab5119555a0fa5ea8d6424e1b759be6ef1efae3', 0, 0, 'Agnes ', '', 2, '165adee8', '09042017', 'GCC', 0, 1),
(00000039, 'Diamante', 'Corazon', 'Amparo', '', 'Ilaya 1st', '', 'Dumangas', 'Iloilo', '9501085801', '', 0, '', '99999999', 2, '', 00000024, 'DiamanteCorazon', 'ad41b7992dc3e1aadd45ec693a7cfcf2a3fce281', 0, 0, 'Corazon Diamante', '', 2, 'a1471fec', '09082017', 'GCC', 0, 1),
(00000040, 'Cachuela', 'Marlin', 'Garcia', '', 'Rizal Ilaud', 'Calinog', 'Dumangas', 'Iloilo', '9072301073', 'marlincachuela@gmail.com', 0, '', '99999999', 0, '', 00000024, 'CachuelaMarlin', 'c948350f217da516fb0224d91c4507b19957861f', 0, 0, 'Marlin Cachuela', '', 2, 'd4c919f9', '09082017', 'GCC', 0, 1),
(00000041, 'Mirabuenos', 'Monica', 'Buenaobra', NULL, '991 Purok 1', ' Tikay', 'Dumangas', 'Bulacan', '9068094218', '', 0, '', '03311995', 2, NULL, 00000013, 'MirabuenosMonica', '60e9072c528ff811568a89d754dc0ce2b0463ddb', 0, 0, 'Monica Mirabuenos', '', 2, '63d4d8fd', '09092017', 'GCC', 0, 1),
(00000042, 'Ganancial', 'Mary', 'Ballinas', NULL, 'BBC Little Baguio', ' Concepcion', 'Dumangas', 'Tarlac', '', '', 0, '', '01061964', 2, NULL, 00000001, 'GanancialMary', 'aebfcc56c53c78b47a4e2bdf8a39aac493d9d594', 0, 0, 'Mary Ganancial', '', 3, 'baf29bf0', '09092017', 'GCC', 0, 1),
(00000043, 'Rebulado', 'Esther', 'Lacbanes', NULL, 'B4 L12 Duhat St.', ' Palmera Woodlands', 'Antipolo City', ' Rizal', '9178582134', 'estherrebulado@yahoo.com', 0, '', '12261900', 2, NULL, 00000042, 'RebuladoEsther', '77601eeb35664e013455539cdd31e605d2ac997b', 0, 0, 'Esther Rebulado', '', 2, '0def5af4', '09112017', 'GCC', 0, 1),
(00000044, 'Mateo', 'Merlin', 'De Guzman', NULL, '007 D. Macam St.', ' Taal', 'Bocaue', ' Bulacan', '9178396898', 'merlinmateo2014@gmail.com', 0, '', '09221978', 1, NULL, 00000013, 'MateoMerlin', '024f1fea709c8a6272bdfe263a6323eba272d0e1', 0, 0, 'Merlin Mateo', '', 2, '08bf1dea', '09202017', 'GCC', 0, 1),
(00000045, 'Basultin', 'Merlyn', 'Gardose', '', '', 'Carmelo', 'Banate', 'Iloilo', '9123119899', '', 0, '', '99999999', 2, '', 00000003, 'BasultinMerlyn', '84b7a90200119c4cb2671086936aab14fbd8402c', 0, 0, 'Merlyn Basultin', '', 3, 'bfa2dcee', '09262017', 'GCC', 0, 1),
(00000046, 'Dela Cruz', 'Rosh Hashanah', 'Diapen', '', '', '', 'Iloilo City', 'Iloilo', '9173051518', 'hash10_1213@yahoo.com', 0, '', '99999999', 0, '', 00000024, 'DelaCruzRosh', '1d9e930ddd392ba12682dc4abaa17498cd1dc0db', 0, 0, 'Rosh Hashanah Dela Cruz', '', 2, '66849fe3', '09282017', 'GCC', 0, 1),
(00000047, 'Muhminin', 'Nelyn', 'Simbajon', '', 'Poblacion', '', 'Iloilo City', 'Iloilo', '9298877397', '', 0, '', '99999999', 2, '', 00000024, 'MuhmininNelyn', 'b90c34c4b158149c029ab3dcd8a972c198c40e09', 0, 0, 'Nelyn Muhminin', '', 2, 'd1995ee7', '09282017', 'GCC', 0, 1),
(00000048, 'Dimzon', 'Salita', 'Dormitorio', NULL, 'P.D. Monfort North', '', 'Dumangas', 'Iloilo', '9485788328', 'salita_dormitorio@yahoo.com', 0, '', '99999999', 2, NULL, 00000049, 'DimzonSalita', '6dc31d00bd847c160cda78d4ead3a76d6c4d9031', 0, 0, 'Salita Dimzon', '', 3, '6c2411df', '09262017', 'GCC', 0, 1),
(00000049, 'Diamante', 'Daphne', 'Dalida', NULL, 'Ilaya Street', '', 'Dumangas', 'Iloilo', '9773773136', '', 0, '', '07151972', 2, NULL, 00000024, 'DiamanteDaphne', 'afaa8466a6fbf18706d4096b72aea31f20b92840', 0, 0, 'Daphne Diamante', '3439052685', 3, 'db39d0db', '09262017', 'GCC', 0, 1),
(00000050, 'Gochuico', 'Alexander', '', NULL, '36A Church Street', 'Grace Village', 'Quezon City', 'Metro Manila', '9178387813', 'alex@uplink.com.ph', 0, '', '07181965', 1, NULL, 00000002, 'GochuicoAlexander', 'f124eef59be2170d1cf674760e9a78bea1f4de61', 0, 0, 'Alexander Gochuico', '1973050423', 3, '0808002b', '09272017', 'GCC', 0, 1),
(00000051, 'Gochuico', 'Bobby', '', NULL, '127 Biak na Bato St.', '', 'Quezon City', 'Metro Manila', '9178950271', 'bugsbobby@uplink.com.ph', 0, '', '02041971', 1, NULL, 00000050, 'GochuicoBobby', '03d705a7a58cfa40425b6c37ef833611e87a0049', 0, 0, 'Bobby Gochuico', '1979001459', 3, 'bf15c12f', '09272017', 'GCC', 0, 1),
(00000052, 'Ching', 'Michael', 'Sy', NULL, '533 M. Naval St.', '', 'Navotas City', 'Metro Manila', '9225652817', 'chingmike769@yahoo.com', 0, '', '07131969', 1, NULL, 00000050, 'ChingMichael', '9cc5decf8c973cdb1acb0608605047179a67282c', 0, 0, 'Michael Ching', '1973028983', 3, '66338222', '09272017', 'GCC', 0, 1),
(00000053, 'Brioso', 'Lourdes', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'BriosoLourdes', '31b91d3b7a1294bddcaf48344b2216a816dba211', 0, 0, 'Lourdes Brioso', '', 1, 'd12e4326', '09282017', 'GCC', 0, 1),
(00000054, 'Zapanta', 'Angelee', 'Baxinela', NULL, '', '', 'Banate', 'Iloilo', '9751911579', '', 0, '', '99999999', 2, NULL, 00000003, 'ZapantaAngelee', '35cd192b136a2252fa78c02d00bd9719c6836a50', 0, 0, 'Angelee Zapanta', '', 2, 'd47e0438', '09282017', 'GCC', 0, 1),
(00000055, 'Villaruel', 'Pauline Love', 'Dela Cruz', NULL, '', 'Talokgangan', 'Banate', 'Iloilo', '9159832874', 'pauvillaruel18@gmail.com', 0, '', '99999999', 2, NULL, 00000003, 'VillaruelPauline', '871a0353a14d260400964022319679d524bc9d4d', 0, 0, 'Pauline Love Villaruel', '', 2, '6363c53c', '09282017', 'GCC', 0, 1),
(00000056, 'Baxinela', 'Amiel', 'Ballego', NULL, '', 'Brgy. Carmelo', 'Banate', 'Iloilo', '', '', 0, '', '99999999', 0, NULL, 00000003, 'BaxinelaAmiel', 'a7508dd5d9689f775ce8daed48fc14aa15b6192f', 0, 0, 'Amiel Baxinela', '', 2, 'ba458631', '09282017', 'GCC', 0, 1),
(00000057, 'Tan', 'Genghis', 'Encarnacion', NULL, '39C Church Street', '', 'Quezon City', 'Metro Manila', '9568738105', 'genghistan88@gmail.com', 0, '', '05191994', 1, NULL, 00000001, 'TanGenghis', '11b53c7a8f226f95f2c7694603434a90f2051314', 0, 0, 'Genghis Tan', '4759177032', 3, '0d584735', '10032017', 'GCC', 0, 1),
(00000058, 'Oquin', 'Joyce Anne', 'Garcia', 'Judith Mindoro Garcia', '1068 Kamada St.', 'Dagat-Dagatan', 'Caloocan', 'Metro Manila', '09469701491', 'oquinjoyce@gmail.com', 0, '', '12231993', 2, '', 00000001, 'OquinJoyce', '641b8dd7ca09b6c308a99807687c5cfe8940cea8', 1, 1, 'Joyce Anne Oquin', '', 3, 'b0e5080d', '10072017', 'GCC', 0, 1),
(00000059, 'Damilig', 'Emmanuel', 'De Guzman', NULL, 'Capariaan', 'Sta. Cruz', 'Ilocos Sur', 'Ilocos', '09065954840', 'revnowelldamilig25@yahoo.com', 0, '', '12251972', 1, NULL, 00000001, 'DamiligEmmanuel', 'a60ee069ff4d9987145449313c72065b9fb07c74', 0, 0, 'Emmanuel Damilig', '3049066197', 3, '07f8c909', '10122017', 'GCC', 0, 1),
(00000060, 'Bangsil', 'Josephine', 'Baturi', NULL, 'Maligcong', 'Salcedo', 'Ilocos Sur', 'Ilocos', '9177005720', '', 0, '', '04181980', 2, NULL, 00000059, 'BangsilJosephine', '10e5accd1d25311eef9cfdc967477c8de919df2b', 0, 0, 'Josephine Bangsil', '', 3, 'db57eb59', '10122017', 'GCC', 0, 1),
(00000061, 'Pico', 'Eddyline', 'Gubatanga', NULL, 'B8 L3 Bito-on Newsite', 'Jaro', 'Iloilo City', 'Iloilo', '9105595802', 'eddyline.pico@deped.gov.ph', 0, '', '07241963', 2, NULL, 00000024, 'PicoEddyline', '0e7830a90a49f64ffda948448afcff72926331ef', 0, 0, 'Eddyline Pico', '9229176215', 3, '6c4a2a5d', '10132017', 'GCC', 0, 1),
(00000062, 'Yun', 'Claire', 'Aboga', NULL, 'S.O Catmon San Rafael', 'Rodriguez', 'Montalban', 'Rizal', '9980196262', 'ayanng22@gmail.com', 0, '', '04131996', 2, NULL, 00000015, 'YunClaire', '075c3ad42045e7af949e8e3f243a4796dc9f7060', 0, 0, 'Claire Yun', '', 2, 'b56c6950', '10142017', 'GCC', 0, 1),
(00000063, 'Mejica', 'Gary Jr.', 'Ilaud', '', '', '', 'Malabon City', 'Metro Manila', '9668738031', '', 0, '', '08041994', 1, '', 00000058, 'MejicaGary', 'f77330c173fe73962a683285c1e6695bbbf49520', 0, 0, 'Gary Mejica Jr.', '', 3, '0271a854', '10232017', 'GCC', 0, 1),
(00000065, 'Diamante', 'Ibarnaly', 'Dela Cruz', '', '33 Ilaya 1st', '', 'Dumangas', 'Iloilo', '9999535971', '', 0, '', '99999999', 0, '', 00000049, 'DiamanteIbarnaly', 'e55c218e1e401d1a3e881e5a6f85c3d3e1dec6e6', 0, 0, 'Ibarnaly Diamante', '', 2, 'b03c2e4e', '10252017', 'GCC', 0, 1),
(00000066, 'Guillen', 'Maria Isolda', 'De Jesus', NULL, 'National Road', 'Calahan', 'Cardona', 'Rizal', '9178741277', 'djmaqui@yahoo.com', 0, '', '12231977', 2, NULL, 00000002, 'GuillenMaqui', 'e1c4863920753d49735a772581bb89d7a2b16cde', 0, 0, 'Maria Isolda Guillen', '3419198284', 3, '691a6d43', '10262017', 'GCC', 0, 1),
(00000067, 'Mamangon', 'Ma. Carliza', 'Obispo', '', '58 M.H. del Pilar St.', 'Sto. Tomas', 'Pasig City', 'Binangonan, Rizal', '9981712171', '', 0, '', '12101984', 2, '', 00000063, 'MamangonCarliza', '2dc6b9038489297cf672893156e70453d3d39243', 0, 0, 'Ma. Carliza Mamangon', '', 3, 'de07ac47', '10262017', 'GCC', 0, 1),
(00000068, 'Dela Cruz', 'Ma. Idanel', '', '', '4790 San Roque St.', 'San Francisco', 'San Juan Floodway', '', '', '', 0, '', '99999999', 0, '', 00000063, 'DelaCruzIdanel', '8c6cc492d8044253d3a49b6eed56c535c34fe687', 0, 0, 'Ma. Idanel Dela Cruz', '', 1, '63bae37f', '10262017', 'GCC', 0, 1),
(00000069, 'Dela Paz', 'Cristoper', 'Palaminano', '', '0978 Cod. Comp., Barrio Road', 'Tayuman', 'Binangonan', 'Rizal', '9366576523', '', 0, '', '10171993', 1, '', 00000063, 'DelaPazCristoper', '86f4e3b3a50e884091dbd527425c5cc65cd4eae3', 0, 0, 'Cristoper Dela Paz', '', 1, 'd4a7227b', '10262017', 'GCC', 0, 1),
(00000070, 'Paguirigan', 'Christian', 'Huete', NULL, 'Phase 1 Block 33 Lot 14', 'San Lorenzo Ruiz', 'Taytay', 'Rizal', '9123721755', '', 0, '', '07141983', 1, NULL, 00000071, 'PaguiriganChristian', 'e364db950a84d7c525f89b7a2896e17e396d5c3a', 0, 0, 'Christian Paguirigan', '', 3, '0796f28b', '10282017', 'GCC', 0, 1),
(00000071, 'Mamangon', 'Daniel', 'Raymundo', NULL, '58 M.H. del Pilar St.', 'Sto. Tomas', 'Pasig City', 'Metro Manila', '9954904285', '', 0, '', '10181984', 1, NULL, 00000067, 'MamangonDaniel', 'a434e44fc751b7b7cc03445d6de270f725ea3bef', 0, 0, 'Daniel Mamangon', '', 1, 'b08b338f', '10282017', 'GCC', 0, 1),
(00000072, 'Cerino', 'Angela Marie', 'Lozano', NULL, '1400-D Pampanga St.', 'Sta. Cruz', 'Manila', 'Metro Manila', '9082020494', 'lozanocerinoa@yahoo.com', 0, '', '04271990', 2, NULL, 00000071, 'CerinoAngela', '09bd3ee88634b6e29bca80df9d96e19f1907092e', 0, 0, 'Angela Marie Cerino', '', 3, '69ad7082', '10282017', 'GCC', 0, 1),
(00000073, 'Sejalbo', 'Norma', 'Panaun', NULL, '23 Joaquin St.', 'Gen. T. de Leon', 'Valenzuela City', 'Pampanga', '9757864866', 'liean_intsik26@yahoo.com', 0, '', '12111983', 2, NULL, 00000071, 'SejalboNorma', '835237bc85253f6353bf91e74ec050d84b418f8a', 0, 0, 'Norma Sejalbo', '', 1, 'deb0b186', '10282017', 'GCC', 0, 1),
(00000074, 'Barrido', 'Bersil', '', NULL, '0978 Cod. Comp., Barrio Road', 'Tayuman', 'Binangonan', 'Rizal', '9396385859', '', 0, '', '05151987', 0, NULL, 00000069, 'BarridoBersil', 'cf58d9f7a296a6676090e4b7d8c2c4b3063bfe77', 0, 0, 'Bersil Barrido', '', 1, 'dbe0f698', '10282017', 'GCC', 0, 1),
(00000075, 'Barrido', 'Marechel', '', NULL, '0978 Cod. Comp., Barrio Road', 'Tayuman', 'Binangonan', 'Rizal', '9393152284', '', 0, '', '03161993', 2, NULL, 00000074, 'BarridoMarechel', '45f12f2f0631a35862ce265b96d41370420a2dcf', 0, 0, 'Marechel Barrido', '', 1, '6cfd379c', '10282017', 'GCC', 0, 1),
(00000076, 'Uson', 'Catherine', '', NULL, 'Pag-asa Village, Arellano St.', '', 'Dagupan City', 'Pangasinan', '9165577770', '', 0, '', '03071975', 2, NULL, 00000063, 'UsonCatherine', '125cefeb7bc4d952c9f3ca9761cf7668b313c4cb', 0, 0, 'Catherine Uson', '', 1, 'b5db7491', '10282017', 'GCC', 0, 1),
(00000077, 'Ignacio', 'Luzviminda', '', NULL, '192E Dr. Pilapil St.', 'San Miguel', 'Pasig City', 'Metro Manila', '9288608720', '', 0, '', '10221968', 2, NULL, 00000063, 'IgnacioLuzviminda', '239aaff080154ce8e8b180874a7c07e8ff71718e', 0, 0, 'Luzviminda Ignacio', '', 1, '02c6b595', '10282017', 'GCC', 0, 1),
(00000078, 'Garcia', 'Roselie', 'Cleopas', NULL, 'Block 1 Lot 2 St. North Caloocan Village', 'Bagumbong', 'Caloocan City', 'Metro Manila', '9771915298', '', 0, '', '02091992', 2, NULL, 00000063, 'GarciaRoselie', '12c2d453426d39fb0db6705d2924657eea1431aa', 0, 0, 'Roselie Garcia', '', 1, 'bf7bfaad', '10282017', 'GCC', 0, 1),
(00000079, 'Mingo', 'Joy', 'Galang', NULL, '387 Herrera Drive', 'Quirino Highway', 'Talipapa', '', '9364700552', '', 0, '', '09301992', 2, NULL, 00000063, 'MingoJoy', 'f1d934fe98366417ce9fdc6f3991b0677f41836e', 0, 0, 'Joy Mingo', '', 1, '08663ba9', '10282017', 'GCC', 0, 1),
(00000080, 'Astorga', 'Ma. Carmelita', 'Manojo', '', '7 dela Rama St.', '', 'Iloilo City', 'Iloilo', '9182464875', 'maricarastorga@yahoo.com', 0, '', '99999999', 2, '', 00000024, 'AstorgaMaricar', 'b1386508be58b93b7cc79f6ecdeec7191f74bcf7', 0, 0, 'Ma. Carmelita Astorga', '', 3, '2fab7536', '10132017', 'GCC', 0, 1),
(00000081, 'Verbo', 'Dominador Jr.', 'Gironella', '', 'Poblacion Sur', 'Salcedo', 'Ilocos Sur', 'Ilocos', '9157822809', '2011domverbo@gmail.com', 0, '', '02281972', 1, '', 00000060, 'VerboDominadorJr', 'ffd72edc0cc3ddfc00f504550dfe93fb00dc34a4', 0, 0, 'Dominador Verbo Jr.', '', 3, '98b6b432', '11072017', 'GCC', 0, 1),
(00000082, 'Borce', 'George', 'Barroa', '', 'Bito-on New Sitio', 'Jaro', 'Iloilo City', 'Iloilo', '9153277816', '', 0, '', '99999999', 1, '', 00000061, 'BorceGeorge', '9566a3167f9181648011b6720abaf3c7d738539a', 0, 0, 'George Borce', '', 2, '4190f73f', '11082017', 'GCC', 0, 1),
(00000083, 'Ajesta', 'Rosa Lea', 'Virgula', '', '287-J E. Lopez St.', '', 'Iloilo City', 'Iloilo', '9175429525', 'rvajesta@yahoo.com', 0, '', '99999999', 2, '', 00000024, 'AjestaRosaLea', '7f4b23f26d0b258298cbd57a05e21b33b170dc34', 0, 0, 'Rosa Lea Ajesta', '', 2, 'f68d363b', '11082017', 'GCC', 0, 1),
(00000084, 'Chang', 'Lizabeth', 'Li Fong', NULL, '33 Matutum St.', '', 'Quezon City', 'Metro Manila', '9328458596', '', 0, '', '09121955', 2, NULL, 00000002, 'ChangLizabeth', '0fd70e9c4fb255030428c23399c9b5abe91126cd', 0, 0, 'Lizabeth Chang', '', 1, 'f3dd7125', '11072017', 'GCC', 0, 1),
(00000085, 'Balembeng', 'Christine', 'Ropal', NULL, '4790 San Roque St.', 'San Francisco', 'Cainta', 'Rizal', '9425615197', '', 0, '', '10301989', 2, NULL, 00000068, 'BalembengChristine', '1ef8a794dad5ac118c7ed326771c90a0276226e4', 0, 0, 'Christine Balembeng', '', 1, '44c0b021', '11082017', 'GCC', 0, 1),
(00000086, 'Cerino', 'Ronald', 'Pesuelo', NULL, '1400-D Pampanga St.', 'Sta. Cruz', 'Manila', 'Metro Manila', '9979375343', '', 0, '', '05011985', 1, NULL, 00000072, 'CerinoRonald', '7ae84e7f625fcb8d31025a9456d908711a666d64', 0, 0, 'Ronald Cerino', '', 1, '9de6f32c', '11082017', 'GCC', 0, 1),
(00000087, 'Loresco', 'Rochelle', 'Quiambao', NULL, '', 'Pureza', 'Manila', 'Metro Manila', '9360878028', '', 0, '', '09281900', 2, NULL, 00000086, 'LorescoRochelle', '2954204f5e31c3ee2e319b93cb7d4accd972a64e', 0, 0, 'Rochelle Loresco', '', 1, '2afb3228', '11082017', 'GCC', 0, 1),
(00000088, 'Cabato', 'Marjorie', 'Bandibas', NULL, '2457 Captain Sixto Cuevas', 'Kalawaan', 'Pasig City', 'Metro Manila', '9752506544', '', 0, '', '05131992', 2, NULL, 00000071, 'CabatoMarjorie', '62aa48a88836049b7cdca57dfb1b64f59547b29f', 0, 0, 'Marjorie Cabato', '', 1, '97467d10', '11082017', 'GCC', 0, 1),
(00000089, 'Labata', 'Gina', 'Martillana', NULL, '2458 D. Manunuso St.', 'Ibayo Tipas', 'Taguig City', 'Metro Manila', '9465195786', '', 0, '', '11031987', 2, NULL, 00000071, 'LabataGina', '2854de09591c83ccadea4f69a14ee1fd5b1ddcab', 0, 0, 'Gina Labata', '', 1, '205bbc14', '11082017', 'GCC', 0, 1),
(00000090, 'Pechayco', 'Alita', 'F.', '', 'Pob. Culon', '', '', 'Antique', '9106928225', '', 0, '', '03011955', 2, '', 00000024, 'PechaycoAlita', '4fe954611544fdcdf904d0986dd7dd6d7e6ccdc4', 0, 0, 'Alita Pechayco', '', 1, 'f36a6ce4', '11132017', 'GCC', 0, 1),
(00000091, 'Noble', 'April Joy', 'Gabito', '', 'Ilauod', '', 'Bugasong', 'Antique', '9263849703', '', 0, '', '04011955', 2, '', 00000024, 'NobleApril', '60d44c9c6590ef487639cb5e482e1bea18aab638', 0, 0, 'April Joy Noble', '', 1, '4477ade0', '11132017', 'GCC', 0, 1),
(00000092, 'Tanong', 'Noelle', 'Lozano', '', 'Pob. Ilauod, Panit-an', 'Capiz', 'Roxas City', 'Capiz', '9989828292', 'rayworld0028@gmail.com', 0, '', '99999999', 0, '', 00000024, 'TanongNoelle', 'ddb4374240b7f68969a06c7b0ed0548f7ec06452', 0, 0, 'Noelle Tanong', '5566003181', 2, '9d51eeed', '11132017', 'GCC', 0, 1),
(00000093, 'Sumayod', 'Tessa', 'Palisoc', NULL, '624 Langka St., La Unica Hija 3 Phase III', 'Brgy. Cupang', 'Antipolo City', 'Rizal', '9272585870', '', 0, '', '09281900', 2, NULL, 00000071, 'SumayodTessa', '5c688d903d6a3f8e30caa3d99693be12d7e1cbe1', 0, 0, 'Tessa Sumayod', '', 1, '2a4c2fe9', '11112017', 'GCC', 0, 1),
(00000094, 'Fuertes', 'Marissa', 'Mamangon', NULL, '58 M.H. del Pilar St.', 'Sto. Tomas', 'Pasig City', 'Metro Manila', '9950134200', '', 0, '', '08231987', 2, NULL, 00000071, 'FuertesMarissa', '0017bbea27768de2337c3a1d2bfa96a7925f4b86', 0, 0, 'Marissa Fuertes', '', 1, '2f1c68f7', '11112017', 'GCC', 0, 1),
(00000095, 'Raymundo', 'Lorgelyn', 'Agan', NULL, '58 M.H. del Pilar St.', 'Sto. Tomas', 'Pasig City', 'Metro Manila', '9212488716', '', 0, '', '12031986', 2, NULL, 00000071, 'RaymundoLorgelyn', 'ba09b258a45a4106670f95b8cde9699282059099', 0, 0, 'Lorgelyn Raymundo', '', 1, '9801a9f3', '11112017', 'GCC', 0, 1),
(00000096, 'Tantiado', 'Jocelyn', 'Ariap', NULL, '2019 Ilang-Ilang St.', 'Batasan Hills', 'Quezon City', 'Metro Manila', '9064695138', '', 0, '', '08171973', 2, NULL, 00000071, 'TantiadoJocelyn', 'f08bab6c8ef1eb28b387f9f710fe1135008c74d1', 0, 0, 'Jocelyn Tantiado', '', 2, '4127eafe', '11112017', 'GCC', 0, 1),
(00000097, 'Obispo', 'Carlo', 'Ramos', NULL, '0455 Lanuza Comp.', 'Tagpos', 'Binangonan', 'Rizal', '9058450531', '', 0, '', '11191966', 1, NULL, 00000067, 'ObispoCarlo', 'c0687a1654ddffeb41968293e7aa0fbe6b74409c', 0, 0, 'Carlo Obispo', '', 1, 'f63a2bfa', '11112017', 'GCC', 0, 1),
(00000098, 'Pagjunasan', 'Marichris', 'Obispo', NULL, '0463 Lanuza Comp.', 'Tagpos', 'Binangonan', 'Rizal', '9483542849', '', 0, '', '07211990', 2, NULL, 00000097, 'PagjunasanMarichris', '89f52f6baa1d9965b77368c9393daa21f998f421', 0, 0, 'Marichris Pagjunasan', '', 1, '4b8764c2', '11112017', 'GCC', 0, 1),
(00000099, 'Bedia', 'Ma. Luz', 'Apolinario', '', 'Gustilo St.', 'Lapaz', 'Iloilo City', 'Iloilo', '9489708876', '', 0, '', '09041982', 2, '', 00000024, 'BediaMaLuz', '09d9c1980404f2c0e8b4d6c2fbef1724d3c9158c', 0, 0, 'Ma. Luz Bedia', '', 2, 'fc9aa5c6', '11132017', 'GCC', 0, 1),
(00000100, 'Legayada', 'Mary Ann', 'Basa', '', '', 'Brgy. Quiling', 'Iloilo City', 'Iloilo', '9266992695', '', 0, '', '99999999', 2, '', 00000024, 'LegayadaMaryAnn', '8a010f05f684c3e87f7d0bb1511461498e34773b', 0, 0, 'Mary Ann Legayada', '', 2, 'fa44e5bd', '11132017', 'GCC', 0, 1),
(00000101, 'Muralla', 'Maria Flor', 'Gabona', '', 'Zone 4', 'Brgy. Concepcion', 'Iloilo City', 'Iloilo', '9391561808', '', 0, '', '09121965', 2, '', 00000080, 'MurallaMariaFlor', 'e98d37b74bd948247805cb3319f974dfb21b1c35', 0, 0, 'Maria Flor Muralla', '', 1, '4d5924b9', '11222017', 'GCC', 0, 1),
(00000102, 'Penuela', 'Fedgen', 'Astorga', '', 'Family Country Hotel, Mateo Road', 'Lagao', 'Gen. Santos City', 'South Cotabato', '9231442980', '', 0, '', '01201975', 0, '', 00000080, 'PenuelaFedgen', '6aeb57f09ebd7421a958d172d3af2ef1a87b34ea', 0, 0, 'Fedgen Penuela', '2159120344', 2, '947f67b4', '11222017', 'GCC', 0, 1),
(00000103, 'Lagahit', 'Efren', '', NULL, '281 Wall 2 Villa Esperanza', 'Molino 2', 'Bacoor City', 'Cavite', '9294247989', '', 0, '', '99999999', 1, NULL, 00000111, 'LagahitEfren', 'd62ead5e80395de003fb6041f58e4f41c5d2f8cf', 0, 0, 'Efren Lagahit', '', 1, '2362a6b0', '11142017', 'GCC', 0, 1),
(00000104, 'Cuales', 'Marites', 'Tamonan', NULL, 'Kawayan', 'San Fernando', 'Valencia City', 'Bukidnon', '9289443759', '', 0, '', '09261976', 2, NULL, 00000103, 'CualesMarites', '38a2d4b6dc497124c715a24abc68212561026cbf', 0, 0, 'Marites Cuales', '', 3, '2632e1ae', '11142017', 'GCC', 0, 1),
(00000105, 'Malinao', 'Rona', 'Espadon', NULL, '', 'Talavera', 'Cabanatuan City', 'Nueva Ecija', '9061213136', '', 0, '', '03091981', 2, NULL, 00000103, 'MalinaoRona', '60087682b969911c8a2a3611e4ce54ef0d8670e3', 0, 0, 'Rona Malinao', '', 3, '912f20aa', '11142017', 'GCC', 0, 1),
(00000106, 'Caalaman', 'Rajah', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 0, NULL, 00000063, 'CaalamanRajah', 'bcf307af9d01aaa3757ad78d61c6770f4c02c8a9', 0, 0, 'Rajah Caalaman', '', 1, '480963a7', '11142017', 'GCC', 0, 1),
(00000107, 'Abunales', 'Jennylyn', '', NULL, '', '', 'San Mateo', 'Rizal', '', '', 0, '', '99999999', 2, NULL, 00000063, 'AbunalesJennylyn', 'a67533fc8544e08e54aa43bd967816ad400908ce', 0, 0, 'Jennylyn Abunales', '', 1, 'ff14a2a3', '11142017', 'GCC', 0, 1),
(00000108, 'Campaner', 'Merian', 'Calvelo', NULL, 'Purok 3', 'Brgy. Camohaguin', 'Gumaca', 'Quezon', '9122199083', '', 0, '', '01041988', 0, NULL, 00000107, 'CampanerMerian', '5f248b0593ac50513069406d1b67e17350647bef', 0, 0, 'Merian Campaner', '', 1, '42a9ed9b', '11142017', 'GCC', 0, 1),
(00000109, 'Custodio', 'Robelyn', 'Flores', NULL, 'Mangga St.', 'Buntong Palay 2, Silangan', 'San Mateo', 'Rizal', '9753682169', 'robiegianan27@gmail.com', 0, '', '07271989', 2, NULL, 00000067, 'CustodioRobelyn', '02fc82b055e80a9fdc97b4661f64893fe67cb226', 0, 0, 'Robelyn Custodio', '', 1, 'f5b42c9f', '11142017', 'GCC', 0, 1),
(00000110, 'Lagahit', 'Gina', '', NULL, '', '', '', 'Negros', '', '', 0, '', '99999999', 2, NULL, 00000103, 'LagahitGina', '04b5d1c2cfa96fb17ecd2d1eb742a0205d20e994', 0, 0, 'Gina Lagahit', '', 2, '2685fc6f', '11142017', 'GCC', 0, 1),
(00000111, 'Cantoria', 'Jimson', 'Leonor', NULL, '39 Villonco St.', 'Sucat', 'Paranaque City', 'Metro Manila', '9187475378', '', 0, '', '12151974', 1, NULL, 00000063, 'CantoriaJimson', '71460cec7c87b58e546e1ca6377ac1e3e1aa91d7', 0, 0, 'Jimson Cantoria', '', 2, '91983d6b', '11142017', 'GCC', 0, 1),
(00000112, 'Casino', 'Jenna', 'Cereno', NULL, '612 Evangelista St.', 'Quiapo', 'Manila City', 'Metro Manila', '9394773984', '', 0, '', '05021983', 2, NULL, 00000072, 'CasinoJenna', '15f7f249b191850d59f8a839f3501a9e142b0119', 0, 0, 'Jenna Casino', '', 3, '48be7e66', '11142017', 'GCC', 0, 1),
(00000113, 'Decio', 'Maristel', 'Delfin', '', 'Block 6 Lot 20 Florvel Homes', 'Oton', 'Iloilo City', 'Iloilo', '9393854348', 'maristel_stars@yahoo.com', 0, '', '11161980', 2, '', 00000092, 'DecioMaristel', '2f328b0663274f86d5005e3503e3cdfbd39495ae', 0, 0, 'Maristel Decio', '9309182305', 2, 'ffa3bf62', '11172017', 'GCC', 0, 1),
(00000114, 'Grande', 'Vivian', 'Aenlle', '', 'c/o 7th Floor HRMO', '', 'Iloilo City', 'Iloilo', '9561300086', '', 0, '', '01231958', 2, '', 00000024, 'GrandeVivian', 'ce4eef6847146e2df7e6915675cf1b083f6f66e8', 0, 0, 'Vivian Grande', '', 2, 'faf3f87c', '11172017', 'GCC', 0, 1),
(00000115, 'Valencia', 'Wilma', 'Garcia', '', 'Dungon B', 'Jaro', 'Iloilo City', 'Iloilo', '9101302403', '', 0, '', '02151965', 2, '', 00000024, 'ValenciaWilma', '32a94914255165029c2ac81bda43b3ff42a674f1', 0, 0, 'Wilma Valencia', '', 1, '4dee3978', '11172017', 'GCC', 0, 1),
(00000116, 'Gallenero', 'Reylyn', 'Garbosa', '', '', 'Veterans Village', 'Iloilo City', 'Iloilo', '9951560752', '', 0, '', '06201991', 0, '', 00000024, 'GalleneroReylyn', '95b45d6f7a2a08f1214383862213785884ff8d9c', 0, 0, 'Reylyn Gallenero', '', 1, '94c87a75', '11172017', 'GCC', 0, 1),
(00000117, 'Cacho', 'Nona', 'Banaban', '', 'Lopez Jaena St.', 'Jaro', 'Iloilo City', 'Iloilo', '9168670238', '', 0, '', '12091987', 2, '', 00000024, 'CachoNona', 'c5e7fc28a7506cfc10aca3ea18f07f6f72b90b01', 0, 0, 'Nona Cacho', '', 1, '23d5bb71', '11172017', 'GCC', 0, 1),
(00000118, 'Zapanta', 'Emma', 'Galindez', '', '7 dela Rama St.', '', 'Iloilo City', 'Iloilo', '9083204885', '', 0, '', '06041952', 2, '', 00000080, 'ZapantaEmma', 'e2608ff2ee47b2d042335138f9c1332bbe7b99d0', 0, 0, 'Emma Zapanta', '1349435027', 3, '9e68f449', '11222017', 'GCC', 0, 1),
(00000119, 'Villaniza', 'Rosemarie', 'Sonio', '', 'Dela Rama St.', 'Brgy. Legaspi', 'Iloilo City', 'Iloilo', '9107630242', '', 0, '', '08191969', 2, '', 00000080, 'VillanizaRosemarie', 'e7f4c79f620651e69bc754d02e5a1e4b15ba6c92', 0, 0, 'Rosemarie Villaniza', '', 2, '2975354d', '11222017', 'GCC', 0, 1),
(00000120, 'Sanchez', 'Lorelie', 'C.', NULL, 'Phase 8A Pck 14 Block 4 Lot 69', 'Bagong Silang', 'Caloocan City', 'Metro Manila', '9555123267', 'johannlovi@gmail.com', 0, '', '09211992', 2, NULL, 00000012, 'SanchezLorelie', '4d64aed5fb8e75ce886fbea301c6122e6007c369', 0, 0, 'Lorelie Sanchez', '', 2, 'f5da171d', '11182017', 'GCC', 0, 1),
(00000121, 'Estrella', 'Cherry', 'H.', NULL, 'Block 21 Lot 22 Phase 2 Dela Costa III', 'Brgy. Graceville', 'San Jose del Monte', 'Bulacan', '9163907691', 'estrellacherry531@gmail.com', 0, '', '05311970', 2, NULL, 00000012, 'EstrellaCherry', 'b4c741c091712ef5646b71b97f31788737b709da', 0, 0, 'Cherry Estrella', '', 1, '42c7d619', '11182017', 'GCC', 0, 1),
(00000122, 'Villaruel', 'Mariz', 'Lopez', NULL, 'Sitio Manggahan', 'San Carlos', 'Binangonan', 'Rizal', '9056392958', '', 0, '', '08221995', 2, NULL, 00000097, 'VillaruelMariz', '368f9297dc86388c83ac50981623d557082b5c0b', 0, 0, 'Mariz Villaruel', '', 1, '9be19514', '11192017', 'GCC', 0, 1),
(00000123, 'Villaruel', 'Francis', 'Lopez', NULL, 'Sitio Manggahan', 'San Carlos', 'Binangonan', 'Rizal', '9565942730', '', 0, '', '09181999', 1, NULL, 00000122, 'VillaruelFrancis', '5b67ad66e27d433ff56e3ccff302d98554981448', 0, 0, 'Francis Villaruel', '', 1, '2cfc5410', '11192017', 'GCC', 0, 1),
(00000124, 'Pacheco', 'Cristopher', '', NULL, '13 Gonzalo Magsalin St.', 'Brgy. Calzada', 'Taguig City', 'Metro Manila', '9776449326', '', 0, '', '06081982', 1, NULL, 00000071, 'PachecoCristopher', '16f47efb31e47e41a44ee97de0298af471a8f90f', 0, 0, 'Cristopher Pacheco', '', 1, '29ac130e', '11192017', 'GCC', 0, 1),
(00000125, 'Sasa', 'Norman Jay', 'Cortez', NULL, '91 Carmen St.', 'Brgy. San Carlos', 'Binangonan', 'Rizal', '9482071034', '', 0, '', '12161983', 1, NULL, 00000097, 'SasaNorman', 'f66a65a7fc71904b42908528c2da12994256f7a7', 0, 0, 'Norman Jay Sasa', '', 1, '9eb1d20a', '11192017', 'GCC', 0, 1),
(00000126, 'Cheng', 'Perlita', 'Mendoza', NULL, '7H Narra Tower, Peninsula Garden Midtown Homes, Quirino Avenue', 'Paco', 'Manila City', 'Metro Manila', '9177935638', 'perlitacheng@yahoo.com', 0, '', '11271961', 1, NULL, 00000002, 'ChengPerlita', '2e15fb26ecc38b67fa6c65639fc9a3b6ec186323', 0, 0, 'Perlita Cheng', '396829831', 3, '47979107', '11202017', 'GCC', 0, 1),
(00000127, 'Fabroa', 'Norielyn', 'Fernandez', '', '', 'Brgy. Anilao', 'Pavia', 'Iloilo', '9102221755', 'lyn_fabroa@yahoo.com', 0, '', '11081978', 2, '', 00000024, 'FabroaNorielyn', 'de9b5aaaca44c2a367053aea69c57d03886526a4', 0, 0, 'Norielyn Fabroa', '', 2, 'f08a5003', '11222017', 'GCC', 0, 1),
(00000128, 'Ynion', 'Mariz', 'Quintar', '', '', 'Brgy. Balabag', 'Pavia', 'Iloilo', '9461946514', '', 0, '', '02221993', 2, '', 00000024, 'YnionMariz', '3b6cbaacdca466278752f71e9063d7e4049c8e08', 0, 0, 'Mariz Ynion', '', 2, '4d371f3b', '11222017', 'GCC', 0, 1),
(00000129, 'Arenga', 'Sueden', 'Arguelles', '', '', 'Badiangan', 'Iloilo City', 'Iloilo', '9076728881', '', 0, '', '99999999', 0, '', 00000024, 'ArengaSueden', 'c0e8135720c2ce5f2dcd46b2cff12508dac11b4d', 0, 0, 'Sueden Arenga', '', 2, 'fa2ade3f', '11222017', 'GCC', 0, 1),
(00000130, 'Bergante', 'An Hycinth', 'Contreras', '', '', '', 'Pavia', 'Iloilo', '9301058175', '', 0, '', '10191993', 2, '', 00000024, 'BerganteAnHycinth', '258c4a0c751d2acb358fb091baf4e8a386c18de8', 0, 0, 'An Hycinth Bergante', '', 2, '291b0ecf', '11222017', 'GCC', 0, 1),
(00000131, 'Baclaan', 'Roselle Ellen Joy', 'Galvez', '', 'Block 21 Lot 10 Villa Carolina Yulo Drive', 'Arevalo', 'Iloilo City', 'Iloilo', '9990000000', '', 0, '', '07281996', 2, '', 00000024, 'BaclaanRoselle', '9f6409048517ab7cb362bdead691dad27c4c0287', 0, 0, 'Roselle Ellen Joy Baclaan', '', 2, '9e06cfcb', '11222017', 'GCC', 0, 1),
(00000132, 'Nermal', 'Ramicy', 'Talagtag', '', 'Al Rigga Deira', '', '', 'Dubai, U.A.E.', '972000000000', '', 0, '', '01271986', 2, '', 00000063, 'NermalRamicy', 'dbe3ab1b82b88b7b39c5c42f13142f737a2e4ec2', 0, 0, 'Ramicy Nermal', '', 3, '47208cc6', '12142017', 'GCC', 0, 1),
(00000133, 'Pabalate', 'Liezel', '', NULL, '', '', 'Talisay City', 'Negros Occidental', '9368171284', '', 0, '', '99999999', 2, NULL, 00000058, 'PabalateLiezel', 'c2e38680b13574d4407b997bcc1b70d368485005', 0, 0, 'Liezel Pabalate', '', 1, 'f03d4dc2', '11212017', 'GCC', 0, 1),
(00000134, 'Balangat', 'Rossana', 'Tamayo', NULL, 'Canas', '', 'Barotac Nuevo', 'IloIlo', '9064650767', '', 0, '', '05271986', 2, NULL, 00000131, 'BalangatRossana', '030f6610ed572a1a2f9a8597646655e694f8787e', 0, 0, 'Rossana Balangat', '', 2, 'f56d0adc', '11222017', 'GCC', 0, 1),
(00000135, 'Sia Reyes', 'Gemma', 'Sy', NULL, '43-C G. Roxas St.', 'Brgy. Manresa', 'Quezon City', 'Metro Manila', '9228985151', 'beasiareyes@gmail.com', 0, '', '05301965', 2, NULL, 00000002, 'SiaReyesGemma', '99bb6213335a7e3535b878899614f204e5685eed', 0, 0, 'Gemma Sia Reyes', '', 3, '4270cbd8', '11222017', 'GCC', 0, 1),
(00000136, 'Ng', 'Victor', '', NULL, 'Room 403 #556 Pilarica St.', 'Sta. Cruz', 'Manila City', 'Metro Manila', '9178980415', 'vsng0417@yahoo.com', 0, '', '04151957', 1, NULL, 00000002, 'NgVictor', 'c8d99aef09cb40d2881d8fda55a689e8d8db4daf', 0, 0, 'Victor Ng', '', 1, '9b5688d5', '11232017', 'GCC', 0, 1),
(00000137, 'Castillo', 'Carmelita', '', NULL, 'Marcos Hiway', 'Brgy. Inarawan', 'Antipolo City', 'Rizal', '9195346371', 'carmencastillo43@yahoo.com', 0, '', '03051957', 2, NULL, 00000002, 'CastilloCarmelita', '9da0c3efcabdeed0ecd93d41b6c1a67782a9df6a', 0, 0, 'Carmelita Castillo', '', 1, '2c4b49d1', '11242017', 'GCC', 0, 1),
(00000138, 'Pacleb', 'Joesana', 'Nino', NULL, '2-7 Calumpang', 'Molo', 'Iloilo City', 'Iloilo', '9205536023', '', 0, '', '99999999', 2, NULL, 00000131, 'PaclebJoesana', '08fbc53337a99da35d637358b9417fe96fa30b09', 0, 0, 'Joesana Pacleb', '', 2, '91f606e9', '11252017', 'GCC', 0, 1),
(00000139, 'Annaguey', 'Philip', 'M.', NULL, '', 'Atabay', 'Salcedo', 'Ilocos Sur', '9752198202', '', 0, '', '10071966', 1, NULL, 00000059, 'AnnagueyPhilip', '860da147c1357e615bb1507dd5a98a70c0ff75d4', 0, 0, 'Philip Annaguey', '', 1, '26ebc7ed', '11272017', 'GCC', 0, 1),
(00000140, 'Parilla', 'Marlon', 'C.', NULL, '', 'Dinaratan', 'Salcedo', 'Ilocos Sur', '9058012554', 'marlonparilla@yahoo.com', 0, '', '11091978', 1, NULL, 00000060, 'ParillaMarlon', '8322bd522c4ecb963f9a050f2e36d76f82701946', 0, 0, 'Marlon Parilla', '', 1, '5365c1f8', '11272017', 'GCC', 0, 1),
(00000141, 'Tafalla', 'Ariel', 'Galve', NULL, 'San Antonio', 'Nueva Valincia G.', 'Iloilo', 'Guimaras', '9103142296', '', 0, '', '03311980', 1, NULL, 00000131, 'TafallaAriel', '5aa8312d34038f3a1a76ed19e8330b2adfeda532', 0, 0, 'Ariel Tafalla', '', 2, 'e47800fc', '11272017', 'GCC', 0, 1),
(00000142, 'Tan', 'Henry Sr.', 'O.', NULL, '', 'Brgy. Dinaratan', 'Salcedo', 'Ilocos Sur', '9777593834', 'henrycora71@gmail.com', 0, '', '01221950', 1, NULL, 00000059, 'TanHenrySr', 'cb1b776baf11e6e38b9a28848b1e707f55e5e013', 0, 0, 'Henry Sr. Tan', '', 1, '3d5e43f1', '11272017', 'GCC', 0, 1),
(00000143, 'Tubiano', 'Rosemarie', 'Robles', NULL, 'Zone 9 Calumpang', 'Molo', 'Iloilo City', 'Iloilo', '9189123211', '', 0, '', '05021960', 2, NULL, 00000080, 'TubianoRosemarie', 'e4b597de865f3cea99b242eb24a5c3039adc004e', 0, 0, 'Rosemarie Tubiano', '9239987815', 2, '8a4382f5', '11272017', 'GCC', 0, 1),
(00000144, 'Alipda', 'Abraham', 'Alipog', NULL, '', 'Culiong', 'Salcedo', 'Ilocos Sur', '9292315901', '', 0, '', '12231964', 1, NULL, 00000059, 'AlipdaAbraham', '75778a1e95e3ef151aeb5729ec872f902b5c360e', 0, 0, 'Abraham Alipda', '', 1, '8f13c5eb', '11272017', 'GCC', 0, 1),
(00000145, 'Gapati', 'Marnel', 'R.', NULL, '', 'Atabay', 'Salcedo', 'Ilocos Sur', '9365821817', '', 0, '', '08161999', 1, NULL, 00000059, 'GapatiMarnel', '909b8a5769ae1a9147301aeebe780a28f6fffb84', 0, 0, 'Marnel Gapati', '', 1, '380e04ef', '11272017', 'GCC', 0, 1),
(00000146, 'Labasan', 'Elmer', 'B.', NULL, '', 'Dinaratan', 'Salcedo', 'Ilocos Sur', '9093117264', '', 0, '', '12311990', 2, NULL, 00000059, 'LabasanElmer', 'ec94a28eea59524d81fdba1fe6533f5973663769', 0, 0, 'Elmer Labasan', '', 1, 'e12847e2', '11272017', 'GCC', 0, 1),
(00000147, 'Bengbeng', 'Joel', 'Q.', NULL, '', 'Pob. Norte', 'Salcedo', 'Ilocos Sur', '', 'joel_saintluke@yahoo.com', 0, '', '02031980', 1, NULL, 00000059, 'BengbengJoel', '24a9a1e2e4387a9e00d626e438ab8aa944b2bbd4', 0, 0, 'Joel Bengbeng', '', 1, '563586e6', '11272017', 'GCC', 0, 1),
(00000148, 'Ortinez', 'Admer Jr.', '', '', '', 'Maligcong', 'Salcedo', 'Ilocos Sur', '9303322711', 'ortinezadmer@yahoo.com', 0, '', '04111989', 1, '', 00000059, 'OrtinezAdmerJr', '3a0c391927bb835d138ef03409b5b61abbefc325', 0, 0, 'Admer Ortinez Jr.', '', 1, 'eb88c9de', '11272017', 'GCC', 0, 1),
(00000149, 'Avela', 'Oliver \"Mark\"', 'Mamugay', NULL, 'Dumag', 'Dapnan', 'Baganga', 'Davao Oriental', '9977030367', '', 0, '', '04091980', 1, NULL, 00000058, 'AvelaMark', '805d2582cd4cb3f476e79383d5ed69002b4f6195', 0, 0, 'Oliver \"Mark\" Avela', '', 3, '5c9508da', '11282017', 'GCC', 0, 1),
(00000150, 'Agasan', 'Nelida', 'Cabinbin', '', 'Zone 6', 'Veterans Village', 'Iloilo City', 'Iloilo', '9075843836', '', 0, '', '10261951', 2, '', 00000080, 'AgasanNelida', 'aac685d9102eb9b2ef395c79eb1ba608e888efd1', 0, 0, 'Nelida Agasan', '', 1, '8fa4d82a', '12062017', 'GCC', 0, 1),
(00000151, 'Pelaez', 'Froilan', '', NULL, 'Block 89 Lot 9 Matahimik St.', 'Pangarap Village', 'Caloocan City', 'Metro Manila', '9165564750', '', 0, '', '11081974', 1, NULL, 00000012, 'PelaezFroilan', 'e7032cedc70e469fbb9fa82a50fd47e2acb5a5f0', 0, 0, 'Froilan Pelaez', '', 1, '38b9192e', '11302017', 'GCC', 0, 1),
(00000152, 'Dela Rosa', 'Myra Joy', '', NULL, '257 Block 8 Pili Ave.', 'West Rembo', 'Makati City', 'Metro Manila', '9124832518', '', 0, '', '01231991', 2, NULL, 00000094, 'DelaRosaMyraJoy', 'cb5b1b859c66caaada1f520f9b218d7e9c4a59db', 0, 0, 'Myra Joy Dela Rosa', '', 1, 'e19f5a23', '11302017', 'GCC', 0, 1),
(00000153, 'Carvajal', 'Mary Rose', 'Rueda', NULL, '506 San Juan', 'Darangan', 'Binangonan', 'Rizal', '9304849710', '', 0, '', '07031981', 2, NULL, 00000067, 'CarvajalMaryRose', 'fa5f31b16460d065c86dd153cd12f26b8b375e76', 0, 0, 'Mary Rose Carvajal', '', 1, '56829b27', '11302017', 'GCC', 0, 1),
(00000154, 'Beltran', 'Honeylet', 'Delos Santos', NULL, '0104 Sitio Wawa', 'Tagpos', 'Binangonan', 'Rizal', '9216018464', '', 0, '', '08031985', 2, NULL, 00000155, 'BeltranHoneylet', '121a9d069c5874c5364869e92a8e76088367ac0f', 0, 0, 'Honeylet Beltran', '', 1, '53d2dc39', '11302017', 'GCC', 0, 1),
(00000155, 'Obispo', 'Rochelle', 'Bernardo', NULL, '0455 Lanuza Comp.', 'Tagpos', 'Binangonan', 'Rizal', '9951220607', '', 0, '', '11021987', 2, NULL, 00000097, 'ObispoRochelle', '4e1868d4d98976f593c86f58b5a8a0184dc9a41a', 0, 0, 'Rochelle Obispo', '', 1, 'e4cf1d3d', '11302017', 'GCC', 0, 1),
(00000156, 'Hilaga', 'Maricar', 'Macaraeg', NULL, '15 Tindalo St., Zone 1', 'Signal Village', 'Taguig City', 'Metro Manila', '9501030375', '', 0, '', '08231991', 2, NULL, 00000094, 'HilagaMaricar', 'ef5b028e1998ef74704e4cbe9aab9a504d6ef6f7', 0, 0, 'Maricar Hilaga', '', 1, '3de95e30', '11302017', 'GCC', 0, 1),
(00000157, 'Frades', 'Alaiza', 'Camar', NULL, 'Block 206 Lot 2 Acacia St.', 'Pembo', 'Makati City', 'Metro Manila', '9360358057', '', 0, '', '09111993', 2, NULL, 00000094, 'FradesAlaiza', 'dfc07789b370d04885a9f1e2a5e1bad32b803240', 0, 0, 'Alaiza Frades', '', 1, '8af49f34', '11302017', 'GCC', 0, 1),
(00000158, 'Alano', 'Denmark', 'Juta', NULL, '85A Bravo St., Zone 2 Central', 'Signal Village', 'Taguig City', 'Metro Manila', '9356697502', '', 0, '', '01131992', 1, NULL, 00000094, 'AlanoDenmark', 'd985f0965ef1db9c624fb2efb7aad82ec4ca4e09', 0, 0, 'Denmark Alano', '', 1, '3749d00c', '11302017', 'GCC', 0, 1),
(00000159, 'Atila', 'Darlene', 'Aqui', NULL, 'Block 52 Lot 1 Bayabas St.', 'Brgy. Rizal', 'Makati City', 'Metro Manila', '9075655917', '', 0, '', '02141989', 2, NULL, 00000094, 'AtilaDarlene', '7dab6a202d4ee60f25c59be64614e14914417bc6', 0, 0, 'Darlene Atila', '', 1, '80541108', '11302017', 'GCC', 0, 1),
(00000160, 'Dela Pena', 'Angela', 'Sumido', NULL, '', 'Purok I', 'Pavia', 'Iloilo', '9090376768', '', 0, '', '99999999', 2, NULL, 00000024, 'DelaPenaAngela', '02f2ef8ea6f69c992ebcd08c5b44e737f5f75bd1', 0, 0, 'Angela Dela Pena', '', 1, '5cfb3358', '11302017', 'GCC', 0, 1),
(00000161, 'Panganiban', 'Neza', 'Amante', NULL, 'Moreno Street', 'Tuburan Pob.', 'Concepcion', 'Iloilo', '9986105212', '', 0, '', '05161988', 0, NULL, 00000134, 'PanganibanNeza', 'f44caf62d9d32c0dfbceef1874f735d0a3cf3185', 0, 0, 'Neza Panganiban', '', 1, 'ebe6f25c', '11302017', 'GCC', 0, 1),
(00000162, 'Hogar', 'Lilibeth', 'Tumulak', '', '', 'Brgy. Muelle Loney', 'Iloilo City', 'Iloilo', '9071567641', '', 0, '', '04261968', 2, '', 00000080, 'HogarLilibeth', 'e55a8b839b8dcd72b985aa61e90147ee52b24255', 0, 0, 'Lilibeth Hogar', '', 1, '32c0b151', '12062017', 'GCC', 0, 1),
(00000163, 'Flaviano', 'Helen', 'Amante', NULL, '', 'Lanas', 'Barotac Nuevo', 'Iloilo', '9398932015', '', 0, '', '12091960', 2, NULL, 00000131, 'FlavianoHelen', 'e3299b6106bdfb350de748962d52c8dae076639a', 0, 0, 'Helen Flaviano', '', 2, '85dd7055', '12022017', 'JAO', 0, 1),
(00000164, 'Tamayo', 'Nelia', 'Amante', NULL, '', 'Lanas', 'Barotac Nuevo', 'Iloilo', '9185425793', '', 0, '', '04201966', 2, NULL, 00000134, 'TamayoNelia', '43cf7535c16534d1ff324f2beadae353203ef1af', 0, 0, 'Nelia Tamayo', '', 1, '808d374b', '12022017', 'JAO', 0, 1),
(00000165, 'Alperto', 'Erma', 'Palomar', NULL, '', 'Apologista', 'Sara', 'Iloilo', '9067065264', '', 0, '', '01291978', 2, NULL, 00000024, 'AlpertoErma', 'aaccf6038fef1c63b36597aa09d577e87250b1f3', 0, 0, 'Erma Alperto', '', 1, '3790f64f', '12032017', 'JAO', 0, 1),
(00000166, 'Laserna', 'Enuela', 'Mesiderio', NULL, '', 'Simsiman', 'Calinog', 'Iloilo', '9126084141', '', 0, '', '03081948', 0, NULL, 00000131, 'LasernaEnuela', '0d41be9544fc53b4ac772aca8124bfb789a35091', 0, 0, 'Enuela Laserna', '', 2, 'eeb6b542', '12042017', 'JAO', 0, 1),
(00000167, 'Lim', 'Benita', 'Yu', NULL, '8 Union Civica', '', 'Quezon City', 'Metro Manila', '9162203608', '', 0, '', '05011939', 2, NULL, 00000168, 'LimBenita', '73b50590ba3ef163c89e5c0aec44d10fec27995d', 0, 0, 'Benita Lim', '', 3, '59ab7446', '12042017', 'JAO', 0, 1),
(00000168, 'Co', 'Bonita', 'Wu', NULL, '21 Circle Drive', 'Cubic Homes, Merville', 'Paranaque City', 'Metro Manila', '9472903770', '', 0, '', '11071950', 2, NULL, 00000002, 'CoBonita', 'e4a6c391663a17656387c279cb184fad0937e82a', 0, 0, 'Bonita Co', '', 3, 'e4163b7e', '12042017', 'JAO', 0, 1),
(00000169, 'Arela', 'Ofelia \"Coco\"', 'S.', NULL, '', '', 'Imus', 'Cavite', '9157090865', '', 0, '', '10121968', 2, NULL, 00000002, 'ArelaCoco', '46cde527cbfd7bfca242e746a5a04b8a32f16c4b', 0, 0, 'Ofelia Arela', '', 2, '530bfa7a', '12052017', 'JAO', 0, 1),
(00000170, 'Fadrigo', 'Nolyn', 'Sayco', NULL, '', 'Sto. Nino Sur, Arevalo', 'Iloilo City', 'Iloilo', '9177285850', '', 0, '', '03031977', 2, NULL, 00000080, 'FadrigoNolyn', '7015a5f172dada95bcef87712386db2e2b7bd686', 0, 0, 'Nolyn Fadrigo', '', 2, '803a2a8a', '12062017', 'JAO', 0, 1),
(00000171, 'Niaga', 'Jenelen \"Samia\"', 'T.', NULL, '', 'Calajunan, Mandurriao', 'Iloilo City', 'Iloilo', '9179035699', '', 0, '', '11281980', 2, NULL, 00000024, 'NiagaSamia', '5e9adc1063cb36f4d0347e946758ea8960497588', 0, 0, 'Jenelen Niaga', '', 1, '3727eb8e', '12062017', 'JAO', 0, 1),
(00000172, 'Gutierrez', 'Violeta', 'Alconada', NULL, '', 'Brgy. Ungka 2', 'Pavia', 'Iloilo', '9185398543', '', 0, '', '99999999', 2, NULL, 00000024, 'GutierrezVioleta', '3438e3b8462197c60b26930fd7c06b0565230fac', 0, 0, 'Violeta Gutierrez', '', 1, 'ee01a883', '12072017', 'JAO', 0, 1);
INSERT INTO `distributors` (`dsdid`, `dslnam`, `dsfnam`, `dsmnam`, `dsmother`, `dsstreet`, `dsbrgy`, `dscity`, `dsprov`, `dscontact`, `dsemail`, `dsemail_confirm`, `dsfb`, `dsbirth`, `dssex`, `dstin`, `dssid`, `un`, `pw`, `payout`, `pay_type`, `pay_name`, `pay_acct`, `dsmtype`, `discount`, `dsencoded`, `dsencodedby`, `withheld`, `dsstatus`) VALUES
(00000173, 'Laguidao', 'Ramon', 'Mercader', NULL, 'Block19 Lot5B Everlasting St.', 'Modesta Village', 'San Mateo', 'Rizal', '9214607292', 'ramonlaguidao@gmail.com', 0, '', '02121953', 1, NULL, 00000174, 'LaguidaoRamon', 'a67169ff5fe2df7b7092311057d347e46653f1f2', 0, 0, 'Ramon Laguidao', '', 1, '591c6987', '12072017', 'JAO', 0, 1),
(00000174, 'Castillo', 'Miko Carlo', 'C.', NULL, 'Marcos Hiway', 'Brgy. Inarawan', 'Antipolo City', 'Rizal', '9195346371', '', 0, '', '99999999', 1, NULL, 00000137, 'CastilloMiko', 'b16eadcc89835ebc33dc36e2c29e8ec4143304c2', 0, 0, 'Miko Carlo Castillo', '', 1, '5c4c2e99', '12072017', 'JAO', 0, 1),
(00000175, 'Torres', 'Leonisa', 'Grate', NULL, '', 'Sinapsapan', 'Jordan', 'Guimaras', '9307994465', '', 0, '', '02041963', 2, NULL, 00000131, 'TorresLeonisa', 'f51c1ebbaaab49190e50304289980031ad3bf7df', 0, 0, 'Leonisa Torres', '', 2, 'eb51ef9d', '12092017', 'JAO', 0, 1),
(00000176, 'Tan', 'Naty', 'Uy', NULL, 'Unit C-5 Angela Gardens Executive Homes, 20 Macopa St.', '', 'Quezon City', 'Metro Manila', '9189051960', 'nats1225@yahoo.com', 0, '', '12251960', 2, NULL, 00000002, 'TanNaty', 'ba17b9faaf078849860de6aa3186a9a775d008fa', 0, 0, 'Naty Tan', '', 1, '3277ac90', '12092017', 'JAO', 0, 1),
(00000177, 'Avila', 'Glorigene', '', NULL, 'Block 2 Alley 46 Lakas Tao', 'San Andres', 'Cainta', 'Rizal', '9366213116', '', 0, '', '99999999', 2, NULL, 00000149, 'AvilaGlorigene', '4f24765c41b33615dc76c858a89e079f4d44c7f0', 0, 0, 'Glorigene Avila', '', 2, '856a6d94', '12102017', 'JAO', 0, 1),
(00000178, 'Samonte', 'Zyrill Jean', '', NULL, 'Block 11 Lot 15 Villa Christina Subdivision', 'Brgy. Cagbang', 'Oton', 'Iloilo', '9105672062', '', 0, '', '99999999', 2, NULL, 00000105, 'SamonteZyrill', '9d3b04c1d1b725a641b8d11ec62a23bfd367b6ca', 0, 0, 'Zyrill Jean Samonte', '', 1, '38d722ac', '12102017', 'JAO', 0, 1),
(00000179, 'Samonte', 'Ailyn', '', NULL, 'Block 11 Lot 15 Villa Christina Subdivision', 'Brgy. Cagbang', 'Oton', 'Iloilo', '', '', 0, '', '99999999', 2, NULL, 00000105, 'SamonteAilyn', 'fb662eeecbb7133d71b7940ab9b3f4f1ce573047', 0, 0, 'Ailyn Samonte', '', 1, '8fcae3a8', '12102017', 'JAO', 0, 1),
(00000180, 'Chua', 'Soledad', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000006, 'ChuaSoledad', 'b01a4ed8b45ce807f90417d1ad48bdb68f31bb8a', 0, 0, 'Soledad Chua', '', 3, 'a807ad37', '12112017', 'JAO', 0, 1),
(00000181, 'Mirasol', 'Glenn', 'D.', '', 'Q. Abeto St.', 'Mandurriao', 'Iloilo City', 'Iloilo', '9499988697', '', 0, '', '05131973', 1, '', 00000080, 'MirasolGlenn', '6549060ae9278ec329cbe0e86b31f9950dcbdcfc', 0, 0, 'Glenn Mirasol', '1319234701', 3, '1f1a6c33', '05062018', 'JAO', 0, 1),
(00000182, 'Leysa', 'Wilfredo', 'Catedrilla', NULL, '', 'Brgy. Agsirab', 'Lambunao', 'Iloilo', '9102911452', '', 0, '', '07101994', 1, NULL, 00000181, 'LeysaWilfredo', '7e19043693ed69e31524d48402a96b4783a7052c', 0, 0, 'Wilfredo Leysa', '', 1, 'c63c2f3e', '12112017', 'JAO', 0, 1),
(00000183, 'Menor', 'Ruby Ann', '', NULL, 'Compound 13 Door 14 Mauban St.', 'Brgy. Manresa', 'Quezon City', 'Metro Manila', '9425220628', 'ann-free9180@yahoo.com', 0, '', '09011980', 2, NULL, 00000012, 'MenorRuby', 'e849f56424e5ffc8dce45335bc16bbaaa96471cb', 0, 0, 'Ruby Ann Menor', '', 1, '7121ee3a', '12112017', 'JAO', 0, 1),
(00000184, 'Dangani', 'Jonelyn', 'David', NULL, '', 'Brgy. Agsalanan', 'Dingle', 'Iloilo', '9995110175', '', 0, '', '04161985', 2, NULL, 00000024, 'DanganiJonelyn', '95cd36dd8b20e53ff1a2d842a1f22cc3468f23cd', 0, 0, 'Jonelyn Dangani', '', 1, '7471a924', '12142017', 'JAO', 0, 1),
(00000185, 'Daanton', 'Diana', 'Daet', NULL, '', 'Brgy. Agsalanan', 'Dingle', 'Iloilo', '9084818657', '', 0, '', '08201964', 2, NULL, 00000024, 'DaantonDiana', 'a9d9e917f0b6c546a09464a9f2441d7d2fe3de1c', 0, 0, 'Diana Daanton', '', 2, 'c36c6820', '12142017', 'JAO', 0, 1),
(00000186, 'Dairo', 'Cynthia', 'Cepe', NULL, '', 'Namatay', 'Dingle', 'Iloilo', '907089499', '', 0, '', '04241963', 2, NULL, 00000024, 'DairoCynthia', '8ce3de8b16e99cdb80a447bdda80477159e652e8', 0, 0, 'Cynthia Dairo', '', 2, '1a4a2b2d', '12142017', 'JAO', 0, 1),
(00000187, 'Gaw', 'Wilson', 'Miras', NULL, 'Block 2 Lot 10 Cairo St.', 'Nile Village, Sto. Nino', 'Marikina City', 'Metro Manila', '9209544013', 'durawoodconst@gmail.com', 0, '', '03111958', 1, NULL, 00000064, 'GawWilson', 'cc8d3a4567f67f73606ea3c15bb30b8021a67afa', 0, 0, 'Wilson Gaw', '', 3, 'ad57ea29', '12162017', 'JAO', 0, 1),
(00000188, 'Fuertes', 'Ricardo', 'S.', NULL, '58 M.H. del Pilar St.', 'Sto. Tomas', 'Pasig City', 'Metro Manila', '9750575499', '', 0, '', '09271986', 1, NULL, 00000094, 'FuertesRicardo', '6301534d63682e98d4d26151024d85a269ace52f', 0, 0, 'Ricardo Fuertes', '', 1, '10eaa511', '12172017', 'JAO', 0, 1),
(00000189, 'Siapco', 'Miriam', 'Repe', NULL, '1199 Villa Caruncho Sandoval Ave.', 'San Miguel', 'Pasig City', 'Metro Manila', '9193488361', 'iamsiapco@gmail.com', 0, '', '09011986', 2, NULL, 00000188, 'SiapcoMiriam', '0e9b8825d90b8338eb0b245c7103d7c886dc34eb', 0, 0, 'Miriam Siapco', '', 1, 'a7f76415', '12172017', 'JAO', 0, 1),
(00000190, 'Ebuenga', 'Joan', 'Lagata', NULL, 'Block 18 Lot 18 11th Ave.', 'Brgy. North Signal Village', 'Taguig City', 'Metro Manila', '9776042890', 'joan.ebuenga@yahoo.com', 0, '', '05201987', 2, NULL, 00000188, 'EbuengaJoan', '85dfaebfb987ff5db325f941a98bc3367018b946', 0, 0, 'Joan Ebuenga', '', 1, '74c6b4e5', '12172017', 'JAO', 0, 1),
(00000191, 'Inocencio', 'Lyndon John', '', NULL, '341 8th St. GHQ Village', 'Brgy. Katuparan', 'Taguig City', 'Metro Manila', '9330866613', 'lyndon_inocencio@yahoo.com', 0, '', '11301997', 1, NULL, 00000188, 'InocencioLyndon', '788746e11e52422c84b1381c20074e1bfcfe054b', 0, 0, 'Lyndon John Inocencio', '', 1, 'c3db75e1', '12172017', 'JAO', 0, 1),
(00000192, 'Adajar', 'Leanilda', 'De las Alas', NULL, '237 D. Apitong St.', 'Comembo', 'Makati City', 'Metro Manila', '9302011089', 'leanildaadajar@rocketmail.com', 0, '', '03171981', 2, NULL, 00000159, 'AdajarLeanilda', 'b410bc1cbe08fac041f7a39fe0fd9758b893066a', 0, 0, 'Leanilda Adajar', '', 1, '1afd36ec', '12172017', 'JAO', 0, 1),
(00000193, 'Juaneza', 'Dhannie Lyn', 'Sol', NULL, '0456 Lanuza Compound', 'Tagpos', 'Binangonan', 'Rizal', '9307627951', '', 0, '', '03091987', 2, NULL, 00000071, 'JuanezaDhannieLyn', 'f4686c048208dddc40eabd779b0f49cfb2d9c0f1', 0, 0, 'Dhannie Lyn Juaneza', '', 1, 'ade0f7e8', '12172017', 'JAO', 0, 1),
(00000194, 'Marcelo', 'Ghina Marie Joy', '', NULL, 'Block 6 Lot 182 Sunflower St.', 'Pembo', 'Makati City', 'Metro Manila', '9089513624', 'cam.ghi2319@yahoo.com', 0, '', '12191989', 2, NULL, 00000188, 'MarceloGhina', '324b3469fe5650902d5f75167371d46570bfc44e', 0, 0, 'Ghina Marie Joy Marcelo', '', 1, 'a8b0b0f6', '12172017', 'JAO', 0, 1),
(00000195, 'Medina', 'Wilfredo', 'Acorin', NULL, '', 'Baclayan', 'New Lucena', 'Iloilo', '9108450735', '', 0, '', '99999999', 1, NULL, 00000024, 'MedinaWilfredo', 'cae9efc8e6df0989f9a65d092a388e70bc8b5eda', 0, 0, 'Wilfredo Medina', '', 1, '1fad71f2', '12172017', 'JAO', 0, 1),
(00000196, 'Camangon', 'Rosario', 'Cantara', NULL, 'Calle St.', '', 'Leon', 'Iloilo', '9064539727', '', 0, '', '10131978', 2, NULL, 00000024, 'CamangonRosario', '85e9f86e6a678c482b71a7cf4df5967f707dd539', 0, 0, 'Rosario Camangon', '', 1, 'c68b32ff', '12182017', 'JAO', 0, 1),
(00000197, 'Bagas', 'Jean', 'Antipuesto', NULL, 'Lopez Jaena St.', 'Jaro', 'Iloilo City', 'Iloilo', '9774027062', '', 0, '', '11111987', 2, NULL, 00000131, 'BagasJean', '2e0c064842f63ec4f91b7f1c73a5eb90da9cadb3', 0, 0, 'Jean Bagas', '', 2, '7196f3fb', '12182017', 'JAO', 0, 1),
(00000198, 'Lepp', 'Emily', 'Lara', NULL, 'Block 9 Lot 7 Taurus St.', 'VML Subd., North Fundidor', 'Iloilo City', 'Iloilo', '9985414316', '', 0, '', '02071962', 2, NULL, 00000131, 'LeppEmily', '762b1ace38f94ed4dac8591def0b4cae1f988a1e', 0, 0, 'Emily Lepp', '', 2, 'cc2bbcc3', '12202017', 'JAO', 0, 1),
(00000199, 'Champlon', 'Mila', 'Tipoc', NULL, 'Block 24 Lot 17 Villa Carolina Yulo Drive', 'Arevalo', 'Iloilo City', 'Iloilo', '335013711', '', 0, '', '09251947', 2, NULL, 00000131, 'ChamplonMila', '9f71eb4511c67c834c8c06f55218237deb735356', 0, 0, 'Mila Champlon', '', 1, '7b367dc7', '12202017', 'JAO', 0, 1),
(00000200, 'Bersamina', 'Ryan', '', NULL, '', '', 'Quezon City', 'Metro Manila', '9062140245', 'rgbersamina@gmail.com', 0, '', '11261992', 1, NULL, 00000001, 'BersaminaRyan', '472f71709797016880f8337d0c840e172df2d804', 0, 0, 'Ryan Bersamina', '', 1, '73b18cbf', '12202017', 'JAO', 0, 1),
(00000201, 'Turaben', 'Cheryl', 'Platigue', NULL, 'Tacas', 'Jaro', 'Iloilo City', 'Iloilo', '9306445239', '', 0, '', '09161971', 2, NULL, 00000024, 'TurabenCheryl', 'b3e8268268b243e4988d73f60d50ef7e8faed5e6', 0, 0, 'Cheryl Turaben', '', 1, 'c4ac4dbb', '12212017', 'JAO', 0, 1),
(00000202, 'Mayo', 'Noralia', 'Unos', NULL, '', 'Jaro', 'Iloilo City', 'Iloilo', '9364673459', '', 0, '', '07251974', 2, NULL, 00000024, 'MayoNoralia', 'a90a50f88db06e75b8fdf1ee01e20a464dfd30a6', 0, 0, 'Noralia Mayo', '', 2, '1d8a0eb6', '12212017', 'JAO', 0, 1),
(00000203, 'Tadeo', 'Joy', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000180, 'TadeoJoy', '7db232e11b5d75a99aa91f59c320232257bdcad9', 0, 0, 'Joy Tadeo', '', 3, 'aa97cfb2', '12222017', 'GCC', 0, 1),
(00000204, 'Zerrudo', 'Leonisa', 'Janolino', NULL, 'Block 19 Lot 42 Phase 2 Deca Homes', 'Pandac', 'Pavia', 'Iloilo', '9159131794', '', 0, '', '10141954', 2, NULL, 00000031, 'ZerrudoLeonisa', '1cc284c09698264289d11046ec0e12c5f6f3e403', 0, 0, 'Leonisa Zerrudo', '', 1, 'afc788ac', '12242017', 'JAO', 0, 1),
(00000205, 'Mesiderio', 'Jonah Ray', 'Palmes', NULL, 'Baluarte', 'Molo', 'Iloilo City', 'Iloilo', '9201383489', '', 0, '', '10301981', 0, NULL, 00000024, 'MesiderioJonah', '6e83cad1289ad30623f229d46a535b5de1ec7047', 0, 0, 'Jonah Ray Mesiderio', '', 2, '18da49a8', '12252017', 'JAO', 0, 1),
(00000206, 'Moleno', 'Lanie', 'Zerrudo', NULL, '', 'Balabag', 'Pavia', 'Iloilo', '9157408037', '', 0, '', '99999999', 2, NULL, 00000031, 'MolenoLanie', '7f7aee07ac00eaedd430f2f1be9737bf29fbaaaf', 0, 0, 'Lanie Moleno', '1479182023', 2, 'c1fc0aa5', '12262017', 'JAO', 0, 1),
(00000207, 'Santillan', 'Florencia', 'Galache', NULL, 'Taft St.', '', 'Sta. Barbara', 'Iloilo', '9507513365', '', 0, '', '10271970', 2, NULL, 00000080, 'SantillanFlorencia', 'd8cf21ff050ee97fc9053f303ce901f147a4919c', 0, 0, 'Florencia Santillan', '', 2, '76e1cba1', '12262017', 'JAO', 0, 1),
(00000208, 'Quidulit', 'Janelyn', 'C.', NULL, 'Block 50 Lot 02 Bayabas St.', 'Brgy. Rizal', 'Makati City', 'Metro Manila', '', '', 0, '', '10171988', 2, NULL, 00000159, 'QuidulitJanelyn', '0074769d3b1cc0ca155d8810db369b03fd1a6f9c', 0, 0, 'Janelyn Quidulit', '', 1, 'cb5c8499', '12292017', 'JAO', 0, 1),
(00000209, 'Bulante', 'Lovely', 'Daroy', NULL, 'Block 52 Lot 1 Bayabas St.', 'Brgy. Rizal', 'Makati City', 'Metro Manila', '9083138271', '', 0, '', '04281998', 2, NULL, 00000159, 'BulanteLovely', 'f99cbd2814c1f5b35dc4b68c44d2762ce0ef75de', 0, 0, 'Lovely Bulante', '', 1, '7c41459d', '12292017', 'JAO', 0, 1),
(00000210, 'Balbon', 'Redenthor', 'Pombo', NULL, '240 V. Custodio St.', 'Brgy. Santulan', 'Malabon City', 'Metro Manila', '9971404690', '', 0, '', '10231993', 1, NULL, 00000071, 'BalbonRedenthor', '6b8558fa33e5ba3bf9b677ea38d99782897c14fc', 0, 0, 'Redenthor Balbon', '', 1, 'af70956d', '12292017', 'JAO', 0, 1),
(00000211, 'Ruiz', 'Jennelyn', 'B.', NULL, 'Block 42 Lot 49 San Lorenzo Ruiz', 'Brgy. San Juan', 'Taytay', 'Rizal', '9158362641', '', 0, '', '06061991', 2, NULL, 00000071, 'RuizJennelyn', 'bb17d405fb4c571a40d64ccfb733f9b97381734a', 0, 0, 'Jennelyn Ruiz', '', 1, '186d5469', '12292017', 'JAO', 0, 1),
(00000212, 'Bernardo', 'Irma', 'Pimentel', NULL, 'Block 78 Lot 8 Bautista ', 'Sampaloc 4', 'Dasmarinas ', 'Cavite', '9778197438', '', 0, '', '06141967', 2, NULL, 00000155, 'BernardoIrma', 'f603383bda5a76c25d070901ab0a29e661d27129', 0, 0, 'Irma Bernardo', '', 1, 'c14b1764', '12292017', 'JAO', 0, 1),
(00000213, 'Abuyan', 'Jelanica', 'Joaquin', NULL, '0457 Lanuza Compound', 'Tagpos', 'Binangonan', 'Rizal', '9066540229', '', 0, '', '09031991', 2, NULL, 00000122, 'AbuyanJelanica', '0bb1ed0e3e715b79c7317e7fec562e999b186503', 0, 0, 'Jelanica Abuyan', '', 1, '7656d660', '12292017', 'JAO', 0, 1),
(00000214, 'Paguntalan', 'Marites', 'Zerrudo', NULL, 'Paloc', 'Sool', 'Dumangas', 'Iloilo', '9175140355', 'maritespaguntalan@gmail.com', 0, '', '07281979', 2, NULL, 00000031, 'PaguntalanMarites', '6326bd1e4bb5fbd9ce8c6a411c39d1b87c88beef', 0, 0, 'Marites Paguntalan', '', 2, '7306917e', '12302017', 'GCC', 0, 1),
(00000215, 'Carado', 'Cerfelina', 'Robles', '', '177 Veterans Village', '', 'Iloilo City', 'Iloilo', '9468339445', '', 0, '', '09211951', 2, '', 00000118, 'CaradoCerfelina', '1f1f956bb7df6c70caadc140bf32a4570485c08a', 0, 0, 'Cerfelina Carado', '', 1, 'c41b507a', '01102018', 'GCC', 0, 1),
(00000216, 'Perez', 'Rhea Lyn', 'Montenegro', NULL, 'Phase 2 Block 19 Lot 47 DECA Homes', '', 'Pavia', 'Iloilo', '9127273630', '', 0, '', '09021995', 2, NULL, 00000031, 'PerezRheaLyn', '999470c51ea567decce7a4f81a0d567673b6b596', 0, 0, 'Rhea Lyn Perez', '', 1, '1d3d1377', '01072018', 'GCC', 0, 1),
(00000217, 'Tan', 'Lilian', 'Yu', NULL, '429 Pina Ave.', 'Sta. Mesa', 'Manila City', 'Metro Manila', '9228721946', 'tanlilian012165@gmail.com', 0, '', '01211965', 2, NULL, 00000002, 'TanLilian', '904775199d3b9e4a0969f043001e08ae8a929305', 0, 0, 'Lilian Tan', '8023006651', 3, 'aa20d273', '01082018', 'JAO', 0, 1),
(00000218, 'Mesiderio', 'Carlito', 'Sta. Romana', '', 'Evangelista St.', 'Purok l', 'Pavia', 'Iloilo', '9338790926', 'nasmesiderio@gmail.com', 0, '', '06151956', 1, '', 00000024, 'MesiderioCarlito', 'ea8c3a6034c53510263202674d4201e044141821', 0, 0, 'Carlito Mesiderio', '', 2, '179d9d4b', '01102018', 'GCC', 0, 1),
(00000219, 'Villa', 'Emer', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'VillaEmer', '8a306e02c69bc63e256b285daffe1e11fedccbcd', 0, 0, 'Emer Villa', '', 1, 'a0805c4f', '01102018', 'JAO', 0, 1),
(00000220, 'Lopez', 'Rodelyn', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'LopezRodelyn', '24eb1dcdbd5d83ed8c1bc7709872addd2595794a', 0, 0, 'Rodelyn Lopez', '', 1, '7c2f7e1f', '01102018', 'JAO', 0, 1),
(00000221, 'Fernandez', 'Grace', 'Mucho', NULL, '', 'Tabucan', 'Barotac Nuevo', 'Iloilo', '9297018144', '', 0, '', '04041971', 2, NULL, 00000118, 'FernandezGrace', 'f074c97621f0c77c7643c7484c150c599a92db3b', 0, 0, 'Grace Fernandez', '', 2, 'cb32bf1b', '01112018', 'GCC', 0, 1),
(00000222, 'Calimutan', 'Maria Elena', 'Halaman', NULL, '31 Gen. Hughes St.', '', 'Iloilo City', 'Iloilo', '9509127736', '', 0, '', '09291955', 2, NULL, 00000150, 'CalimutanMariaElena', '2f520f5be5fa61b633c56864f99ab82bd28c7473', 0, 0, 'Maria Elena Calimutan', '', 2, '1214fc16', '01112018', 'GCC', 0, 1),
(00000223, 'Antone', 'Dina', 'Herbuela', NULL, '', '', 'Estancia', 'Iloilo', '9304786041', '', 0, '', '09271965', 2, NULL, 00000031, 'AntoneDina', 'add6203091a82e84d70ffcf5a681391f96ab04ac', 0, 0, 'Dina Antone', '', 1, 'a5093d12', '01132018', 'GCC', 0, 1),
(00000224, 'Lomugdang', 'Joeann', 'Aguirre', NULL, '', '', 'Estancia', 'Iloilo', '9567345664', '', 0, '', '01281976', 2, NULL, 00000031, 'LomugdangJoeann', '4eeba1948fefa1ff21d9dee62d5e6ab446a61d5e', 0, 0, 'Joeann Lomugdang', '', 1, 'a0597a0c', '01132018', 'GCC', 0, 1),
(00000225, 'Clarito', 'Haydie', 'Sunio', NULL, '', '', 'Sta. Barbara', 'Iloilo', '9094387076', '', 0, '', '03101972', 2, NULL, 00000218, 'ClaritoHaydie', '7dd2eaf1919b06160e423915c0669b3a2c93f735', 0, 0, 'Haydie Clarito', '', 1, '1744bb08', '01152018', 'GCC', 0, 1),
(00000226, 'Alinsubao', 'Helen', 'Andea', NULL, 'Alibango St.', '', 'Alimodian', 'Iloilo', '9094925217', 'hellenalinsubao@yahoo.com', 0, '', '03251992', 2, NULL, 00000031, 'AlinsubaoHelen', '4f893fba6c201334f7a31ef4b2d8b8ca6d851233', 0, 0, 'Helen Alinsubao', '', 1, 'ce62f805', '01152018', 'GCC', 0, 1),
(00000227, 'Golveo', 'Myrel', 'Duhina', '', 'llaya 1st', '', 'Dumangas', 'Iloilo', '9303297738', '', 0, '', '01021985', 2, '', 00000218, 'GolveoMyrel', '95fef51b36524077d7b26ef5b8a28dfcb8e03967', 0, 0, 'Myrel Golveo', '', 1, '797f3901', '01172018', 'GCC', 0, 1),
(00000228, 'Catedrilla', 'Roda', 'Labordo', NULL, '', 'Panuran', 'Lambunao', 'Iloilo', '9093210022', '', 0, '', '02121973', 2, NULL, 00000182, 'CatedrillaRoda', '13e366ce92827bf3cc993f0700a8a75947032d79', 0, 0, 'Roda Catedrilla', '', 2, 'c4c27639', '01172018', 'GCC', 0, 1),
(00000229, 'Baldesimo', 'Nelita', 'Guellergen', '', '146 Gen Hughes St.', '', 'Iloilo City', 'Iloilo', '', '', 0, '', '08061946', 2, '', 00000118, 'BaldesimoNelita', '5353b1abf882a25e09269676e71190c3b20a695b', 0, 0, 'Nelita Baldesimo', '', 2, '73dfb73d', '01222018', 'GCC', 0, 1),
(00000230, 'Cantara', 'Raymund', 'Mijares', NULL, 'Blk17 LT4', 'Austery Subd.', 'Manduarriao', 'Iloilo', '9129389208', 'RayCantara@yahoo.com', 0, '', '11051980', 1, NULL, 00000162, 'CantaraRaymund', '466f66193cbc248f1cb1e77f028ae1d5eb8b8221', 0, 0, 'Raymund Cantara', '', 1, 'a0ee67cd', '01222018', 'GCC', 0, 1),
(00000231, 'Belchez', 'Gina', 'G.', NULL, '729 Block 45 Lot 12 Phase 1', 'Bagong Nayon II', 'Antipolo City', 'Rizal', '9234944835', 'gina.belchez@gmail.com', 0, '', '07181982', 2, NULL, 00000105, 'BelchezGina', '81d7aaf9b60c13e730c6cd76e051440a3e124c39', 0, 0, 'Gina Belchez', '', 1, '17f3a6c9', '01222018', 'GCC', 0, 1),
(00000232, 'Endoso', 'Jeanna', 'Pahilga', NULL, '', 'Sagua ', 'Anini-y', 'Antique', '9353075590', 'jeannapendoso@yahoo.com', 0, '', '09091975', 2, NULL, 00000218, 'EndosoJeanna', 'aef3ef921f301966286e2f74e7e2ecb420569337', 0, 0, 'Jeanna Endoso', '', 2, 'ced5e5c4', '01232018', 'GCC', 0, 1),
(00000233, 'Focbit', 'Junary', 'Obligar', NULL, 'Block 22', 'Addition Hills', 'Mandaluyong City', 'Metro Manila', '9104270421', 'junabam2x@gmail.com', 0, '', '01011991', 1, NULL, 00000002, 'FocbitJunary', '32a2ef47d959cda9aeac764ddc9ff04df9b805ca', 0, 0, 'Junary Focbit', '3889144784', 3, '79c824c0', '01232018', 'GCC', 0, 1),
(00000234, 'Nidea', 'Katia', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'NideaKatia', '1a79277c7e2e868e504f2da25520c108575829e4', 0, 0, 'Katia Nidea', '', 3, '7c9863de', '01252018', 'JAO', 0, 1),
(00000235, 'Zerrudo', 'Carlos', '', NULL, '', 'Sta. Cruz San Miguel', '', 'Iloilo', '9064214229', '', 0, '', '09161955', 1, NULL, 00000204, 'ZerrudoCarlos', '7617a647dc2f46f5f445ae848036ccaf0caa2f3a', 0, 0, 'Carlos Zerrudo', '', 1, 'cb85a2da', '01262018', 'GCC', 0, 1),
(00000236, 'Olympia', 'Evangeline \"Jane\"', 'Comiso', NULL, '1645 Kundiman St.', 'Sampaloc', 'Manila City', 'Metro Manila', '9199570794', 'polarisangel09@gmail.com', 0, '', '09221961', 2, NULL, 00000002, 'OlympiaJane', '13459eb396067091f58f520d3ba072942be31a4b', 0, 0, 'Evangeline \"Jane\" Olympia', '', 3, '12a3e1d7', '01272018', 'JAO', 0, 1),
(00000237, 'Lorque', 'Stephanie', 'Jamoyot', NULL, '', 'Brgy. Pal-agon Pavia ', 'Iloilo City', 'Iloilo', '9396406173', '', 0, '', '09241985', 2, NULL, 00000218, 'LorqueStephanie', 'ecf114dd253fef7a2cba341a3e26ea794fc90c81', 0, 0, 'Stephanie Lorque', '', 1, 'a5be20d3', '01292018', 'GCC', 0, 1),
(00000238, 'Moleno', 'Magdalena', 'Enan', '', '', 'Lopez Jaena Norte', 'La Paz', 'Iloilo', '9105267235', '', 0, '', '04192018', 2, '', 00000206, 'MolenoMagdalena', '66cfd894e274f8ed13b549b5c25c4edc9171205d', 0, 0, 'Magdalena MoleÃ±o', '', 1, '18036feb', '01302018', 'GCC', 0, 1),
(00000239, 'Viernes', 'David', 'L.', NULL, '1716 Maria Clara St.', 'Sampaloc', 'Manila', 'Metro Manila', '9478710203', '', 0, '', '12291963', 1, NULL, 00000002, 'ViernesDavid', 'efb1ad1ffb884e98be524060a367bbef32fed636', 0, 0, 'David Viernes', '', 1, 'af1eaeef', '01312018', 'JAO', 0, 1),
(00000240, 'Casampol', 'Ma. Imelda', '', NULL, '', 'Upper Bicutan', 'Taguig City', 'Metro Manila', '9217915863', '', 0, '', '12031969', 2, NULL, 00000058, 'CasampolImelda', '8e2d0f052a3599a308c5756eae1088b1a29e82d0', 0, 0, 'Ma. Imelda Casampol', '', 3, 'da90a8fa', '02242018', 'JAO', 0, 1),
(00000241, 'See', 'Irene Carolina', 'K.', '', '1020 Reina Regente St.', 'Binondo', 'Manila', 'Metro Manila', '9165759300', 'irene_2062@yahoo.com', 0, '', '10011988', 2, '', 00000002, 'SeeIrene', '6e1dcc6f90ec72ea1e962d198c630007014921fc', 0, 0, 'Irene Carolina See', '', 1, '6d8d69fe', '02052018', 'JAO', 0, 1),
(00000242, 'Masangya', 'Janet', 'Zamora', NULL, '', 'Brgy. Monica Blumentritt St. ', 'Iloilo City', 'Iloilo', '9308555379', '', 0, '', '06091988', 2, NULL, 00000118, 'MasangyaJanet', '20e08555d0d494389b6e943d974eefe2aee5b775', 0, 0, 'Janet Masangya', '', 1, 'b4ab2af3', '02052018', 'GCC', 0, 1),
(00000243, 'Dela Cruz', 'Jocelyn', 'Drilon', NULL, '33 N Zamora St.', '', ' Iloilo City', 'Iloilo', '9187890601', '', 0, '', '12041962', 2, NULL, 00000118, 'DelaCruzJocelyn', '1e1e8f8408e70c68dac5e5d719dd8a8c2062e754', 0, 0, 'Jocelyn Dela Cruz', '', 1, '03b6ebf7', '02052018', 'GCC', 0, 1),
(00000244, 'Macaranas', 'Lella', 'Espada', NULL, 'Lessandra Subd.', 'Hibao-an', 'Pavia', 'Iloilo', '9078889760', '', 0, '', '03051989', 2, NULL, 00000080, 'MacaranasLella', '5ea07249a431f4f6570efc722c4dd4a0e07212a9', 0, 0, 'Lella Macaranas', '', 2, '06e6ace9', '02052018', 'GCC', 0, 1),
(00000245, 'Quebradero', 'Hermania', 'Pasigay', NULL, '', 'Brgy.Nueva Union', 'Passi City', 'Iloilo', '9083204885', '', 0, '', '09201950', 2, NULL, 00000118, 'QuebraderoHermania', 'f57203353abffb863922e265eca62b4f1057b499', 0, 0, 'Hermania Quebradero', '', 1, 'b1fb6ded', '02052018', 'GCC', 0, 1),
(00000246, 'Solitario', 'Sheila Mae', 'Panes', NULL, '153-H', ' Legaspi Dela Rama', 'Iloilo City', 'Iloilo', '9463865167', '', 0, '', '11111987', 2, NULL, 00000118, 'SolitarioSheila', 'c271b5cf96dfe8df80fa1c2a1e5344b9317acd42', 0, 0, 'Sheila Mae Solitario', '', 1, '68dd2ee0', '02052018', 'GCC', 0, 1),
(00000247, 'Al-wahaibi', 'Shahin', 'Zerrudo', NULL, 'Deca Homes', ' Pandac', 'Pavia', 'Iloilo', '9159131794', '', 0, '', '12072004', 2, NULL, 00000031, 'AlwahaibiShahin', '21fb409ef2d2b5ab1815172c7f154ac890b361e6', 0, 0, 'Shahin Al-wahaibi', '', 3, 'dfc0efe4', '02052018', 'GCC', 0, 1),
(00000248, 'Moleno', 'Alfredo Jr.', 'Magnetico', '', '', 'Lopez Jaena Norte', 'La Paz', 'Iloilo', '9369004622', '', 0, '', '02151986', 1, '', 00000206, 'MolenoAlfredoJr', 'fe85bfe3275c76e05796affb0e6d2528461b5c75', 0, 0, 'Alfredo MoleÃ±o Jr.', '', 1, '627da0dc', '02052018', 'GCC', 0, 1),
(00000249, 'Lerum', 'Aileen', '', NULL, '1063 Vicente Cruz St.', 'Sampaloc', 'Manila', 'Metro Manila', '9397535059', 'aileenlerum@yahoo.com', 0, '', '05111974', 2, NULL, 00000002, 'LerumAileen', 'a07ca2be623d4a24aff5a9188e762098b60a3fc1', 0, 0, 'Aileen Lerum', '', 1, 'd56061d8', '02082018', 'JAO', 0, 1),
(00000250, 'Igbante', 'Jocelyn', 'Nillos', NULL, 'c/o Kodak Phil. INC', '', 'Gaisano', 'Iloilo', '9985542818', '', 0, '', '12211966', 2, NULL, 00000118, 'IgbanteJocelyn', '45df425c82313cb38df3bfa3185323cb47283a86', 0, 0, 'Jocelyn Igbante', '1473048899', 2, '0651b128', '02092018', 'GCC', 0, 1),
(00000251, 'Penaredondo', 'Claudette', 'Zapanta', '', 'Villa Consulacion Subd.', 'Tabuc Suba Jaro', 'Iloilo City', 'Iloilo', '9958455189', '', 0, '', '01121986', 2, '', 00000118, 'PenaredondoClaudette', 'a80848aa8551aa04f1ad2d09ff5bfcf6793a228c', 0, 0, 'Claudette PeÃ±aredondo', '', 2, 'b14c702c', '02102018', 'GCC', 0, 1),
(00000252, 'Alfaras', 'Lisa', 'Gamuza', NULL, 'Ramos Ext.', 'Brgy. Purok 1', 'Pavia', 'Iloilo', '9469568065', '', 0, '', '01071964', 2, NULL, 00000218, 'AlfarasLisa', 'c86b4f4f86061e1d1e2e6de13f590385d1972a1f', 0, 0, 'Lisa Alfaras', '', 2, '686a3321', '02112018', 'GCC', 0, 1),
(00000253, 'Carvajal', 'Bernald', '', NULL, '36 ROTC Hunter', '', '', '', '9267065443', '', 0, '', '10221964', 1, NULL, 00000002, 'CarvajalBernald', '298ed19166d32ebd824cafe8a84c4e21d1cfc661', 0, 0, 'Bernald Carvajal', '', 1, 'df77f225', '02132018', 'JAO', 0, 1),
(00000254, 'Temporosa', 'Ana Marie', 'Trono', NULL, 'Allera St.', 'Tigbuan', 'Iloilo City', 'Iloilo', '9203279761', '', 0, '', '07261969', 2, NULL, 00000029, 'TemporosaAnaMarie', '56c84335ee1b9eed1eb7a22d268128b597099583', 0, 0, 'Ana Marie Temporosa', '', 2, 'da27b53b', '02142018', 'GCC', 0, 1),
(00000255, 'Balgos', 'Ma. Theresa', 'Buenafe', NULL, '162', 'Veterans Village', 'Iloilo City', 'Iloilo', '9214943732', '', 0, '', '01201967', 2, NULL, 00000150, 'BalgosMaTheresa', 'df39eb01224833b2a0fb4552081eff7efdce5701', 0, 0, 'Ma. Theresa Balgos', '', 2, '6d3a743f', '02162018', 'GCC', 0, 1),
(00000256, 'Felarca', 'Wallyn', 'Gubatanga', NULL, 'Blk. 8 Lot 9 Newsite Bitoon', 'Jaro', 'Iloilo City', 'Iloilo', '9958519550', '', 0, '', '10151995', 0, NULL, 00000061, 'FelarcaWallyn', 'e273f05a8e341fbfcb3ccc8b80f72a9a8e48ab92', 0, 0, 'Wallyn Felarca', '', 2, 'b41c3732', '02162018', 'GCC', 0, 1),
(00000257, 'Jayme', 'Jennyline', 'Pico', NULL, 'Blk. 8 Lot 3 Bito-on Newsite', 'Jaro', 'Iloilo City', 'Iloilo', '9778777151', '', 0, '', '04191986', 2, NULL, 00000061, 'JaymeJennyline', '043965ab8db9e301466979dcd259616b63669151', 0, 0, 'Jennyline Jayme', '', 2, '0301f636', '02162018', 'GCC', 0, 1),
(00000258, 'Diaz', 'Concepcion', 'B.', NULL, '121 Sta. Catalina St.', '', 'Quezon City', 'Metro Manila', '9393526911', 'diaz.alona@yahoo.com', 0, '', '12071960', 2, NULL, 00000006, 'DiazConcepcion', '82d2beb5a11ea1597d8ab9a69d71d0444f7d69b0', 0, 0, 'Concepcion Diaz', '', 1, 'bebcb90e', '02172018', 'JAO', 0, 1),
(00000259, '', 'Abmer', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000001, 'Abmer', 'f88a401a8f15fea5c27485fc6f54d532abd757b2', 0, 0, 'Abmer ', '', 2, '09a1780a', '08132017', 'GCC', 0, 1),
(00000260, 'Allones', 'Radino', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000001, 'AllonesRadino', '205495daf69a7c93e4f0d5bffbf969b4f58b859b', 0, 0, 'Radino Allones', '', 2, 'd50e5a5a', '08162017', 'GCC', 0, 1),
(00000261, 'Caldwell', 'Mark', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000001, 'CaldwellMark', 'c5fc7084eb8534c7707b40c4478cf640da15226d', 0, 0, 'Mark Caldwell', '', 2, '62139b5e', '09012017', 'GCC', 0, 1),
(00000262, 'Austria', 'Jeffrey', 'Domingo', '', 'Balikbayan Road', '', 'Tanay', 'Rizal', '09560619906', 'legendmammals1968@gmail.com', 0, '', '03311981', 1, '', 00000044, 'AustriaJeffrey', 'bcc5a84a8fd9d142dd70f6ac444bda42a4974d06', 0, 0, '', '', 2, 'bb35d853', '10242017', 'GCC', 0, 1),
(00000263, 'Masinsin', 'Mereniza', 'Casinsinan', '', 'Sitio Bulo-Bulo', 'Quisa', 'Pililla', 'Rizal', '09109709541', '', 0, '', '03241982', 0, '', 00000044, 'MasinsinMereniza', 'e6dc74ca3dc94997ee4a0b0ab5e42aa8329bdb6a', 0, 0, '', '', 2, '0c281957', '10242017', 'GCC', 0, 1),
(00000264, 'Catalan', 'Rhem Mae', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000016, 'CatalanRhemMae', 'd6abb3e99bc458e249b7787d5b4c0893169a4c71', 0, 0, 'Rhem Mae Catalan', '', 1, '09785e49', '12222017', 'GCC', 0, 1),
(00000265, 'Andajer', 'Lemar', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 0, NULL, 00000188, 'AndajerLemar', 'f51277c310d299c3770028896f050e5bd54fecc1', 0, 0, 'Lemar Andajer', '', 1, 'be659f4d', '12222017', 'GCC', 0, 1),
(00000266, 'Sumugad', 'Pia Mhirasol', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000013, 'SumugadPia', 'a947d992873a56ad9b2962e5d4dbae91e224be74', 0, 0, 'Pia Mhirasol Sumugad', '', 1, '6743dc40', '01052018', 'GCC', 0, 1),
(00000267, 'Torres', 'Jose Roy', '', NULL, '', 'Brgy. Mambugan', 'Antipolo City', 'Rizal', '9232757530', '', 0, '', '02041983', 1, NULL, 00000105, 'TorresJoseRoy', '4974f29d4a29a97a7f2b57c3dc4da490a5750bd5', 0, 0, 'Jose Roy Torres', '', 1, 'd05e1d44', '01222018', 'GCC', 0, 1),
(00000268, 'Alquisada', 'Patricia Mae', 'Esmolina', NULL, 'Oñate de Leon', 'Mandurriao', 'Iloilo City', 'Iloilo', '9491191827', '', 0, '', '11031983', 2, NULL, 00000171, 'AlquisadaPatricia', '1c57aa04907248f64f404c0e687ca19215124b1a', 0, 0, 'Patricia Mae Alquisada', '', 1, '6de3527c', '02202018', 'GCC', 0, 1),
(00000269, 'Hogar', 'Ramonito Jr.', 'Tumulak', '', '', 'Brgy. Muelle Loney', 'Iloilo City', 'Iloilo', '', '', 0, '', '08191990', 1, '', 00000162, 'HogarRamonitoJr', '3e6f2b7570d98d0d5e7ee03bf79fd362f541d536', 0, 0, 'Ramonito Hogar Jr.', '', 2, 'dafe9378', '02202018', 'GCC', 0, 1),
(00000270, 'Takashima', 'Erika', '', NULL, '2062 Leveriza St.', 'Malate', 'Manila City', 'Metro Manila', '9284357369', '', 0, '', '99999999', 2, NULL, 00000058, 'TakashimaErika', '380e3f49bd4f6394c5c271d27721ca1d449d7060', 0, 0, 'Erika Takashima', '', 1, '09cf4388', '02222018', 'GCC', 0, 1),
(00000271, 'Nermal', 'Myra', '', NULL, '', 'Brgy. Martinez', 'Tibiao', 'Antique', '9275081824', '', 0, '', '07021988', 2, NULL, 00000132, 'NermalMyra', '8b6a2f782a0e9bf099711151a079415447f73874', 0, 0, 'Myra Nermal', '', 1, 'bed2828c', '02222018', 'GCC', 0, 1),
(00000272, 'Mas', 'Rachelle', 'Cagara', NULL, '82 B Caab Apartelle E. Faustino St.', 'Punturin', 'Valenzuela City', 'Metro Manila', '', '', 0, '', '99999999', 2, NULL, 00000149, 'MasRachelle', 'ac2836c6fc968d16d61c20059afda3c40dff7e92', 0, 0, 'Rachelle Mas', '', 1, '67f4c181', '02222018', 'GCC', 0, 1),
(00000273, 'Orsolino', 'Cristito', 'T.', NULL, '#931 Sampaguita St.', 'Brgy. San Jose, Brgy. 187, Zone 16, Tala', 'Caloocan City', 'Metro Manila', '9976383206', '', 0, '', '09241968', 1, NULL, 00000002, 'OrsolinoCristito', 'c618e3f871200a795f004e332df940e2e40af27b', 0, 0, 'Cristito Orsolino', '', 1, 'd0e90085', '02222018', 'JAO', 0, 1),
(00000274, 'Malinao', 'Mary Christine Angela', '', NULL, '', '', '', 'Nueva Ecija', '9061213136', '', 0, '', '03292004', 2, NULL, 00000132, 'MalinaoAngela', 'd0139995b817762014a57e96006f77368332e110', 0, 0, 'Mary Christine Angela Malinao', '', 1, 'd5b9479b', '02222018', 'GCC', 0, 1),
(00000275, 'Balanuevo', 'Alma', '', NULL, 'Room 1001 Prestige Tower, Ongpin St.', 'Sta. Cruz', 'Manila City', 'Metro Manila', '9268791518', '', 0, '', '99999999', 2, NULL, 00000105, 'BalanuevoAlma', 'd29e3bb27198e48552cdca05848be07a21666864', 0, 0, 'Alma Balanuevo', '', 1, '62a4869f', '02222018', 'GCC', 0, 1),
(00000276, 'Caling', 'Alma Rose', '', NULL, '', 'Maranding', 'Lala', 'Lanao del Norte', '9366182923', '', 0, '', '06092005', 2, NULL, 00000275, 'CalingAlmaRose', 'de53e3101c879830b410141af71639cd840d995c', 0, 0, 'Alma Rose Caling', '', 1, 'bb82c592', '02222018', 'GCC', 0, 1),
(00000277, 'Balanuevo', 'Emma', '', NULL, '', '', '', 'Lanao del Norte', '9057959044', '', 0, '', '12211992', 2, NULL, 00000275, 'BalanuevoEmma', 'c88dbb927ecd94b282f04d712f2b6ab70364ea1b', 0, 0, 'Emma Balanuevo', '', 1, '0c9f0496', '02222018', 'GCC', 0, 1),
(00000278, 'Hernandez', 'Lizel', '', NULL, 'Lucky Homes Subdivision', 'Santo Cristo', 'Sariaya', 'Quezon', '9109923415', '', 0, '', '99999999', 2, NULL, 00000132, 'HernandezLizel', '0f926bbc77b033546394112fd0c6250beae35e24', 0, 0, 'Lizel Hernandez', '', 1, 'b1224bae', '02222018', 'GCC', 0, 1),
(00000279, 'Lavalle', 'Manuel Benilda', '', NULL, '110 A M.L.Quezon St.', 'Hagonoy', 'Taguig City', 'Metro Manila', '', '', 0, '', '06111961', 1, NULL, 00000132, 'LavalleManuel', '18957588300453be2c3922f8da1f42083fa8e98c', 0, 0, 'Manuel Benilda Lavalle', '', 1, '063f8aaa', '02222018', 'GCC', 0, 1),
(00000280, 'Valdez', 'Terry', 'Lopez', NULL, '11A 1st Avenue', 'Manggahan, Bagong Lipunan ng Crame', 'Quezon City', 'Metro Manila', '9771301077', '', 0, '', '06121979', 2, NULL, 00000132, 'ValdezTerry', 'f82e95458d5cf046fe51d10e1be525e22661157c', 0, 0, 'Terry Valdez', '', 1, '21f2c435', '02222018', 'GCC', 0, 1),
(00000281, 'Joson', 'John Jester', '', NULL, 'Area C Purok 12, Veoleta s St.', 'San Martin 4', 'San Jose del Monte', 'Bulacan', '9072306027', '', 0, '', '12301998', 1, NULL, 00000132, 'JosonJohnJester', '2aaed782d8dd515f8c500f46a330971245fe2fda', 0, 0, 'John Jester Joson', '', 1, '96ef0531', '02222018', 'GCC', 0, 1),
(00000282, 'Untalan', 'Sheryll', 'J.', NULL, 'T. Alonzo St.', '', 'Baguio City', 'Benguet', '9083423723', '', 0, '', '99999999', 2, NULL, 00000132, 'UntalanSheryll', '1baa5333eccdee7e18a78ab55a3e64874d4ea370', 0, 0, 'Sheryll Untalan', '', 1, '4fc9463c', '02222018', 'GCC', 0, 1),
(00000283, 'Gumban', 'Lovella', 'Bustamante', NULL, '', 'Trapiche', 'Oton', 'Iloilo', '9064366931', '', 0, '', '06091977', 2, NULL, 00000080, 'GumbanLovella', '587e7f694920904273b992afb563d1719dc05e70', 0, 0, 'Lovella Gumban', '', 2, 'f8d48738', '02252018', 'GCC', 0, 1),
(00000284, 'Evangelista', 'Richel', 'D.', NULL, '', 'Pob. 1', 'Bauan', 'Batangas', '9059247189', 'e_ishie@yahoo.com', 0, '', '05261986', 2, NULL, 00000058, 'EvangelistaRichel', '5129437ca4cc338d9072851f83cdeb1f4a514f46', 0, 0, 'Richel Evangelista', '', 2, 'fd84c026', '02252018', 'GCC', 0, 1),
(00000285, 'Opelinia', 'Juliet', '', '', 'Unit 810 Pinecrest Condominium, Aurora Blvd.', '', 'Quezon City', 'Metro Manila', '9053010682', 'jmopelinia@gmail.com', 0, '', '01241984', 2, '', 00000001, 'OpeliniaJuliet', 'f96453e8f26c1d4779dcafa422ca729617b59ee2', 0, 0, 'Juliet Opelinia', '', 0, '4a990122', '02272018', 'JAO', 0, 1),
(00000286, 'Nacario', 'Jocelyn', 'Arceno', NULL, '', 'VIP Village, Inayawan', 'Cebu City', 'Cebu', '9423702238', '', 0, '', '06021980', 2, NULL, 00000218, 'NacarioJocelyn', 'f5747d202b00f8807ccc8111f5b93d40fff4498e', 0, 0, 'Jocelyn Nacario', '', 1, '93bf422f', '02272018', 'GCC', 0, 1),
(00000287, 'Roga', 'Lorna', 'Porras', NULL, '', 'Brgy. Muelle Loney', 'Iloilo City', 'Iloilo', '9483236997', '', 0, '', '04191961', 2, NULL, 00000243, 'RogaLorna', '0f36f0286774bed002b43520f7251cd9b4b810ae', 0, 0, 'Lorna Roga', '', 1, '24a2832b', '02282018', 'GCC', 0, 1),
(00000288, 'Abraham', 'Margarette', 'O Dell', NULL, '', 'Lopez Jaena Norte', 'La Paz', 'Iloilo', '9308146210', '', 0, '', '07281969', 2, NULL, 00000243, 'AbrahamMargarette', '942289f3a5317604f9be82160854247eea96d0ed', 0, 0, 'Margarette Abraham', '', 1, '991fcc13', '02282018', 'GCC', 0, 1),
(00000289, 'Casampol', 'Justine Mae', '', NULL, '', 'Upper Bicutan', 'Taguig City', 'Metro Manila', '9217915863', '', 0, '', '06192003', 2, NULL, 00000240, 'CasampolJustineMae', '9c115328ecede58b0e8d9f6f0b59783b6a73e953', 0, 0, 'Justine Mae Casampol', '', 3, '2e020d17', '03012018', 'JAO', 0, 1),
(00000290, 'Galvez', 'Wedeliza', 'Adlawan', NULL, '2353 Larry', 'San Roque', 'Talisay City', 'Cebu', '9335046249', '', 0, '', '06121972', 2, NULL, 00000024, 'GalvezWedeliza', 'b2938020453fae7a05f12ca57f14228d35b31da6', 0, 0, 'Wedeliza Galvez', '', 2, 'fd33dde7', '03012018', 'GCC', 0, 1),
(00000291, 'Gonzales', 'Nenita', 'Dayday', NULL, '', 'Tuburan Sur', 'Danao City', 'Cebu', '9397491517', '', 0, '', '02141951', 2, NULL, 00000024, 'GonzalesNenita', 'cc889861710671f2390bead8cc255f8476c311f1', 0, 0, 'Nenita Gonzales', '', 2, '4a2e1ce3', '03022018', 'GCC', 0, 1),
(00000292, 'Derit', 'Nadeth', 'Baclaan', NULL, '', 'Magdugo', 'Toledo City', 'Cebu', '9278770915', '', 0, '', '12111983', 2, NULL, 00000131, 'DeritNadeth', '346c4414878f4ce2cb605b5ee5985314ae5a426b', 0, 0, 'Nadeth Derit', '', 2, '93085fee', '03032018', 'GCC', 0, 1),
(00000293, 'Tolentino', 'Evangeline', 'Perez', NULL, '244 Salinas Drive Extn.', 'Lahug', 'Cebu City', 'Cebu', '9323515660', '', 0, '', '04251965', 2, NULL, 00000024, 'TolentinoEvangeline', '601b51d3f55c6f3e46f20c7a9b06056bc8bbc573', 0, 0, 'Evangeline Tolentino', '', 2, '24159eea', '03062018', 'GCC', 0, 1),
(00000294, 'Villareal', 'Emilnor', 'Manuel', NULL, '15 Domingo St.', 'Cauarel 2 Subd., Project 6', 'Quezon City', 'Metro Manila', '9339520176', 'december_em@yahoo.com', 0, '', '12091972', 0, NULL, 00000001, 'VillarealEmilnor', '10629dcf0ffd36e5f241d5c1b07c0b3f7e84b20f', 0, 0, 'Emilnor Villareal', '', 3, '2145d9f4', '03062018', 'JAO', 0, 1),
(00000295, 'Tolentino', 'Dindo', 'Batoto', NULL, '244 Salinas Drive Extn.', 'Lahug', 'Cebu City', 'Cebu', '9335382357', '', 0, '', '12051965', 1, NULL, 00000293, 'TolentinoDindo', 'd4a009a39663e9066cf700293993667b32c8682e', 0, 0, 'Dindo Tolentino', '', 2, '965818f0', '03072018', 'GCC', 0, 1),
(00000296, 'Mata', 'Prescilla Liezl', 'Dihayco', NULL, '', 'P. Labuca Cansojong', 'Talisay City', 'Cebu', '9255026526', '', 0, '', '03231985', 2, NULL, 00000024, 'MataPrescilla', '520571c71c59cd27ab55d75af938f4795b470579', 0, 0, 'Prescilla Liezl Mata', '', 2, '4f7e5bfd', '03082018', 'GCC', 0, 1),
(00000297, 'Cambe', 'Joy', 'Salazar', NULL, '', 'Brgy. Concepcion II', 'Iloilo City', 'Iloilo', '9103467933', '', 0, '', '07311976', 2, NULL, 00000080, 'CambeJoy', 'edda99e3f8f2c7367e54399099d1f52aac63e826', 0, 0, 'Joy Cambe', '', 2, 'f8639af9', '03092018', 'GCC', 0, 1),
(00000298, 'Galvez', 'Jenny', 'Ganancial', NULL, '', 'Alaguisoc ', 'Jordan', ' Guimaras', '9555719521', '', 0, '', '01061983', 2, NULL, 00000225, 'GalvezJenny', '6a4df91d000a2a09f88d275239a8b147186d4cae', 0, 0, 'Jenny Galvez', '', 2, '45ded5c1', '03092018', 'GCC', 0, 1),
(00000299, 'Andrino', 'Ma. Lourdes', 'Porras', NULL, '', 'Don Fransisco Vill. Jaro ', 'Iloilo City', 'Iloilo', '9177228399', '', 0, '', '02111959', 2, NULL, 00000181, 'AndrinoLourdes', '9b689ee82217d569a22e6194a610b911a9d97933', 0, 0, 'Ma. Lourdes Andrino', '', 2, 'f2c314c5', '03102018', 'GCC', 0, 1),
(00000300, 'Coronado', 'Estelita', 'Sorilla', NULL, '307', 'Veterans Village', 'Iloilo City', 'Iloilo', '9106353178', '', 0, '', '01061944', 2, NULL, 00000297, 'CoronadoEstelita', 'ff0a1fae47eb8de8f1b8a166067fb5e3b3feecb4', 0, 0, 'Estelita Coronado', '', 2, 'f41d54be', '03112018', 'GCC', 0, 1),
(00000301, 'Comprendio', 'Rosemarie', 'Elechicon', NULL, '142 Modern Homes Subd.', ' Tabuc Suba Jaro', 'Iloilo City', 'Iloilo', '9778577688', '', 0, '', '10171960', 2, NULL, 00000024, 'ComprendioRosemarie', '1bb5d5c8e36e5ac3f5250fa3767a88424b2835f7', 0, 0, 'Rosemarie Comprendio', '', 2, '430095ba', '03122018', 'GCC', 0, 1),
(00000302, 'Chua', 'Maricris', 'Parrenas', NULL, 'NFA', 'Jaro', 'Iloilo City', 'Iloilo', '9178426109', '', 0, '', '01021970', 2, NULL, 00000024, 'ChuaMaricris', 'd00a1a98101c44339b976a409736b8f9ecb3b7a6', 0, 0, 'Maricris Chua', '', 2, '9a26d6b7', '03122018', 'GCC', 0, 1),
(00000303, 'Calayag', 'Agnes', 'Villavert', NULL, 'Villa Vista Subd. Guzman St.', ' Mandurriao', 'Iloilo City', 'Iloilo', '9959630070', '', 0, '', '08291960', 2, NULL, 00000024, 'CalayagAgnes', '4b004f525b1210d300a4488a2ee0c65b91a05522', 0, 0, 'Agnes Calayag', '', 2, '2d3b17b3', '03122018', 'GCC', 0, 1),
(00000304, 'Anatan', 'Elma', 'Tilawo', NULL, '', 'Ungka II', 'Pavia', 'Iloilo', '9209835767', '', 0, '', '01101965', 2, NULL, 00000024, 'AnatanElma', '18118e77920611cc9c92b3bc4b0a8ae173688f03', 0, 0, 'Elma Anatan', '', 2, '286b50ad', '03122018', 'GCC', 0, 1),
(00000305, 'Escalona', 'Andrea', 'Magbanua', NULL, 'Blk 25 lot 6 NHA I ', 'Mandurriao', 'Iloilo City', 'Iloilo', '9332024283', '', 0, '', '06091955', 2, NULL, 00000024, 'EscalonaAndrea', '3825e915ac6def191ff6556cdf57ffe4878292f5', 0, 0, 'Andrea Escalona', '', 2, '9f7691a9', '03122018', 'GCC', 0, 1),
(00000306, 'Perfas', 'Elaine Mae', 'Samorin', NULL, 'NFA', 'Jaro', 'Iloilo City', 'Iloilo', '9055119240', 'elaineperfas@gmail.com', 0, '', '05061983', 2, NULL, 00000305, 'PerfasElaine', 'efba08024537bc1bf8781be31ba3cc8bf3923758', 0, 0, 'Elaine Mae Perfas', '', 2, '4650d2a4', '03122018', 'GCC', 0, 1),
(00000307, 'Cabanos', 'Joebart', 'Cantel', '', '', '', 'Tigbuan City', 'Iloilo', '9982317400', '', 0, '', '10221961', 1, '', 00000305, 'CabanosJoebart', '553f945f377e7a74e918660cb31b9625a62527a7', 0, 0, 'Joebart CabaÃ±os', '', 2, 'f14d13a0', '03122018', 'GCC', 0, 1),
(00000308, 'Jaca', 'Asarinas', 'Royo', NULL, '308-E', ' Zone 4', 'Concepcion City', 'Iloilo', '9295646779', '', 0, '', '12161950', 0, NULL, 00000297, 'JacaAsarinas', '7cdd5b09dabdb130239e5ce567419e32ca6ea6c0', 0, 0, 'Asarinas Jaca', '', 2, '4cf05c98', '03152018', 'GCC', 0, 1),
(00000309, 'Lamboloto', 'Eva', 'Alcaraz', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000220, 'LambolotoEva', 'ddf3e0a51bb69abf58463a3cf5ccbc26d6f52b42', 0, 0, 'Eva Lamboloto', '', 1, 'fbed9d9c', '03182019', 'GCC', 0, 1),
(00000310, 'Ko', 'Shu Hua', '', NULL, '', '', 'Taipei City', 'Taiwan', '', '', 0, '', '99999999', 2, NULL, 00000002, 'KoCoco', 'ea0930b4abc8f4dea46914fd8380268aec6b5853', 0, 0, 'Shu Hua Ko', '', 0, '28dc4d6c', '03202018', 'GCC', 0, 1),
(00000311, 'Pon', 'Enie', 'Boblo', NULL, 'DHPRR- Phase 3 Block 34 Lot 21', 'Pandac', 'Pavia', 'Iloilo', '9287693277', '', 0, '', '05111986', 1, NULL, 00000181, 'PonEnie', '0866f1d7fcb14ca4434c7297a6115341e2168878', 0, 0, 'Enie Pon', '', 2, '9fc18c68', '03212018', 'GCC', 0, 1),
(00000312, 'Rashid', 'Cherry Mae', 'Sajonia', '', 'Ramos Ext.', 'Brgy. Purok 1', 'Pavia', 'Iloilo', '9206410020', '', 0, '', '02171981', 2, '', 00000218, 'RashidCherryMae', 'ac37e09d416d259f52e5491b8431bf42151d580e', 0, 0, 'Cherry Mae Rashid', '', 2, '46e7cf65', '03232018', 'GCC', 0, 1),
(00000313, 'Arroyo', 'Mary Grace', 'Biboso', NULL, '', '', 'Pavia', 'Iloilo', '9307970779', '', 0, '', '07061967', 2, NULL, 00000301, 'ArroyoMaryGrace', '0874c2aa2f0306356e28edf056360210b796f447', 0, 0, 'Mary Grace Arroyo', '', 2, 'f1fa0e61', '03262018', 'GCC', 0, 1),
(00000314, 'Pacleb', 'Julie Ann', 'Nino', '', '', 'Calumpang Molo', 'Iloilo City', 'Iloilo', '9099101673', '', 0, '', '06162018', 2, '', 00000138, 'PaclebJulieAnn', '77000c470720ab77cc2972caa0f76edc51fe5016', 0, 0, 'Julie Ann Pacleb', '', 2, 'f4aa497f', '03262018', 'GCC', 0, 1),
(00000315, 'De Los Santos', 'Rico', 'B.', NULL, 'Blk. 26 Lot 31 PCUP RPG Village', 'Brgy. San Jose', 'Antipolo City', 'Rizal', '9164627750', '', 0, '', '02141970', 1, NULL, 00000053, 'DeLosSantosRico', '1962e0d74ae6ae5fced82e7b0892775900bd46e2', 0, 0, 'Rico De Los Santos', '', 2, '43b7887b', '04022018', 'GCC', 0, 1),
(00000316, 'Yu', 'Elizabeth', 'Astrologo', NULL, 'Lucky Homes Subd.', 'Jaro', 'Iloilo City', 'Iloilo', '9184270018', '', 0, '', '12241953', 2, NULL, 00000080, 'YuElizabeth', 'cc50b48f61056f5012f14891321b5d14a9c822e2', 0, 0, 'Elizabeth Yu', '', 2, '9a91cb76', '05092018', 'GCC', 0, 1),
(00000317, 'Laurel', 'Alice', 'Lerma', NULL, 'Unit 1112 Howard Tower 6th Ave.', 'Grace Park East', 'Caloocan City', 'Metro Manila', '9173404645', '', 0, '', '11161957', 2, NULL, 00000002, 'LaurelAlice', 'ce8290c955c52c09b6bbda8667519fd01e08d3ac', 0, 0, 'Alice Laurel', '', 3, '2d8c0a72', '05162018', 'GCC', 0, 1),
(00000318, 'Tetan', 'Antonio', 'Sy', NULL, 'Unit 1112 Howard Tower 6th Ave.', 'Grace Park East', 'Caloocan City', 'Metro Manila', '63282456379', '', 0, '', '06251957', 2, NULL, 00000317, 'TetanAntonio', '974f9c65992b2d9c646be66a5f8b6e6d48bf61cd', 0, 0, 'Antonio Tetan', '', 3, '9031454a', '05162018', 'GCC', 0, 1),
(00000319, 'Hinigpit', 'Myra', 'Conlu', NULL, 'Block 24 Lot 10 Carmela Valley Subd.', '', 'Silay City', 'Negros Occidental', '9260074121', '', 0, '', '07031979', 2, NULL, 00000308, 'HinigpitMyra', 'a71240c460208fa66dc21bb8748d1c6dfcec4ebb', 0, 0, 'Myra Hinigpit', '', 2, '272c844e', '05222018', 'GCC', 0, 1),
(00000320, 'Lumintac', 'Ma. Socorro', 'Manojo', NULL, 'Block 8 Zayco Subd. ', 'Zayco Subd.', 'Kabankalan', 'Negros Occidental', '9183116338', '', 0, '', '03211964', 2, NULL, 00000080, 'LumintacMaSocorro', '85b0b905ea1724ff080001f0e9c0ebe8424f7304', 0, 0, 'Ma. Socorro Lumintac', '', 2, 'fb83a61e', '05222018', 'GCC', 0, 1),
(00000321, 'Diaz', 'Emmanuel', '', '', '121 Sta. Catalina St.', 'Holy Spirit', 'Quezon City', 'Metro Manila', '6324113210', 'diaz.alona@yahoo.com', 0, '', '04021985', 2, '', 00000258, 'DiazEmmanuel', 'a1c50c4c905aae1bade37789d6e1f21fbebac979', 0, 0, 'Emmanuel Diaz', '', 2, '4c9e671a', '05282018', 'GCC', 0, 1),
(00000322, 'Pingol', 'Edelmina', 'Dimarucut', '', '29 Masbate Loop, Marina Bay Homes', 'Tambo', 'Paraï¿½aque City', 'Metro Manila', '', 'goldminefoundation@yahoo.com', 0, '', '08051976', 2, '', 00000002, 'PingolEdelmina', 'b728a1ecd4aedcae81f3338c859e9441aad633ed', 0, 0, 'Edelmina Pingol', '', 3, '2f5d4e1f', '06012018', 'GCC', 1, 1),
(00000323, 'Tindo', 'Tipayno', 'Cato', NULL, '#3 Villamor St.', 'Brgy. Pacdal', 'Baguio City', 'Benguet', '9486254548', '', 0, '', '99999999', 1, NULL, 00000328, 'TindoTipayno', 'c481beeb6c3716cb23b2fac6a9028e3522f48a84', 0, 0, 'Tipayno Tindo', '', 1, '22a5e513', '06152018', 'GCC', 0, 1),
(00000324, 'Acedo', 'Edna', '', NULL, '509 Bldg. B Makati Homes', '', 'Makati City', 'Metro Manila', '9283340334', 'ednaacedo99@gmail.com', 0, '', '10231955', 2, NULL, 00000159, 'AcedoEdna', 'e0094251b8460c26d6042cbc3f5bb72dec35d618', 0, 0, 'Edna Acedo', '', 2, '27f5a20d', '06202018', 'GCC', 0, 1),
(00000325, 'Sabas', 'Lanie', 'Camasis', NULL, 'Ramos Ext.', 'Brgy. Purok 1', 'Pavia', 'Iloilo', '9560079060', '', 0, '', '03271988', 2, NULL, 00000024, 'SabasLanie', 'd5ca1b7bbf1016d15570b3934c50bf99bacb8521', 0, 0, 'Lanie Sabas', '', 3, '90e86309', '06252018', 'GCC', 0, 1),
(00000326, 'Barretto', 'Mark Joseph', 'Ang', '', '29-6 G. Araneta Ave.', 'Brgy. Potrero', 'Malabon City', 'Metro Manila', '9175899615', 'barrettomarkjoseph2017@gmail.com', 0, '', '11291990', 1, '', 00000025, 'BarrettoMark', '9ca7d34a0c17331390ea0fc2ffe86b5f123c4916', 0, 0, 'Mark Joseph Barretto', '', 3, '49ce2004', '06282018', 'GCC', 0, 1),
(00000327, 'Barretto', 'Camille', '', NULL, '29-6 G. Araneta Ave.', 'Brgy. Potrero', 'Malabon City', 'Metro Manila', '', '', 0, '', '99999999', 2, NULL, 00000025, 'BarrettoCamille', '7cad8063e770d0d7a3df07b6f2294fa3319d2664', 0, 0, 'Camille Barretto', '', 3, 'fed3e100', '07042018', 'GCC', 0, 1),
(00000328, 'Quimque', 'Mercy', 'Montebon', NULL, 'AC 131 ', 'Central Ambiong', 'La Trinidad', 'Benguet', '9208152252', '', 0, '', '99999999', 2, NULL, 00000002, 'QuimqueMercy', 'cda6cdde8973df8baa7cbeea7834e97b9bc4dd1e', 0, 0, 'Mercy Quimque', '', 3, '436eae38', '07062018', 'GCC', 0, 1),
(00000329, 'Ong', 'Marcus Broderick', '', NULL, '', '', '', 'Benguet', '', '', 0, '', '99999999', 1, NULL, 00000328, 'OngMarcusBroderick', '80a2c56308ac29afd079b4690f7cb6003be6bc6f', 0, 0, 'Marcus Broderick Ong', '', 3, 'f4736f3c', '07062018', 'GCC', 0, 1),
(00000330, 'Ong', 'Marco Brenan', '', NULL, '', '', '', 'Benguet', '', '', 0, '', '99999999', 1, NULL, 00000329, 'OngMarcoBrenan', 'ad031b0d9f076fe9e01114d0a0f73e42d1506f10', 0, 0, 'Marco Brenan Ong', '', 3, '2742bfcc', '07062018', 'GCC', 0, 1),
(00000331, 'Ananayo', 'Steve', '', NULL, '', '', '', 'Benguet', '', '', 0, '', '99999999', 1, NULL, 00000330, 'AnanayoSteve', 'ea5baf0e540fcb0de3bf6cf37dc0f7211fb934ef', 0, 0, 'Steve Ananayo', '', 3, '905f7ec8', '07062018', 'GCC', 0, 1),
(00000332, 'Senti', 'Juan', '', NULL, '', '', '', 'Benguet', '', '', 0, '', '99999999', 1, NULL, 00000331, 'SentiJuan', '38825f94351307f8a643849cd71315c87d8aebdc', 0, 0, 'Juan Senti', '', 3, '49793dc5', '07062018', 'GCC', 0, 1),
(00000333, 'Tan', 'Anne Maureen', '', NULL, '', '', 'San Fernando City', 'La Union', '9178700535', 'annemaureen39@gmail.com', 0, '', '08101960', 2, NULL, 00000002, 'TanAnne', 'afa1739a249e5a78918550f33b1522fb0c1f72c8', 0, 0, 'Anne Maureen Tan', '', 2, 'fe64fcc1', '07122018', 'GCC', 0, 1),
(00000334, 'Aguete', 'Eddie', '', NULL, '', '', 'Marikina City', 'Metro Manila', '', '', 0, '', '99999999', 1, NULL, 00000001, 'AgueteEddie', '907b06e0bd3708508962af0163c074239e86a3ee', 0, 0, 'Eddie Aguete', '', 1, 'fb34bbdf', '07232018', 'GCC', 0, 1),
(00000335, 'Racho', 'Patrizia Franzia', '', NULL, 'Loreto St.', 'Sampaloc', 'Manila City', 'Metro Manila', '9487741558', '', 0, '', '09231994', 2, NULL, 00000058, 'RachoPatrizia', 'a7180751940000db6eca562c601cf8e5d5b3e7bc', 0, 0, 'Patrizia Franzia Racho', '', 2, '4c297adb', '07232018', 'GCC', 0, 1),
(00000336, 'Baro', 'Aldrin', '', NULL, '', 'Brgy. Tubeng', 'Tupi', 'South Cotabato', '9071266994', '', 0, '', '06101990', 1, NULL, 00000105, 'BaroAldrin', 'c96eba6aad139f15ca93be8158f922b4a8c3690a', 0, 0, 'Aldrin Baro', '', 2, '950f39d6', '07232018', 'GCC', 0, 1),
(00000337, 'Cereneche', 'Leticia', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000024, 'CerenecheLeticia', '84c9511eec9e3c883b55dfa09480183d96a897a6', 0, 0, 'Leticia Cereneche', '', 2, '2212f8d2', '07252018', 'GCC', 0, 1),
(00000338, 'Espera', 'Marivic', 'A.', NULL, '1366 Laon-Laan', 'Sampaloc', 'Manila City', 'Metro Manila', '9216925035', 'marivicespera@gmail.com', 0, '', '12081978', 2, NULL, 00000002, 'EsperaMarivic', '991efe588a8aa6a0a802b2a7711bdabffe3e16b1', 0, 0, 'Marivic Espera', '', 1, '9fafb7ea', '07272018', 'GCC', 0, 1),
(00000339, 'Dela Cruz', 'Mariza', 'J.', NULL, 'Block      Lot 11 Margarita Estate', 'Tanawan', 'Bustos', 'Bulacan', '9163403004', '', 0, '', '08101970', 2, NULL, 00000169, 'DelaCruzMariza', '58bdca03866e49f7446e208511333e75fde865a9', 0, 0, 'Mariza Dela Cruz', '', 2, '28b276ee', '07272018', 'GCC', 0, 1),
(00000340, 'Mescallado', 'Aubrey', '', NULL, '1697 Paz St.', 'Paco', 'Manila City', 'Metro Manila', '9279529318', 'aubrey.mescallado@yahoo.com', 0, '', '04181983', 2, NULL, 00000013, 'MescalladoAubrey', '379e4d17f3676190962c24691b88b453722c3c3f', 0, 0, 'Aubrey Mescallado', '', 1, '5d3c70fb', '07272018', 'GCC', 0, 1),
(00000341, 'Amparado', 'Argie', 'Torlao', '', '', 'Parada Bato', 'Sta. Ana', 'Cagayan Valley', '9171361209', '', 0, '', '09071976', 1, '', 00000354, 'AmparadoArgie', '1f19822b636e294dd838f871eebe8468a8154233', 0, 0, 'Argie Amparado', '', 3, 'ea21b1ff', '08032018', 'GCC', 0, 1),
(00000342, 'Chan', 'Carlo', '', NULL, '', '', '', 'Iloilo', '', '', 0, '', '99999999', 1, NULL, 00000181, 'ChanCarlo', '940a046dc1552dbe77fbd50cce35d26b7a54bd7b', 0, 0, 'Carlo Chan', '', 2, '3307f2f2', '07302018', 'GCC', 0, 1),
(00000343, 'Nino', 'Amalia', 'Mabaquiao', '', 'B5 L7 Landheights 6', 'Mandurriao', 'Iloilo City', 'Iloilo', '0333211394', '', 0, '', '04011957', 2, '', 00000138, 'NinoAmalia', '66f6282dda34362f82d214b1a5e2ff0bb33ba535', 0, 0, 'Amalia NiÃ±o', '', 3, '841a33f6', '07302018', 'GCC', 0, 1),
(00000344, 'De Silva', 'Maria Elena', 'Olama', NULL, '1701 7th St.', 'Punta Sta. Ana', 'Manila City', 'Metro Manila', '9234609227', '', 0, '', '07201972', 2, NULL, 00000013, 'DeSilvaMariaElena', 'bb1a3d8b9991b2ddb40e2352932a5acd9f1eac84', 0, 0, 'Maria Elena De Silva', '', 3, '814a74e8', '08072018', 'GCC', 0, 1);
INSERT INTO `distributors` (`dsdid`, `dslnam`, `dsfnam`, `dsmnam`, `dsmother`, `dsstreet`, `dsbrgy`, `dscity`, `dsprov`, `dscontact`, `dsemail`, `dsemail_confirm`, `dsfb`, `dsbirth`, `dssex`, `dstin`, `dssid`, `un`, `pw`, `payout`, `pay_type`, `pay_name`, `pay_acct`, `dsmtype`, `discount`, `dsencoded`, `dsencodedby`, `withheld`, `dsstatus`) VALUES
(00000345, 'Gallego', 'Ma. Angela Mae', 'Niño', NULL, 'B5 L7 Landheights 6', 'Mandurriao', 'Iloilo City', 'Iloilo', '9988656931', '', 0, '', '05071980', 2, NULL, 00000343, 'GallegoMaAngelaMae', 'b47efe4a85392e791ecff4e266f5897704cd97db', 0, 0, 'Ma. Angela Mae Gallego', '', 3, '3657b5ec', '08092018', 'GCC', 0, 1),
(00000346, 'Nino', 'Roberto Jr.', 'Cerbana', '', '#14 Zone 8', 'Calumpang Molo', 'Iloilo City', 'Iloilo', '9997798481', '', 0, '', '05031979', 1, '', 00000138, 'NinoRobertoJr', 'ec212f994cf557a3d73019ba3f015007e00243e3', 0, 0, 'Roberto NiÃ±o Jr.', '', 3, 'ef71f6e1', '08092018', 'GCC', 0, 1),
(00000347, 'Nonog', 'Elizabeth', 'Pingol', NULL, '38 Zone 1', 'Capalangan', 'Apalit', 'Pampanga', '9363100705', '', 0, '', '06291969', 2, NULL, 00000322, 'NonogElizabeth', '9718500a319a10defdec5a777c38586c2e546fba', 0, 0, 'Elizabeth Nonog', '', 3, '586c37e5', '08202018', 'GCC', 0, 1),
(00000348, 'Pingol', 'Emil', 'Dimarucut', NULL, '38 Zone 1', 'Capalangan', 'Apalit', 'Pampanga', '', '', 0, '', '06251974', 1, NULL, 00000322, 'PingolEmil', 'b23a4594cfb7e0f67c69f17cb519c339626a4342', 0, 0, 'Emil Pingol', '', 3, 'e5d178dd', '08202018', 'GCC', 0, 1),
(00000349, 'Astorga', 'Ramon', 'Manojo', NULL, 'Archbishop Res.', 'Jaro', 'Iloilo City', 'Iloilo', '9192546467', '', 0, '', '99999999', 1, NULL, 00000080, 'AstorgaRamon', '67f191165ab90ad8b5f305da0993a0ba19f14574', 0, 0, 'Ramon Astorga', '', 3, '52ccb9d9', '08232018', 'GCC', 0, 1),
(00000350, 'Rayos', 'Aiza', 'Manahan', NULL, '991 Int. 15 Morong St.', 'Tondo', 'Manila City', 'Metro Manila', '9309101095', 'aizz.manahan@gmail.com', 0, '', '05151993', 2, NULL, 00000058, 'RayosAiza', 'a377fa17075f81ce354aab4d6700516d590ea340', 0, 0, 'Aiza Rayos', '', 2, '81fd6929', '08272018', 'GCC', 0, 1),
(00000351, 'Clemente', 'Melody <deceased>', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000325, 'ClementeMelody', '52ea3de6f4f27742aaf353a47c95175724e104e5', 0, 0, 'Melody <deceased> Clemente', '', 3, '36e0a82d', '09012018', 'GCC', 0, 1),
(00000352, 'Abrazado', 'Jerome', '', NULL, 'Roosevelt Ave.', '', 'Quezon City', 'Metro Manila', '9565215759', 'abrazadojerome@gmail.com', 0, '', '12221991', 1, NULL, 00000067, 'AbrazadoJerome', 'd7c4bd420c66d94dba39ff038d20a241b6352c50', 0, 0, 'Jerome Abrazado', '', 2, 'efc6eb20', '09042018', 'GCC', 0, 1),
(00000353, 'Torlao', 'Edren', 'Miredor', '', '', 'Centro', 'Sta. Ana', 'Cagayan Valley', '9754900798', '', 0, '', '01241984', 2, '', 00000354, 'TorlaoEdren', '5c9b89f59df663877c7056fe26ca1895b552f492', 0, 0, 'Edren Torlao', '', 3, '58db2a24', '09262018', 'GCC', 0, 1),
(00000354, 'Pio', 'Erica', 'Orais', '', '', 'Centro', 'Sta. Ana', 'Cagayan Valley', '9120420520', '', 0, '', '09031985', 2, '', 00000013, 'PioErica', 'f2d887e58f22b540a356305338e32c04525f189c', 0, 0, 'Erica Pio', '', 3, '5d8b6d3a', '09042018', 'GCC', 0, 1),
(00000355, 'Joseco', 'Golda', 'Arabejo', NULL, 'Gran Plains Subd.', 'Jaro', 'Iloilo City', 'Iloilo', '9989794863', '', 0, '', '12091976', 2, NULL, 00000218, 'JosecoGolda', '6209b26196d2b13e84e6862f8d851e53e768de34', 0, 0, 'Golda Joseco', '', 3, 'ea96ac3e', '09122018', 'GCC', 0, 1),
(00000356, 'Recto', 'Analissa', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000002, 'RectoAnalissa', '441d6128232e47cfc6b3f58f211716a17bcbab73', 0, 0, 'Analissa Recto', '', 2, '33b0ef33', '09132018', 'GCC', 0, 1),
(00000357, 'Garduque', 'Marlon', 'Benigno', '', '', 'Dungeg', 'Sta. Ana', 'Cagayan Valley', '9976820620', '', 0, '', '99999999', 1, '', 00000353, 'GarduqueMarlon', 'c402b1d60000d711a3ff8ac9d499751d006e258a', 0, 0, 'Marlon Garduque', '', 3, '84ad2e37', '09262018', 'GCC', 0, 1),
(00000358, 'Tusi', 'Veronica', 'Montemayor', NULL, '', 'Mahayag', 'San Miguel', 'Bohol', '', '', 0, '', '07191974', 2, NULL, 00000325, 'TusiVeronica', 'da4342fda5ea6c5a8a6c7cdef3c9115450b3f2cd', 0, 0, 'Veronica Tusi', '', 3, '3910610f', '09252018', 'GCC', 0, 1),
(00000359, 'Alog', 'Chrizel', 'Rumbaoa', NULL, '', 'Centro', 'Sta. Ana', 'Cagayan Valley', '9273058153', '', 0, '', '01201981', 1, NULL, 00000341, 'AlogChrizel', '4b968da072dbe37616d2fa47f1996272d16310f6', 0, 0, 'Chrizel Alog', '', 3, '8e0da00b', '10242018', 'GCC', 0, 1),
(00000360, 'Chua', 'Naomi Ruth', 'Quitay', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000007, 'ChuaNaomi', 'b7c366c93d380369bdfae196fbaf94f28d874771', 0, 0, 'Naomi Ruth Chua', '', 3, '52a2825b', '11072018', 'GCC', 0, 1),
(00000361, 'Lope', 'May Florence', '', NULL, '', '', 'Oton', 'Iloilo', '9086970832', '', 0, '', '05121959', 2, NULL, 00000250, 'LopeMayFlorence', 'c5b8355370ed9e2f771ae7f1e130b19cebc8597b', 0, 0, 'May Florence Lope', '', 3, 'e5bf435f', '11072018', 'GCC', 0, 1),
(00000362, 'Bingcang', 'Marylyn', 'Alcober', '', '46B Burgos St.', 'La Paz', 'Iloilo City', 'Iloilo', '9308242552', '', 0, '', '08091970', 2, '', 00000250, 'BingcangMarylyn', '34520d82882f48ce5d2574d02be2e4d89303f5ca', 0, 0, 'Marylyn Bingcang', '', 3, '3c990052', '11112018', 'GCC', 0, 1),
(00000363, 'Buyco', 'Merlinda', '', NULL, '', '', 'Anilao City', 'Iloilo', '9178277178', 'dang69buyco@gmail.com', 0, '', '05241969', 2, NULL, 00000250, 'BuycoMerlinda', '03c3996a21f3d9954735910f6816e90fa65dd090', 0, 0, 'Merlinda Buyco', '', 3, '8b84c156', '12132018', 'GCC', 0, 1),
(00000364, 'Dela Paz', 'Maria Theresa', 'Fuertes', NULL, '', '', 'Barotac Nuevo', 'Iloilo', '9385670446', '', 0, '', '11081949', 2, NULL, 00000150, 'DelaPazMariaTheresa', 'fbd8c0c2a1c36dd9e67a4c529c25d3717d3b77db', 0, 0, 'Maria Theresa Dela Paz', '', 3, '8ed48648', '12152018', 'GCC', 0, 1),
(00000365, 'Alor', 'Mary Jean', 'Patubo', NULL, '178 Block 5', ' Brgy. Sinikway Lapuz', 'Iloil', 'Iloilo', '9218558094', '', 0, '', '05021983', 2, NULL, 00000131, 'AlorMaryJean', '39e3b800a2829afe355e3decf2f731c29120a4e5', 0, 0, 'Mary Jean Alor', '', 3, '39c9474c', '12172018', 'GCC', 0, 1),
(00000366, 'Quitay', 'Rita', 'Kinikot', NULL, '37 Camachile St.', 'Western Bicutan', 'Taguig City', 'Metro Manila', '9554681797', '', 0, '', '05221953', 2, NULL, 00000007, 'QuitayRita', 'ec3c311a909793c61dff659cf2db0176a07ed22f', 0, 0, 'Rita Quitay', '', 3, 'e0ef0441', '12222018', 'GCC', 0, 1),
(00000367, 'Onte', 'Clarise', 'Patriaca', NULL, '', 'Aganan', 'Pavia', 'Iloilo', '9384258589', '', 0, '', '12271996', 2, NULL, 00000218, 'OnteClarise', '8a08a14af3efb8d4bf60d9a595d75e6422800e7f', 0, 0, 'Clarise Onte', '', 3, '57f2c545', '12292018', 'GCC', 0, 1),
(00000368, 'Gregorio', 'Maricel', '', NULL, '', '', 'Binalbagan', 'Negros Occidental', '9505919878', '', 0, '', '99999999', 2, NULL, 00000024, 'GregorioMaricel', '70745dfa2e81217b7e943f0c78a1415eca4fd1fb', 0, 0, 'Maricel Gregorio', '', 3, 'ea4f8a7d', '12312018', 'GCC', 0, 1),
(00000369, 'Benitez', 'Marife', 'Quitay', NULL, '79 National Road', 'Talimundoc', 'Orani', 'Bataan', '9471024868', 'marifeqbenitez@gmail.com', 0, '', '07091977', 2, NULL, 00000366, 'BenitezMarife', '72a255ebab8a4e531402bc2f76f0955e6ab23349', 0, 0, 'Marife Benitez', '', 1, '5d524b79', '01052019', 'GCC', 0, 1),
(00000370, 'Oquin', 'John Russel', 'Garcia', 'Judith Oquin', '991 Int. 15 Morong St.', 'Tondo', 'Manila City', 'Metro Manila', '09054089610', 'russel.oquin@gmail.com', 0, 'Russel Oquin', '02081995', 1, '', 00000058, 'OquinJohnRussel', 'd4362be76d04eb10bca1e9680a7505a030caa768', 4, 1, 'John Russel Oquin', '09054089610', 2, '8e639b89', '01102019', 'GCC', 0, 1),
(00000371, 'Silverio', 'Maria Luz', 'R.', NULL, '', 'Tibag', 'Pulilan', 'Bulacan', '9430680693', 'zaisilverio88@gmail.com', 0, '', '12191989', 2, NULL, 00000013, 'SilverioMariaLuz', '7327650fb22987fc2e90b719492e9f0dfe2136c7', 0, 0, 'Maria Luz Silverio', '', 1, '397e5a8d', '01172019', 'GCC', 0, 1),
(00000372, 'Roca', 'Melvin Keiff', 'Cambe', '', '208-4 Lam-en Village', 'Purok 20', 'Baguio City', 'Benguet', '9996796066', 'melvinkeiffroca@gmail.com', 0, '', '12121989', 1, '', 00000322, 'RocaMelvin', 'f6fabb104a3d3ebab8313259d084cd9d02b58b42', 0, 0, 'Melvin Keiff Roca', '', 3, 'e0581980', '01222019', 'GCC', 1, 0),
(00000373, 'Regulto', 'Augusto Caesar', 'Dela Cruz', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000036, 'RegultoCaesar', 'b5b30715e77c79080f83af82a4bd95faebd4bd6a', 0, 0, 'Augusto Caesar Regulto', '', 1, '5745d884', '01242019', 'GCC', 0, 1),
(00000374, 'Regulto', 'Angelo James', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000373, 'RegultoAJ', 'f04f3ce983ed1747b8b077106f638612c204117d', 0, 0, 'Angelo James Regulto', '', 1, '52159f9a', '01242019', 'GCC', 0, 1),
(00000375, 'Regulto', 'Ma. Eloisa', '', '', '', '', '', '', '', '', 0, '', '99999999', 2, '', 00000374, 'RegultoLotlot', 'e1345435121e78d28c889f62e3e447011363287c', 0, 0, 'Ma. Eloisa Regulto', '', 1, 'e5085e9e', '01242019', 'GCC', 0, 1),
(00000376, 'Gamarcha', 'Luzbel', 'Clamano', NULL, '264', 'Brgy. Marulas', 'Kawit', 'Cavite', '9475404667', 'belgamarcha@yahoo.com', 0, '', '09121986', 2, NULL, 00000372, 'GamarchaLuzbel', 'a209348824a3dfbd6b586b0c8bdc94b7c120a6dc', 0, 0, 'Luzbel Gamarcha', '', 1, '3c2e1d93', '01292019', 'GCC', 0, 1),
(00000377, 'Sevilla', 'Grace', 'Escubio', NULL, 'Unit A Block 5 Lot 16 Dunhill Street', 'United East Fairview Subd., East Fairview', 'Quezon City', 'Metro Manila', '9163991644', 'mhya2k@gmail.com', 0, '', '01221957', 2, NULL, 00000376, 'SevillaGrace', '6bf92c880b2befc79f0e275ae61703ad7f714b5b', 0, 0, 'Grace Sevilla', '', 1, '8b33dc97', '01292019', 'GCC', 0, 1),
(00000378, 'Pacificar', 'Jerome', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000376, 'PacificarJerome', '6611275dae3f1cd7155c05c034f47d4a4f15489c', 0, 0, 'Jerome Pacificar', '', 1, '368e93af', '01312019', 'GCC', 0, 1),
(00000379, 'Tan', 'Mary Ann', 'Tan', NULL, '18 Duhat Loop, Phase 1 Ayala Westgrove Heights', 'Brgy. Inchikan', 'Silang', 'Cavite', '9164656655', 'maryanntantan@yahoo.com', 0, '', '07021968', 2, NULL, 00000002, 'TanMaryAnn', 'b26d3d94a9fb65121cbf8e78d0ad625285d9251d', 0, 0, 'Mary Ann Tan', '', 3, '819352ab', '02032019', 'GCC', 0, 1),
(00000380, 'Mortos', 'John Marvelous', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000002, 'MortosMarvelous', '244d8a9766d86e0215438febf006c72835394afe', 0, 0, 'John Marvelous Mortos', '', 1, 'a65e1c34', '02082019', 'GCC', 0, 1),
(00000381, 'Bautista', 'Ma. Lea', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000376, 'BautistaMaLea', '7917e3b60e8d37666849aa9c59385b0c72b3b899', 0, 0, 'Ma. Lea Bautista', '', 1, '1143dd30', '02182019', 'GCC', 0, 1),
(00000382, '', 'Healthy Hugs', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 0, NULL, 00000377, 'HealthyHugs', 'd436799e15f75da3aad293e73c1eb4892f59adaf', 0, 0, 'Healthy Hugs ', '', 1, 'c8659e3d', '02182019', 'GCC', 0, 1),
(00000383, 'Ballaran', 'Shirley', 'Barcelona', NULL, 'P-2', 'Bangkilingan', 'Tabaco City', 'Albay', '9061888599', '', 0, '', '03121970', 2, NULL, 00000376, 'BallaranShirley', 'e760b7ec49affd9c1c5fa6ae555d02f8a3b17a0a', 0, 0, 'Shirley Ballaran', '839040792', 3, '7f785f39', '02182019', 'GCC', 0, 1),
(00000384, 'Mendoza', 'Jean', 'B.', NULL, 'Verdant Hills', 'Brgy. Pasong Tamo', 'Quezon City', 'Metro Manila', '9064321080', '', 0, '', '11201962', 2, NULL, 00000376, 'MendozaJean', '9a70f81806f3b5a896f1e6225f2646518b10ce0d', 0, 0, 'Jean Mendoza', '', 1, '7a281827', '03062019', 'GCC', 0, 1),
(00000385, 'Barlis', 'Rowena', 'R.', NULL, 'Block 1 Lot 14 Karina Homes', 'Bagumbong', 'Caloocan City', 'Metro Manila', '9656820933', 'whengbarlis0428@gmail.com', 0, '', '04281978', 2, NULL, 00000001, 'BarlisRowena', 'f61dd4c83e9102fa9a790ef755c9809c58a7b315', 0, 0, 'Rowena Barlis', '', 1, 'cd35d923', '03072019', 'GCC', 0, 1),
(00000386, 'Andrada', 'Carlito', 'Lahera', NULL, '2151 Road 6 Fabie Estate', 'Sta. Ana', 'Manila City', 'Metro Manila', '9774996739', 'carlito2064@gmail.com', 0, '', '02091964', 1, NULL, 00000377, 'AndradaCarlito', 'fd2c98cc15b450e91131d1709e8eb1da5aee544e', 0, 0, 'Carlito Andrada', '', 1, '14139a2e', '03082019', 'GCC', 0, 1),
(00000387, 'Francisco', 'Venedict', 'A.', '', 'Phase 2 Block 5 Lot 57 Greenbreeze', 'Brgy. San Isidro', 'Rodriguez', 'Rizal', '9084653258', 'abenroserofrancisco@gmail.com', 0, '', '03281983', 1, '', 00000002, 'FranciscoVenedict', '4caea0dd4a4fb0629149cbcdfdcfa842498c67d7', 0, 0, 'Venedict Francisco', '', 1, 'a30e5b2a', '04262019', 'GCC', 0, 1),
(00000388, 'Villareal', 'Anna May', 'Sertan', NULL, '', '', '', '', '9275451046', '', 0, '', '99999999', 2, NULL, 00000360, 'VillarealAnnaMay', 'd32cd434aa1aa4699e675483e6ec4c52cfaa2505', 0, 0, 'Anna May Villareal', '', 1, '1eb31412', '04262019', 'GCC', 0, 1),
(00000389, 'Tan', 'Mercy', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000379, 'TanMercy', '4d34ccfb90cebda32afc1e1bc546dd7ceb9158b5', 0, 0, 'Mercy Tan', '', 1, 'a9aed516', '05042019', 'GCC', 0, 1),
(00000390, 'Esguerra', 'Oliver Rafer', '', NULL, '307 Gahak', '', 'Kawit', 'Cavite', '9195999577', 'oresguerra@yahoo.com', 0, '', '10041965', 1, NULL, 00000376, 'EsguerraOliver', '0da6938df42417248495d1db8fa56ed7d982a3c3', 0, 0, 'Oliver Rafer Esguerra', '', 1, '7a9f05e6', '05182019', 'GCC', 0, 1),
(00000391, 'Buenafe', 'Virginia', '', NULL, 'CDC, Tagaytay Country Homes 3', 'Silang Crossing', 'Tagaytay City', 'Cavite', '9338557855', 'millet715@gmail.com', 0, '', '07151958', 2, NULL, 00000390, 'BuenafeVirginia', 'ef86cebb352c61e95fda9d5bf84589a13f99765e', 0, 0, 'Virginia Buenafe', '', 1, 'cd82c4e2', '05202019', 'GCC', 0, 1),
(00000392, 'Lugay', 'Ruth Juliet', 'V.', NULL, 'Unit 1 Block 9 Lot 29 Foggy Heights Village', '', 'Tagaytay City', 'Cavite', '9237409050', 'ruth.lugay@gmail.com', 0, '', '01131957', 2, NULL, 00000391, 'LugayRuth', '8ffad90d8ef3b1a8bb7954a6289bcc0332de06db', 0, 0, 'Ruth Juliet Lugay', '', 1, '14a487ef', '06012019', 'GCC', 0, 1),
(00000393, 'Chua', 'Elizabeth', 'Tan', NULL, 'National Highway', 'Brgy. Paciano Rizal', 'Calamba City', 'Laguna', '9175451135', 'bethtin831@gmail.com', 0, '', '08311962', 2, NULL, 00000379, 'ChuaElizabeth', '5f6ccf04c5872917d2bad7f471f864924a4c69e5', 0, 0, 'Elizabeth Chua', '', 3, 'a3b946eb', '06022019', 'GCC', 0, 1),
(00000394, 'Gandionco', 'Rosita', 'Ang', '', 'FJR Electrical Supply', '', 'General Santos City', 'South Cotabato', '9177169888', '', 0, '', '03241957', 2, '', 00000002, 'GandioncoRoss', '5babd6a5d6ffde0f732ab3256a247654ab1060b3', 0, 0, 'Rosita Gandionco', '', 3, 'a6e901f5', '04142018', 'GCC', 0, 1),
(00000395, 'Gonzales', 'Corazon', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000377, 'GonzalesCorazon', '8bbe52830a63676ae4b21e3192a55ccf1fe25535', 0, 0, 'Corazon Gonzales', '', 1, '11f4c0f1', '09052019', 'GCC', 0, 1),
(00000396, 'Rosario', 'Euraya', 'V.', NULL, '2218-A Makata St.', 'Sta. Cruz', 'Manila City', 'Metro Manila', '9998995625', '', 0, '', '05021967', 2, NULL, 00000013, 'RosarioEuraya', 'c42fa1bae77e14b2b5dbbf601eb649bf73d76a92', 0, 0, 'Euraya Rosario', '', 1, 'c8d283fc', '09072019', 'GCC', 0, 1),
(00000397, 'Dagum', 'Michael Vincent', 'Regulto', NULL, '', '', 'Apalit', 'Pampanga', '', '', 0, '', '11021993', 2, NULL, 00000375, 'DagumMichaelVincent', '7b5d8a4d6ebb142d2e94447dbebf8f485d4d18a8', 0, 0, 'Michael Vincent Dagum', '', 1, '7fcf42f8', '09072019', 'GCC', 0, 1),
(00000398, 'Ebuen', 'Lillian', 'Lasaten', NULL, 'Room 103 Alpha Building, No. 77 Boni Serrano Avenue', 'Cubao', 'Quezon City', 'Metro Manila', '9178982717', 'totalbodydentistry@yahoo.com', 0, '', '99999999', 2, NULL, 00000007, 'EbuenLillian', '6083ffb5a444a5a15479ec86d03687f504188ffb', 0, 0, 'Lillian Ebuen', '', 1, 'c2720dc0', '09132019', 'GCC', 0, 1),
(00000399, 'De Guzman', 'Abigail', 'Capitulo', NULL, '#17 Bulakeña Village', 'Saog', 'Marilao', 'Bulacan', '9235867286', '', 0, '', '12091986', 2, NULL, 00000013, 'DeGuzmanAbigail', '96ebfd13820ef802ac15546fab95fceb2811dc14', 0, 0, 'Abigail De Guzman', '', 1, '756fccc4', '10012019', 'GCC', 0, 1),
(00000400, 'Gelle', 'Soledad', 'Ventura', NULL, 'Block 4 Lot 48 Phase 2 Gumamela St., Elysian Homes', 'Bahay Pari', 'Meycauayan', 'Bulacan', '9178154527', 'solgelle@yahoo.com', 0, '', '06281964', 2, NULL, 00000013, 'GelleSoledad', '260280b6d6e5b6cf406e4dcd4283af907fa48327', 0, 0, 'Soledad Gelle', '', 1, '615a5fbb', '10142019', 'GCC', 0, 1),
(00000401, 'Pelaez', 'Hannah Jane', 'Paragat', NULL, 'Block 89 Lot 9 Matahimik St.', 'Pangarap Village', 'Caloocan City', 'Metro Manila', '9212281244', 'pelaezhannah@gmail.com', 0, '', '10271998', 2, NULL, 00000151, 'PelaezHannah', '9b22fbae65aebfe7af17c97962568caa063c88e9', 0, 0, 'Hannah Jane Pelaez', '', 1, 'd6479ebf', '10192019', 'GCC', 0, 1),
(00000402, 'Ombion', 'Alysa Mae', 'Netura', NULL, '541 Malaya St.', 'Brgy. 181, Pangarap Village', 'Caloocan City', 'Metro Manila', '9060272053', 'alysaombion24@gmail.com', 0, '', '05241999', 2, NULL, 00000401, 'OmbionAlysaMae', '09168b5bc4e6b94d74a7719b100ae7e82171dbe3', 0, 0, 'Alysa Mae Ombion', '', 1, '0f61ddb2', '10192019', 'GCC', 0, 1),
(00000403, 'Nicolas', 'Rogem', 'Cay', NULL, 'Block 10 Lot 1 San Agustin St.', 'Guadanoville', 'Caloocan City', 'Metro Manila', '9169336491', 'nicolasrogem@yahoo.com', 0, '', '12021997', 2, NULL, 00000401, 'NicolasRogem', 'a6dc9244dc0396e6858554824e7079fd79bf30ff', 0, 0, 'Rogem Nicolas', '', 1, 'b87c1cb6', '10192019', 'GCC', 0, 1),
(00000404, 'Edria', 'Jordan', 'Abdon', NULL, '238 G. de Jesus St.', 'Bagong Barrio', 'Caloocan City', 'Metro Manila', '9509446046', 'longsaybako1314@gmail.com', 0, '', '03131987', 1, NULL, 00000007, 'EdriaJordan', '8eaa009cc09b6876b15b1fdb28ab790218eb7179', 0, 0, 'Jordan Edria', '', 1, 'bd2c5ba8', '10192019', 'GCC', 0, 1),
(00000405, 'Fabro', 'Kharezze', 'Fernando', NULL, '#75 Gonzales', 'East Grace Park', 'Caloocan City', 'Metro Manila', '9554519864', 'kharezze.fabro@yahoo.com', 0, '', '06251996', 2, NULL, 00000058, 'FabroKharezze', '899e23879585fd15af5fdf1b31370b4f7eee34d0', 0, 0, 'Kharezze Fabro', '', 1, '0a319aac', '10192019', 'GCC', 0, 1),
(00000406, 'Anciano', 'Hannah Mae', 'Zamora', NULL, 'Block 1 Lot 36 Phase 7 Arkanzas St.', '', 'San Jose del Monte City', 'Bulacan', '9985617120', 'hmanciano.hma@gmail.com', 0, '', '08061997', 2, NULL, 00000401, 'AncianoHannahMae', '362bd46542dc73ab4ac558771498c29ee867cfa0', 0, 0, 'Hannah Mae Anciano', '', 1, 'd317d9a1', '10192019', 'GCC', 0, 1),
(00000407, 'Arellano', 'Salvacion', 'Tagara', NULL, 'Block 75 Lot 18 Phase 12 Riverside', 'Bagong Silang, Tala', 'Caloocan City', 'Metro Manila', '9396302121', 'kristinearellano19@gmail.com', 0, '', '10061975', 2, NULL, 00000401, 'ArellanoSalvacion', 'd0b3d4a87db124c17734d013017823e5598ee877', 0, 0, 'Salvacion Arellano', '', 1, '640a18a5', '10302019', 'GCC', 0, 1),
(00000408, 'Salomon', 'Madeline', 'Sorela', NULL, 'Block 2 Lot 1 Phase E1 Mulawin Francisco Homes', '', 'San Jose del Monte City', 'Bulacan', '9285870734', '', 0, '', '03181969', 2, NULL, 00000401, 'SalomonMadeline', '7f60ca55fa9c49b16edfedae282978d1bdbf0d0f', 0, 0, 'Madeline Salomon', '', 1, 'd9b7579d', '10312019', 'GCC', 0, 1),
(00000409, 'Rafael', 'Amelia', 'Punzalan', NULL, '95 Kamuning Road', '', 'Quezon City', 'Metro Manila', '9224120793', '', 0, '', '01121950', 2, NULL, 00000377, 'RafaelAmelia', 'ed4e1cd2fee9321e9ec95c9865aebad0333f6c66', 0, 0, 'Amelia Rafael', '', 1, '6eaa9699', '11122019', 'GCC', 0, 1),
(00000410, 'Reyes', 'Teodoro', '', NULL, '', '', '', '', '9228960970', '', 0, '', '04281943', 1, NULL, 00000002, 'ReyesTeodoro', '472c9c2845d1251352365511e41ecc13e8aa8014', 0, 0, 'Teodoro Reyes', '', 1, 'bd9b4669', '11232019', 'GCC', 0, 1),
(00000411, 'Gelle', 'Hanna Alyssa', 'Ventura', NULL, 'Penthouse 10 Cityland North Residences', 'Veterans Village', 'Quezon City', 'Metro Manila', '9457983413', 'h.gelle@yahoo.com', 0, '', '05131995', 2, NULL, 00000400, 'GelleHanna', '73a99e44c0ee48ba418564abdbf9dded9bf6cee9', 0, 0, 'Hanna Alyssa Gelle', '', 1, '0a86876d', '12192019', 'GCC', 0, 1),
(00000412, 'Tee', 'Ryan Oliver', 'Qua', NULL, 'One Wilson Place', '', 'San Juan City', 'Metro Manila', '', '', 0, '', '07081973', 1, NULL, 00000002, 'TeeRyan', '22fcd29d3d1836ac9d4edc8a8295b3edcf9d08b0', 0, 0, 'Ryan Oliver Tee', '', 1, 'd3a0c460', '12292019', 'GCC', 0, 1),
(00000413, 'Cheng', 'Jenny', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000389, 'ChengJenny', '53934036351b428eed6dcd072b8b12dcf709b14e', 0, 0, 'Jenny Cheng', '', 1, '64bd0564', '01022020', 'GCC', 0, 1),
(00000414, 'Yap', 'Rogelio', 'Chiong', NULL, '113 Victory St.', 'San Perfecto', 'San Juan City', 'Metro Manila', '9224960127', 'rogeryap59@yahoo.com', 0, '', '01062020', 1, NULL, 00000002, 'YapRogelio', 'ffda159bcec443a7ec3a48f0f7ea86ebd1272107', 0, 0, 'Rogelio Yap', '', 1, '61ed427a', '01062020', 'GCC', 0, 1),
(00000415, 'Anire', 'Allan', 'Orquita', NULL, 'B-13 Unit 437 Deca Homes Vitas St.', 'Tondo', 'Manila City', 'Metro Manila', '9088887431', 'allananire@yahoo.com', 0, '', '07131972', 1, NULL, 00000058, 'AnireAllan', '1e83bafaab0d330196cfc0a4079c725cfb5b0429', 0, 0, 'Allan Anire', '', 2, 'd6f0837e', '01312020', 'GCC', 0, 1),
(00000416, '', 'Justice Knights Tracker', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 0, NULL, 00000377, 'JusticeKnights', '2bbaa04f6f246f5865ad240fbc8ce330d2da7e7f', 0, 0, 'Justice Knights Tracker ', '', 1, '0fd6c073', '02082020', 'GCC', 0, 1),
(00000417, 'Lauta', 'Kenneth', 'Llagas', '', '33 Diamond St.', 'Batasan Hills', 'Quezon City', 'Metro Manila', '9275402993', '', 0, '', '11021993', 1, '', 00000002, 'LautaKenneth', '125f62542c105562616a355568149c1871e3e658', 0, 0, 'Kenneth Lauta', '', 0, 'b8cb0177', '02172020', 'GCC', 1, 0),
(00000418, 'Tancungco', 'Mikee', 'Brabante', NULL, '615 Pag-asa St., 7th Avenue', '', 'Caloocan City', 'Metro Manila', '9177985511', 'mikee.tancungco.icf@gmail.com', 0, '', '11221995', 2, NULL, 00000417, 'TancungcoMikee', '91dfbd03eee1cc3e5e017560afed64ebdb89d7fb', 0, 0, 'Mikee Tancungco', '', 1, '05764e4f', '02172020', 'GCC', 0, 1),
(00000419, 'Ang', 'Arlene', 'Morales', '', 'Unit 1411 Altiva Cypress Towers, PDS Avenue', 'Ususan', 'Taguig City', 'Metro Manila', '9177066884', 'arlene.ang@gmail.com', 0, '', '01151965', 2, '', 00000007, 'AngArlene', '15ed11b48abb338563fb61c9af24952f19aa36dd', 0, 0, 'Arlene Ang', '', 1, 'b26b8f4b', '02282020', 'GCC', 0, 1),
(00000420, 'Nerecina', 'Malou', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000002, 'NerecinaMalou', '20b0a43354874b34c75f4bb2d7c962d097c211d1', 0, 0, 'Malou Nerecina', '', 1, '6ec4ad1b', '02292020', 'GCC', 0, 1),
(00000421, 'Tee', 'Joanna Marie', 'Chua', NULL, 'One Wilson Place', '', 'San Juan City', 'Metro Manila', '', '', 0, '', '07211980', 2, NULL, 00000412, 'TeeJoanna', '9d56ac4163b42182fd3776aaecb2f6681493798e', 0, 0, 'Joanna Marie Tee', '', 1, 'd9d96c1f', '03022020', 'GCC', 0, 1),
(00000422, 'Sevilla', 'Mary Therese Celine', 'Escubio', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000377, 'SevillaMaryThereseCeline', '5c28972404a168219f799015e6421015ed849a33', 0, 0, 'Mary Therese Celine Sevilla', '', 1, '00ff2f12', '03032020', 'GCC', 0, 1),
(00000423, 'Chua', 'Shirley Lolette', 'Lim', NULL, '35 Calvary Hill St.', 'Damayang Lagi', 'Quezon City', 'Metro Manila', '9175272482', 'shirl.event@yahoo.com', 0, '', '08281974', 2, NULL, 00000421, 'ChuaShirley', 'a867b7d7366478e50645c5b5ae7ac2a201c4e17a', 0, 0, 'Shirley Lolette Chua', '', 1, 'b7e2ee16', '03232020', 'GCC', 0, 1),
(00000424, 'Chua', 'Allan Benson', 'Lim', NULL, '35 Calvary Hill St.', 'Damayang Lagi', 'Quezon City', 'Metro Manila', '9175816234', 'abchua10@yahoo.com', 0, '', '05301979', 1, NULL, 00000423, 'ChuaAllan', '563eb074e7b9f7bd95efc8ebed3d5dec96b0ea46', 0, 0, 'Allan Benson Chua', '', 1, 'b2b2a908', '03282020', 'GCC', 0, 1),
(00000425, 'Chuaunsu', 'Nelson', 'Tan', NULL, 'Unit 1204-A Valencia Hills Condominium, N. Domingo St.', '', 'Quezon City', 'Metro Manila', '9175333717', 'nelsonc48@gmail.com', 0, '', '12181963', 1, NULL, 00000423, 'ChuaunsuNelson', '1557dddd4513db1125701b584cabb8a274863beb', 0, 0, 'Nelson Chuaunsu', '', 1, '05af680c', '04022020', 'GCC', 0, 1),
(00000426, 'Oquin', 'Arnolfo', 'Lim', NULL, '1068 Kamada St.', 'Dagat-Dagatan', 'Caloocan City', 'Metro Manila', '9185825261', '', 0, '', '08301968', 1, NULL, 00000370, 'OquinArnolfo', '259c0991debcc2df56bc17e7c35802d7d5596514', 0, 0, 'Arnolfo Oquin', '', 1, 'dc892b01', '06122020', 'GCC', 0, 1),
(00000427, 'Co', 'Jonathan Anthony', 'Chua', NULL, '35 Calvary Hill St.', 'Damayang Lagi', 'Quezon City', 'Metro Manila', '9178543837', '', 0, '', '02132001', 1, NULL, 00000017, 'CoJonathan', '4c29cdaff0d3c0ae4c26a0071d876b3918c242af', 0, 0, 'Jonathan Anthony Co', '', 1, '6b94ea05', '07012020', 'GCC', 0, 1),
(00000428, 'Ang Ngo Ching', 'Pia Charliz', 'Lim', NULL, '35 7th St.', 'Brgy. Mariana', 'Quezon City', 'Metro Manila', '9176470166', 'pia_angngoching@dlsu.edu.ph', 0, '', '07241998', 2, NULL, 00000427, 'AngNgoChingPia', 'fffe0aa8d6f605209e8187fa7815cbf7dc5ac998', 0, 0, 'Pia Charliz Ang Ngo Ching', '', 1, 'd629a53d', '07012020', 'GCC', 0, 1),
(00000429, 'Regulto', 'Ma. Emily', 'Dela Cruz', NULL, '5305 Harvest Moon Ct.', '', 'Elkgrove', 'California, USA 95758', '12547816743', 'maemilyregulto@gmail.com', 0, '', '03161969', 2, NULL, 00000001, 'RegultoMaEmily', '744b3579e0a3aadf773ecbcebca5758167c92538', 0, 0, 'Ma. Emily Regulto', '', 1, '61346439', '10022020', 'GCC', 0, 1),
(00000430, 'Chen', 'Richard', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000002, 'ChenRichard', '2156eb2fcc37f6e709ff87865122c6cc6e9c4896', 0, 0, 'Richard Chen', '', 1, 'b205b4c9', '10132020', 'GCC', 0, 1),
(00000431, 'Tinio', 'Gina', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000309, 'TinioGina', 'd2a5c87189ea7346a76bd78b80802256c9156a9e', 0, 0, 'Gina Tinio', '', 1, '051875cd', '10162020', 'GCC', 0, 1),
(00000432, 'Manuel', 'Lito', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000002, 'ManuelLito', '38362ca10f930c17f07e4d6c7abdd109d72a1d4e', 0, 0, 'Lito Manuel', '', 1, 'dc3e36c0', '10172020', 'GCC', 0, 1),
(00000433, 'Tejoso', 'Jonald', 'Tangi', NULL, 'Block 3 Lot 12 Jasmin St. Sampaguita Subd.', 'Camarin', 'Caloocan City', 'Metro Manila', '9563884968', 'jonaldtejoso@gmail.com', 0, '', '01221977', 1, NULL, 00000063, 'TejosoJonald', 'a7c43be0c2b706357250db2d9e024f31cde67d99', 0, 0, 'Jonald Tejoso', '', 1, '6b23f7c4', '11152019', 'GCC', 0, 1),
(00000434, 'Salazar', 'Jocelyn', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000381, 'SalazarJocelyn', 'cad63348bb1f024a86cd0ce7607bba6e4ffce9d9', 0, 0, 'Jocelyn Salazar', '', 1, '6e73b0da', '11182020', 'GCC', 0, 1),
(00000435, 'Gadon', 'Laugelie', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000434, 'GadonLaugelie', '56c3a7d6aa630033cf5798f1b7e07d9497e90377', 0, 0, 'Laugelie Gadon', '', 1, 'd96e71de', '12082020', 'GCC', 0, 1),
(00000436, 'Dequina', 'Nicolas Jhon', 'Castillano', '', 'Pine Tree Street', 'Buhangin', 'Davao City', 'Davao del Sur', '9061392935', 'nicolasjhondequina@gmail.com', 0, '', '06261991', 1, '', 00000394, 'DequinaNicolas', 'e954fd11e43894ca746dc557c313369ea0683074', 0, 0, 'Nicolas Jhon DequiÃ±a', '', 1, '004832d3', '03282021', 'GCC', 0, 1),
(00000437, 'Francisco', 'Romeo Jr.', 'Godoy', '', '20 Jason St., Maripaz Subd.', 'Bilog, Balangkas', 'Valenzuela City', 'Metro Manila', '9287497799', 'rgfjr14@gmail.com', 0, '', '04141965', 1, '', 00000219, 'FranciscoJun', 'a19c9950e4ae41bc1c92a2c49e0e3573e1a212ec', 0, 0, 'Romeo Francisco Jr.', '', 1, 'b755f3d7', '01122021', 'GCC', 0, 1),
(00000438, 'Nua', 'Melody Jane', 'Chua', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000002, 'NuaMelodyJane', 'db7c93c3d84ce83526b578ddaef036cd0f0c3c03', 0, 0, 'Melody Jane Nua', '', 1, '0ae8bcef', '01192021', 'GCC', 0, 1),
(00000439, 'Camayang', 'Angelo Mark', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000001, 'CamayangAngelo', '76e79e0d93ac9b2e3931677512c2dde425147821', 0, 0, 'Angelo Mark Camayang', '', 1, 'bdf57deb', '05132020', 'GCC', 0, 1),
(00000440, 'Estrella', 'Alex', 'Santos', NULL, '', '', 'Malolos City', 'Bulacan', '9158562251', '', 0, '', '12241975', 1, NULL, 00000439, 'EstrellaAlex', 'bd58c05920f7d85c5f2c80864851c983ed147334', 0, 0, 'Alex Estrella', '', 1, 'c87b7bfe', '01292021', 'GCC', 0, 1),
(00000441, 'Cabuslay', 'Roland', '', NULL, '', 'Pag-asa', 'Quezon City', 'Metro Manila', '', '', 0, '', '01011980', 1, NULL, 00000439, 'CabuslayRoland', '6d14a36a1ea7a67df751ff601204aaabb3bab368', 0, 0, 'Roland Cabuslay', '', 1, '7f66bafa', '02102021', 'GCC', 0, 1),
(00000442, 'Empenida', 'Rebecca', 'Belasa', '', 'Block 31 Lot 6 Sarangani Homes Phase 1', 'San Isidro, Lagao', 'General Santos City', 'South Cotabato', '9060170090', 'empenidarebecca@gmail.com', 0, '', '09271964', 2, '', 00000394, 'EmpenidaRebecca', 'f64793d3054e1d4100041fe47a0c84cafbe888d4', 0, 0, 'Rebecca Empenida', '', 1, 'a640f9f7', '03012021', 'GCC', 0, 1),
(00000443, 'Jugarap', 'Ruby', '', NULL, 'Bijoux Box Jewelry Shop, Gaisano Mall of GenSan', '', 'General Santos City', 'South Cotabato', '9198896249', 'jugarapruby13@gmail.com', 0, '', '99999999', 2, NULL, 00000002, 'JugarapRuby', 'c4dd37fd7e4a004e31eb7393521179b51252f042', 0, 0, 'Ruby Jugarap', '', 2, '115d38f3', '05082018', 'GCC', 0, 1),
(00000444, 'Bandal', 'Marites', '', NULL, '', 'Brgy. Oson', 'Capul', 'Northern Samar', '9282879885', '', 0, '', '99999999', 2, NULL, 00000105, 'BandalMarites', '6ed8837b11d40361c90ddc0d732ab695f0124be5', 0, 0, 'Marites Bandal', '', 1, '140d7fed', '03132019', 'GCC', 0, 1),
(00000445, 'Bonabon', 'Merba', '', NULL, '', 'Brgy. Oson', 'Capul', 'Northern Samar', '9282879885', '', 0, '', '99999999', 2, NULL, 00000105, 'BonabonMerba', 'adac3779ec2a7799ba486eb774a4d88cd22ba81e', 0, 0, 'Merba Bonabon', '', 1, 'a310bee9', '03132019', 'GCC', 0, 1),
(00000446, 'Cabico', 'Christine', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000388, 'CabicoChristine', '92438b5ef1b5e96fc6672caaf7312f510ff27489', 0, 0, 'Christine Cabico', '', 1, '7a36fde4', '10302019', 'GCC', 0, 1),
(00000447, 'Regulto', 'Pedro Alfonso', 'Dela Cruz', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000036, 'RegultoYhet', '9499ae363ba611985c6fbac81bd1e94ddeba9cc7', 0, 0, 'Pedro Alfonso Regulto', '', 1, 'cd2b3ce0', '12212019', 'GCC', 0, 1),
(00000448, 'Jumaquio', 'Marvin', '', NULL, '', '', 'Malolos City', 'Bulacan', '', '', 0, '', '99999999', 1, NULL, 00000001, 'JumaquioMarvin', '397977fa82f9edd10cdcb8b45e2a65b80ffdb2bf', 0, 0, 'Marvin Jumaquio', '', 1, '709673d8', '12232019', 'GCC', 0, 1),
(00000449, 'Platero', 'Gemma', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000376, 'PlateroGemma', 'bbb8fef3cb12635348608205a86903dffbe90ee2', 0, 0, 'Gemma Platero', '', 1, 'c78bb2dc', '01102020', 'GCC', 0, 1),
(00000450, 'Aratia', 'Arnel', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000449, 'AratiaArnel', '0f1cd2a3cb9c97db67f5b5e5b32eea68312592ec', 0, 0, 'Arnel Aratia', '', 1, '14ba622c', '01102020', 'GCC', 0, 1),
(00000451, 'Yambao', 'Florencio', '', NULL, '', '', '', 'Arayat', '', '', 0, '', '99999999', 1, NULL, 00000001, 'YambaoFlorencio', 'aae12a0e260012f6685fa4ba13667dcb2f74b7e0', 0, 0, 'Florencio Yambao', '', 1, 'a3a7a328', '01212020', 'GCC', 0, 1),
(00000452, '', 'Aging Pinoy', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 0, NULL, 00000377, 'AgingPinoy', 'ff5a906534d47a62e61364633078bc0f98fbb4ae', 0, 0, 'Aging Pinoy ', '', 1, '7a81e025', '02082020', 'GCC', 0, 1),
(00000453, 'Lao', 'Jon Nicholas', 'Chia', NULL, '202-1 Champagne Edition, J. Escriva Drive', 'San Antonio', 'Pasig City', 'Metro Manila', '9178313808', 'jonncl@yahoo.com', 0, 'Jon Lao', '11221966', 1, NULL, 00000421, 'Toymastah', '4b6e4b5f9a2d8f0e620899e0f7a5b2d114e2cfda', 0, 0, 'Jon Nicholas Lao', '', 1, 'cd9c2121', '03262020', 'GCC', 0, 1),
(00000454, 'Tan', 'Antonio Elmer', '', NULL, 'Unit 2608 The Levels Anaheim Condominium Pacific Rim-Filinvest, Petron-Commerce Avenue', 'Alabang', 'Muntinlupa', 'Metro Manila', '9178173894', '', 0, '', '99999999', 1, NULL, 00000389, 'TanAntonioElmer', 'a6f4ce6f3558de65827b895a34ff441b50768292', 0, 0, 'Antonio Elmer Tan', '', 1, 'c8cc663f', '04012020', 'GCC', 0, 1),
(00000455, 'Tan', 'Candee', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000421, 'TanCandee', 'd8c99fd0767819e31bebc572ba55729561e58080', 0, 0, 'Candee Tan', '', 1, '7fd1a73b', '04022020', 'GCC', 0, 1),
(00000456, 'Dela Rosa', 'Mari Claire', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000421, 'DelaRosaMariClaire', '57b28ce3b02457263e928691c0603fac203b6142', 0, 0, 'Mari Claire Dela Rosa', '', 1, 'a6f7e436', '04052020', 'GCC', 0, 1),
(00000457, 'Cu', 'Marlene', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000421, 'CuMarlene', '24c1f54fe09ee0c98b9ce2e63ee584cbae8c051a', 0, 0, 'Marlene Cu', '', 1, '11ea2532', '04062020', 'GCC', 0, 1),
(00000458, 'Sy', 'Chelsea', '', NULL, 'Imperial Sky Garden Condominium, 707 Ongpin St.', 'Binondo', 'Manila City', 'Metro Manila', '9053653648', '', 0, '', '99999999', 2, NULL, 00000017, 'SyChelsea', 'b790448441496d307df28e4b98b3eba6ba076a91', 0, 0, 'Chelsea Sy', '', 1, 'ac576a0a', '04062020', 'GCC', 0, 1),
(00000459, 'Bajandi', 'Amelita', '', NULL, 'Block 5 Lot 20 #36 Executive Homes 1, Cainta Green Park Village', '', 'Cainta', 'Rizal', '9159928987', '', 0, '', '99999999', 2, NULL, 00000390, 'BajandiAmelita', '8972e3526d8fc6123af467d9974fd4ce04733bce', 0, 0, 'Amelita Bajandi', '', 1, '1b4aab0e', '04072020', 'GCC', 0, 1),
(00000460, 'Babiera', 'Fil', '', NULL, '611 Consular Area Post Proper South Side', 'Fort Bonifacio', 'Taguig City', 'Metro Manila', '9279944563', '', 0, '', '99999999', 1, NULL, 00000419, 'BabieraFil', 'c9e4aaa44abe555accea631aac5eed8ef6b7c4fc', 0, 0, 'Fil Babiera', '', 1, 'c7e5895e', '04182020', 'GCC', 0, 1),
(00000461, 'Sinag', 'Myles', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000421, 'SinagMyles', 'e0cd896d8ca23af52aa14d588239794d6442edff', 0, 0, 'Myles Sinag', '', 1, '70f8485a', '04202020', 'GCC', 0, 1),
(00000462, 'Fernando', 'Andrew', '', NULL, 'Unit 5 Casa Francesca, Victoria Road', 'Brgy. San Miguel', 'Pasig City', 'Metro Manila', '9274114782', '', 0, '', '01241970', 1, NULL, 00000423, 'FernandoAndrew', 'f488e40444494cbdf3e1665dbf500cef1d52afa3', 0, 0, 'Andrew Fernando', '', 1, 'a9de0b57', '04242020', 'GCC', 0, 1),
(00000463, 'Lim', 'Godwin', '', NULL, '', '', 'San Juan City', 'Metro Manila', '', '', 0, '', '99999999', 1, NULL, 00000002, 'LimGodwin', '480c233d367f371c0abddf109ef2fd9c88e9cfed', 0, 0, 'Godwin Lim', '', 1, '1ec3ca53', '05072020', 'GCC', 0, 1),
(00000464, 'Pastera', 'Anne', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000421, 'PasteraAnne', '82a47957ceaffeb2b8ca2dfdbb13fb144661d9c8', 0, 0, 'Anne Pastera', '', 1, '1b938d4d', '05082020', 'GCC', 0, 1),
(00000465, 'Sandoval', 'Elizabeth', '', NULL, '29 B Calamba St. corner Mariveles', 'Brgy. Salvacion, La Loma', 'Quezon City', 'Metro Manila', '9338292627', '', 0, '', '99999999', 2, NULL, 00000390, 'SandovalElizabeth', '11a622ac6b6d9b507dbe504de60da9e3e844ed67', 0, 0, 'Elizabeth Sandoval', '', 1, 'ac8e4c49', '05292020', 'GCC', 0, 1),
(00000466, 'Gay', 'Ma. Lourdes', '', NULL, '413 Damayan St.', 'Bacood, Sta. Mesa', 'Manila City', 'Metro Manila', '9338612195', '', 0, '', '99999999', 2, NULL, 00000007, 'GayMalu', '1be9e8b4427247168d8e5ff2c64737b9eb6056f0', 0, 0, 'Ma. Lourdes Gay', '', 1, '75a80f44', '06072020', 'GCC', 0, 1),
(00000467, 'Lopez', 'Jorge Jr.', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'LopezJorge', 'fa414c33d26f4b138263a3d3bd18cf1b1234de18', 0, 0, 'Jorge Lopez Jr.', '', 1, 'c2b5ce40', '06182020', 'GCC', 0, 1),
(00000468, 'Sy', 'Jane', '', NULL, '', 'Montgomery', 'Quezon City', 'Metro Manila', '', '', 0, '', '99999999', 2, NULL, 00000423, 'SyJane', '4b713f5fd478ee0c310e3d5695326c8e517d41c9', 0, 0, 'Jane Sy', '', 1, '7f088178', '07072020', 'GCC', 0, 1),
(00000469, 'Marla', 'Ellen', '', NULL, 'Lot 13 Block 165 Avocado St.', 'Purok 2, New Lower Bicutan', 'Taguig City', 'Metro Manila', '9436915168', '', 0, '', '99999999', 2, NULL, 00000366, 'MarlaEllen', '557358ef8af9065608ee6a156f1772a06d7b82be', 0, 0, 'Ellen Marla', '', 1, 'c815407c', '07112020', 'GCC', 0, 1),
(00000470, 'Fuentes', 'Eduard', '', NULL, '', '', 'Davao City', 'Davao del Sur', '9261191572', '', 0, '', '99999999', 1, NULL, 00000416, 'FuentesEduard', '2c929b01717641f7ddcb6b2db4ab7202ea4abded', 0, 0, 'Eduard Fuentes', '', 1, '1b24908c', '07212020', 'GCC', 0, 1),
(00000471, 'Cu', 'Stephen', '', NULL, 'Ace Tower 1 Condominium, Banawe St.', '', 'Quezon City', 'Metro Manila', '', '', 0, '', '99999999', 1, NULL, 00000002, 'CuStephen', 'ecd5cda8af43c021fd7ae23375aec268e5196db7', 0, 0, 'Stephen Cu', '', 1, 'ac395188', '08042020', 'GCC', 0, 1),
(00000472, 'Chan', 'Michelle', 'Sy', 'Betty', 'MOTHER IGNACIA', 'Paligsahan', 'Quezon City', 'METRO MANILA', '09178873343', 'MICDIVER@GMAIL.COM', 0, 'facebook.com/micdiver', '03201971', 2, '185-300-312', 00000309, 'ChanMichelle', '5bc67fdc0705f4899f653c02f8797c3e24dcbd35', 0, 0, 'Michelle Chan', '', 1, '751f1285', '08042020', 'GCC', 0, 1),
(00000473, 'Lopez', 'Joel', '', NULL, '2J Majorca Tower, 70 Calle Industria', 'Libis', 'Quezon City', 'Metro Manila', '9175630625', '', 0, '', '99999999', 1, NULL, 00000002, 'LopezJoel', '9f1d1d546982d21e1fb28a9e472c3a8c5d85ca9b', 0, 0, 'Joel Lopez', '', 1, 'c202d381', '08042020', 'GCC', 0, 1),
(00000474, 'Ruste', 'Zigmund Patrick', '', NULL, 'Tsekwa Store, #5 cor. Aquarius & Saturn St.', 'GSIS, Matina', 'Davao City', 'Davao del Sur', '9566337124', '', 0, '', '99999999', 1, NULL, 00000002, 'RusteZigmund', '998972dc0acb629e21d0fef63a9888aebd562322', 0, 0, 'Zigmund Patrick Ruste', '', 1, 'c752949f', '08152020', 'GCC', 0, 1),
(00000475, 'Sy', 'Jinky', '', NULL, '247 Dao Street', 'Marikina Heights', 'Marikina City', 'Metro Manila', '9173022851', '', 0, '', '99999999', 2, NULL, 00000002, 'SyJinky', '31f5f1ac73ffa2284904f87a93aa286f7bc17be4', 0, 0, 'Jinky Sy', '', 1, '704f559b', '08222020', 'GCC', 0, 1),
(00000476, 'Castillo', 'Norma', '', NULL, 'Block 4 Lot 4 Buena Perlas 2', 'Brgy. Labas', 'Sta. Rosa', 'Laguna', '9179822566', '', 0, '', '99999999', 2, NULL, 00000002, 'CastilloNorma', '0c37a1689bbde1110fcc86f9d7dff78ee839a4a9', 0, 0, 'Norma Castillo', '', 1, 'a9691696', '08242020', 'GCC', 0, 1),
(00000477, 'Fernando', 'Norvie', '', NULL, '', '', 'Odiongan', 'Romblon', '9206223465', '', 0, '', '99999999', 1, NULL, 00000002, 'FernandoNorvie', 'dbf468ddae39b395f71548e2eaa0a62fbbefa421', 0, 0, 'Norvie Fernando', '', 1, '1e74d792', '08282020', 'GCC', 0, 1),
(00000478, 'Yu', 'Andy', '', NULL, '', '', 'Quezon City', 'Metro Manila', '', '', 0, '', '99999999', 1, NULL, 00000017, 'YuAndy', 'd4104fac480a73acded22893e65d12e241921c10', 0, 0, 'Andy Yu', '', 1, 'a3c998aa', '09142020', 'GCC', 0, 1),
(00000479, 'Baguios', 'Jenelyn', 'Perez', NULL, '1631 Bulacan Street', 'Brgy. 382, Sta. Cruz', 'Manila City', 'Metro Manila', '09683793000', 'jenelynperez1997@gmail.com', 0, '', '09161997', 2, NULL, 00000001, 'BaguiosJenelyn', '75df5f0e64670d824f10e79b52edbdd86e903fcd', 0, 0, 'Jenelyn Baguios', '', 1, '14d459ae', '02222021', 'GCC', 0, 1),
(00000480, 'Go', 'Marilyn', 'Sy', NULL, 'Room 1003 S Tower, 1630 Jose Abad Santos Avenue', 'Tondo', 'Manila City', 'Metro Manila', '09178496383', '', 0, '', '03222021', 2, NULL, 00000002, 'GoMarilyn', NULL, 0, 0, '', '', 1, '280530f8', '03192018', 'grace', 0, 1),
(00000481, 'Taduan', 'Mary Anne', 'Oropel', '', '6023 Benito Hao St.', 'Mapulang Lupa', 'Valenzuela City', 'Metro Manila', '09360332500', '', 0, '', '07141986', 2, '', 00000424, 'TaduanMaryAnne', '1ba7eb0915d652eb97cc751129d410cff8ad3da1', 0, 0, '', '', 1, '62f98a67', '03072021', 'grace', 0, 1),
(00000482, 'Herrera', 'Crystal Joice', 'Aranas', '', 'Block 2 Lot 3 Perpetual Heights Subdivision', 'Sindalan', 'San Fernando City', 'Pampanga', '09175122117', 'crystaljoiceherrera@gmail.com', 0, '', '12121991', 2, '', 00000309, 'HerreraCrystal', '1f1c3c804573e53759cbc8be51f900028ea5050a', 0, 0, '', '', 1, 'fd7f5d03', '03272021', 'grace', 0, 1),
(00000483, 'Wong', 'Rennie', '', '', '17 25th Street', 'East Bajac', 'Olongapo City', 'Zambales', '09989987725', '', 0, '', '01011970', 1, '', 00000002, 'WongRennie', 'ffa7a3244f87774c64a48bb3f08d57dd18c062dd', 0, 0, '', '', 4, '6bd3400e', '04162021', 'grace', 0, 1),
(00000484, 'Torres', 'Leoniwil', '', '', '', '', 'General Santos City', 'South Cotabato', '', '', 0, '', '12301961', 2, '', 00000394, 'TorresLeoniwil', 'aad2561418e676b59f2d218b78088dcd6862a5e0', 0, 0, '', '', 1, '7021b178', '04242021', 'grace', 0, 1),
(00000485, 'Diaz', 'Lory Joy', 'Belarde', '', '9223 Leonardo Bldg., Cluster 2, Spagio Berrardo Condominium, Champaca St.', 'Brgy. Sauyo', 'Quezon City', 'Metro Manila', '09163621734', 'diazloryjoy@yahoo.com', 0, '', '08011977', 2, '', 00000001, 'DiazLory', '6cb9939ba6c634ab6babb80634b9b1c0fa8d768f', 0, 0, '', '', 1, 'dd99dc14', '06112021', 'grace', 0, 1),
(00000486, 'Gadon', 'Ludmilla', 'Bo', 'Angelica Bea', '49 northlane st greymarville subd', 'Talon dos', 'Las Pinas City', 'Tabaco Albay', '09159425894', 'ludy_lgm@yahoo.com', 0, 'Ludmilla Bo', '07181962', 2, '', 00000434, 'LUDYG', '30ca3e55b2b7300b4cf23532180d571e14152080', 3, 0, 'Ludmilla B Gadon', '002400031181', 4, '37052a19', '07152021', 'grace', 0, 1),
(00000487, 'Narvaez', 'Ernesto', 'Lumaquin', 'Trinidad F. Lumaquin', '1187 Carola St.', 'Brgy. 480', 'Manila', 'Metro Manila', '09420426071', 'narvaezernesto2021@gmail.com', 0, 'narvaez.ernesto.90', '02231975', 1, '151446067', 00000410, 'NarvaezErnesto', '34e599f9b08720eb393b40f93594c1b43866196d', 2, 0, '', '', 4, '5f7a7ba4', '07222021', 'grace', 0, 1),
(00000488, 'Chan', 'Maeva', 'Sy', 'Mae Yu', '94 M.L. Quezon St', 'Parang', 'Marikina', 'Metro-Manila', '09176208866', 'maevachan@yahoo.com.sg', 0, '', '04011964', 2, '', 00000002, 'Maeva', '7ae9f80a0f273a1f8f5fe1a57c8c600327618a80', 0, 1, 'Maeva Sy Chan', '', 4, 'ad2c49ed', '08072021', 'grace', 0, 1),
(00000489, 'Young', 'Karisse', 'Ang', 'Lim song', 'President M Roxas street', 'Industrial Valley', 'Marikina City', 'METRO MANILA', '09178485812', 'karisse88@yahoo.com', 0, 'Karisse Ang', '08072021', 2, '', 00000002, 'Karisse21', 'd328cde91051fb191bb8f7e68bd114a8c44435df', 4, 1, '', '', 4, '5b8d15bd', '08072021', 'grace', 0, 1),
(00000490, 'Paua', 'Muriel', 'Bea', 'CariÃ±o', '442 Zaragosa St Tondo Manila', '1', 'Manila', 'Tondo Manila', '09498414992', 'murielbea3@gmail.com', 1, 'Muriel Bea', '08222021', 2, 'None', 00000434, 'Beamuriel', '7dde163305343b957439d2aae08c65b910b4bd56', 3, 0, 'Muriel Paua', '001590015213', 4, 'c992a8f8', '08232021', 'grace', 0, 1),
(00000491, 'Trivino', 'Cheryll Anne', 'Tallud', 'Thelma Carag Tallud', '38 Rafael Palma st. PDP executive village', 'BF Homes', 'ParaÃ±aque', 'Metro Manila', '09189390704', 'chetrivino@gmail.com', 0, '', '02141978', 2, '', 00000429, 'Chetrivino', '8e94fa63a5d817f6e5b4a552456b15f9d1dc4098', 0, 1, 'Cheryll Anne TriviÃ±o', '', 4, '', '12112021', 'grace', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `distributors1`
--

CREATE TABLE `distributors1` (
  `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `dslnam` varchar(255) DEFAULT NULL,
  `dsfnam` varchar(255) NOT NULL,
  `dsmnam` varchar(255) DEFAULT NULL,
  `dsmother` varchar(64) DEFAULT NULL,
  `dsstreet` varchar(255) NOT NULL,
  `dsbrgy` varchar(255) NOT NULL,
  `dscity` varchar(255) NOT NULL,
  `dsprov` varchar(255) NOT NULL,
  `dscontact` varchar(32) DEFAULT NULL,
  `dsemail` varchar(64) DEFAULT NULL,
  `dsemail_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `dsfb` varchar(64) DEFAULT NULL,
  `dsbirth` varchar(8) NOT NULL,
  `dssex` tinyint(1) NOT NULL DEFAULT '0',
  `dstin` text,
  `dssid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `un` varchar(64) DEFAULT NULL,
  `pw` varchar(64) DEFAULT NULL,
  `payout` tinyint(1) DEFAULT '0',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0',
  `pay_name` varchar(64) DEFAULT NULL,
  `pay_acct` varchar(32) DEFAULT NULL,
  `dsmtype` tinyint(1) DEFAULT '0',
  `discount` varchar(8) DEFAULT NULL,
  `dsencoded` varchar(8) DEFAULT NULL,
  `dsencodedby` varchar(64) DEFAULT NULL,
  `withheld` tinyint(1) NOT NULL DEFAULT '0',
  `dsstatus` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `distributors1`
--

INSERT INTO `distributors1` (`dsdid`, `dslnam`, `dsfnam`, `dsmnam`, `dsmother`, `dsstreet`, `dsbrgy`, `dscity`, `dsprov`, `dscontact`, `dsemail`, `dsemail_confirm`, `dsfb`, `dsbirth`, `dssex`, `dstin`, `dssid`, `un`, `pw`, `payout`, `pay_type`, `pay_name`, `pay_acct`, `dsmtype`, `discount`, `dsencoded`, `dsencodedby`, `withheld`, `dsstatus`) VALUES
(00000011, 'De Vera', 'Charity', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'DeVeraCharity', '81bc3812f0697c17c2ac73c7783e1b34931f2516', 0, 0, 'Charity De Vera', '', 2, '1634e56a', '06192017', 'GCC', 0, 1),
(00000012, 'Pelaez', 'Blaine', 'Paragat', NULL, 'B89 L9 Matahimik St.', 'Pangarap Village', 'Caloocan', 'Metro Manila', '9322021709', 'blaine.pelaez1128@gmail.com', 0, '', '11021972', 2, NULL, 00000001, 'PelaezBlaine', '7d7adf6ea4bfbb07aea46b5f561efc6f8693426d', 0, 0, 'Blaine Pelaez', '', 2, 'cf12a667', '06202017', 'GCC', 0, 1),
(00000008, 'Sy', 'Alexandra', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'SyAlexandra', '59238e69446020206b64d9863e648c6a98d23f88', 0, 0, 'Alexandra Sy', '', 2, 'c505359a', '06152017', 'GCC', 0, 1),
(00000010, 'Estillos', 'Gerry', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000005, 'EstillosGerry', '16b4df02d6daac02cb1537ee561f0a8b680d1bab', 0, 0, 'Gerry Estillos', '', 2, 'a129246e', '06152017', 'GCC', 0, 1),
(00000009, 'Brital', 'Malyn', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000005, 'BritalMalyn', '71d685ccd599a43e12fe8ffbaebce95692f5010c', 0, 0, 'Malyn Brital', '', 2, '7218f49e', '06152017', 'GCC', 0, 1),
(00000007, 'Quitay', 'Ma. Lorelee', 'Kinikot', NULL, '37 Camachile St.', ' Western Bicutan', ' Taguig', ' Metro Manila', '9554681797', 'mlquitay@yahoo.com', 0, '', '12291975', 2, NULL, 00000001, 'QuitayLorelee', 'ac2beb71c6c085bef477f485f3212b889d3bb97d', 0, 0, 'Ma. Lorelee Quitay', '3049101502', 3, '78b87aa2', '06152017', 'GCC', 0, 1),
(00000006, 'Apat', 'Dioleta', 'Estaniel', NULL, '', 'Bagong Silang', '', 'Davao del Norte', '9097854129', '', 0, '', '10151970', 2, NULL, 00000001, 'ApatDioleta', '7ba3792c1bd02746d1fe660d5654bfa4c39b9018', 0, 0, 'Dioleta Apat', '', 2, 'cfa5bba6', '06152017', 'GCC', 0, 1),
(00000005, 'Brital', 'Gina', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'BritalGina', '2546aad1b35e1fb7fdcdb9e5c2362fff32f2577b', 0, 0, 'Gina Brital', '', 2, '1683f8ab', '06052017', 'GCC', 0, 1),
(00000004, 'Neria', 'Lorraine', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'NeriaLorraine', 'a37ddb1183cfdfd106c3845374357f2e454434e8', 0, 0, 'Lorraine Neria', '', 2, 'a19e39af', '06052017', 'GCC', 0, 1),
(00000001, 'Regulto', 'Alexis', 'Dela Cruz', NULL, 'Unit 509 Integrated Professional Offices, #14 Quezon Avenue', 'Dona Josefa', 'Quezon City', 'Metro Manila', '09423692717', 'alexisregulto@gmail.com', 0, '', '04291975', 1, NULL, 00000000, 'RegultoAlexis', 'a2bcdc8fbebd49ee9f2730503621f8e947c378b1', 0, 0, 'Alexis Regulto', '', 0, 'caf5fcb8', '06012017', 'GCC', 0, 1),
(00000002, 'Co', 'Grace', 'Chua', NULL, '35 Calvary Hill Street', 'Damayang Lagi', 'Quezon City', 'Metro Manila', '09175357033', 'jlsintl@mozcom.com', 0, 'grace.co.dhub', '01231970', 2, NULL, 00000000, 'CoGrace', '6c741c3076eba33e6a4cbaccac3187e5860b2a61', 2, 0, 'Grace Co', '0219108877', 0, '13d3bfb5', '06012017', 'GCC', 0, 1),
(00000003, 'Baxinela', 'Mario', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'BaxinelaMario', '351f992f58fcc628380236c27bb5f340e1d145c3', 0, 0, 'Mario Baxinela', '', 1, 'a4ce7eb1', '09182017', 'GCC', 0, 1),
(00000037, 'Mesiderio', 'Genoveva', 'Sta. Romana', '', 'Gama Grande', 'Calinog', 'Iloilo', 'Iloilo', '9102184183', '', 0, '', '99999999', 2, '', 00000024, 'MesiderioGenoveva', '0ce54cdca885780c9412bb826d46853a26eca5b5', 0, 0, 'Genoveva Mesiderio', '', 2, 'abe791d0', '09052017', 'GCC', 0, 1),
(00000064, 'Te', 'Gerardine', 'Veloso', '', '', '', '', '', '', '', 0, '', '99999999', 2, '', 00000002, 'TeGerardine', '3981faf6dabbcbea7d36628e330ea5bfadca3015', 0, 0, 'Gerardine Te', '', 2, '0721ef4a', '10242017', 'GCC', 0, 1),
(00000018, 'Dingos', 'Raquel', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000013, 'DingosRaquel', 'c181ad8439ae0b395eb0d5838b6029bb6f8286de', 0, 0, 'Raquel Dingos', '', 0, '19c42c48', '07012017', 'GCC', 0, 1),
(00000020, 'Estayo', 'Mariel', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000013, 'EstayoMariel', '682c9f1b4ade1489f6a82c4cc67a7b248444e552', 0, 0, 'Mariel Estayo', '', 0, '7276cf1c', '07152017', 'GCC', 0, 1),
(00000021, 'Santiago', 'Maritess', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000011, 'SantiagoMaritess', '1267fbbbddcb67dec4bd84fc20d97f53b639de31', 0, 0, 'Maritess Santiago', '', 0, 'c56b0e18', '07162017', 'GCC', 0, 1),
(00000000, 'Lucky Universe', 'RCA', '', NULL, 'Unit 509 Integrated Professional Offices, #14 Quezon Avenue', 'Dona Josefa', 'Quezon City', 'Metro Manila', '09175357033', 'luckyuniverse11@gmail.com', 0, '', '09112017', 0, NULL, 00000000, 'RCA', 'bf145b230a83ca5e6fcfa1ac6a370e26c74fd290', 2, 0, 'RCA Lucky Universe', '', 0, '7de83dbc', '06012017', 'GCC', 0, 1),
(00000013, 'Nemenzo', 'Maria Lourdes', 'Haber', '', 'B9 L17 Mary Grace Sta. Rosa I', '', 'Marilao', 'Bulacan', '9109966638', '', 0, '', '05121986', 2, '', 00000001, 'NemenzoLourdes', 'e1a9d1d8e5b3a17adcd7522e8e249de867efe491', 0, 0, 'Maria Lourdes Nemenzo', '', 3, '780f6763', '06212017', 'GCC', 1, 0),
(00000014, 'Benitez', 'Joel', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000007, 'BenitezJoel', '8f210011b5c409779dc1e4f949e9dd75fd3cca8c', 0, 0, 'Joel Benitez', '', 2, '7d5f207d', '06242017', 'GCC', 0, 1),
(00000015, 'Ferreras', 'Edesa', 'Calupas', NULL, '10 Katipunan', 'Kaliwa Bagbag', 'Novaliches, Quezon City', ' Metro Manila', '9476083287', 'dessa_ferreras@yahoo.com', 0, '', '09221995', 2, NULL, 00000013, 'FerrerasEdesa', '1ae589c25aaccc6302b52942a726cdcc828ac824', 0, 0, 'Edesa Ferreras', '', 2, 'ca42e179', '06282017', 'GCC', 0, 1),
(00000016, 'Bosquillos', 'Emily', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000013, 'BosquillosEmily', '7ab70473f15dc211ef4449f4528b7b55d2f863a5', 0, 0, 'Emily Bosquillos', '', 3, '1364a274', '06302017', 'GCC', 0, 1),
(00000017, 'Co', 'Joshua Anthony', 'Chua', NULL, '35 Calvary Hill St.', 'Damayang Lagi', 'Quezon City', 'Metro Manila', '9178357055', '', 0, '', '07071995', 1, NULL, 00000423, 'CoJoshua', '0b4b82ffa5be0bd1918dba7c821e95140e5ee906', 0, 0, 'Joshua Anthony Co', '', 2, 'a4796370', '07012017', 'GCC', 0, 1),
(00000022, 'Arellano', 'Myra', 'Uclaray', '', '99 Congressional Ave.', 'Project 8', 'Quezon City', 'Metro Manila', '9175133626', 'richee1028@yahoo.com', 0, '', '10281979', 2, '', 00000001, 'ArellanoMyra', '1061f7b5d4413e395cfa788af0416bcbbaa7eab8', 0, 0, 'Myra Arellano', '2389065261', 3, '1c4d4d15', '09102017', 'GCC', 0, 1),
(00000023, 'Mancenido', 'Elizalde Jr.', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'MancenidoElizaldeJr', '1159f81869eacfaebd1477d7df4f1e5c661ee917', 0, 0, 'Elizalde Mancenido Jr.', '', 2, 'ab508c11', '07282017', 'GCC', 0, 1),
(00000024, 'Galvez', 'Maryam', '', '', 'Ramos Ext. Brgy. Purok 1 Pavia', 'Iloilo City', 'Iloilo', 'Iloilo', '9237402148', 'maryamgalvez@gmail.com', 0, '', '05101967', 2, '', 00000001, 'GalvezMaryam', 'c00d9352a378e27de5b4c7ea5ddb521522a4a124', 0, 0, 'Maryam Galvez', '', 3, 'ae00cb0f', '08022017', 'GCC', 0, 1),
(00000025, 'Barretto', 'Lourdes', 'Ang', NULL, '29-6 Araneta Avenue', ' Barangay Potrero', ' Malabon City', ' Metro Manila', '9207230437', '', 0, '', '12221955', 2, NULL, 00000002, 'BarrettoLourdes', 'ee720c39982e6f68d58afa5cad8257c834744d21', 0, 0, 'Lourdes Barretto', '', 3, '191d0a0b', '08042017', 'GCC', 0, 1),
(00000026, 'Santos', 'Teresita', 'Yap', NULL, 'B56 L60 Taurus Street', ' Heritage Homes', ' Marilao', ' Bulacan', '9054455529', 'tysantos@smg.sanmiguel.com.ph', 0, '', '05161972', 2, NULL, 00000001, 'SantosTeresita', '91beb1b90d8dabc91ec62acdc3b5e41a1d0d54a5', 0, 0, 'Aquilles Ranier Ronquilo Santos', '4169399064', 3, 'c03b4906', '08092017', 'GCC', 0, 1),
(00000027, 'Bactung', 'Geraldine', 'Betiwan', '', 'Brgy. Pandac', 'Pavia', 'Iloilo', 'Iloilo', '9561658640', 'jarahfaciuos@gmail.com', 0, '', '99999999', 2, '', 00000024, 'BactungGeraldine', 'f3c606e9c6320794f7a2f7a12c6e9ac45b0bc909', 0, 0, 'Geraldine Bactung', '', 2, '77268802', '08142017', 'GCC', 0, 1),
(00000028, 'Gumafelix', 'Cris', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000001, 'GumafelixCris', 'e435e78373f6e5ddd9bd31aeb03684f03d4c526d', 0, 0, 'Cris Gumafelix', '', 2, 'ca9bc73a', '08132017', 'GCC', 0, 1),
(00000029, 'Cayetano', 'Joy', 'Tembrevilla', NULL, 'B8 L1 Orchid St. Florvel Home', ' Oton', 'Iloilo', 'Iloilo', '9297488628', 'joytc09@yahoo.com', 0, '', '99999999', 2, NULL, 00000024, 'CayetanoJoy', 'd613c9fb8dd67a99d32ab66915512103300acb61', 0, 0, 'Joy Cayetano', '', 2, '7d86063e', '08152017', 'GCC', 0, 1),
(00000030, 'Kang', 'Clarissa', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000017, 'KangClarissa', 'ecdf3aa6b289f84e3b3559b78d04c61a8c37d467', 0, 0, 'Clarissa Kang', '', 2, 'aeb7d6ce', '08172017', 'GCC', 0, 1),
(00000031, 'Al-wahaibi', 'Jean', 'Zerrudo', NULL, 'B19 L42 P-2 Deca Homes', ' Pandac Pavia', 'Iloilo', 'Iloilo', '9159131794', 'jeanzerrudo29@gmail.com', 0, '', '99999999', 2, NULL, 00000024, 'AlwahaibiJean', 'f9819a0cef2f51066b9e845eca874ea6fc3ec8db', 0, 0, 'Jean Al-wahaibi', '', 3, '19aa17ca', '08232017', 'GCC', 0, 1),
(00000032, 'Octaviano', 'Elna', 'Pinuela', '', 'Jolaud Sur.', 'Zarraga', 'Iloilo', 'Iloilo', '9083690745', '', 0, '', '99999999', 2, '', 00000024, 'OctavianoElna', 'c822c8870ebad1fe4e8349efae58c13e1a5bb379', 0, 0, 'Elna Octaviano', '', 2, 'c08c54c7', '08312017', 'GCC', 0, 1),
(00000033, 'Depamaylo', 'Gina', 'Flores', '', 'Gomez St.', 'Zarraga', 'Iloilo', 'Iloilo', '9179450995', '', 0, '', '99999999', 2, '', 00000024, 'DepamayloGina', 'a2b5cee5b95559f8c94b9ee9df1be9c9ab317aeb', 0, 0, 'Gina Depamaylo', '', 2, '779195c3', '08312017', 'GCC', 0, 1),
(00000034, 'Domantay', 'Warren', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'DomantayWarren', 'e953a035f934629d5003d02e0b2d357f67a230c3', 0, 0, 'Warren Domantay', '', 2, '72c1d2dd', '08262017', 'GCC', 0, 1),
(00000035, 'Tanig', 'Marvin', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'TanigMarvin', '9b4092c3a0956092ebd01a2c10c5d4c79dd62c93', 0, 0, 'Marvin Tanig', '', 2, 'c5dc13d9', '08242017', 'GCC', 0, 1),
(00000036, 'Regulto', 'Peter John', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'RegultoPJ', '0c653732f2cc0330a036be82e5b36019e66a6bfe', 0, 0, 'Peter John Regulto', '', 2, '1cfa50d4', '08242017', 'GCC', 0, 1),
(00000038, '', 'Agnes', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000006, 'Agnes', '2ab5119555a0fa5ea8d6424e1b759be6ef1efae3', 0, 0, 'Agnes ', '', 2, '165adee8', '09042017', 'GCC', 0, 1),
(00000039, 'Diamante', 'Corazon', 'Amparo', '', 'Ilaya 1st', '', 'Dumangas', 'Iloilo', '9501085801', '', 0, '', '99999999', 2, '', 00000024, 'DiamanteCorazon', 'ad41b7992dc3e1aadd45ec693a7cfcf2a3fce281', 0, 0, 'Corazon Diamante', '', 2, 'a1471fec', '09082017', 'GCC', 0, 1),
(00000040, 'Cachuela', 'Marlin', 'Garcia', '', 'Rizal Ilaud', 'Calinog', 'Dumangas', 'Iloilo', '9072301073', 'marlincachuela@gmail.com', 0, '', '99999999', 0, '', 00000024, 'CachuelaMarlin', 'c948350f217da516fb0224d91c4507b19957861f', 0, 0, 'Marlin Cachuela', '', 2, 'd4c919f9', '09082017', 'GCC', 0, 1),
(00000041, 'Mirabuenos', 'Monica', 'Buenaobra', NULL, '991 Purok 1', ' Tikay', 'Dumangas', 'Bulacan', '9068094218', '', 0, '', '03311995', 2, NULL, 00000013, 'MirabuenosMonica', '60e9072c528ff811568a89d754dc0ce2b0463ddb', 0, 0, 'Monica Mirabuenos', '', 2, '63d4d8fd', '09092017', 'GCC', 0, 1),
(00000042, 'Ganancial', 'Mary', 'Ballinas', NULL, 'BBC Little Baguio', ' Concepcion', 'Dumangas', 'Tarlac', '', '', 0, '', '01061964', 2, NULL, 00000001, 'GanancialMary', 'aebfcc56c53c78b47a4e2bdf8a39aac493d9d594', 0, 0, 'Mary Ganancial', '', 3, 'baf29bf0', '09092017', 'GCC', 0, 1),
(00000043, 'Rebulado', 'Esther', 'Lacbanes', NULL, 'B4 L12 Duhat St.', ' Palmera Woodlands', 'Antipolo City', ' Rizal', '9178582134', 'estherrebulado@yahoo.com', 0, '', '12261900', 2, NULL, 00000042, 'RebuladoEsther', '77601eeb35664e013455539cdd31e605d2ac997b', 0, 0, 'Esther Rebulado', '', 2, '0def5af4', '09112017', 'GCC', 0, 1),
(00000044, 'Mateo', 'Merlin', 'De Guzman', NULL, '007 D. Macam St.', ' Taal', 'Bocaue', ' Bulacan', '9178396898', 'merlinmateo2014@gmail.com', 0, '', '09221978', 1, NULL, 00000013, 'MateoMerlin', '024f1fea709c8a6272bdfe263a6323eba272d0e1', 0, 0, 'Merlin Mateo', '', 2, '08bf1dea', '09202017', 'GCC', 0, 1),
(00000045, 'Basultin', 'Merlyn', 'Gardose', '', '', 'Carmelo', 'Banate', 'Iloilo', '9123119899', '', 0, '', '99999999', 2, '', 00000003, 'BasultinMerlyn', '84b7a90200119c4cb2671086936aab14fbd8402c', 0, 0, 'Merlyn Basultin', '', 3, 'bfa2dcee', '09262017', 'GCC', 0, 1),
(00000046, 'Dela Cruz', 'Rosh Hashanah', 'Diapen', '', '', '', 'Iloilo City', 'Iloilo', '9173051518', 'hash10_1213@yahoo.com', 0, '', '99999999', 0, '', 00000024, 'DelaCruzRosh', '1d9e930ddd392ba12682dc4abaa17498cd1dc0db', 0, 0, 'Rosh Hashanah Dela Cruz', '', 2, '66849fe3', '09282017', 'GCC', 0, 1),
(00000047, 'Muhminin', 'Nelyn', 'Simbajon', '', 'Poblacion', '', 'Iloilo City', 'Iloilo', '9298877397', '', 0, '', '99999999', 2, '', 00000024, 'MuhmininNelyn', 'b90c34c4b158149c029ab3dcd8a972c198c40e09', 0, 0, 'Nelyn Muhminin', '', 2, 'd1995ee7', '09282017', 'GCC', 0, 1),
(00000048, 'Dimzon', 'Salita', 'Dormitorio', NULL, 'P.D. Monfort North', '', 'Dumangas', 'Iloilo', '9485788328', 'salita_dormitorio@yahoo.com', 0, '', '99999999', 2, NULL, 00000049, 'DimzonSalita', '6dc31d00bd847c160cda78d4ead3a76d6c4d9031', 0, 0, 'Salita Dimzon', '', 3, '6c2411df', '09262017', 'GCC', 0, 1),
(00000049, 'Diamante', 'Daphne', 'Dalida', NULL, 'Ilaya Street', '', 'Dumangas', 'Iloilo', '9773773136', '', 0, '', '07151972', 2, NULL, 00000024, 'DiamanteDaphne', 'afaa8466a6fbf18706d4096b72aea31f20b92840', 0, 0, 'Daphne Diamante', '3439052685', 3, 'db39d0db', '09262017', 'GCC', 0, 1),
(00000050, 'Gochuico', 'Alexander', '', NULL, '36A Church Street', 'Grace Village', 'Quezon City', 'Metro Manila', '9178387813', 'alex@uplink.com.ph', 0, '', '07181965', 1, NULL, 00000002, 'GochuicoAlexander', 'f124eef59be2170d1cf674760e9a78bea1f4de61', 0, 0, 'Alexander Gochuico', '1973050423', 3, '0808002b', '09272017', 'GCC', 0, 1),
(00000051, 'Gochuico', 'Bobby', '', NULL, '127 Biak na Bato St.', '', 'Quezon City', 'Metro Manila', '9178950271', 'bugsbobby@uplink.com.ph', 0, '', '02041971', 1, NULL, 00000050, 'GochuicoBobby', '03d705a7a58cfa40425b6c37ef833611e87a0049', 0, 0, 'Bobby Gochuico', '1979001459', 3, 'bf15c12f', '09272017', 'GCC', 0, 1),
(00000052, 'Ching', 'Michael', 'Sy', NULL, '533 M. Naval St.', '', 'Navotas City', 'Metro Manila', '9225652817', 'chingmike769@yahoo.com', 0, '', '07131969', 1, NULL, 00000050, 'ChingMichael', '9cc5decf8c973cdb1acb0608605047179a67282c', 0, 0, 'Michael Ching', '1973028983', 3, '66338222', '09272017', 'GCC', 0, 1),
(00000053, 'Brioso', 'Lourdes', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'BriosoLourdes', '31b91d3b7a1294bddcaf48344b2216a816dba211', 0, 0, 'Lourdes Brioso', '', 1, 'd12e4326', '09282017', 'GCC', 0, 1),
(00000054, 'Zapanta', 'Angelee', 'Baxinela', NULL, '', '', 'Banate', 'Iloilo', '9751911579', '', 0, '', '99999999', 2, NULL, 00000003, 'ZapantaAngelee', '35cd192b136a2252fa78c02d00bd9719c6836a50', 0, 0, 'Angelee Zapanta', '', 2, 'd47e0438', '09282017', 'GCC', 0, 1),
(00000055, 'Villaruel', 'Pauline Love', 'Dela Cruz', NULL, '', 'Talokgangan', 'Banate', 'Iloilo', '9159832874', 'pauvillaruel18@gmail.com', 0, '', '99999999', 2, NULL, 00000003, 'VillaruelPauline', '871a0353a14d260400964022319679d524bc9d4d', 0, 0, 'Pauline Love Villaruel', '', 2, '6363c53c', '09282017', 'GCC', 0, 1),
(00000056, 'Baxinela', 'Amiel', 'Ballego', NULL, '', 'Brgy. Carmelo', 'Banate', 'Iloilo', '', '', 0, '', '99999999', 0, NULL, 00000003, 'BaxinelaAmiel', 'a7508dd5d9689f775ce8daed48fc14aa15b6192f', 0, 0, 'Amiel Baxinela', '', 2, 'ba458631', '09282017', 'GCC', 0, 1),
(00000057, 'Tan', 'Genghis', 'Encarnacion', NULL, '39C Church Street', '', 'Quezon City', 'Metro Manila', '9568738105', 'genghistan88@gmail.com', 0, '', '05191994', 1, NULL, 00000001, 'TanGenghis', '11b53c7a8f226f95f2c7694603434a90f2051314', 0, 0, 'Genghis Tan', '4759177032', 3, '0d584735', '10032017', 'GCC', 0, 1),
(00000058, 'Oquin', 'Joyce Anne', 'Garcia', 'Judith Mindoro Garcia', '1068 Kamada St.', 'Dagat-Dagatan', 'Caloocan', 'Metro Manila', '09469701491', 'oquinjoyce@gmail.com', 0, '', '12231993', 2, '', 00000001, 'OquinJoyce', '641b8dd7ca09b6c308a99807687c5cfe8940cea8', 1, 1, 'Joyce Anne Oquin', '', 3, 'b0e5080d', '10072017', 'GCC', 0, 1),
(00000059, 'Damilig', 'Emmanuel', 'De Guzman', NULL, 'Capariaan', 'Sta. Cruz', 'Ilocos Sur', 'Ilocos', '09065954840', 'revnowelldamilig25@yahoo.com', 0, '', '12251972', 1, NULL, 00000001, 'DamiligEmmanuel', 'a60ee069ff4d9987145449313c72065b9fb07c74', 0, 0, 'Emmanuel Damilig', '3049066197', 3, '07f8c909', '10122017', 'GCC', 0, 1),
(00000060, 'Bangsil', 'Josephine', 'Baturi', NULL, 'Maligcong', 'Salcedo', 'Ilocos Sur', 'Ilocos', '9177005720', '', 0, '', '04181980', 2, NULL, 00000059, 'BangsilJosephine', '10e5accd1d25311eef9cfdc967477c8de919df2b', 0, 0, 'Josephine Bangsil', '', 3, 'db57eb59', '10122017', 'GCC', 0, 1),
(00000061, 'Pico', 'Eddyline', 'Gubatanga', NULL, 'B8 L3 Bito-on Newsite', 'Jaro', 'Iloilo City', 'Iloilo', '9105595802', 'eddyline.pico@deped.gov.ph', 0, '', '07241963', 2, NULL, 00000024, 'PicoEddyline', '0e7830a90a49f64ffda948448afcff72926331ef', 0, 0, 'Eddyline Pico', '9229176215', 3, '6c4a2a5d', '10132017', 'GCC', 0, 1),
(00000062, 'Yun', 'Claire', 'Aboga', NULL, 'S.O Catmon San Rafael', 'Rodriguez', 'Montalban', 'Rizal', '9980196262', 'ayanng22@gmail.com', 0, '', '04131996', 2, NULL, 00000015, 'YunClaire', '075c3ad42045e7af949e8e3f243a4796dc9f7060', 0, 0, 'Claire Yun', '', 2, 'b56c6950', '10142017', 'GCC', 0, 1),
(00000063, 'Mejica', 'Gary Jr.', 'Ilaud', '', '', '', 'Malabon City', 'Metro Manila', '9668738031', '', 0, '', '08041994', 1, '', 00000058, 'MejicaGary', 'f77330c173fe73962a683285c1e6695bbbf49520', 0, 0, 'Gary Mejica Jr.', '', 3, '0271a854', '10232017', 'GCC', 0, 1),
(00000065, 'Diamante', 'Ibarnaly', 'Dela Cruz', '', '33 Ilaya 1st', '', 'Dumangas', 'Iloilo', '9999535971', '', 0, '', '99999999', 0, '', 00000049, 'DiamanteIbarnaly', 'e55c218e1e401d1a3e881e5a6f85c3d3e1dec6e6', 0, 0, 'Ibarnaly Diamante', '', 2, 'b03c2e4e', '10252017', 'GCC', 0, 1),
(00000066, 'Guillen', 'Maria Isolda', 'De Jesus', NULL, 'National Road', 'Calahan', 'Cardona', 'Rizal', '9178741277', 'djmaqui@yahoo.com', 0, '', '12231977', 2, NULL, 00000002, 'GuillenMaqui', 'e1c4863920753d49735a772581bb89d7a2b16cde', 0, 0, 'Maria Isolda Guillen', '3419198284', 3, '691a6d43', '10262017', 'GCC', 0, 1),
(00000067, 'Mamangon', 'Ma. Carliza', 'Obispo', '', '58 M.H. del Pilar St.', 'Sto. Tomas', 'Pasig City', 'Binangonan, Rizal', '9981712171', '', 0, '', '12101984', 2, '', 00000063, 'MamangonCarliza', '2dc6b9038489297cf672893156e70453d3d39243', 0, 0, 'Ma. Carliza Mamangon', '', 3, 'de07ac47', '10262017', 'GCC', 0, 1),
(00000068, 'Dela Cruz', 'Ma. Idanel', '', '', '4790 San Roque St.', 'San Francisco', 'San Juan Floodway', '', '', '', 0, '', '99999999', 0, '', 00000063, 'DelaCruzIdanel', '8c6cc492d8044253d3a49b6eed56c535c34fe687', 0, 0, 'Ma. Idanel Dela Cruz', '', 1, '63bae37f', '10262017', 'GCC', 0, 1),
(00000069, 'Dela Paz', 'Cristoper', 'Palaminano', '', '0978 Cod. Comp., Barrio Road', 'Tayuman', 'Binangonan', 'Rizal', '9366576523', '', 0, '', '10171993', 1, '', 00000063, 'DelaPazCristoper', '86f4e3b3a50e884091dbd527425c5cc65cd4eae3', 0, 0, 'Cristoper Dela Paz', '', 1, 'd4a7227b', '10262017', 'GCC', 0, 1),
(00000070, 'Paguirigan', 'Christian', 'Huete', NULL, 'Phase 1 Block 33 Lot 14', 'San Lorenzo Ruiz', 'Taytay', 'Rizal', '9123721755', '', 0, '', '07141983', 1, NULL, 00000071, 'PaguiriganChristian', 'e364db950a84d7c525f89b7a2896e17e396d5c3a', 0, 0, 'Christian Paguirigan', '', 3, '0796f28b', '10282017', 'GCC', 0, 1),
(00000071, 'Mamangon', 'Daniel', 'Raymundo', NULL, '58 M.H. del Pilar St.', 'Sto. Tomas', 'Pasig City', 'Metro Manila', '9954904285', '', 0, '', '10181984', 1, NULL, 00000067, 'MamangonDaniel', 'a434e44fc751b7b7cc03445d6de270f725ea3bef', 0, 0, 'Daniel Mamangon', '', 1, 'b08b338f', '10282017', 'GCC', 0, 1),
(00000072, 'Cerino', 'Angela Marie', 'Lozano', NULL, '1400-D Pampanga St.', 'Sta. Cruz', 'Manila', 'Metro Manila', '9082020494', 'lozanocerinoa@yahoo.com', 0, '', '04271990', 2, NULL, 00000071, 'CerinoAngela', '09bd3ee88634b6e29bca80df9d96e19f1907092e', 0, 0, 'Angela Marie Cerino', '', 3, '69ad7082', '10282017', 'GCC', 0, 1),
(00000073, 'Sejalbo', 'Norma', 'Panaun', NULL, '23 Joaquin St.', 'Gen. T. de Leon', 'Valenzuela City', 'Pampanga', '9757864866', 'liean_intsik26@yahoo.com', 0, '', '12111983', 2, NULL, 00000071, 'SejalboNorma', '835237bc85253f6353bf91e74ec050d84b418f8a', 0, 0, 'Norma Sejalbo', '', 1, 'deb0b186', '10282017', 'GCC', 0, 1),
(00000074, 'Barrido', 'Bersil', '', NULL, '0978 Cod. Comp., Barrio Road', 'Tayuman', 'Binangonan', 'Rizal', '9396385859', '', 0, '', '05151987', 0, NULL, 00000069, 'BarridoBersil', 'cf58d9f7a296a6676090e4b7d8c2c4b3063bfe77', 0, 0, 'Bersil Barrido', '', 1, 'dbe0f698', '10282017', 'GCC', 0, 1),
(00000075, 'Barrido', 'Marechel', '', NULL, '0978 Cod. Comp., Barrio Road', 'Tayuman', 'Binangonan', 'Rizal', '9393152284', '', 0, '', '03161993', 2, NULL, 00000074, 'BarridoMarechel', '45f12f2f0631a35862ce265b96d41370420a2dcf', 0, 0, 'Marechel Barrido', '', 1, '6cfd379c', '10282017', 'GCC', 0, 1),
(00000076, 'Uson', 'Catherine', '', NULL, 'Pag-asa Village, Arellano St.', '', 'Dagupan City', 'Pangasinan', '9165577770', '', 0, '', '03071975', 2, NULL, 00000063, 'UsonCatherine', '125cefeb7bc4d952c9f3ca9761cf7668b313c4cb', 0, 0, 'Catherine Uson', '', 1, 'b5db7491', '10282017', 'GCC', 0, 1),
(00000077, 'Ignacio', 'Luzviminda', '', NULL, '192E Dr. Pilapil St.', 'San Miguel', 'Pasig City', 'Metro Manila', '9288608720', '', 0, '', '10221968', 2, NULL, 00000063, 'IgnacioLuzviminda', '239aaff080154ce8e8b180874a7c07e8ff71718e', 0, 0, 'Luzviminda Ignacio', '', 1, '02c6b595', '10282017', 'GCC', 0, 1),
(00000078, 'Garcia', 'Roselie', 'Cleopas', NULL, 'Block 1 Lot 2 St. North Caloocan Village', 'Bagumbong', 'Caloocan City', 'Metro Manila', '9771915298', '', 0, '', '02091992', 2, NULL, 00000063, 'GarciaRoselie', '12c2d453426d39fb0db6705d2924657eea1431aa', 0, 0, 'Roselie Garcia', '', 1, 'bf7bfaad', '10282017', 'GCC', 0, 1),
(00000079, 'Mingo', 'Joy', 'Galang', NULL, '387 Herrera Drive', 'Quirino Highway', 'Talipapa', '', '9364700552', '', 0, '', '09301992', 2, NULL, 00000063, 'MingoJoy', 'f1d934fe98366417ce9fdc6f3991b0677f41836e', 0, 0, 'Joy Mingo', '', 1, '08663ba9', '10282017', 'GCC', 0, 1),
(00000080, 'Astorga', 'Ma. Carmelita', 'Manojo', '', '7 dela Rama St.', '', 'Iloilo City', 'Iloilo', '9182464875', 'maricarastorga@yahoo.com', 0, '', '99999999', 2, '', 00000024, 'AstorgaMaricar', 'b1386508be58b93b7cc79f6ecdeec7191f74bcf7', 0, 0, 'Ma. Carmelita Astorga', '', 3, '2fab7536', '10132017', 'GCC', 0, 1),
(00000081, 'Verbo', 'Dominador Jr.', 'Gironella', '', 'Poblacion Sur', 'Salcedo', 'Ilocos Sur', 'Ilocos', '9157822809', '2011domverbo@gmail.com', 0, '', '02281972', 1, '', 00000060, 'VerboDominadorJr', 'ffd72edc0cc3ddfc00f504550dfe93fb00dc34a4', 0, 0, 'Dominador Verbo Jr.', '', 3, '98b6b432', '11072017', 'GCC', 0, 1),
(00000082, 'Borce', 'George', 'Barroa', '', 'Bito-on New Sitio', 'Jaro', 'Iloilo City', 'Iloilo', '9153277816', '', 0, '', '99999999', 1, '', 00000061, 'BorceGeorge', '9566a3167f9181648011b6720abaf3c7d738539a', 0, 0, 'George Borce', '', 2, '4190f73f', '11082017', 'GCC', 0, 1),
(00000083, 'Ajesta', 'Rosa Lea', 'Virgula', '', '287-J E. Lopez St.', '', 'Iloilo City', 'Iloilo', '9175429525', 'rvajesta@yahoo.com', 0, '', '99999999', 2, '', 00000024, 'AjestaRosaLea', '7f4b23f26d0b258298cbd57a05e21b33b170dc34', 0, 0, 'Rosa Lea Ajesta', '', 2, 'f68d363b', '11082017', 'GCC', 0, 1),
(00000084, 'Chang', 'Lizabeth', 'Li Fong', NULL, '33 Matutum St.', '', 'Quezon City', 'Metro Manila', '9328458596', '', 0, '', '09121955', 2, NULL, 00000002, 'ChangLizabeth', '0fd70e9c4fb255030428c23399c9b5abe91126cd', 0, 0, 'Lizabeth Chang', '', 1, 'f3dd7125', '11072017', 'GCC', 0, 1),
(00000085, 'Balembeng', 'Christine', 'Ropal', NULL, '4790 San Roque St.', 'San Francisco', 'Cainta', 'Rizal', '9425615197', '', 0, '', '10301989', 2, NULL, 00000068, 'BalembengChristine', '1ef8a794dad5ac118c7ed326771c90a0276226e4', 0, 0, 'Christine Balembeng', '', 1, '44c0b021', '11082017', 'GCC', 0, 1),
(00000086, 'Cerino', 'Ronald', 'Pesuelo', NULL, '1400-D Pampanga St.', 'Sta. Cruz', 'Manila', 'Metro Manila', '9979375343', '', 0, '', '05011985', 1, NULL, 00000072, 'CerinoRonald', '7ae84e7f625fcb8d31025a9456d908711a666d64', 0, 0, 'Ronald Cerino', '', 1, '9de6f32c', '11082017', 'GCC', 0, 1),
(00000087, 'Loresco', 'Rochelle', 'Quiambao', NULL, '', 'Pureza', 'Manila', 'Metro Manila', '9360878028', '', 0, '', '09281900', 2, NULL, 00000086, 'LorescoRochelle', '2954204f5e31c3ee2e319b93cb7d4accd972a64e', 0, 0, 'Rochelle Loresco', '', 1, '2afb3228', '11082017', 'GCC', 0, 1),
(00000088, 'Cabato', 'Marjorie', 'Bandibas', NULL, '2457 Captain Sixto Cuevas', 'Kalawaan', 'Pasig City', 'Metro Manila', '9752506544', '', 0, '', '05131992', 2, NULL, 00000071, 'CabatoMarjorie', '62aa48a88836049b7cdca57dfb1b64f59547b29f', 0, 0, 'Marjorie Cabato', '', 1, '97467d10', '11082017', 'GCC', 0, 1),
(00000089, 'Labata', 'Gina', 'Martillana', NULL, '2458 D. Manunuso St.', 'Ibayo Tipas', 'Taguig City', 'Metro Manila', '9465195786', '', 0, '', '11031987', 2, NULL, 00000071, 'LabataGina', '2854de09591c83ccadea4f69a14ee1fd5b1ddcab', 0, 0, 'Gina Labata', '', 1, '205bbc14', '11082017', 'GCC', 0, 1),
(00000090, 'Pechayco', 'Alita', 'F.', '', 'Pob. Culon', '', '', 'Antique', '9106928225', '', 0, '', '03011955', 2, '', 00000024, 'PechaycoAlita', '4fe954611544fdcdf904d0986dd7dd6d7e6ccdc4', 0, 0, 'Alita Pechayco', '', 1, 'f36a6ce4', '11132017', 'GCC', 0, 1),
(00000091, 'Noble', 'April Joy', 'Gabito', '', 'Ilauod', '', 'Bugasong', 'Antique', '9263849703', '', 0, '', '04011955', 2, '', 00000024, 'NobleApril', '60d44c9c6590ef487639cb5e482e1bea18aab638', 0, 0, 'April Joy Noble', '', 1, '4477ade0', '11132017', 'GCC', 0, 1),
(00000092, 'Tanong', 'Noelle', 'Lozano', '', 'Pob. Ilauod, Panit-an', 'Capiz', 'Roxas City', 'Capiz', '9989828292', 'rayworld0028@gmail.com', 0, '', '99999999', 0, '', 00000024, 'TanongNoelle', 'ddb4374240b7f68969a06c7b0ed0548f7ec06452', 0, 0, 'Noelle Tanong', '5566003181', 2, '9d51eeed', '11132017', 'GCC', 0, 1),
(00000093, 'Sumayod', 'Tessa', 'Palisoc', NULL, '624 Langka St., La Unica Hija 3 Phase III', 'Brgy. Cupang', 'Antipolo City', 'Rizal', '9272585870', '', 0, '', '09281900', 2, NULL, 00000071, 'SumayodTessa', '5c688d903d6a3f8e30caa3d99693be12d7e1cbe1', 0, 0, 'Tessa Sumayod', '', 1, '2a4c2fe9', '11112017', 'GCC', 0, 1),
(00000094, 'Fuertes', 'Marissa', 'Mamangon', NULL, '58 M.H. del Pilar St.', 'Sto. Tomas', 'Pasig City', 'Metro Manila', '9950134200', '', 0, '', '08231987', 2, NULL, 00000071, 'FuertesMarissa', '0017bbea27768de2337c3a1d2bfa96a7925f4b86', 0, 0, 'Marissa Fuertes', '', 1, '2f1c68f7', '11112017', 'GCC', 0, 1),
(00000095, 'Raymundo', 'Lorgelyn', 'Agan', NULL, '58 M.H. del Pilar St.', 'Sto. Tomas', 'Pasig City', 'Metro Manila', '9212488716', '', 0, '', '12031986', 2, NULL, 00000071, 'RaymundoLorgelyn', 'ba09b258a45a4106670f95b8cde9699282059099', 0, 0, 'Lorgelyn Raymundo', '', 1, '9801a9f3', '11112017', 'GCC', 0, 1),
(00000096, 'Tantiado', 'Jocelyn', 'Ariap', NULL, '2019 Ilang-Ilang St.', 'Batasan Hills', 'Quezon City', 'Metro Manila', '9064695138', '', 0, '', '08171973', 2, NULL, 00000071, 'TantiadoJocelyn', 'f08bab6c8ef1eb28b387f9f710fe1135008c74d1', 0, 0, 'Jocelyn Tantiado', '', 2, '4127eafe', '11112017', 'GCC', 0, 1),
(00000097, 'Obispo', 'Carlo', 'Ramos', NULL, '0455 Lanuza Comp.', 'Tagpos', 'Binangonan', 'Rizal', '9058450531', '', 0, '', '11191966', 1, NULL, 00000067, 'ObispoCarlo', 'c0687a1654ddffeb41968293e7aa0fbe6b74409c', 0, 0, 'Carlo Obispo', '', 1, 'f63a2bfa', '11112017', 'GCC', 0, 1),
(00000098, 'Pagjunasan', 'Marichris', 'Obispo', NULL, '0463 Lanuza Comp.', 'Tagpos', 'Binangonan', 'Rizal', '9483542849', '', 0, '', '07211990', 2, NULL, 00000097, 'PagjunasanMarichris', '89f52f6baa1d9965b77368c9393daa21f998f421', 0, 0, 'Marichris Pagjunasan', '', 1, '4b8764c2', '11112017', 'GCC', 0, 1),
(00000099, 'Bedia', 'Ma. Luz', 'Apolinario', '', 'Gustilo St.', 'Lapaz', 'Iloilo City', 'Iloilo', '9489708876', '', 0, '', '09041982', 2, '', 00000024, 'BediaMaLuz', '09d9c1980404f2c0e8b4d6c2fbef1724d3c9158c', 0, 0, 'Ma. Luz Bedia', '', 2, 'fc9aa5c6', '11132017', 'GCC', 0, 1),
(00000100, 'Legayada', 'Mary Ann', 'Basa', '', '', 'Brgy. Quiling', 'Iloilo City', 'Iloilo', '9266992695', '', 0, '', '99999999', 2, '', 00000024, 'LegayadaMaryAnn', '8a010f05f684c3e87f7d0bb1511461498e34773b', 0, 0, 'Mary Ann Legayada', '', 2, 'fa44e5bd', '11132017', 'GCC', 0, 1),
(00000101, 'Muralla', 'Maria Flor', 'Gabona', '', 'Zone 4', 'Brgy. Concepcion', 'Iloilo City', 'Iloilo', '9391561808', '', 0, '', '09121965', 2, '', 00000080, 'MurallaMariaFlor', 'e98d37b74bd948247805cb3319f974dfb21b1c35', 0, 0, 'Maria Flor Muralla', '', 1, '4d5924b9', '11222017', 'GCC', 0, 1),
(00000102, 'Penuela', 'Fedgen', 'Astorga', '', 'Family Country Hotel, Mateo Road', 'Lagao', 'Gen. Santos City', 'South Cotabato', '9231442980', '', 0, '', '01201975', 0, '', 00000080, 'PenuelaFedgen', '6aeb57f09ebd7421a958d172d3af2ef1a87b34ea', 0, 0, 'Fedgen Penuela', '2159120344', 2, '947f67b4', '11222017', 'GCC', 0, 1),
(00000103, 'Lagahit', 'Efren', '', NULL, '281 Wall 2 Villa Esperanza', 'Molino 2', 'Bacoor City', 'Cavite', '9294247989', '', 0, '', '99999999', 1, NULL, 00000111, 'LagahitEfren', 'd62ead5e80395de003fb6041f58e4f41c5d2f8cf', 0, 0, 'Efren Lagahit', '', 1, '2362a6b0', '11142017', 'GCC', 0, 1),
(00000104, 'Cuales', 'Marites', 'Tamonan', NULL, 'Kawayan', 'San Fernando', 'Valencia City', 'Bukidnon', '9289443759', '', 0, '', '09261976', 2, NULL, 00000103, 'CualesMarites', '38a2d4b6dc497124c715a24abc68212561026cbf', 0, 0, 'Marites Cuales', '', 3, '2632e1ae', '11142017', 'GCC', 0, 1),
(00000105, 'Malinao', 'Rona', 'Espadon', NULL, '', 'Talavera', 'Cabanatuan City', 'Nueva Ecija', '9061213136', '', 0, '', '03091981', 2, NULL, 00000103, 'MalinaoRona', '60087682b969911c8a2a3611e4ce54ef0d8670e3', 0, 0, 'Rona Malinao', '', 3, '912f20aa', '11142017', 'GCC', 0, 1),
(00000106, 'Caalaman', 'Rajah', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 0, NULL, 00000063, 'CaalamanRajah', 'bcf307af9d01aaa3757ad78d61c6770f4c02c8a9', 0, 0, 'Rajah Caalaman', '', 1, '480963a7', '11142017', 'GCC', 0, 1),
(00000107, 'Abunales', 'Jennylyn', '', NULL, '', '', 'San Mateo', 'Rizal', '', '', 0, '', '99999999', 2, NULL, 00000063, 'AbunalesJennylyn', 'a67533fc8544e08e54aa43bd967816ad400908ce', 0, 0, 'Jennylyn Abunales', '', 1, 'ff14a2a3', '11142017', 'GCC', 0, 1),
(00000108, 'Campaner', 'Merian', 'Calvelo', NULL, 'Purok 3', 'Brgy. Camohaguin', 'Gumaca', 'Quezon', '9122199083', '', 0, '', '01041988', 0, NULL, 00000107, 'CampanerMerian', '5f248b0593ac50513069406d1b67e17350647bef', 0, 0, 'Merian Campaner', '', 1, '42a9ed9b', '11142017', 'GCC', 0, 1),
(00000109, 'Custodio', 'Robelyn', 'Flores', NULL, 'Mangga St.', 'Buntong Palay 2, Silangan', 'San Mateo', 'Rizal', '9753682169', 'robiegianan27@gmail.com', 0, '', '07271989', 2, NULL, 00000067, 'CustodioRobelyn', '02fc82b055e80a9fdc97b4661f64893fe67cb226', 0, 0, 'Robelyn Custodio', '', 1, 'f5b42c9f', '11142017', 'GCC', 0, 1),
(00000110, 'Lagahit', 'Gina', '', NULL, '', '', '', 'Negros', '', '', 0, '', '99999999', 2, NULL, 00000103, 'LagahitGina', '04b5d1c2cfa96fb17ecd2d1eb742a0205d20e994', 0, 0, 'Gina Lagahit', '', 2, '2685fc6f', '11142017', 'GCC', 0, 1),
(00000111, 'Cantoria', 'Jimson', 'Leonor', NULL, '39 Villonco St.', 'Sucat', 'Paranaque City', 'Metro Manila', '9187475378', '', 0, '', '12151974', 1, NULL, 00000063, 'CantoriaJimson', '71460cec7c87b58e546e1ca6377ac1e3e1aa91d7', 0, 0, 'Jimson Cantoria', '', 2, '91983d6b', '11142017', 'GCC', 0, 1),
(00000112, 'Casino', 'Jenna', 'Cereno', NULL, '612 Evangelista St.', 'Quiapo', 'Manila City', 'Metro Manila', '9394773984', '', 0, '', '05021983', 2, NULL, 00000072, 'CasinoJenna', '15f7f249b191850d59f8a839f3501a9e142b0119', 0, 0, 'Jenna Casino', '', 3, '48be7e66', '11142017', 'GCC', 0, 1),
(00000113, 'Decio', 'Maristel', 'Delfin', '', 'Block 6 Lot 20 Florvel Homes', 'Oton', 'Iloilo City', 'Iloilo', '9393854348', 'maristel_stars@yahoo.com', 0, '', '11161980', 2, '', 00000092, 'DecioMaristel', '2f328b0663274f86d5005e3503e3cdfbd39495ae', 0, 0, 'Maristel Decio', '9309182305', 2, 'ffa3bf62', '11172017', 'GCC', 0, 1),
(00000114, 'Grande', 'Vivian', 'Aenlle', '', 'c/o 7th Floor HRMO', '', 'Iloilo City', 'Iloilo', '9561300086', '', 0, '', '01231958', 2, '', 00000024, 'GrandeVivian', 'ce4eef6847146e2df7e6915675cf1b083f6f66e8', 0, 0, 'Vivian Grande', '', 2, 'faf3f87c', '11172017', 'GCC', 0, 1),
(00000115, 'Valencia', 'Wilma', 'Garcia', '', 'Dungon B', 'Jaro', 'Iloilo City', 'Iloilo', '9101302403', '', 0, '', '02151965', 2, '', 00000024, 'ValenciaWilma', '32a94914255165029c2ac81bda43b3ff42a674f1', 0, 0, 'Wilma Valencia', '', 1, '4dee3978', '11172017', 'GCC', 0, 1),
(00000116, 'Gallenero', 'Reylyn', 'Garbosa', '', '', 'Veterans Village', 'Iloilo City', 'Iloilo', '9951560752', '', 0, '', '06201991', 0, '', 00000024, 'GalleneroReylyn', '95b45d6f7a2a08f1214383862213785884ff8d9c', 0, 0, 'Reylyn Gallenero', '', 1, '94c87a75', '11172017', 'GCC', 0, 1),
(00000117, 'Cacho', 'Nona', 'Banaban', '', 'Lopez Jaena St.', 'Jaro', 'Iloilo City', 'Iloilo', '9168670238', '', 0, '', '12091987', 2, '', 00000024, 'CachoNona', 'c5e7fc28a7506cfc10aca3ea18f07f6f72b90b01', 0, 0, 'Nona Cacho', '', 1, '23d5bb71', '11172017', 'GCC', 0, 1),
(00000118, 'Zapanta', 'Emma', 'Galindez', '', '7 dela Rama St.', '', 'Iloilo City', 'Iloilo', '9083204885', '', 0, '', '06041952', 2, '', 00000080, 'ZapantaEmma', 'e2608ff2ee47b2d042335138f9c1332bbe7b99d0', 0, 0, 'Emma Zapanta', '1349435027', 3, '9e68f449', '11222017', 'GCC', 0, 1),
(00000119, 'Villaniza', 'Rosemarie', 'Sonio', '', 'Dela Rama St.', 'Brgy. Legaspi', 'Iloilo City', 'Iloilo', '9107630242', '', 0, '', '08191969', 2, '', 00000080, 'VillanizaRosemarie', 'e7f4c79f620651e69bc754d02e5a1e4b15ba6c92', 0, 0, 'Rosemarie Villaniza', '', 2, '2975354d', '11222017', 'GCC', 0, 1),
(00000120, 'Sanchez', 'Lorelie', 'C.', NULL, 'Phase 8A Pck 14 Block 4 Lot 69', 'Bagong Silang', 'Caloocan City', 'Metro Manila', '9555123267', 'johannlovi@gmail.com', 0, '', '09211992', 2, NULL, 00000012, 'SanchezLorelie', '4d64aed5fb8e75ce886fbea301c6122e6007c369', 0, 0, 'Lorelie Sanchez', '', 2, 'f5da171d', '11182017', 'GCC', 0, 1),
(00000121, 'Estrella', 'Cherry', 'H.', NULL, 'Block 21 Lot 22 Phase 2 Dela Costa III', 'Brgy. Graceville', 'San Jose del Monte', 'Bulacan', '9163907691', 'estrellacherry531@gmail.com', 0, '', '05311970', 2, NULL, 00000012, 'EstrellaCherry', 'b4c741c091712ef5646b71b97f31788737b709da', 0, 0, 'Cherry Estrella', '', 1, '42c7d619', '11182017', 'GCC', 0, 1),
(00000122, 'Villaruel', 'Mariz', 'Lopez', NULL, 'Sitio Manggahan', 'San Carlos', 'Binangonan', 'Rizal', '9056392958', '', 0, '', '08221995', 2, NULL, 00000097, 'VillaruelMariz', '368f9297dc86388c83ac50981623d557082b5c0b', 0, 0, 'Mariz Villaruel', '', 1, '9be19514', '11192017', 'GCC', 0, 1),
(00000123, 'Villaruel', 'Francis', 'Lopez', NULL, 'Sitio Manggahan', 'San Carlos', 'Binangonan', 'Rizal', '9565942730', '', 0, '', '09181999', 1, NULL, 00000122, 'VillaruelFrancis', '5b67ad66e27d433ff56e3ccff302d98554981448', 0, 0, 'Francis Villaruel', '', 1, '2cfc5410', '11192017', 'GCC', 0, 1),
(00000124, 'Pacheco', 'Cristopher', '', NULL, '13 Gonzalo Magsalin St.', 'Brgy. Calzada', 'Taguig City', 'Metro Manila', '9776449326', '', 0, '', '06081982', 1, NULL, 00000071, 'PachecoCristopher', '16f47efb31e47e41a44ee97de0298af471a8f90f', 0, 0, 'Cristopher Pacheco', '', 1, '29ac130e', '11192017', 'GCC', 0, 1),
(00000125, 'Sasa', 'Norman Jay', 'Cortez', NULL, '91 Carmen St.', 'Brgy. San Carlos', 'Binangonan', 'Rizal', '9482071034', '', 0, '', '12161983', 1, NULL, 00000097, 'SasaNorman', 'f66a65a7fc71904b42908528c2da12994256f7a7', 0, 0, 'Norman Jay Sasa', '', 1, '9eb1d20a', '11192017', 'GCC', 0, 1),
(00000126, 'Cheng', 'Perlita', 'Mendoza', NULL, '7H Narra Tower, Peninsula Garden Midtown Homes, Quirino Avenue', 'Paco', 'Manila City', 'Metro Manila', '9177935638', 'perlitacheng@yahoo.com', 0, '', '11271961', 1, NULL, 00000002, 'ChengPerlita', '2e15fb26ecc38b67fa6c65639fc9a3b6ec186323', 0, 0, 'Perlita Cheng', '396829831', 3, '47979107', '11202017', 'GCC', 0, 1),
(00000127, 'Fabroa', 'Norielyn', 'Fernandez', '', '', 'Brgy. Anilao', 'Pavia', 'Iloilo', '9102221755', 'lyn_fabroa@yahoo.com', 0, '', '11081978', 2, '', 00000024, 'FabroaNorielyn', 'de9b5aaaca44c2a367053aea69c57d03886526a4', 0, 0, 'Norielyn Fabroa', '', 2, 'f08a5003', '11222017', 'GCC', 0, 1),
(00000128, 'Ynion', 'Mariz', 'Quintar', '', '', 'Brgy. Balabag', 'Pavia', 'Iloilo', '9461946514', '', 0, '', '02221993', 2, '', 00000024, 'YnionMariz', '3b6cbaacdca466278752f71e9063d7e4049c8e08', 0, 0, 'Mariz Ynion', '', 2, '4d371f3b', '11222017', 'GCC', 0, 1),
(00000129, 'Arenga', 'Sueden', 'Arguelles', '', '', 'Badiangan', 'Iloilo City', 'Iloilo', '9076728881', '', 0, '', '99999999', 0, '', 00000024, 'ArengaSueden', 'c0e8135720c2ce5f2dcd46b2cff12508dac11b4d', 0, 0, 'Sueden Arenga', '', 2, 'fa2ade3f', '11222017', 'GCC', 0, 1),
(00000130, 'Bergante', 'An Hycinth', 'Contreras', '', '', '', 'Pavia', 'Iloilo', '9301058175', '', 0, '', '10191993', 2, '', 00000024, 'BerganteAnHycinth', '258c4a0c751d2acb358fb091baf4e8a386c18de8', 0, 0, 'An Hycinth Bergante', '', 2, '291b0ecf', '11222017', 'GCC', 0, 1),
(00000131, 'Baclaan', 'Roselle Ellen Joy', 'Galvez', '', 'Block 21 Lot 10 Villa Carolina Yulo Drive', 'Arevalo', 'Iloilo City', 'Iloilo', '9990000000', '', 0, '', '07281996', 2, '', 00000024, 'BaclaanRoselle', '9f6409048517ab7cb362bdead691dad27c4c0287', 0, 0, 'Roselle Ellen Joy Baclaan', '', 2, '9e06cfcb', '11222017', 'GCC', 0, 1),
(00000132, 'Nermal', 'Ramicy', 'Talagtag', '', 'Al Rigga Deira', '', '', 'Dubai, U.A.E.', '972000000000', '', 0, '', '01271986', 2, '', 00000063, 'NermalRamicy', 'dbe3ab1b82b88b7b39c5c42f13142f737a2e4ec2', 0, 0, 'Ramicy Nermal', '', 3, '47208cc6', '12142017', 'GCC', 0, 1),
(00000133, 'Pabalate', 'Liezel', '', NULL, '', '', 'Talisay City', 'Negros Occidental', '9368171284', '', 0, '', '99999999', 2, NULL, 00000058, 'PabalateLiezel', 'c2e38680b13574d4407b997bcc1b70d368485005', 0, 0, 'Liezel Pabalate', '', 1, 'f03d4dc2', '11212017', 'GCC', 0, 1),
(00000134, 'Balangat', 'Rossana', 'Tamayo', NULL, 'Canas', '', 'Barotac Nuevo', 'IloIlo', '9064650767', '', 0, '', '05271986', 2, NULL, 00000131, 'BalangatRossana', '030f6610ed572a1a2f9a8597646655e694f8787e', 0, 0, 'Rossana Balangat', '', 2, 'f56d0adc', '11222017', 'GCC', 0, 1),
(00000135, 'Sia Reyes', 'Gemma', 'Sy', NULL, '43-C G. Roxas St.', 'Brgy. Manresa', 'Quezon City', 'Metro Manila', '9228985151', 'beasiareyes@gmail.com', 0, '', '05301965', 2, NULL, 00000002, 'SiaReyesGemma', '99bb6213335a7e3535b878899614f204e5685eed', 0, 0, 'Gemma Sia Reyes', '', 3, '4270cbd8', '11222017', 'GCC', 0, 1),
(00000136, 'Ng', 'Victor', '', NULL, 'Room 403 #556 Pilarica St.', 'Sta. Cruz', 'Manila City', 'Metro Manila', '9178980415', 'vsng0417@yahoo.com', 0, '', '04151957', 1, NULL, 00000002, 'NgVictor', 'c8d99aef09cb40d2881d8fda55a689e8d8db4daf', 0, 0, 'Victor Ng', '', 1, '9b5688d5', '11232017', 'GCC', 0, 1),
(00000137, 'Castillo', 'Carmelita', '', NULL, 'Marcos Hiway', 'Brgy. Inarawan', 'Antipolo City', 'Rizal', '9195346371', 'carmencastillo43@yahoo.com', 0, '', '03051957', 2, NULL, 00000002, 'CastilloCarmelita', '9da0c3efcabdeed0ecd93d41b6c1a67782a9df6a', 0, 0, 'Carmelita Castillo', '', 1, '2c4b49d1', '11242017', 'GCC', 0, 1),
(00000138, 'Pacleb', 'Joesana', 'Nino', NULL, '2-7 Calumpang', 'Molo', 'Iloilo City', 'Iloilo', '9205536023', '', 0, '', '99999999', 2, NULL, 00000131, 'PaclebJoesana', '08fbc53337a99da35d637358b9417fe96fa30b09', 0, 0, 'Joesana Pacleb', '', 2, '91f606e9', '11252017', 'GCC', 0, 1),
(00000139, 'Annaguey', 'Philip', 'M.', NULL, '', 'Atabay', 'Salcedo', 'Ilocos Sur', '9752198202', '', 0, '', '10071966', 1, NULL, 00000059, 'AnnagueyPhilip', '860da147c1357e615bb1507dd5a98a70c0ff75d4', 0, 0, 'Philip Annaguey', '', 1, '26ebc7ed', '11272017', 'GCC', 0, 1),
(00000140, 'Parilla', 'Marlon', 'C.', NULL, '', 'Dinaratan', 'Salcedo', 'Ilocos Sur', '9058012554', 'marlonparilla@yahoo.com', 0, '', '11091978', 1, NULL, 00000060, 'ParillaMarlon', '8322bd522c4ecb963f9a050f2e36d76f82701946', 0, 0, 'Marlon Parilla', '', 1, '5365c1f8', '11272017', 'GCC', 0, 1),
(00000141, 'Tafalla', 'Ariel', 'Galve', NULL, 'San Antonio', 'Nueva Valincia G.', 'Iloilo', 'Guimaras', '9103142296', '', 0, '', '03311980', 1, NULL, 00000131, 'TafallaAriel', '5aa8312d34038f3a1a76ed19e8330b2adfeda532', 0, 0, 'Ariel Tafalla', '', 2, 'e47800fc', '11272017', 'GCC', 0, 1),
(00000142, 'Tan', 'Henry Sr.', 'O.', NULL, '', 'Brgy. Dinaratan', 'Salcedo', 'Ilocos Sur', '9777593834', 'henrycora71@gmail.com', 0, '', '01221950', 1, NULL, 00000059, 'TanHenrySr', 'cb1b776baf11e6e38b9a28848b1e707f55e5e013', 0, 0, 'Henry Sr. Tan', '', 1, '3d5e43f1', '11272017', 'GCC', 0, 1),
(00000143, 'Tubiano', 'Rosemarie', 'Robles', NULL, 'Zone 9 Calumpang', 'Molo', 'Iloilo City', 'Iloilo', '9189123211', '', 0, '', '05021960', 2, NULL, 00000080, 'TubianoRosemarie', 'e4b597de865f3cea99b242eb24a5c3039adc004e', 0, 0, 'Rosemarie Tubiano', '9239987815', 2, '8a4382f5', '11272017', 'GCC', 0, 1),
(00000144, 'Alipda', 'Abraham', 'Alipog', NULL, '', 'Culiong', 'Salcedo', 'Ilocos Sur', '9292315901', '', 0, '', '12231964', 1, NULL, 00000059, 'AlipdaAbraham', '75778a1e95e3ef151aeb5729ec872f902b5c360e', 0, 0, 'Abraham Alipda', '', 1, '8f13c5eb', '11272017', 'GCC', 0, 1),
(00000145, 'Gapati', 'Marnel', 'R.', NULL, '', 'Atabay', 'Salcedo', 'Ilocos Sur', '9365821817', '', 0, '', '08161999', 1, NULL, 00000059, 'GapatiMarnel', '909b8a5769ae1a9147301aeebe780a28f6fffb84', 0, 0, 'Marnel Gapati', '', 1, '380e04ef', '11272017', 'GCC', 0, 1),
(00000146, 'Labasan', 'Elmer', 'B.', NULL, '', 'Dinaratan', 'Salcedo', 'Ilocos Sur', '9093117264', '', 0, '', '12311990', 2, NULL, 00000059, 'LabasanElmer', 'ec94a28eea59524d81fdba1fe6533f5973663769', 0, 0, 'Elmer Labasan', '', 1, 'e12847e2', '11272017', 'GCC', 0, 1),
(00000147, 'Bengbeng', 'Joel', 'Q.', NULL, '', 'Pob. Norte', 'Salcedo', 'Ilocos Sur', '', 'joel_saintluke@yahoo.com', 0, '', '02031980', 1, NULL, 00000059, 'BengbengJoel', '24a9a1e2e4387a9e00d626e438ab8aa944b2bbd4', 0, 0, 'Joel Bengbeng', '', 1, '563586e6', '11272017', 'GCC', 0, 1),
(00000148, 'Ortinez', 'Admer Jr.', '', '', '', 'Maligcong', 'Salcedo', 'Ilocos Sur', '9303322711', 'ortinezadmer@yahoo.com', 0, '', '04111989', 1, '', 00000059, 'OrtinezAdmerJr', '3a0c391927bb835d138ef03409b5b61abbefc325', 0, 0, 'Admer Ortinez Jr.', '', 1, 'eb88c9de', '11272017', 'GCC', 0, 1),
(00000149, 'Avela', 'Oliver \"Mark\"', 'Mamugay', NULL, 'Dumag', 'Dapnan', 'Baganga', 'Davao Oriental', '9977030367', '', 0, '', '04091980', 1, NULL, 00000058, 'AvelaMark', '805d2582cd4cb3f476e79383d5ed69002b4f6195', 0, 0, 'Oliver \"Mark\" Avela', '', 3, '5c9508da', '11282017', 'GCC', 0, 1),
(00000150, 'Agasan', 'Nelida', 'Cabinbin', '', 'Zone 6', 'Veterans Village', 'Iloilo City', 'Iloilo', '9075843836', '', 0, '', '10261951', 2, '', 00000080, 'AgasanNelida', 'aac685d9102eb9b2ef395c79eb1ba608e888efd1', 0, 0, 'Nelida Agasan', '', 1, '8fa4d82a', '12062017', 'GCC', 0, 1),
(00000151, 'Pelaez', 'Froilan', '', NULL, 'Block 89 Lot 9 Matahimik St.', 'Pangarap Village', 'Caloocan City', 'Metro Manila', '9165564750', '', 0, '', '11081974', 1, NULL, 00000012, 'PelaezFroilan', 'e7032cedc70e469fbb9fa82a50fd47e2acb5a5f0', 0, 0, 'Froilan Pelaez', '', 1, '38b9192e', '11302017', 'GCC', 0, 1),
(00000152, 'Dela Rosa', 'Myra Joy', '', NULL, '257 Block 8 Pili Ave.', 'West Rembo', 'Makati City', 'Metro Manila', '9124832518', '', 0, '', '01231991', 2, NULL, 00000094, 'DelaRosaMyraJoy', 'cb5b1b859c66caaada1f520f9b218d7e9c4a59db', 0, 0, 'Myra Joy Dela Rosa', '', 1, 'e19f5a23', '11302017', 'GCC', 0, 1),
(00000153, 'Carvajal', 'Mary Rose', 'Rueda', NULL, '506 San Juan', 'Darangan', 'Binangonan', 'Rizal', '9304849710', '', 0, '', '07031981', 2, NULL, 00000067, 'CarvajalMaryRose', 'fa5f31b16460d065c86dd153cd12f26b8b375e76', 0, 0, 'Mary Rose Carvajal', '', 1, '56829b27', '11302017', 'GCC', 0, 1),
(00000154, 'Beltran', 'Honeylet', 'Delos Santos', NULL, '0104 Sitio Wawa', 'Tagpos', 'Binangonan', 'Rizal', '9216018464', '', 0, '', '08031985', 2, NULL, 00000155, 'BeltranHoneylet', '121a9d069c5874c5364869e92a8e76088367ac0f', 0, 0, 'Honeylet Beltran', '', 1, '53d2dc39', '11302017', 'GCC', 0, 1),
(00000155, 'Obispo', 'Rochelle', 'Bernardo', NULL, '0455 Lanuza Comp.', 'Tagpos', 'Binangonan', 'Rizal', '9951220607', '', 0, '', '11021987', 2, NULL, 00000097, 'ObispoRochelle', '4e1868d4d98976f593c86f58b5a8a0184dc9a41a', 0, 0, 'Rochelle Obispo', '', 1, 'e4cf1d3d', '11302017', 'GCC', 0, 1),
(00000156, 'Hilaga', 'Maricar', 'Macaraeg', NULL, '15 Tindalo St., Zone 1', 'Signal Village', 'Taguig City', 'Metro Manila', '9501030375', '', 0, '', '08231991', 2, NULL, 00000094, 'HilagaMaricar', 'ef5b028e1998ef74704e4cbe9aab9a504d6ef6f7', 0, 0, 'Maricar Hilaga', '', 1, '3de95e30', '11302017', 'GCC', 0, 1),
(00000157, 'Frades', 'Alaiza', 'Camar', NULL, 'Block 206 Lot 2 Acacia St.', 'Pembo', 'Makati City', 'Metro Manila', '9360358057', '', 0, '', '09111993', 2, NULL, 00000094, 'FradesAlaiza', 'dfc07789b370d04885a9f1e2a5e1bad32b803240', 0, 0, 'Alaiza Frades', '', 1, '8af49f34', '11302017', 'GCC', 0, 1),
(00000158, 'Alano', 'Denmark', 'Juta', NULL, '85A Bravo St., Zone 2 Central', 'Signal Village', 'Taguig City', 'Metro Manila', '9356697502', '', 0, '', '01131992', 1, NULL, 00000094, 'AlanoDenmark', 'd985f0965ef1db9c624fb2efb7aad82ec4ca4e09', 0, 0, 'Denmark Alano', '', 1, '3749d00c', '11302017', 'GCC', 0, 1),
(00000159, 'Atila', 'Darlene', 'Aqui', NULL, 'Block 52 Lot 1 Bayabas St.', 'Brgy. Rizal', 'Makati City', 'Metro Manila', '9075655917', '', 0, '', '02141989', 2, NULL, 00000094, 'AtilaDarlene', '7dab6a202d4ee60f25c59be64614e14914417bc6', 0, 0, 'Darlene Atila', '', 1, '80541108', '11302017', 'GCC', 0, 1),
(00000160, 'Dela Pena', 'Angela', 'Sumido', NULL, '', 'Purok I', 'Pavia', 'Iloilo', '9090376768', '', 0, '', '99999999', 2, NULL, 00000024, 'DelaPenaAngela', '02f2ef8ea6f69c992ebcd08c5b44e737f5f75bd1', 0, 0, 'Angela Dela Pena', '', 1, '5cfb3358', '11302017', 'GCC', 0, 1),
(00000161, 'Panganiban', 'Neza', 'Amante', NULL, 'Moreno Street', 'Tuburan Pob.', 'Concepcion', 'Iloilo', '9986105212', '', 0, '', '05161988', 0, NULL, 00000134, 'PanganibanNeza', 'f44caf62d9d32c0dfbceef1874f735d0a3cf3185', 0, 0, 'Neza Panganiban', '', 1, 'ebe6f25c', '11302017', 'GCC', 0, 1),
(00000162, 'Hogar', 'Lilibeth', 'Tumulak', '', '', 'Brgy. Muelle Loney', 'Iloilo City', 'Iloilo', '9071567641', '', 0, '', '04261968', 2, '', 00000080, 'HogarLilibeth', 'e55a8b839b8dcd72b985aa61e90147ee52b24255', 0, 0, 'Lilibeth Hogar', '', 1, '32c0b151', '12062017', 'GCC', 0, 1),
(00000163, 'Flaviano', 'Helen', 'Amante', NULL, '', 'Lanas', 'Barotac Nuevo', 'Iloilo', '9398932015', '', 0, '', '12091960', 2, NULL, 00000131, 'FlavianoHelen', 'e3299b6106bdfb350de748962d52c8dae076639a', 0, 0, 'Helen Flaviano', '', 2, '85dd7055', '12022017', 'JAO', 0, 1),
(00000164, 'Tamayo', 'Nelia', 'Amante', NULL, '', 'Lanas', 'Barotac Nuevo', 'Iloilo', '9185425793', '', 0, '', '04201966', 2, NULL, 00000134, 'TamayoNelia', '43cf7535c16534d1ff324f2beadae353203ef1af', 0, 0, 'Nelia Tamayo', '', 1, '808d374b', '12022017', 'JAO', 0, 1),
(00000165, 'Alperto', 'Erma', 'Palomar', NULL, '', 'Apologista', 'Sara', 'Iloilo', '9067065264', '', 0, '', '01291978', 2, NULL, 00000024, 'AlpertoErma', 'aaccf6038fef1c63b36597aa09d577e87250b1f3', 0, 0, 'Erma Alperto', '', 1, '3790f64f', '12032017', 'JAO', 0, 1),
(00000166, 'Laserna', 'Enuela', 'Mesiderio', NULL, '', 'Simsiman', 'Calinog', 'Iloilo', '9126084141', '', 0, '', '03081948', 0, NULL, 00000131, 'LasernaEnuela', '0d41be9544fc53b4ac772aca8124bfb789a35091', 0, 0, 'Enuela Laserna', '', 2, 'eeb6b542', '12042017', 'JAO', 0, 1),
(00000167, 'Lim', 'Benita', 'Yu', NULL, '8 Union Civica', '', 'Quezon City', 'Metro Manila', '9162203608', '', 0, '', '05011939', 2, NULL, 00000168, 'LimBenita', '73b50590ba3ef163c89e5c0aec44d10fec27995d', 0, 0, 'Benita Lim', '', 3, '59ab7446', '12042017', 'JAO', 0, 1),
(00000168, 'Co', 'Bonita', 'Wu', NULL, '21 Circle Drive', 'Cubic Homes, Merville', 'Paranaque City', 'Metro Manila', '9472903770', '', 0, '', '11071950', 2, NULL, 00000002, 'CoBonita', 'e4a6c391663a17656387c279cb184fad0937e82a', 0, 0, 'Bonita Co', '', 3, 'e4163b7e', '12042017', 'JAO', 0, 1),
(00000169, 'Arela', 'Ofelia \"Coco\"', 'S.', NULL, '', '', 'Imus', 'Cavite', '9157090865', '', 0, '', '10121968', 2, NULL, 00000002, 'ArelaCoco', '46cde527cbfd7bfca242e746a5a04b8a32f16c4b', 0, 0, 'Ofelia Arela', '', 2, '530bfa7a', '12052017', 'JAO', 0, 1),
(00000170, 'Fadrigo', 'Nolyn', 'Sayco', NULL, '', 'Sto. Nino Sur, Arevalo', 'Iloilo City', 'Iloilo', '9177285850', '', 0, '', '03031977', 2, NULL, 00000080, 'FadrigoNolyn', '7015a5f172dada95bcef87712386db2e2b7bd686', 0, 0, 'Nolyn Fadrigo', '', 2, '803a2a8a', '12062017', 'JAO', 0, 1),
(00000171, 'Niaga', 'Jenelen \"Samia\"', 'T.', NULL, '', 'Calajunan, Mandurriao', 'Iloilo City', 'Iloilo', '9179035699', '', 0, '', '11281980', 2, NULL, 00000024, 'NiagaSamia', '5e9adc1063cb36f4d0347e946758ea8960497588', 0, 0, 'Jenelen Niaga', '', 1, '3727eb8e', '12062017', 'JAO', 0, 1),
(00000172, 'Gutierrez', 'Violeta', 'Alconada', NULL, '', 'Brgy. Ungka 2', 'Pavia', 'Iloilo', '9185398543', '', 0, '', '99999999', 2, NULL, 00000024, 'GutierrezVioleta', '3438e3b8462197c60b26930fd7c06b0565230fac', 0, 0, 'Violeta Gutierrez', '', 1, 'ee01a883', '12072017', 'JAO', 0, 1);
INSERT INTO `distributors1` (`dsdid`, `dslnam`, `dsfnam`, `dsmnam`, `dsmother`, `dsstreet`, `dsbrgy`, `dscity`, `dsprov`, `dscontact`, `dsemail`, `dsemail_confirm`, `dsfb`, `dsbirth`, `dssex`, `dstin`, `dssid`, `un`, `pw`, `payout`, `pay_type`, `pay_name`, `pay_acct`, `dsmtype`, `discount`, `dsencoded`, `dsencodedby`, `withheld`, `dsstatus`) VALUES
(00000173, 'Laguidao', 'Ramon', 'Mercader', NULL, 'Block19 Lot5B Everlasting St.', 'Modesta Village', 'San Mateo', 'Rizal', '9214607292', 'ramonlaguidao@gmail.com', 0, '', '02121953', 1, NULL, 00000174, 'LaguidaoRamon', 'a67169ff5fe2df7b7092311057d347e46653f1f2', 0, 0, 'Ramon Laguidao', '', 1, '591c6987', '12072017', 'JAO', 0, 1),
(00000174, 'Castillo', 'Miko Carlo', 'C.', NULL, 'Marcos Hiway', 'Brgy. Inarawan', 'Antipolo City', 'Rizal', '9195346371', '', 0, '', '99999999', 1, NULL, 00000137, 'CastilloMiko', 'b16eadcc89835ebc33dc36e2c29e8ec4143304c2', 0, 0, 'Miko Carlo Castillo', '', 1, '5c4c2e99', '12072017', 'JAO', 0, 1),
(00000175, 'Torres', 'Leonisa', 'Grate', NULL, '', 'Sinapsapan', 'Jordan', 'Guimaras', '9307994465', '', 0, '', '02041963', 2, NULL, 00000131, 'TorresLeonisa', 'f51c1ebbaaab49190e50304289980031ad3bf7df', 0, 0, 'Leonisa Torres', '', 2, 'eb51ef9d', '12092017', 'JAO', 0, 1),
(00000176, 'Tan', 'Naty', 'Uy', NULL, 'Unit C-5 Angela Gardens Executive Homes, 20 Macopa St.', '', 'Quezon City', 'Metro Manila', '9189051960', 'nats1225@yahoo.com', 0, '', '12251960', 2, NULL, 00000002, 'TanNaty', 'ba17b9faaf078849860de6aa3186a9a775d008fa', 0, 0, 'Naty Tan', '', 1, '3277ac90', '12092017', 'JAO', 0, 1),
(00000177, 'Avila', 'Glorigene', '', NULL, 'Block 2 Alley 46 Lakas Tao', 'San Andres', 'Cainta', 'Rizal', '9366213116', '', 0, '', '99999999', 2, NULL, 00000149, 'AvilaGlorigene', '4f24765c41b33615dc76c858a89e079f4d44c7f0', 0, 0, 'Glorigene Avila', '', 2, '856a6d94', '12102017', 'JAO', 0, 1),
(00000178, 'Samonte', 'Zyrill Jean', '', NULL, 'Block 11 Lot 15 Villa Christina Subdivision', 'Brgy. Cagbang', 'Oton', 'Iloilo', '9105672062', '', 0, '', '99999999', 2, NULL, 00000105, 'SamonteZyrill', '9d3b04c1d1b725a641b8d11ec62a23bfd367b6ca', 0, 0, 'Zyrill Jean Samonte', '', 1, '38d722ac', '12102017', 'JAO', 0, 1),
(00000179, 'Samonte', 'Ailyn', '', NULL, 'Block 11 Lot 15 Villa Christina Subdivision', 'Brgy. Cagbang', 'Oton', 'Iloilo', '', '', 0, '', '99999999', 2, NULL, 00000105, 'SamonteAilyn', 'fb662eeecbb7133d71b7940ab9b3f4f1ce573047', 0, 0, 'Ailyn Samonte', '', 1, '8fcae3a8', '12102017', 'JAO', 0, 1),
(00000180, 'Chua', 'Soledad', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000006, 'ChuaSoledad', 'b01a4ed8b45ce807f90417d1ad48bdb68f31bb8a', 0, 0, 'Soledad Chua', '', 3, 'a807ad37', '12112017', 'JAO', 0, 1),
(00000181, 'Mirasol', 'Glenn', 'D.', '', 'Q. Abeto St.', 'Mandurriao', 'Iloilo City', 'Iloilo', '9499988697', '', 0, '', '05131973', 1, '', 00000080, 'MirasolGlenn', '6549060ae9278ec329cbe0e86b31f9950dcbdcfc', 0, 0, 'Glenn Mirasol', '1319234701', 3, '1f1a6c33', '05062018', 'JAO', 0, 1),
(00000182, 'Leysa', 'Wilfredo', 'Catedrilla', NULL, '', 'Brgy. Agsirab', 'Lambunao', 'Iloilo', '9102911452', '', 0, '', '07101994', 1, NULL, 00000181, 'LeysaWilfredo', '7e19043693ed69e31524d48402a96b4783a7052c', 0, 0, 'Wilfredo Leysa', '', 1, 'c63c2f3e', '12112017', 'JAO', 0, 1),
(00000183, 'Menor', 'Ruby Ann', '', NULL, 'Compound 13 Door 14 Mauban St.', 'Brgy. Manresa', 'Quezon City', 'Metro Manila', '9425220628', 'ann-free9180@yahoo.com', 0, '', '09011980', 2, NULL, 00000012, 'MenorRuby', 'e849f56424e5ffc8dce45335bc16bbaaa96471cb', 0, 0, 'Ruby Ann Menor', '', 1, '7121ee3a', '12112017', 'JAO', 0, 1),
(00000184, 'Dangani', 'Jonelyn', 'David', NULL, '', 'Brgy. Agsalanan', 'Dingle', 'Iloilo', '9995110175', '', 0, '', '04161985', 2, NULL, 00000024, 'DanganiJonelyn', '95cd36dd8b20e53ff1a2d842a1f22cc3468f23cd', 0, 0, 'Jonelyn Dangani', '', 1, '7471a924', '12142017', 'JAO', 0, 1),
(00000185, 'Daanton', 'Diana', 'Daet', NULL, '', 'Brgy. Agsalanan', 'Dingle', 'Iloilo', '9084818657', '', 0, '', '08201964', 2, NULL, 00000024, 'DaantonDiana', 'a9d9e917f0b6c546a09464a9f2441d7d2fe3de1c', 0, 0, 'Diana Daanton', '', 2, 'c36c6820', '12142017', 'JAO', 0, 1),
(00000186, 'Dairo', 'Cynthia', 'Cepe', NULL, '', 'Namatay', 'Dingle', 'Iloilo', '907089499', '', 0, '', '04241963', 2, NULL, 00000024, 'DairoCynthia', '8ce3de8b16e99cdb80a447bdda80477159e652e8', 0, 0, 'Cynthia Dairo', '', 2, '1a4a2b2d', '12142017', 'JAO', 0, 1),
(00000187, 'Gaw', 'Wilson', 'Miras', NULL, 'Block 2 Lot 10 Cairo St.', 'Nile Village, Sto. Nino', 'Marikina City', 'Metro Manila', '9209544013', 'durawoodconst@gmail.com', 0, '', '03111958', 1, NULL, 00000064, 'GawWilson', 'cc8d3a4567f67f73606ea3c15bb30b8021a67afa', 0, 0, 'Wilson Gaw', '', 3, 'ad57ea29', '12162017', 'JAO', 0, 1),
(00000188, 'Fuertes', 'Ricardo', 'S.', NULL, '58 M.H. del Pilar St.', 'Sto. Tomas', 'Pasig City', 'Metro Manila', '9750575499', '', 0, '', '09271986', 1, NULL, 00000094, 'FuertesRicardo', '6301534d63682e98d4d26151024d85a269ace52f', 0, 0, 'Ricardo Fuertes', '', 1, '10eaa511', '12172017', 'JAO', 0, 1),
(00000189, 'Siapco', 'Miriam', 'Repe', NULL, '1199 Villa Caruncho Sandoval Ave.', 'San Miguel', 'Pasig City', 'Metro Manila', '9193488361', 'iamsiapco@gmail.com', 0, '', '09011986', 2, NULL, 00000188, 'SiapcoMiriam', '0e9b8825d90b8338eb0b245c7103d7c886dc34eb', 0, 0, 'Miriam Siapco', '', 1, 'a7f76415', '12172017', 'JAO', 0, 1),
(00000190, 'Ebuenga', 'Joan', 'Lagata', NULL, 'Block 18 Lot 18 11th Ave.', 'Brgy. North Signal Village', 'Taguig City', 'Metro Manila', '9776042890', 'joan.ebuenga@yahoo.com', 0, '', '05201987', 2, NULL, 00000188, 'EbuengaJoan', '85dfaebfb987ff5db325f941a98bc3367018b946', 0, 0, 'Joan Ebuenga', '', 1, '74c6b4e5', '12172017', 'JAO', 0, 1),
(00000191, 'Inocencio', 'Lyndon John', '', NULL, '341 8th St. GHQ Village', 'Brgy. Katuparan', 'Taguig City', 'Metro Manila', '9330866613', 'lyndon_inocencio@yahoo.com', 0, '', '11301997', 1, NULL, 00000188, 'InocencioLyndon', '788746e11e52422c84b1381c20074e1bfcfe054b', 0, 0, 'Lyndon John Inocencio', '', 1, 'c3db75e1', '12172017', 'JAO', 0, 1),
(00000192, 'Adajar', 'Leanilda', 'De las Alas', NULL, '237 D. Apitong St.', 'Comembo', 'Makati City', 'Metro Manila', '9302011089', 'leanildaadajar@rocketmail.com', 0, '', '03171981', 2, NULL, 00000159, 'AdajarLeanilda', 'b410bc1cbe08fac041f7a39fe0fd9758b893066a', 0, 0, 'Leanilda Adajar', '', 1, '1afd36ec', '12172017', 'JAO', 0, 1),
(00000193, 'Juaneza', 'Dhannie Lyn', 'Sol', NULL, '0456 Lanuza Compound', 'Tagpos', 'Binangonan', 'Rizal', '9307627951', '', 0, '', '03091987', 2, NULL, 00000071, 'JuanezaDhannieLyn', 'f4686c048208dddc40eabd779b0f49cfb2d9c0f1', 0, 0, 'Dhannie Lyn Juaneza', '', 1, 'ade0f7e8', '12172017', 'JAO', 0, 1),
(00000194, 'Marcelo', 'Ghina Marie Joy', '', NULL, 'Block 6 Lot 182 Sunflower St.', 'Pembo', 'Makati City', 'Metro Manila', '9089513624', 'cam.ghi2319@yahoo.com', 0, '', '12191989', 2, NULL, 00000188, 'MarceloGhina', '324b3469fe5650902d5f75167371d46570bfc44e', 0, 0, 'Ghina Marie Joy Marcelo', '', 1, 'a8b0b0f6', '12172017', 'JAO', 0, 1),
(00000195, 'Medina', 'Wilfredo', 'Acorin', NULL, '', 'Baclayan', 'New Lucena', 'Iloilo', '9108450735', '', 0, '', '99999999', 1, NULL, 00000024, 'MedinaWilfredo', 'cae9efc8e6df0989f9a65d092a388e70bc8b5eda', 0, 0, 'Wilfredo Medina', '', 1, '1fad71f2', '12172017', 'JAO', 0, 1),
(00000196, 'Camangon', 'Rosario', 'Cantara', NULL, 'Calle St.', '', 'Leon', 'Iloilo', '9064539727', '', 0, '', '10131978', 2, NULL, 00000024, 'CamangonRosario', '85e9f86e6a678c482b71a7cf4df5967f707dd539', 0, 0, 'Rosario Camangon', '', 1, 'c68b32ff', '12182017', 'JAO', 0, 1),
(00000197, 'Bagas', 'Jean', 'Antipuesto', NULL, 'Lopez Jaena St.', 'Jaro', 'Iloilo City', 'Iloilo', '9774027062', '', 0, '', '11111987', 2, NULL, 00000131, 'BagasJean', '2e0c064842f63ec4f91b7f1c73a5eb90da9cadb3', 0, 0, 'Jean Bagas', '', 2, '7196f3fb', '12182017', 'JAO', 0, 1),
(00000198, 'Lepp', 'Emily', 'Lara', NULL, 'Block 9 Lot 7 Taurus St.', 'VML Subd., North Fundidor', 'Iloilo City', 'Iloilo', '9985414316', '', 0, '', '02071962', 2, NULL, 00000131, 'LeppEmily', '762b1ace38f94ed4dac8591def0b4cae1f988a1e', 0, 0, 'Emily Lepp', '', 2, 'cc2bbcc3', '12202017', 'JAO', 0, 1),
(00000199, 'Champlon', 'Mila', 'Tipoc', NULL, 'Block 24 Lot 17 Villa Carolina Yulo Drive', 'Arevalo', 'Iloilo City', 'Iloilo', '335013711', '', 0, '', '09251947', 2, NULL, 00000131, 'ChamplonMila', '9f71eb4511c67c834c8c06f55218237deb735356', 0, 0, 'Mila Champlon', '', 1, '7b367dc7', '12202017', 'JAO', 0, 1),
(00000200, 'Bersamina', 'Ryan', '', NULL, '', '', 'Quezon City', 'Metro Manila', '9062140245', 'rgbersamina@gmail.com', 0, '', '11261992', 1, NULL, 00000001, 'BersaminaRyan', '472f71709797016880f8337d0c840e172df2d804', 0, 0, 'Ryan Bersamina', '', 1, '73b18cbf', '12202017', 'JAO', 0, 1),
(00000201, 'Turaben', 'Cheryl', 'Platigue', NULL, 'Tacas', 'Jaro', 'Iloilo City', 'Iloilo', '9306445239', '', 0, '', '09161971', 2, NULL, 00000024, 'TurabenCheryl', 'b3e8268268b243e4988d73f60d50ef7e8faed5e6', 0, 0, 'Cheryl Turaben', '', 1, 'c4ac4dbb', '12212017', 'JAO', 0, 1),
(00000202, 'Mayo', 'Noralia', 'Unos', NULL, '', 'Jaro', 'Iloilo City', 'Iloilo', '9364673459', '', 0, '', '07251974', 2, NULL, 00000024, 'MayoNoralia', 'a90a50f88db06e75b8fdf1ee01e20a464dfd30a6', 0, 0, 'Noralia Mayo', '', 2, '1d8a0eb6', '12212017', 'JAO', 0, 1),
(00000203, 'Tadeo', 'Joy', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000180, 'TadeoJoy', '7db232e11b5d75a99aa91f59c320232257bdcad9', 0, 0, 'Joy Tadeo', '', 3, 'aa97cfb2', '12222017', 'GCC', 0, 1),
(00000204, 'Zerrudo', 'Leonisa', 'Janolino', NULL, 'Block 19 Lot 42 Phase 2 Deca Homes', 'Pandac', 'Pavia', 'Iloilo', '9159131794', '', 0, '', '10141954', 2, NULL, 00000031, 'ZerrudoLeonisa', '1cc284c09698264289d11046ec0e12c5f6f3e403', 0, 0, 'Leonisa Zerrudo', '', 1, 'afc788ac', '12242017', 'JAO', 0, 1),
(00000205, 'Mesiderio', 'Jonah Ray', 'Palmes', NULL, 'Baluarte', 'Molo', 'Iloilo City', 'Iloilo', '9201383489', '', 0, '', '10301981', 0, NULL, 00000024, 'MesiderioJonah', '6e83cad1289ad30623f229d46a535b5de1ec7047', 0, 0, 'Jonah Ray Mesiderio', '', 2, '18da49a8', '12252017', 'JAO', 0, 1),
(00000206, 'Moleno', 'Lanie', 'Zerrudo', NULL, '', 'Balabag', 'Pavia', 'Iloilo', '9157408037', '', 0, '', '99999999', 2, NULL, 00000031, 'MolenoLanie', '7f7aee07ac00eaedd430f2f1be9737bf29fbaaaf', 0, 0, 'Lanie Moleno', '1479182023', 2, 'c1fc0aa5', '12262017', 'JAO', 0, 1),
(00000207, 'Santillan', 'Florencia', 'Galache', NULL, 'Taft St.', '', 'Sta. Barbara', 'Iloilo', '9507513365', '', 0, '', '10271970', 2, NULL, 00000080, 'SantillanFlorencia', 'd8cf21ff050ee97fc9053f303ce901f147a4919c', 0, 0, 'Florencia Santillan', '', 2, '76e1cba1', '12262017', 'JAO', 0, 1),
(00000208, 'Quidulit', 'Janelyn', 'C.', NULL, 'Block 50 Lot 02 Bayabas St.', 'Brgy. Rizal', 'Makati City', 'Metro Manila', '', '', 0, '', '10171988', 2, NULL, 00000159, 'QuidulitJanelyn', '0074769d3b1cc0ca155d8810db369b03fd1a6f9c', 0, 0, 'Janelyn Quidulit', '', 1, 'cb5c8499', '12292017', 'JAO', 0, 1),
(00000209, 'Bulante', 'Lovely', 'Daroy', NULL, 'Block 52 Lot 1 Bayabas St.', 'Brgy. Rizal', 'Makati City', 'Metro Manila', '9083138271', '', 0, '', '04281998', 2, NULL, 00000159, 'BulanteLovely', 'f99cbd2814c1f5b35dc4b68c44d2762ce0ef75de', 0, 0, 'Lovely Bulante', '', 1, '7c41459d', '12292017', 'JAO', 0, 1),
(00000210, 'Balbon', 'Redenthor', 'Pombo', NULL, '240 V. Custodio St.', 'Brgy. Santulan', 'Malabon City', 'Metro Manila', '9971404690', '', 0, '', '10231993', 1, NULL, 00000071, 'BalbonRedenthor', '6b8558fa33e5ba3bf9b677ea38d99782897c14fc', 0, 0, 'Redenthor Balbon', '', 1, 'af70956d', '12292017', 'JAO', 0, 1),
(00000211, 'Ruiz', 'Jennelyn', 'B.', NULL, 'Block 42 Lot 49 San Lorenzo Ruiz', 'Brgy. San Juan', 'Taytay', 'Rizal', '9158362641', '', 0, '', '06061991', 2, NULL, 00000071, 'RuizJennelyn', 'bb17d405fb4c571a40d64ccfb733f9b97381734a', 0, 0, 'Jennelyn Ruiz', '', 1, '186d5469', '12292017', 'JAO', 0, 1),
(00000212, 'Bernardo', 'Irma', 'Pimentel', NULL, 'Block 78 Lot 8 Bautista ', 'Sampaloc 4', 'Dasmarinas ', 'Cavite', '9778197438', '', 0, '', '06141967', 2, NULL, 00000155, 'BernardoIrma', 'f603383bda5a76c25d070901ab0a29e661d27129', 0, 0, 'Irma Bernardo', '', 1, 'c14b1764', '12292017', 'JAO', 0, 1),
(00000213, 'Abuyan', 'Jelanica', 'Joaquin', NULL, '0457 Lanuza Compound', 'Tagpos', 'Binangonan', 'Rizal', '9066540229', '', 0, '', '09031991', 2, NULL, 00000122, 'AbuyanJelanica', '0bb1ed0e3e715b79c7317e7fec562e999b186503', 0, 0, 'Jelanica Abuyan', '', 1, '7656d660', '12292017', 'JAO', 0, 1),
(00000214, 'Paguntalan', 'Marites', 'Zerrudo', NULL, 'Paloc', 'Sool', 'Dumangas', 'Iloilo', '9175140355', 'maritespaguntalan@gmail.com', 0, '', '07281979', 2, NULL, 00000031, 'PaguntalanMarites', '6326bd1e4bb5fbd9ce8c6a411c39d1b87c88beef', 0, 0, 'Marites Paguntalan', '', 2, '7306917e', '12302017', 'GCC', 0, 1),
(00000215, 'Carado', 'Cerfelina', 'Robles', '', '177 Veterans Village', '', 'Iloilo City', 'Iloilo', '9468339445', '', 0, '', '09211951', 2, '', 00000118, 'CaradoCerfelina', '1f1f956bb7df6c70caadc140bf32a4570485c08a', 0, 0, 'Cerfelina Carado', '', 1, 'c41b507a', '01102018', 'GCC', 0, 1),
(00000216, 'Perez', 'Rhea Lyn', 'Montenegro', NULL, 'Phase 2 Block 19 Lot 47 DECA Homes', '', 'Pavia', 'Iloilo', '9127273630', '', 0, '', '09021995', 2, NULL, 00000031, 'PerezRheaLyn', '999470c51ea567decce7a4f81a0d567673b6b596', 0, 0, 'Rhea Lyn Perez', '', 1, '1d3d1377', '01072018', 'GCC', 0, 1),
(00000217, 'Tan', 'Lilian', 'Yu', NULL, '429 Pina Ave.', 'Sta. Mesa', 'Manila City', 'Metro Manila', '9228721946', 'tanlilian012165@gmail.com', 0, '', '01211965', 2, NULL, 00000002, 'TanLilian', '904775199d3b9e4a0969f043001e08ae8a929305', 0, 0, 'Lilian Tan', '8023006651', 3, 'aa20d273', '01082018', 'JAO', 0, 1),
(00000218, 'Mesiderio', 'Carlito', 'Sta. Romana', '', 'Evangelista St.', 'Purok l', 'Pavia', 'Iloilo', '9338790926', 'nasmesiderio@gmail.com', 0, '', '06151956', 1, '', 00000024, 'MesiderioCarlito', 'ea8c3a6034c53510263202674d4201e044141821', 0, 0, 'Carlito Mesiderio', '', 2, '179d9d4b', '01102018', 'GCC', 0, 1),
(00000219, 'Villa', 'Emer', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'VillaEmer', '8a306e02c69bc63e256b285daffe1e11fedccbcd', 0, 0, 'Emer Villa', '', 1, 'a0805c4f', '01102018', 'JAO', 0, 1),
(00000220, 'Lopez', 'Rodelyn', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'LopezRodelyn', '24eb1dcdbd5d83ed8c1bc7709872addd2595794a', 0, 0, 'Rodelyn Lopez', '', 1, '7c2f7e1f', '01102018', 'JAO', 0, 1),
(00000221, 'Fernandez', 'Grace', 'Mucho', NULL, '', 'Tabucan', 'Barotac Nuevo', 'Iloilo', '9297018144', '', 0, '', '04041971', 2, NULL, 00000118, 'FernandezGrace', 'f074c97621f0c77c7643c7484c150c599a92db3b', 0, 0, 'Grace Fernandez', '', 2, 'cb32bf1b', '01112018', 'GCC', 0, 1),
(00000222, 'Calimutan', 'Maria Elena', 'Halaman', NULL, '31 Gen. Hughes St.', '', 'Iloilo City', 'Iloilo', '9509127736', '', 0, '', '09291955', 2, NULL, 00000150, 'CalimutanMariaElena', '2f520f5be5fa61b633c56864f99ab82bd28c7473', 0, 0, 'Maria Elena Calimutan', '', 2, '1214fc16', '01112018', 'GCC', 0, 1),
(00000223, 'Antone', 'Dina', 'Herbuela', NULL, '', '', 'Estancia', 'Iloilo', '9304786041', '', 0, '', '09271965', 2, NULL, 00000031, 'AntoneDina', 'add6203091a82e84d70ffcf5a681391f96ab04ac', 0, 0, 'Dina Antone', '', 1, 'a5093d12', '01132018', 'GCC', 0, 1),
(00000224, 'Lomugdang', 'Joeann', 'Aguirre', NULL, '', '', 'Estancia', 'Iloilo', '9567345664', '', 0, '', '01281976', 2, NULL, 00000031, 'LomugdangJoeann', '4eeba1948fefa1ff21d9dee62d5e6ab446a61d5e', 0, 0, 'Joeann Lomugdang', '', 1, 'a0597a0c', '01132018', 'GCC', 0, 1),
(00000225, 'Clarito', 'Haydie', 'Sunio', NULL, '', '', 'Sta. Barbara', 'Iloilo', '9094387076', '', 0, '', '03101972', 2, NULL, 00000218, 'ClaritoHaydie', '7dd2eaf1919b06160e423915c0669b3a2c93f735', 0, 0, 'Haydie Clarito', '', 1, '1744bb08', '01152018', 'GCC', 0, 1),
(00000226, 'Alinsubao', 'Helen', 'Andea', NULL, 'Alibango St.', '', 'Alimodian', 'Iloilo', '9094925217', 'hellenalinsubao@yahoo.com', 0, '', '03251992', 2, NULL, 00000031, 'AlinsubaoHelen', '4f893fba6c201334f7a31ef4b2d8b8ca6d851233', 0, 0, 'Helen Alinsubao', '', 1, 'ce62f805', '01152018', 'GCC', 0, 1),
(00000227, 'Golveo', 'Myrel', 'Duhina', '', 'llaya 1st', '', 'Dumangas', 'Iloilo', '9303297738', '', 0, '', '01021985', 2, '', 00000218, 'GolveoMyrel', '95fef51b36524077d7b26ef5b8a28dfcb8e03967', 0, 0, 'Myrel Golveo', '', 1, '797f3901', '01172018', 'GCC', 0, 1),
(00000228, 'Catedrilla', 'Roda', 'Labordo', NULL, '', 'Panuran', 'Lambunao', 'Iloilo', '9093210022', '', 0, '', '02121973', 2, NULL, 00000182, 'CatedrillaRoda', '13e366ce92827bf3cc993f0700a8a75947032d79', 0, 0, 'Roda Catedrilla', '', 2, 'c4c27639', '01172018', 'GCC', 0, 1),
(00000229, 'Baldesimo', 'Nelita', 'Guellergen', '', '146 Gen Hughes St.', '', 'Iloilo City', 'Iloilo', '', '', 0, '', '08061946', 2, '', 00000118, 'BaldesimoNelita', '5353b1abf882a25e09269676e71190c3b20a695b', 0, 0, 'Nelita Baldesimo', '', 2, '73dfb73d', '01222018', 'GCC', 0, 1),
(00000230, 'Cantara', 'Raymund', 'Mijares', NULL, 'Blk17 LT4', 'Austery Subd.', 'Manduarriao', 'Iloilo', '9129389208', 'RayCantara@yahoo.com', 0, '', '11051980', 1, NULL, 00000162, 'CantaraRaymund', '466f66193cbc248f1cb1e77f028ae1d5eb8b8221', 0, 0, 'Raymund Cantara', '', 1, 'a0ee67cd', '01222018', 'GCC', 0, 1),
(00000231, 'Belchez', 'Gina', 'G.', NULL, '729 Block 45 Lot 12 Phase 1', 'Bagong Nayon II', 'Antipolo City', 'Rizal', '9234944835', 'gina.belchez@gmail.com', 0, '', '07181982', 2, NULL, 00000105, 'BelchezGina', '81d7aaf9b60c13e730c6cd76e051440a3e124c39', 0, 0, 'Gina Belchez', '', 1, '17f3a6c9', '01222018', 'GCC', 0, 1),
(00000232, 'Endoso', 'Jeanna', 'Pahilga', NULL, '', 'Sagua ', 'Anini-y', 'Antique', '9353075590', 'jeannapendoso@yahoo.com', 0, '', '09091975', 2, NULL, 00000218, 'EndosoJeanna', 'aef3ef921f301966286e2f74e7e2ecb420569337', 0, 0, 'Jeanna Endoso', '', 2, 'ced5e5c4', '01232018', 'GCC', 0, 1),
(00000233, 'Focbit', 'Junary', 'Obligar', NULL, 'Block 22', 'Addition Hills', 'Mandaluyong City', 'Metro Manila', '9104270421', 'junabam2x@gmail.com', 0, '', '01011991', 1, NULL, 00000002, 'FocbitJunary', '32a2ef47d959cda9aeac764ddc9ff04df9b805ca', 0, 0, 'Junary Focbit', '3889144784', 3, '79c824c0', '01232018', 'GCC', 0, 1),
(00000234, 'Nidea', 'Katia', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000001, 'NideaKatia', '1a79277c7e2e868e504f2da25520c108575829e4', 0, 0, 'Katia Nidea', '', 3, '7c9863de', '01252018', 'JAO', 0, 1),
(00000235, 'Zerrudo', 'Carlos', '', NULL, '', 'Sta. Cruz San Miguel', '', 'Iloilo', '9064214229', '', 0, '', '09161955', 1, NULL, 00000204, 'ZerrudoCarlos', '7617a647dc2f46f5f445ae848036ccaf0caa2f3a', 0, 0, 'Carlos Zerrudo', '', 1, 'cb85a2da', '01262018', 'GCC', 0, 1),
(00000236, 'Olympia', 'Evangeline \"Jane\"', 'Comiso', NULL, '1645 Kundiman St.', 'Sampaloc', 'Manila City', 'Metro Manila', '9199570794', 'polarisangel09@gmail.com', 0, '', '09221961', 2, NULL, 00000002, 'OlympiaJane', '13459eb396067091f58f520d3ba072942be31a4b', 0, 0, 'Evangeline \"Jane\" Olympia', '', 3, '12a3e1d7', '01272018', 'JAO', 0, 1),
(00000237, 'Lorque', 'Stephanie', 'Jamoyot', NULL, '', 'Brgy. Pal-agon Pavia ', 'Iloilo City', 'Iloilo', '9396406173', '', 0, '', '09241985', 2, NULL, 00000218, 'LorqueStephanie', 'ecf114dd253fef7a2cba341a3e26ea794fc90c81', 0, 0, 'Stephanie Lorque', '', 1, 'a5be20d3', '01292018', 'GCC', 0, 1),
(00000238, 'MoleÃ±o', 'Magdalena', 'Enan', '', '', 'Lopez Jaena Norte', 'La Paz', 'Iloilo', '9105267235', '', 0, '', '04192018', 2, '', 00000206, 'MolenoMagdalena', '66cfd894e274f8ed13b549b5c25c4edc9171205d', 0, 0, 'Magdalena MoleÃ±o', '', 1, '18036feb', '01302018', 'GCC', 0, 1),
(00000239, 'Viernes', 'David', 'L.', NULL, '1716 Maria Clara St.', 'Sampaloc', 'Manila', 'Metro Manila', '9478710203', '', 0, '', '12291963', 1, NULL, 00000002, 'ViernesDavid', 'efb1ad1ffb884e98be524060a367bbef32fed636', 0, 0, 'David Viernes', '', 1, 'af1eaeef', '01312018', 'JAO', 0, 1),
(00000240, 'Casampol', 'Ma. Imelda', '', NULL, '', 'Upper Bicutan', 'Taguig City', 'Metro Manila', '9217915863', '', 0, '', '12031969', 2, NULL, 00000058, 'CasampolImelda', '8e2d0f052a3599a308c5756eae1088b1a29e82d0', 0, 0, 'Ma. Imelda Casampol', '', 3, 'da90a8fa', '02242018', 'JAO', 0, 1),
(00000241, 'See', 'Irene Carolina', 'K.', '', '1020 Reina Regente St.', 'Binondo', 'Manila', 'Metro Manila', '9165759300', 'irene_2062@yahoo.com', 0, '', '10011988', 2, '', 00000002, 'SeeIrene', '6e1dcc6f90ec72ea1e962d198c630007014921fc', 0, 0, 'Irene Carolina See', '', 1, '6d8d69fe', '02052018', 'JAO', 0, 1),
(00000242, 'Masangya', 'Janet', 'Zamora', NULL, '', 'Brgy. Monica Blumentritt St. ', 'Iloilo City', 'Iloilo', '9308555379', '', 0, '', '06091988', 2, NULL, 00000118, 'MasangyaJanet', '20e08555d0d494389b6e943d974eefe2aee5b775', 0, 0, 'Janet Masangya', '', 1, 'b4ab2af3', '02052018', 'GCC', 0, 1),
(00000243, 'Dela Cruz', 'Jocelyn', 'Drilon', NULL, '33 N Zamora St.', '', ' Iloilo City', 'Iloilo', '9187890601', '', 0, '', '12041962', 2, NULL, 00000118, 'DelaCruzJocelyn', '1e1e8f8408e70c68dac5e5d719dd8a8c2062e754', 0, 0, 'Jocelyn Dela Cruz', '', 1, '03b6ebf7', '02052018', 'GCC', 0, 1),
(00000244, 'Macaranas', 'Lella', 'Espada', NULL, 'Lessandra Subd.', 'Hibao-an', 'Pavia', 'Iloilo', '9078889760', '', 0, '', '03051989', 2, NULL, 00000080, 'MacaranasLella', '5ea07249a431f4f6570efc722c4dd4a0e07212a9', 0, 0, 'Lella Macaranas', '', 2, '06e6ace9', '02052018', 'GCC', 0, 1),
(00000245, 'Quebradero', 'Hermania', 'Pasigay', NULL, '', 'Brgy.Nueva Union', 'Passi City', 'Iloilo', '9083204885', '', 0, '', '09201950', 2, NULL, 00000118, 'QuebraderoHermania', 'f57203353abffb863922e265eca62b4f1057b499', 0, 0, 'Hermania Quebradero', '', 1, 'b1fb6ded', '02052018', 'GCC', 0, 1),
(00000246, 'Solitario', 'Sheila Mae', 'Panes', NULL, '153-H', ' Legaspi Dela Rama', 'Iloilo City', 'Iloilo', '9463865167', '', 0, '', '11111987', 2, NULL, 00000118, 'SolitarioSheila', 'c271b5cf96dfe8df80fa1c2a1e5344b9317acd42', 0, 0, 'Sheila Mae Solitario', '', 1, '68dd2ee0', '02052018', 'GCC', 0, 1),
(00000247, 'Al-wahaibi', 'Shahin', 'Zerrudo', NULL, 'Deca Homes', ' Pandac', 'Pavia', 'Iloilo', '9159131794', '', 0, '', '12072004', 2, NULL, 00000031, 'AlwahaibiShahin', '21fb409ef2d2b5ab1815172c7f154ac890b361e6', 0, 0, 'Shahin Al-wahaibi', '', 3, 'dfc0efe4', '02052018', 'GCC', 0, 1),
(00000248, 'MoleÃ±o', 'Alfredo Jr.', 'Magnetico', '', '', 'Lopez Jaena Norte', 'La Paz', 'Iloilo', '9369004622', '', 0, '', '02151986', 1, '', 00000206, 'MolenoAlfredoJr', 'fe85bfe3275c76e05796affb0e6d2528461b5c75', 0, 0, 'Alfredo MoleÃ±o Jr.', '', 1, '627da0dc', '02052018', 'GCC', 0, 1),
(00000249, 'Lerum', 'Aileen', '', NULL, '1063 Vicente Cruz St.', 'Sampaloc', 'Manila', 'Metro Manila', '9397535059', 'aileenlerum@yahoo.com', 0, '', '05111974', 2, NULL, 00000002, 'LerumAileen', 'a07ca2be623d4a24aff5a9188e762098b60a3fc1', 0, 0, 'Aileen Lerum', '', 1, 'd56061d8', '02082018', 'JAO', 0, 1),
(00000250, 'Igbante', 'Jocelyn', 'Nillos', NULL, 'c/o Kodak Phil. INC', '', 'Gaisano', 'Iloilo', '9985542818', '', 0, '', '12211966', 2, NULL, 00000118, 'IgbanteJocelyn', '45df425c82313cb38df3bfa3185323cb47283a86', 0, 0, 'Jocelyn Igbante', '1473048899', 2, '0651b128', '02092018', 'GCC', 0, 1),
(00000251, 'PeÃ±aredondo', 'Claudette', 'Zapanta', '', 'Villa Consulacion Subd.', 'Tabuc Suba Jaro', 'Iloilo City', 'Iloilo', '9958455189', '', 0, '', '01121986', 2, '', 00000118, 'PenaredondoClaudette', 'a80848aa8551aa04f1ad2d09ff5bfcf6793a228c', 0, 0, 'Claudette PeÃ±aredondo', '', 2, 'b14c702c', '02102018', 'GCC', 0, 1),
(00000252, 'Alfaras', 'Lisa', 'Gamuza', NULL, 'Ramos Ext.', 'Brgy. Purok 1', 'Pavia', 'Iloilo', '9469568065', '', 0, '', '01071964', 2, NULL, 00000218, 'AlfarasLisa', 'c86b4f4f86061e1d1e2e6de13f590385d1972a1f', 0, 0, 'Lisa Alfaras', '', 2, '686a3321', '02112018', 'GCC', 0, 1),
(00000253, 'Carvajal', 'Bernald', '', NULL, '36 ROTC Hunter', '', '', '', '9267065443', '', 0, '', '10221964', 1, NULL, 00000002, 'CarvajalBernald', '298ed19166d32ebd824cafe8a84c4e21d1cfc661', 0, 0, 'Bernald Carvajal', '', 1, 'df77f225', '02132018', 'JAO', 0, 1),
(00000254, 'Temporosa', 'Ana Marie', 'Trono', NULL, 'Allera St.', 'Tigbuan', 'Iloilo City', 'Iloilo', '9203279761', '', 0, '', '07261969', 2, NULL, 00000029, 'TemporosaAnaMarie', '56c84335ee1b9eed1eb7a22d268128b597099583', 0, 0, 'Ana Marie Temporosa', '', 2, 'da27b53b', '02142018', 'GCC', 0, 1),
(00000255, 'Balgos', 'Ma. Theresa', 'Buenafe', NULL, '162', 'Veterans Village', 'Iloilo City', 'Iloilo', '9214943732', '', 0, '', '01201967', 2, NULL, 00000150, 'BalgosMaTheresa', 'df39eb01224833b2a0fb4552081eff7efdce5701', 0, 0, 'Ma. Theresa Balgos', '', 2, '6d3a743f', '02162018', 'GCC', 0, 1),
(00000256, 'Felarca', 'Wallyn', 'Gubatanga', NULL, 'Blk. 8 Lot 9 Newsite Bitoon', 'Jaro', 'Iloilo City', 'Iloilo', '9958519550', '', 0, '', '10151995', 0, NULL, 00000061, 'FelarcaWallyn', 'e273f05a8e341fbfcb3ccc8b80f72a9a8e48ab92', 0, 0, 'Wallyn Felarca', '', 2, 'b41c3732', '02162018', 'GCC', 0, 1),
(00000257, 'Jayme', 'Jennyline', 'Pico', NULL, 'Blk. 8 Lot 3 Bito-on Newsite', 'Jaro', 'Iloilo City', 'Iloilo', '9778777151', '', 0, '', '04191986', 2, NULL, 00000061, 'JaymeJennyline', '043965ab8db9e301466979dcd259616b63669151', 0, 0, 'Jennyline Jayme', '', 2, '0301f636', '02162018', 'GCC', 0, 1),
(00000258, 'Diaz', 'Concepcion', 'B.', NULL, '121 Sta. Catalina St.', '', 'Quezon City', 'Metro Manila', '9393526911', 'diaz.alona@yahoo.com', 0, '', '12071960', 2, NULL, 00000006, 'DiazConcepcion', '82d2beb5a11ea1597d8ab9a69d71d0444f7d69b0', 0, 0, 'Concepcion Diaz', '', 1, 'bebcb90e', '02172018', 'JAO', 0, 1),
(00000259, '', 'Abmer', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000001, 'Abmer', 'f88a401a8f15fea5c27485fc6f54d532abd757b2', 0, 0, 'Abmer ', '', 2, '09a1780a', '08132017', 'GCC', 0, 1),
(00000260, 'Allones', 'Radino', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000001, 'AllonesRadino', '205495daf69a7c93e4f0d5bffbf969b4f58b859b', 0, 0, 'Radino Allones', '', 2, 'd50e5a5a', '08162017', 'GCC', 0, 1),
(00000261, 'Caldwell', 'Mark', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000001, 'CaldwellMark', 'c5fc7084eb8534c7707b40c4478cf640da15226d', 0, 0, 'Mark Caldwell', '', 2, '62139b5e', '09012017', 'GCC', 0, 1),
(00000262, 'Austria', 'Jeffrey', 'Domingo', '', 'Balikbayan Road', '', 'Tanay', 'Rizal', '09560619906', 'legendmammals1968@gmail.com', 0, '', '03311981', 1, '', 00000044, 'AustriaJeffrey', 'bcc5a84a8fd9d142dd70f6ac444bda42a4974d06', 0, 0, '', '', 2, 'bb35d853', '10242017', 'GCC', 0, 1),
(00000263, 'Masinsin', 'Mereniza', 'Casinsinan', '', 'Sitio Bulo-Bulo', 'Quisa', 'Pililla', 'Rizal', '09109709541', '', 0, '', '03241982', 0, '', 00000044, 'MasinsinMereniza', 'e6dc74ca3dc94997ee4a0b0ab5e42aa8329bdb6a', 0, 0, '', '', 2, '0c281957', '10242017', 'GCC', 0, 1),
(00000264, 'Catalan', 'Rhem Mae', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000016, 'CatalanRhemMae', 'd6abb3e99bc458e249b7787d5b4c0893169a4c71', 0, 0, 'Rhem Mae Catalan', '', 1, '09785e49', '12222017', 'GCC', 0, 1),
(00000265, 'Andajer', 'Lemar', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 0, NULL, 00000188, 'AndajerLemar', 'f51277c310d299c3770028896f050e5bd54fecc1', 0, 0, 'Lemar Andajer', '', 1, 'be659f4d', '12222017', 'GCC', 0, 1),
(00000266, 'Sumugad', 'Pia Mhirasol', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000013, 'SumugadPia', 'a947d992873a56ad9b2962e5d4dbae91e224be74', 0, 0, 'Pia Mhirasol Sumugad', '', 1, '6743dc40', '01052018', 'GCC', 0, 1),
(00000267, 'Torres', 'Jose Roy', '', NULL, '', 'Brgy. Mambugan', 'Antipolo City', 'Rizal', '9232757530', '', 0, '', '02041983', 1, NULL, 00000105, 'TorresJoseRoy', '4974f29d4a29a97a7f2b57c3dc4da490a5750bd5', 0, 0, 'Jose Roy Torres', '', 1, 'd05e1d44', '01222018', 'GCC', 0, 1),
(00000268, 'Alquisada', 'Patricia Mae', 'Esmolina', NULL, 'Oñate de Leon', 'Mandurriao', 'Iloilo City', 'Iloilo', '9491191827', '', 0, '', '11031983', 2, NULL, 00000171, 'AlquisadaPatricia', '1c57aa04907248f64f404c0e687ca19215124b1a', 0, 0, 'Patricia Mae Alquisada', '', 1, '6de3527c', '02202018', 'GCC', 0, 1),
(00000269, 'Hogar', 'Ramonito Jr.', 'Tumulak', '', '', 'Brgy. Muelle Loney', 'Iloilo City', 'Iloilo', '', '', 0, '', '08191990', 1, '', 00000162, 'HogarRamonitoJr', '3e6f2b7570d98d0d5e7ee03bf79fd362f541d536', 0, 0, 'Ramonito Hogar Jr.', '', 2, 'dafe9378', '02202018', 'GCC', 0, 1),
(00000270, 'Takashima', 'Erika', '', NULL, '2062 Leveriza St.', 'Malate', 'Manila City', 'Metro Manila', '9284357369', '', 0, '', '99999999', 2, NULL, 00000058, 'TakashimaErika', '380e3f49bd4f6394c5c271d27721ca1d449d7060', 0, 0, 'Erika Takashima', '', 1, '09cf4388', '02222018', 'GCC', 0, 1),
(00000271, 'Nermal', 'Myra', '', NULL, '', 'Brgy. Martinez', 'Tibiao', 'Antique', '9275081824', '', 0, '', '07021988', 2, NULL, 00000132, 'NermalMyra', '8b6a2f782a0e9bf099711151a079415447f73874', 0, 0, 'Myra Nermal', '', 1, 'bed2828c', '02222018', 'GCC', 0, 1),
(00000272, 'Mas', 'Rachelle', 'Cagara', NULL, '82 B Caab Apartelle E. Faustino St.', 'Punturin', 'Valenzuela City', 'Metro Manila', '', '', 0, '', '99999999', 2, NULL, 00000149, 'MasRachelle', 'ac2836c6fc968d16d61c20059afda3c40dff7e92', 0, 0, 'Rachelle Mas', '', 1, '67f4c181', '02222018', 'GCC', 0, 1),
(00000273, 'Orsolino', 'Cristito', 'T.', NULL, '#931 Sampaguita St.', 'Brgy. San Jose, Brgy. 187, Zone 16, Tala', 'Caloocan City', 'Metro Manila', '9976383206', '', 0, '', '09241968', 1, NULL, 00000002, 'OrsolinoCristito', 'c618e3f871200a795f004e332df940e2e40af27b', 0, 0, 'Cristito Orsolino', '', 1, 'd0e90085', '02222018', 'JAO', 0, 1),
(00000274, 'Malinao', 'Mary Christine Angela', '', NULL, '', '', '', 'Nueva Ecija', '9061213136', '', 0, '', '03292004', 2, NULL, 00000132, 'MalinaoAngela', 'd0139995b817762014a57e96006f77368332e110', 0, 0, 'Mary Christine Angela Malinao', '', 1, 'd5b9479b', '02222018', 'GCC', 0, 1),
(00000275, 'Balanuevo', 'Alma', '', NULL, 'Room 1001 Prestige Tower, Ongpin St.', 'Sta. Cruz', 'Manila City', 'Metro Manila', '9268791518', '', 0, '', '99999999', 2, NULL, 00000105, 'BalanuevoAlma', 'd29e3bb27198e48552cdca05848be07a21666864', 0, 0, 'Alma Balanuevo', '', 1, '62a4869f', '02222018', 'GCC', 0, 1),
(00000276, 'Caling', 'Alma Rose', '', NULL, '', 'Maranding', 'Lala', 'Lanao del Norte', '9366182923', '', 0, '', '06092005', 2, NULL, 00000275, 'CalingAlmaRose', 'de53e3101c879830b410141af71639cd840d995c', 0, 0, 'Alma Rose Caling', '', 1, 'bb82c592', '02222018', 'GCC', 0, 1),
(00000277, 'Balanuevo', 'Emma', '', NULL, '', '', '', 'Lanao del Norte', '9057959044', '', 0, '', '12211992', 2, NULL, 00000275, 'BalanuevoEmma', 'c88dbb927ecd94b282f04d712f2b6ab70364ea1b', 0, 0, 'Emma Balanuevo', '', 1, '0c9f0496', '02222018', 'GCC', 0, 1),
(00000278, 'Hernandez', 'Lizel', '', NULL, 'Lucky Homes Subdivision', 'Santo Cristo', 'Sariaya', 'Quezon', '9109923415', '', 0, '', '99999999', 2, NULL, 00000132, 'HernandezLizel', '0f926bbc77b033546394112fd0c6250beae35e24', 0, 0, 'Lizel Hernandez', '', 1, 'b1224bae', '02222018', 'GCC', 0, 1),
(00000279, 'Lavalle', 'Manuel Benilda', '', NULL, '110 A M.L.Quezon St.', 'Hagonoy', 'Taguig City', 'Metro Manila', '', '', 0, '', '06111961', 1, NULL, 00000132, 'LavalleManuel', '18957588300453be2c3922f8da1f42083fa8e98c', 0, 0, 'Manuel Benilda Lavalle', '', 1, '063f8aaa', '02222018', 'GCC', 0, 1),
(00000280, 'Valdez', 'Terry', 'Lopez', NULL, '11A 1st Avenue', 'Manggahan, Bagong Lipunan ng Crame', 'Quezon City', 'Metro Manila', '9771301077', '', 0, '', '06121979', 2, NULL, 00000132, 'ValdezTerry', 'f82e95458d5cf046fe51d10e1be525e22661157c', 0, 0, 'Terry Valdez', '', 1, '21f2c435', '02222018', 'GCC', 0, 1),
(00000281, 'Joson', 'John Jester', '', NULL, 'Area C Purok 12, Veoleta s St.', 'San Martin 4', 'San Jose del Monte', 'Bulacan', '9072306027', '', 0, '', '12301998', 1, NULL, 00000132, 'JosonJohnJester', '2aaed782d8dd515f8c500f46a330971245fe2fda', 0, 0, 'John Jester Joson', '', 1, '96ef0531', '02222018', 'GCC', 0, 1),
(00000282, 'Untalan', 'Sheryll', 'J.', NULL, 'T. Alonzo St.', '', 'Baguio City', 'Benguet', '9083423723', '', 0, '', '99999999', 2, NULL, 00000132, 'UntalanSheryll', '1baa5333eccdee7e18a78ab55a3e64874d4ea370', 0, 0, 'Sheryll Untalan', '', 1, '4fc9463c', '02222018', 'GCC', 0, 1),
(00000283, 'Gumban', 'Lovella', 'Bustamante', NULL, '', 'Trapiche', 'Oton', 'Iloilo', '9064366931', '', 0, '', '06091977', 2, NULL, 00000080, 'GumbanLovella', '587e7f694920904273b992afb563d1719dc05e70', 0, 0, 'Lovella Gumban', '', 2, 'f8d48738', '02252018', 'GCC', 0, 1),
(00000284, 'Evangelista', 'Richel', 'D.', NULL, '', 'Pob. 1', 'Bauan', 'Batangas', '9059247189', 'e_ishie@yahoo.com', 0, '', '05261986', 2, NULL, 00000058, 'EvangelistaRichel', '5129437ca4cc338d9072851f83cdeb1f4a514f46', 0, 0, 'Richel Evangelista', '', 2, 'fd84c026', '02252018', 'GCC', 0, 1),
(00000285, 'Opelinia', 'Juliet', '', '', 'Unit 810 Pinecrest Condominium, Aurora Blvd.', '', 'Quezon City', 'Metro Manila', '9053010682', 'jmopelinia@gmail.com', 0, '', '01241984', 2, '', 00000001, 'OpeliniaJuliet', 'f96453e8f26c1d4779dcafa422ca729617b59ee2', 0, 0, 'Juliet Opelinia', '', 0, '4a990122', '02272018', 'JAO', 0, 1),
(00000286, 'Nacario', 'Jocelyn', 'Arceno', NULL, '', 'VIP Village, Inayawan', 'Cebu City', 'Cebu', '9423702238', '', 0, '', '06021980', 2, NULL, 00000218, 'NacarioJocelyn', 'f5747d202b00f8807ccc8111f5b93d40fff4498e', 0, 0, 'Jocelyn Nacario', '', 1, '93bf422f', '02272018', 'GCC', 0, 1),
(00000287, 'Roga', 'Lorna', 'Porras', NULL, '', 'Brgy. Muelle Loney', 'Iloilo City', 'Iloilo', '9483236997', '', 0, '', '04191961', 2, NULL, 00000243, 'RogaLorna', '0f36f0286774bed002b43520f7251cd9b4b810ae', 0, 0, 'Lorna Roga', '', 1, '24a2832b', '02282018', 'GCC', 0, 1),
(00000288, 'Abraham', 'Margarette', 'O Dell', NULL, '', 'Lopez Jaena Norte', 'La Paz', 'Iloilo', '9308146210', '', 0, '', '07281969', 2, NULL, 00000243, 'AbrahamMargarette', '942289f3a5317604f9be82160854247eea96d0ed', 0, 0, 'Margarette Abraham', '', 1, '991fcc13', '02282018', 'GCC', 0, 1),
(00000289, 'Casampol', 'Justine Mae', '', NULL, '', 'Upper Bicutan', 'Taguig City', 'Metro Manila', '9217915863', '', 0, '', '06192003', 2, NULL, 00000240, 'CasampolJustineMae', '9c115328ecede58b0e8d9f6f0b59783b6a73e953', 0, 0, 'Justine Mae Casampol', '', 3, '2e020d17', '03012018', 'JAO', 0, 1),
(00000290, 'Galvez', 'Wedeliza', 'Adlawan', NULL, '2353 Larry', 'San Roque', 'Talisay City', 'Cebu', '9335046249', '', 0, '', '06121972', 2, NULL, 00000024, 'GalvezWedeliza', 'b2938020453fae7a05f12ca57f14228d35b31da6', 0, 0, 'Wedeliza Galvez', '', 2, 'fd33dde7', '03012018', 'GCC', 0, 1),
(00000291, 'Gonzales', 'Nenita', 'Dayday', NULL, '', 'Tuburan Sur', 'Danao City', 'Cebu', '9397491517', '', 0, '', '02141951', 2, NULL, 00000024, 'GonzalesNenita', 'cc889861710671f2390bead8cc255f8476c311f1', 0, 0, 'Nenita Gonzales', '', 2, '4a2e1ce3', '03022018', 'GCC', 0, 1),
(00000292, 'Derit', 'Nadeth', 'Baclaan', NULL, '', 'Magdugo', 'Toledo City', 'Cebu', '9278770915', '', 0, '', '12111983', 2, NULL, 00000131, 'DeritNadeth', '346c4414878f4ce2cb605b5ee5985314ae5a426b', 0, 0, 'Nadeth Derit', '', 2, '93085fee', '03032018', 'GCC', 0, 1),
(00000293, 'Tolentino', 'Evangeline', 'Perez', NULL, '244 Salinas Drive Extn.', 'Lahug', 'Cebu City', 'Cebu', '9323515660', '', 0, '', '04251965', 2, NULL, 00000024, 'TolentinoEvangeline', '601b51d3f55c6f3e46f20c7a9b06056bc8bbc573', 0, 0, 'Evangeline Tolentino', '', 2, '24159eea', '03062018', 'GCC', 0, 1),
(00000294, 'Villareal', 'Emilnor', 'Manuel', NULL, '15 Domingo St.', 'Cauarel 2 Subd., Project 6', 'Quezon City', 'Metro Manila', '9339520176', 'december_em@yahoo.com', 0, '', '12091972', 0, NULL, 00000001, 'VillarealEmilnor', '10629dcf0ffd36e5f241d5c1b07c0b3f7e84b20f', 0, 0, 'Emilnor Villareal', '', 3, '2145d9f4', '03062018', 'JAO', 0, 1),
(00000295, 'Tolentino', 'Dindo', 'Batoto', NULL, '244 Salinas Drive Extn.', 'Lahug', 'Cebu City', 'Cebu', '9335382357', '', 0, '', '12051965', 1, NULL, 00000293, 'TolentinoDindo', 'd4a009a39663e9066cf700293993667b32c8682e', 0, 0, 'Dindo Tolentino', '', 2, '965818f0', '03072018', 'GCC', 0, 1),
(00000296, 'Mata', 'Prescilla Liezl', 'Dihayco', NULL, '', 'P. Labuca Cansojong', 'Talisay City', 'Cebu', '9255026526', '', 0, '', '03231985', 2, NULL, 00000024, 'MataPrescilla', '520571c71c59cd27ab55d75af938f4795b470579', 0, 0, 'Prescilla Liezl Mata', '', 2, '4f7e5bfd', '03082018', 'GCC', 0, 1),
(00000297, 'Cambe', 'Joy', 'Salazar', NULL, '', 'Brgy. Concepcion II', 'Iloilo City', 'Iloilo', '9103467933', '', 0, '', '07311976', 2, NULL, 00000080, 'CambeJoy', 'edda99e3f8f2c7367e54399099d1f52aac63e826', 0, 0, 'Joy Cambe', '', 2, 'f8639af9', '03092018', 'GCC', 0, 1),
(00000298, 'Galvez', 'Jenny', 'Ganancial', NULL, '', 'Alaguisoc ', 'Jordan', ' Guimaras', '9555719521', '', 0, '', '01061983', 2, NULL, 00000225, 'GalvezJenny', '6a4df91d000a2a09f88d275239a8b147186d4cae', 0, 0, 'Jenny Galvez', '', 2, '45ded5c1', '03092018', 'GCC', 0, 1),
(00000299, 'Andrino', 'Ma. Lourdes', 'Porras', NULL, '', 'Don Fransisco Vill. Jaro ', 'Iloilo City', 'Iloilo', '9177228399', '', 0, '', '02111959', 2, NULL, 00000181, 'AndrinoLourdes', '9b689ee82217d569a22e6194a610b911a9d97933', 0, 0, 'Ma. Lourdes Andrino', '', 2, 'f2c314c5', '03102018', 'GCC', 0, 1),
(00000300, 'Coronado', 'Estelita', 'Sorilla', NULL, '307', 'Veterans Village', 'Iloilo City', 'Iloilo', '9106353178', '', 0, '', '01061944', 2, NULL, 00000297, 'CoronadoEstelita', 'ff0a1fae47eb8de8f1b8a166067fb5e3b3feecb4', 0, 0, 'Estelita Coronado', '', 2, 'f41d54be', '03112018', 'GCC', 0, 1),
(00000301, 'Comprendio', 'Rosemarie', 'Elechicon', NULL, '142 Modern Homes Subd.', ' Tabuc Suba Jaro', 'Iloilo City', 'Iloilo', '9778577688', '', 0, '', '10171960', 2, NULL, 00000024, 'ComprendioRosemarie', '1bb5d5c8e36e5ac3f5250fa3767a88424b2835f7', 0, 0, 'Rosemarie Comprendio', '', 2, '430095ba', '03122018', 'GCC', 0, 1),
(00000302, 'Chua', 'Maricris', 'Parrenas', NULL, 'NFA', 'Jaro', 'Iloilo City', 'Iloilo', '9178426109', '', 0, '', '01021970', 2, NULL, 00000024, 'ChuaMaricris', 'd00a1a98101c44339b976a409736b8f9ecb3b7a6', 0, 0, 'Maricris Chua', '', 2, '9a26d6b7', '03122018', 'GCC', 0, 1),
(00000303, 'Calayag', 'Agnes', 'Villavert', NULL, 'Villa Vista Subd. Guzman St.', ' Mandurriao', 'Iloilo City', 'Iloilo', '9959630070', '', 0, '', '08291960', 2, NULL, 00000024, 'CalayagAgnes', '4b004f525b1210d300a4488a2ee0c65b91a05522', 0, 0, 'Agnes Calayag', '', 2, '2d3b17b3', '03122018', 'GCC', 0, 1),
(00000304, 'Anatan', 'Elma', 'Tilawo', NULL, '', 'Ungka II', 'Pavia', 'Iloilo', '9209835767', '', 0, '', '01101965', 2, NULL, 00000024, 'AnatanElma', '18118e77920611cc9c92b3bc4b0a8ae173688f03', 0, 0, 'Elma Anatan', '', 2, '286b50ad', '03122018', 'GCC', 0, 1),
(00000305, 'Escalona', 'Andrea', 'Magbanua', NULL, 'Blk 25 lot 6 NHA I ', 'Mandurriao', 'Iloilo City', 'Iloilo', '9332024283', '', 0, '', '06091955', 2, NULL, 00000024, 'EscalonaAndrea', '3825e915ac6def191ff6556cdf57ffe4878292f5', 0, 0, 'Andrea Escalona', '', 2, '9f7691a9', '03122018', 'GCC', 0, 1),
(00000306, 'Perfas', 'Elaine Mae', 'Samorin', NULL, 'NFA', 'Jaro', 'Iloilo City', 'Iloilo', '9055119240', 'elaineperfas@gmail.com', 0, '', '05061983', 2, NULL, 00000305, 'PerfasElaine', 'efba08024537bc1bf8781be31ba3cc8bf3923758', 0, 0, 'Elaine Mae Perfas', '', 2, '4650d2a4', '03122018', 'GCC', 0, 1),
(00000307, 'CabaÃ±os', 'Joebart', 'Cantel', '', '', '', 'Tigbuan City', 'Iloilo', '9982317400', '', 0, '', '10221961', 1, '', 00000305, 'CabanosJoebart', '553f945f377e7a74e918660cb31b9625a62527a7', 0, 0, 'Joebart CabaÃ±os', '', 2, 'f14d13a0', '03122018', 'GCC', 0, 1),
(00000308, 'Jaca', 'Asarinas', 'Royo', NULL, '308-E', ' Zone 4', 'Concepcion City', 'Iloilo', '9295646779', '', 0, '', '12161950', 0, NULL, 00000297, 'JacaAsarinas', '7cdd5b09dabdb130239e5ce567419e32ca6ea6c0', 0, 0, 'Asarinas Jaca', '', 2, '4cf05c98', '03152018', 'GCC', 0, 1),
(00000309, 'Lamboloto', 'Eva', 'Alcaraz', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000220, 'LambolotoEva', 'ddf3e0a51bb69abf58463a3cf5ccbc26d6f52b42', 0, 0, 'Eva Lamboloto', '', 1, 'fbed9d9c', '03182019', 'GCC', 0, 1),
(00000310, 'Ko', 'Shu Hua', '', NULL, '', '', 'Taipei City', 'Taiwan', '', '', 0, '', '99999999', 2, NULL, 00000002, 'KoCoco', 'ea0930b4abc8f4dea46914fd8380268aec6b5853', 0, 0, 'Shu Hua Ko', '', 0, '28dc4d6c', '03202018', 'GCC', 0, 1),
(00000311, 'Pon', 'Enie', 'Boblo', NULL, 'DHPRR- Phase 3 Block 34 Lot 21', 'Pandac', 'Pavia', 'Iloilo', '9287693277', '', 0, '', '05111986', 1, NULL, 00000181, 'PonEnie', '0866f1d7fcb14ca4434c7297a6115341e2168878', 0, 0, 'Enie Pon', '', 2, '9fc18c68', '03212018', 'GCC', 0, 1),
(00000312, 'Rashid', 'Cherry Mae', 'Sajonia', '', 'Ramos Ext.', 'Brgy. Purok 1', 'Pavia', 'Iloilo', '9206410020', '', 0, '', '02171981', 2, '', 00000218, 'RashidCherryMae', 'ac37e09d416d259f52e5491b8431bf42151d580e', 0, 0, 'Cherry Mae Rashid', '', 2, '46e7cf65', '03232018', 'GCC', 0, 1),
(00000313, 'Arroyo', 'Mary Grace', 'Biboso', NULL, '', '', 'Pavia', 'Iloilo', '9307970779', '', 0, '', '07061967', 2, NULL, 00000301, 'ArroyoMaryGrace', '0874c2aa2f0306356e28edf056360210b796f447', 0, 0, 'Mary Grace Arroyo', '', 2, 'f1fa0e61', '03262018', 'GCC', 0, 1),
(00000314, 'Pacleb', 'Julie Ann', 'NiÃ±o', '', '', 'Calumpang Molo', 'Iloilo City', 'Iloilo', '9099101673', '', 0, '', '06162018', 2, '', 00000138, 'PaclebJulieAnn', '77000c470720ab77cc2972caa0f76edc51fe5016', 0, 0, 'Julie Ann Pacleb', '', 2, 'f4aa497f', '03262018', 'GCC', 0, 1),
(00000315, 'De Los Santos', 'Rico', 'B.', NULL, 'Blk. 26 Lot 31 PCUP RPG Village', 'Brgy. San Jose', 'Antipolo City', 'Rizal', '9164627750', '', 0, '', '02141970', 1, NULL, 00000053, 'DeLosSantosRico', '1962e0d74ae6ae5fced82e7b0892775900bd46e2', 0, 0, 'Rico De Los Santos', '', 2, '43b7887b', '04022018', 'GCC', 0, 1),
(00000316, 'Yu', 'Elizabeth', 'Astrologo', NULL, 'Lucky Homes Subd.', 'Jaro', 'Iloilo City', 'Iloilo', '9184270018', '', 0, '', '12241953', 2, NULL, 00000080, 'YuElizabeth', 'cc50b48f61056f5012f14891321b5d14a9c822e2', 0, 0, 'Elizabeth Yu', '', 2, '9a91cb76', '05092018', 'GCC', 0, 1),
(00000317, 'Laurel', 'Alice', 'Lerma', NULL, 'Unit 1112 Howard Tower 6th Ave.', 'Grace Park East', 'Caloocan City', 'Metro Manila', '9173404645', '', 0, '', '11161957', 2, NULL, 00000002, 'LaurelAlice', 'ce8290c955c52c09b6bbda8667519fd01e08d3ac', 0, 0, 'Alice Laurel', '', 3, '2d8c0a72', '05162018', 'GCC', 0, 1),
(00000318, 'Tetan', 'Antonio', 'Sy', NULL, 'Unit 1112 Howard Tower 6th Ave.', 'Grace Park East', 'Caloocan City', 'Metro Manila', '63282456379', '', 0, '', '06251957', 2, NULL, 00000317, 'TetanAntonio', '974f9c65992b2d9c646be66a5f8b6e6d48bf61cd', 0, 0, 'Antonio Tetan', '', 3, '9031454a', '05162018', 'GCC', 0, 1),
(00000319, 'Hinigpit', 'Myra', 'Conlu', NULL, 'Block 24 Lot 10 Carmela Valley Subd.', '', 'Silay City', 'Negros Occidental', '9260074121', '', 0, '', '07031979', 2, NULL, 00000308, 'HinigpitMyra', 'a71240c460208fa66dc21bb8748d1c6dfcec4ebb', 0, 0, 'Myra Hinigpit', '', 2, '272c844e', '05222018', 'GCC', 0, 1),
(00000320, 'Lumintac', 'Ma. Socorro', 'Manojo', NULL, 'Block 8 Zayco Subd. ', 'Zayco Subd.', 'Kabankalan', 'Negros Occidental', '9183116338', '', 0, '', '03211964', 2, NULL, 00000080, 'LumintacMaSocorro', '85b0b905ea1724ff080001f0e9c0ebe8424f7304', 0, 0, 'Ma. Socorro Lumintac', '', 2, 'fb83a61e', '05222018', 'GCC', 0, 1),
(00000321, 'Diaz', 'Emmanuel', '', '', '121 Sta. Catalina St.', 'Holy Spirit', 'Quezon City', 'Metro Manila', '6324113210', 'diaz.alona@yahoo.com', 0, '', '04021985', 2, '', 00000258, 'DiazEmmanuel', 'a1c50c4c905aae1bade37789d6e1f21fbebac979', 0, 0, 'Emmanuel Diaz', '', 2, '4c9e671a', '05282018', 'GCC', 0, 1),
(00000322, 'Pingol', 'Edelmina', 'Dimarucut', '', '29 Masbate Loop, Marina Bay Homes', 'Tambo', 'Paraï¿½aque City', 'Metro Manila', '', 'goldminefoundation@yahoo.com', 0, '', '08051976', 2, '', 00000002, 'PingolEdelmina', 'c3f8cfa0cabbf7fc4d81f1ac072df073a7077bda', 0, 0, 'Edelmina Pingol', '', 3, '2f5d4e1f', '06012018', 'GCC', 1, 1),
(00000323, 'Tindo', 'Tipayno', 'Cato', NULL, '#3 Villamor St.', 'Brgy. Pacdal', 'Baguio City', 'Benguet', '9486254548', '', 0, '', '99999999', 1, NULL, 00000328, 'TindoTipayno', 'c481beeb6c3716cb23b2fac6a9028e3522f48a84', 0, 0, 'Tipayno Tindo', '', 1, '22a5e513', '06152018', 'GCC', 0, 1),
(00000324, 'Acedo', 'Edna', '', NULL, '509 Bldg. B Makati Homes', '', 'Makati City', 'Metro Manila', '9283340334', 'ednaacedo99@gmail.com', 0, '', '10231955', 2, NULL, 00000159, 'AcedoEdna', 'e0094251b8460c26d6042cbc3f5bb72dec35d618', 0, 0, 'Edna Acedo', '', 2, '27f5a20d', '06202018', 'GCC', 0, 1),
(00000325, 'Sabas', 'Lanie', 'Camasis', NULL, 'Ramos Ext.', 'Brgy. Purok 1', 'Pavia', 'Iloilo', '9560079060', '', 0, '', '03271988', 2, NULL, 00000024, 'SabasLanie', 'd5ca1b7bbf1016d15570b3934c50bf99bacb8521', 0, 0, 'Lanie Sabas', '', 3, '90e86309', '06252018', 'GCC', 0, 1),
(00000326, 'Barretto', 'Mark Joseph', 'Ang', '', '29-6 G. Araneta Ave.', 'Brgy. Potrero', 'Malabon City', 'Metro Manila', '9175899615', 'barrettomarkjoseph2017@gmail.com', 0, '', '11291990', 1, '', 00000025, 'BarrettoMark', '9ca7d34a0c17331390ea0fc2ffe86b5f123c4916', 0, 0, 'Mark Joseph Barretto', '', 3, '49ce2004', '06282018', 'GCC', 0, 1),
(00000327, 'Barretto', 'Camille', '', NULL, '29-6 G. Araneta Ave.', 'Brgy. Potrero', 'Malabon City', 'Metro Manila', '', '', 0, '', '99999999', 2, NULL, 00000025, 'BarrettoCamille', '7cad8063e770d0d7a3df07b6f2294fa3319d2664', 0, 0, 'Camille Barretto', '', 3, 'fed3e100', '07042018', 'GCC', 0, 1),
(00000328, 'Quimque', 'Mercy', 'Montebon', NULL, 'AC 131 ', 'Central Ambiong', 'La Trinidad', 'Benguet', '9208152252', '', 0, '', '99999999', 2, NULL, 00000002, 'QuimqueMercy', 'cda6cdde8973df8baa7cbeea7834e97b9bc4dd1e', 0, 0, 'Mercy Quimque', '', 3, '436eae38', '07062018', 'GCC', 0, 1),
(00000329, 'Ong', 'Marcus Broderick', '', NULL, '', '', '', 'Benguet', '', '', 0, '', '99999999', 1, NULL, 00000328, 'OngMarcusBroderick', '80a2c56308ac29afd079b4690f7cb6003be6bc6f', 0, 0, 'Marcus Broderick Ong', '', 3, 'f4736f3c', '07062018', 'GCC', 0, 1),
(00000330, 'Ong', 'Marco Brenan', '', NULL, '', '', '', 'Benguet', '', '', 0, '', '99999999', 1, NULL, 00000329, 'OngMarcoBrenan', 'ad031b0d9f076fe9e01114d0a0f73e42d1506f10', 0, 0, 'Marco Brenan Ong', '', 3, '2742bfcc', '07062018', 'GCC', 0, 1),
(00000331, 'Ananayo', 'Steve', '', NULL, '', '', '', 'Benguet', '', '', 0, '', '99999999', 1, NULL, 00000330, 'AnanayoSteve', 'ea5baf0e540fcb0de3bf6cf37dc0f7211fb934ef', 0, 0, 'Steve Ananayo', '', 3, '905f7ec8', '07062018', 'GCC', 0, 1),
(00000332, 'Senti', 'Juan', '', NULL, '', '', '', 'Benguet', '', '', 0, '', '99999999', 1, NULL, 00000331, 'SentiJuan', '38825f94351307f8a643849cd71315c87d8aebdc', 0, 0, 'Juan Senti', '', 3, '49793dc5', '07062018', 'GCC', 0, 1),
(00000333, 'Tan', 'Anne Maureen', '', NULL, '', '', 'San Fernando City', 'La Union', '9178700535', 'annemaureen39@gmail.com', 0, '', '08101960', 2, NULL, 00000002, 'TanAnne', 'afa1739a249e5a78918550f33b1522fb0c1f72c8', 0, 0, 'Anne Maureen Tan', '', 2, 'fe64fcc1', '07122018', 'GCC', 0, 1),
(00000334, 'Aguete', 'Eddie', '', NULL, '', '', 'Marikina City', 'Metro Manila', '', '', 0, '', '99999999', 1, NULL, 00000001, 'AgueteEddie', '907b06e0bd3708508962af0163c074239e86a3ee', 0, 0, 'Eddie Aguete', '', 1, 'fb34bbdf', '07232018', 'GCC', 0, 1),
(00000335, 'Racho', 'Patrizia Franzia', '', NULL, 'Loreto St.', 'Sampaloc', 'Manila City', 'Metro Manila', '9487741558', '', 0, '', '09231994', 2, NULL, 00000058, 'RachoPatrizia', 'a7180751940000db6eca562c601cf8e5d5b3e7bc', 0, 0, 'Patrizia Franzia Racho', '', 2, '4c297adb', '07232018', 'GCC', 0, 1),
(00000336, 'Baro', 'Aldrin', '', NULL, '', 'Brgy. Tubeng', 'Tupi', 'South Cotabato', '9071266994', '', 0, '', '06101990', 1, NULL, 00000105, 'BaroAldrin', 'c96eba6aad139f15ca93be8158f922b4a8c3690a', 0, 0, 'Aldrin Baro', '', 2, '950f39d6', '07232018', 'GCC', 0, 1),
(00000337, 'Cereneche', 'Leticia', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000024, 'CerenecheLeticia', '84c9511eec9e3c883b55dfa09480183d96a897a6', 0, 0, 'Leticia Cereneche', '', 2, '2212f8d2', '07252018', 'GCC', 0, 1),
(00000338, 'Espera', 'Marivic', 'A.', NULL, '1366 Laon-Laan', 'Sampaloc', 'Manila City', 'Metro Manila', '9216925035', 'marivicespera@gmail.com', 0, '', '12081978', 2, NULL, 00000002, 'EsperaMarivic', '991efe588a8aa6a0a802b2a7711bdabffe3e16b1', 0, 0, 'Marivic Espera', '', 1, '9fafb7ea', '07272018', 'GCC', 0, 1),
(00000339, 'Dela Cruz', 'Mariza', 'J.', NULL, 'Block      Lot 11 Margarita Estate', 'Tanawan', 'Bustos', 'Bulacan', '9163403004', '', 0, '', '08101970', 2, NULL, 00000169, 'DelaCruzMariza', '58bdca03866e49f7446e208511333e75fde865a9', 0, 0, 'Mariza Dela Cruz', '', 2, '28b276ee', '07272018', 'GCC', 0, 1),
(00000340, 'Mescallado', 'Aubrey', '', NULL, '1697 Paz St.', 'Paco', 'Manila City', 'Metro Manila', '9279529318', 'aubrey.mescallado@yahoo.com', 0, '', '04181983', 2, NULL, 00000013, 'MescalladoAubrey', '379e4d17f3676190962c24691b88b453722c3c3f', 0, 0, 'Aubrey Mescallado', '', 1, '5d3c70fb', '07272018', 'GCC', 0, 1),
(00000341, 'Amparado', 'Argie', 'Torlao', '', '', 'Parada Bato', 'Sta. Ana', 'Cagayan Valley', '9171361209', '', 0, '', '09071976', 1, '', 00000354, 'AmparadoArgie', '1f19822b636e294dd838f871eebe8468a8154233', 0, 0, 'Argie Amparado', '', 3, 'ea21b1ff', '08032018', 'GCC', 0, 1),
(00000342, 'Chan', 'Carlo', '', NULL, '', '', '', 'Iloilo', '', '', 0, '', '99999999', 1, NULL, 00000181, 'ChanCarlo', '940a046dc1552dbe77fbd50cce35d26b7a54bd7b', 0, 0, 'Carlo Chan', '', 2, '3307f2f2', '07302018', 'GCC', 0, 1),
(00000343, 'NiÃ±o', 'Amalia', 'Mabaquiao', '', 'B5 L7 Landheights 6', 'Mandurriao', 'Iloilo City', 'Iloilo', '0333211394', '', 0, '', '04011957', 2, '', 00000138, 'NinoAmalia', '66f6282dda34362f82d214b1a5e2ff0bb33ba535', 0, 0, 'Amalia NiÃ±o', '', 3, '841a33f6', '07302018', 'GCC', 0, 1),
(00000344, 'De Silva', 'Maria Elena', 'Olama', NULL, '1701 7th St.', 'Punta Sta. Ana', 'Manila City', 'Metro Manila', '9234609227', '', 0, '', '07201972', 2, NULL, 00000013, 'DeSilvaMariaElena', 'bb1a3d8b9991b2ddb40e2352932a5acd9f1eac84', 0, 0, 'Maria Elena De Silva', '', 3, '814a74e8', '08072018', 'GCC', 0, 1);
INSERT INTO `distributors1` (`dsdid`, `dslnam`, `dsfnam`, `dsmnam`, `dsmother`, `dsstreet`, `dsbrgy`, `dscity`, `dsprov`, `dscontact`, `dsemail`, `dsemail_confirm`, `dsfb`, `dsbirth`, `dssex`, `dstin`, `dssid`, `un`, `pw`, `payout`, `pay_type`, `pay_name`, `pay_acct`, `dsmtype`, `discount`, `dsencoded`, `dsencodedby`, `withheld`, `dsstatus`) VALUES
(00000345, 'Gallego', 'Ma. Angela Mae', 'Niño', NULL, 'B5 L7 Landheights 6', 'Mandurriao', 'Iloilo City', 'Iloilo', '9988656931', '', 0, '', '05071980', 2, NULL, 00000343, 'GallegoMaAngelaMae', 'b47efe4a85392e791ecff4e266f5897704cd97db', 0, 0, 'Ma. Angela Mae Gallego', '', 3, '3657b5ec', '08092018', 'GCC', 0, 1),
(00000346, 'NiÃ±o', 'Roberto Jr.', 'Cerbana', '', '#14 Zone 8', 'Calumpang Molo', 'Iloilo City', 'Iloilo', '9997798481', '', 0, '', '05031979', 1, '', 00000138, 'NinoRobertoJr', 'ec212f994cf557a3d73019ba3f015007e00243e3', 0, 0, 'Roberto NiÃ±o Jr.', '', 3, 'ef71f6e1', '08092018', 'GCC', 0, 1),
(00000347, 'Nonog', 'Elizabeth', 'Pingol', NULL, '38 Zone 1', 'Capalangan', 'Apalit', 'Pampanga', '9363100705', '', 0, '', '06291969', 2, NULL, 00000322, 'NonogElizabeth', '9718500a319a10defdec5a777c38586c2e546fba', 0, 0, 'Elizabeth Nonog', '', 3, '586c37e5', '08202018', 'GCC', 0, 1),
(00000348, 'Pingol', 'Emil', 'Dimarucut', NULL, '38 Zone 1', 'Capalangan', 'Apalit', 'Pampanga', '', '', 0, '', '06251974', 1, NULL, 00000322, 'PingolEmil', 'b23a4594cfb7e0f67c69f17cb519c339626a4342', 0, 0, 'Emil Pingol', '', 3, 'e5d178dd', '08202018', 'GCC', 0, 1),
(00000349, 'Astorga', 'Ramon', 'Manojo', NULL, 'Archbishop Res.', 'Jaro', 'Iloilo City', 'Iloilo', '9192546467', '', 0, '', '99999999', 1, NULL, 00000080, 'AstorgaRamon', '67f191165ab90ad8b5f305da0993a0ba19f14574', 0, 0, 'Ramon Astorga', '', 3, '52ccb9d9', '08232018', 'GCC', 0, 1),
(00000350, 'Rayos', 'Aiza', 'Manahan', NULL, '991 Int. 15 Morong St.', 'Tondo', 'Manila City', 'Metro Manila', '9309101095', 'aizz.manahan@gmail.com', 0, '', '05151993', 2, NULL, 00000058, 'RayosAiza', 'a377fa17075f81ce354aab4d6700516d590ea340', 0, 0, 'Aiza Rayos', '', 2, '81fd6929', '08272018', 'GCC', 0, 1),
(00000351, 'Clemente', 'Melody <deceased>', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000325, 'ClementeMelody', '52ea3de6f4f27742aaf353a47c95175724e104e5', 0, 0, 'Melody <deceased> Clemente', '', 3, '36e0a82d', '09012018', 'GCC', 0, 1),
(00000352, 'Abrazado', 'Jerome', '', NULL, 'Roosevelt Ave.', '', 'Quezon City', 'Metro Manila', '9565215759', 'abrazadojerome@gmail.com', 0, '', '12221991', 1, NULL, 00000067, 'AbrazadoJerome', 'd7c4bd420c66d94dba39ff038d20a241b6352c50', 0, 0, 'Jerome Abrazado', '', 2, 'efc6eb20', '09042018', 'GCC', 0, 1),
(00000353, 'Torlao', 'Edren', 'Miredor', '', '', 'Centro', 'Sta. Ana', 'Cagayan Valley', '9754900798', '', 0, '', '01241984', 2, '', 00000354, 'TorlaoEdren', '5c9b89f59df663877c7056fe26ca1895b552f492', 0, 0, 'Edren Torlao', '', 3, '58db2a24', '09262018', 'GCC', 0, 1),
(00000354, 'Pio', 'Erica', 'Orais', '', '', 'Centro', 'Sta. Ana', 'Cagayan Valley', '9120420520', '', 0, '', '09031985', 2, '', 00000013, 'PioErica', 'f2d887e58f22b540a356305338e32c04525f189c', 0, 0, 'Erica Pio', '', 3, '5d8b6d3a', '09042018', 'GCC', 0, 1),
(00000355, 'Joseco', 'Golda', 'Arabejo', NULL, 'Gran Plains Subd.', 'Jaro', 'Iloilo City', 'Iloilo', '9989794863', '', 0, '', '12091976', 2, NULL, 00000218, 'JosecoGolda', '6209b26196d2b13e84e6862f8d851e53e768de34', 0, 0, 'Golda Joseco', '', 3, 'ea96ac3e', '09122018', 'GCC', 0, 1),
(00000356, 'Recto', 'Analissa', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000002, 'RectoAnalissa', '441d6128232e47cfc6b3f58f211716a17bcbab73', 0, 0, 'Analissa Recto', '', 2, '33b0ef33', '09132018', 'GCC', 0, 1),
(00000357, 'Garduque', 'Marlon', 'Benigno', '', '', 'Dungeg', 'Sta. Ana', 'Cagayan Valley', '9976820620', '', 0, '', '99999999', 1, '', 00000353, 'GarduqueMarlon', 'c402b1d60000d711a3ff8ac9d499751d006e258a', 0, 0, 'Marlon Garduque', '', 3, '84ad2e37', '09262018', 'GCC', 0, 1),
(00000358, 'Tusi', 'Veronica', 'Montemayor', NULL, '', 'Mahayag', 'San Miguel', 'Bohol', '', '', 0, '', '07191974', 2, NULL, 00000325, 'TusiVeronica', 'da4342fda5ea6c5a8a6c7cdef3c9115450b3f2cd', 0, 0, 'Veronica Tusi', '', 3, '3910610f', '09252018', 'GCC', 0, 1),
(00000359, 'Alog', 'Chrizel', 'Rumbaoa', NULL, '', 'Centro', 'Sta. Ana', 'Cagayan Valley', '9273058153', '', 0, '', '01201981', 1, NULL, 00000341, 'AlogChrizel', '4b968da072dbe37616d2fa47f1996272d16310f6', 0, 0, 'Chrizel Alog', '', 3, '8e0da00b', '10242018', 'GCC', 0, 1),
(00000360, 'Chua', 'Naomi Ruth', 'Quitay', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000007, 'ChuaNaomi', 'b7c366c93d380369bdfae196fbaf94f28d874771', 0, 0, 'Naomi Ruth Chua', '', 3, '52a2825b', '11072018', 'GCC', 0, 1),
(00000361, 'Lope', 'May Florence', '', NULL, '', '', 'Oton', 'Iloilo', '9086970832', '', 0, '', '05121959', 2, NULL, 00000250, 'LopeMayFlorence', 'c5b8355370ed9e2f771ae7f1e130b19cebc8597b', 0, 0, 'May Florence Lope', '', 3, 'e5bf435f', '11072018', 'GCC', 0, 1),
(00000362, 'Bingcang', 'Marylyn', 'Alcober', '', '46B Burgos St.', 'La Paz', 'Iloilo City', 'Iloilo', '9308242552', '', 0, '', '08091970', 2, '', 00000250, 'BingcangMarylyn', '34520d82882f48ce5d2574d02be2e4d89303f5ca', 0, 0, 'Marylyn Bingcang', '', 3, '3c990052', '11112018', 'GCC', 0, 1),
(00000363, 'Buyco', 'Merlinda', '', NULL, '', '', 'Anilao City', 'Iloilo', '9178277178', 'dang69buyco@gmail.com', 0, '', '05241969', 2, NULL, 00000250, 'BuycoMerlinda', '03c3996a21f3d9954735910f6816e90fa65dd090', 0, 0, 'Merlinda Buyco', '', 3, '8b84c156', '12132018', 'GCC', 0, 1),
(00000364, 'Dela Paz', 'Maria Theresa', 'Fuertes', NULL, '', '', 'Barotac Nuevo', 'Iloilo', '9385670446', '', 0, '', '11081949', 2, NULL, 00000150, 'DelaPazMariaTheresa', 'fbd8c0c2a1c36dd9e67a4c529c25d3717d3b77db', 0, 0, 'Maria Theresa Dela Paz', '', 3, '8ed48648', '12152018', 'GCC', 0, 1),
(00000365, 'Alor', 'Mary Jean', 'Patubo', NULL, '178 Block 5', ' Brgy. Sinikway Lapuz', 'Iloil', 'Iloilo', '9218558094', '', 0, '', '05021983', 2, NULL, 00000131, 'AlorMaryJean', '39e3b800a2829afe355e3decf2f731c29120a4e5', 0, 0, 'Mary Jean Alor', '', 3, '39c9474c', '12172018', 'GCC', 0, 1),
(00000366, 'Quitay', 'Rita', 'Kinikot', NULL, '37 Camachile St.', 'Western Bicutan', 'Taguig City', 'Metro Manila', '9554681797', '', 0, '', '05221953', 2, NULL, 00000007, 'QuitayRita', 'ec3c311a909793c61dff659cf2db0176a07ed22f', 0, 0, 'Rita Quitay', '', 3, 'e0ef0441', '12222018', 'GCC', 0, 1),
(00000367, 'Onte', 'Clarise', 'Patriaca', NULL, '', 'Aganan', 'Pavia', 'Iloilo', '9384258589', '', 0, '', '12271996', 2, NULL, 00000218, 'OnteClarise', '8a08a14af3efb8d4bf60d9a595d75e6422800e7f', 0, 0, 'Clarise Onte', '', 3, '57f2c545', '12292018', 'GCC', 0, 1),
(00000368, 'Gregorio', 'Maricel', '', NULL, '', '', 'Binalbagan', 'Negros Occidental', '9505919878', '', 0, '', '99999999', 2, NULL, 00000024, 'GregorioMaricel', '70745dfa2e81217b7e943f0c78a1415eca4fd1fb', 0, 0, 'Maricel Gregorio', '', 3, 'ea4f8a7d', '12312018', 'GCC', 0, 1),
(00000369, 'Benitez', 'Marife', 'Quitay', NULL, '79 National Road', 'Talimundoc', 'Orani', 'Bataan', '9471024868', 'marifeqbenitez@gmail.com', 0, '', '07091977', 2, NULL, 00000366, 'BenitezMarife', '72a255ebab8a4e531402bc2f76f0955e6ab23349', 0, 0, 'Marife Benitez', '', 1, '5d524b79', '01052019', 'GCC', 0, 1),
(00000370, 'Oquin', 'John Russel', 'Garcia', 'Judith Oquin', '991 Int. 15 Morong St.', 'Tondo', 'Manila City', 'Metro Manila', '09054089610', 'russel.oquin@gmail.com', 0, 'Russel Oquin', '02081995', 1, '', 00000058, 'OquinJohnRussel', 'd4362be76d04eb10bca1e9680a7505a030caa768', 4, 1, 'John Russel Oquin', '09054089610', 2, '8e639b89', '01102019', 'GCC', 0, 1),
(00000371, 'Silverio', 'Maria Luz', 'R.', NULL, '', 'Tibag', 'Pulilan', 'Bulacan', '9430680693', 'zaisilverio88@gmail.com', 0, '', '12191989', 2, NULL, 00000013, 'SilverioMariaLuz', '7327650fb22987fc2e90b719492e9f0dfe2136c7', 0, 0, 'Maria Luz Silverio', '', 1, '397e5a8d', '01172019', 'GCC', 0, 1),
(00000372, 'Roca', 'Melvin Keiff', 'Cambe', '', '208-4 Lam-en Village', 'Purok 20', 'Baguio City', 'Benguet', '9996796066', 'melvinkeiffroca@gmail.com', 0, '', '12121989', 1, '', 00000322, 'RocaMelvin', 'f6fabb104a3d3ebab8313259d084cd9d02b58b42', 0, 0, 'Melvin Keiff Roca', '', 3, 'e0581980', '01222019', 'GCC', 1, 0),
(00000373, 'Regulto', 'Augusto Caesar', 'Dela Cruz', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000036, 'RegultoCaesar', 'b5b30715e77c79080f83af82a4bd95faebd4bd6a', 0, 0, 'Augusto Caesar Regulto', '', 1, '5745d884', '01242019', 'GCC', 0, 1),
(00000374, 'Regulto', 'Angelo James', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000373, 'RegultoAJ', 'f04f3ce983ed1747b8b077106f638612c204117d', 0, 0, 'Angelo James Regulto', '', 1, '52159f9a', '01242019', 'GCC', 0, 1),
(00000375, 'Regulto', 'Ma. Eloisa', '', '', '', '', '', '', '', '', 0, '', '99999999', 2, '', 00000374, 'RegultoLotlot', 'e1345435121e78d28c889f62e3e447011363287c', 0, 0, 'Ma. Eloisa Regulto', '', 1, 'e5085e9e', '01242019', 'GCC', 0, 1),
(00000376, 'Gamarcha', 'Luzbel', 'Clamano', NULL, '264', 'Brgy. Marulas', 'Kawit', 'Cavite', '9475404667', 'belgamarcha@yahoo.com', 0, '', '09121986', 2, NULL, 00000372, 'GamarchaLuzbel', 'a209348824a3dfbd6b586b0c8bdc94b7c120a6dc', 0, 0, 'Luzbel Gamarcha', '', 1, '3c2e1d93', '01292019', 'GCC', 0, 1),
(00000377, 'Sevilla', 'Grace', 'Escubio', NULL, 'Unit A Block 5 Lot 16 Dunhill Street', 'United East Fairview Subd., East Fairview', 'Quezon City', 'Metro Manila', '9163991644', 'mhya2k@gmail.com', 0, '', '01221957', 2, NULL, 00000376, 'SevillaGrace', '6bf92c880b2befc79f0e275ae61703ad7f714b5b', 0, 0, 'Grace Sevilla', '', 1, '8b33dc97', '01292019', 'GCC', 0, 1),
(00000378, 'Pacificar', 'Jerome', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000376, 'PacificarJerome', '6611275dae3f1cd7155c05c034f47d4a4f15489c', 0, 0, 'Jerome Pacificar', '', 1, '368e93af', '01312019', 'GCC', 0, 1),
(00000379, 'Tan', 'Mary Ann', 'Tan', NULL, '18 Duhat Loop, Phase 1 Ayala Westgrove Heights', 'Brgy. Inchikan', 'Silang', 'Cavite', '9164656655', 'maryanntantan@yahoo.com', 0, '', '07021968', 2, NULL, 00000002, 'TanMaryAnn', 'b26d3d94a9fb65121cbf8e78d0ad625285d9251d', 0, 0, 'Mary Ann Tan', '', 3, '819352ab', '02032019', 'GCC', 0, 1),
(00000380, 'Mortos', 'John Marvelous', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000002, 'MortosMarvelous', '244d8a9766d86e0215438febf006c72835394afe', 0, 0, 'John Marvelous Mortos', '', 1, 'a65e1c34', '02082019', 'GCC', 0, 1),
(00000381, 'Bautista', 'Ma. Lea', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000376, 'BautistaMaLea', '7917e3b60e8d37666849aa9c59385b0c72b3b899', 0, 0, 'Ma. Lea Bautista', '', 1, '1143dd30', '02182019', 'GCC', 0, 1),
(00000382, '', 'Healthy Hugs', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 0, NULL, 00000377, 'HealthyHugs', 'd436799e15f75da3aad293e73c1eb4892f59adaf', 0, 0, 'Healthy Hugs ', '', 1, 'c8659e3d', '02182019', 'GCC', 0, 1),
(00000383, 'Ballaran', 'Shirley', 'Barcelona', NULL, 'P-2', 'Bangkilingan', 'Tabaco City', 'Albay', '9061888599', '', 0, '', '03121970', 2, NULL, 00000376, 'BallaranShirley', 'e760b7ec49affd9c1c5fa6ae555d02f8a3b17a0a', 0, 0, 'Shirley Ballaran', '839040792', 3, '7f785f39', '02182019', 'GCC', 0, 1),
(00000384, 'Mendoza', 'Jean', 'B.', NULL, 'Verdant Hills', 'Brgy. Pasong Tamo', 'Quezon City', 'Metro Manila', '9064321080', '', 0, '', '11201962', 2, NULL, 00000376, 'MendozaJean', '9a70f81806f3b5a896f1e6225f2646518b10ce0d', 0, 0, 'Jean Mendoza', '', 1, '7a281827', '03062019', 'GCC', 0, 1),
(00000385, 'Barlis', 'Rowena', 'R.', NULL, 'Block 1 Lot 14 Karina Homes', 'Bagumbong', 'Caloocan City', 'Metro Manila', '9656820933', 'whengbarlis0428@gmail.com', 0, '', '04281978', 2, NULL, 00000001, 'BarlisRowena', 'f61dd4c83e9102fa9a790ef755c9809c58a7b315', 0, 0, 'Rowena Barlis', '', 1, 'cd35d923', '03072019', 'GCC', 0, 1),
(00000386, 'Andrada', 'Carlito', 'Lahera', NULL, '2151 Road 6 Fabie Estate', 'Sta. Ana', 'Manila City', 'Metro Manila', '9774996739', 'carlito2064@gmail.com', 0, '', '02091964', 1, NULL, 00000377, 'AndradaCarlito', 'fd2c98cc15b450e91131d1709e8eb1da5aee544e', 0, 0, 'Carlito Andrada', '', 1, '14139a2e', '03082019', 'GCC', 0, 1),
(00000387, 'Francisco', 'Venedict', 'A.', '', 'Phase 2 Block 5 Lot 57 Greenbreeze', 'Brgy. San Isidro', 'Rodriguez', 'Rizal', '9084653258', 'abenroserofrancisco@gmail.com', 0, '', '03281983', 1, '', 00000002, 'FranciscoVenedict', '4caea0dd4a4fb0629149cbcdfdcfa842498c67d7', 0, 0, 'Venedict Francisco', '', 1, 'a30e5b2a', '04262019', 'GCC', 0, 1),
(00000388, 'Villareal', 'Anna May', 'Sertan', NULL, '', '', '', '', '9275451046', '', 0, '', '99999999', 2, NULL, 00000360, 'VillarealAnnaMay', 'd32cd434aa1aa4699e675483e6ec4c52cfaa2505', 0, 0, 'Anna May Villareal', '', 1, '1eb31412', '04262019', 'GCC', 0, 1),
(00000389, 'Tan', 'Mercy', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000379, 'TanMercy', '4d34ccfb90cebda32afc1e1bc546dd7ceb9158b5', 0, 0, 'Mercy Tan', '', 1, 'a9aed516', '05042019', 'GCC', 0, 1),
(00000390, 'Esguerra', 'Oliver Rafer', '', NULL, '307 Gahak', '', 'Kawit', 'Cavite', '9195999577', 'oresguerra@yahoo.com', 0, '', '10041965', 1, NULL, 00000376, 'EsguerraOliver', '0da6938df42417248495d1db8fa56ed7d982a3c3', 0, 0, 'Oliver Rafer Esguerra', '', 1, '7a9f05e6', '05182019', 'GCC', 0, 1),
(00000391, 'Buenafe', 'Virginia', '', NULL, 'CDC, Tagaytay Country Homes 3', 'Silang Crossing', 'Tagaytay City', 'Cavite', '9338557855', 'millet715@gmail.com', 0, '', '07151958', 2, NULL, 00000390, 'BuenafeVirginia', 'ef86cebb352c61e95fda9d5bf84589a13f99765e', 0, 0, 'Virginia Buenafe', '', 1, 'cd82c4e2', '05202019', 'GCC', 0, 1),
(00000392, 'Lugay', 'Ruth Juliet', 'V.', NULL, 'Unit 1 Block 9 Lot 29 Foggy Heights Village', '', 'Tagaytay City', 'Cavite', '9237409050', 'ruth.lugay@gmail.com', 0, '', '01131957', 2, NULL, 00000391, 'LugayRuth', '8ffad90d8ef3b1a8bb7954a6289bcc0332de06db', 0, 0, 'Ruth Juliet Lugay', '', 1, '14a487ef', '06012019', 'GCC', 0, 1),
(00000393, 'Chua', 'Elizabeth', 'Tan', NULL, 'National Highway', 'Brgy. Paciano Rizal', 'Calamba City', 'Laguna', '9175451135', 'bethtin831@gmail.com', 0, '', '08311962', 2, NULL, 00000379, 'ChuaElizabeth', '5f6ccf04c5872917d2bad7f471f864924a4c69e5', 0, 0, 'Elizabeth Chua', '', 3, 'a3b946eb', '06022019', 'GCC', 0, 1),
(00000394, 'Gandionco', 'Rosita', 'Ang', '', 'FJR Electrical Supply', '', 'General Santos City', 'South Cotabato', '9177169888', '', 0, '', '03241957', 2, '', 00000002, 'GandioncoRoss', '5babd6a5d6ffde0f732ab3256a247654ab1060b3', 0, 0, 'Rosita Gandionco', '', 3, 'a6e901f5', '04142018', 'GCC', 0, 1),
(00000395, 'Gonzales', 'Corazon', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000377, 'GonzalesCorazon', '8bbe52830a63676ae4b21e3192a55ccf1fe25535', 0, 0, 'Corazon Gonzales', '', 1, '11f4c0f1', '09052019', 'GCC', 0, 1),
(00000396, 'Rosario', 'Euraya', 'V.', NULL, '2218-A Makata St.', 'Sta. Cruz', 'Manila City', 'Metro Manila', '9998995625', '', 0, '', '05021967', 2, NULL, 00000013, 'RosarioEuraya', 'c42fa1bae77e14b2b5dbbf601eb649bf73d76a92', 0, 0, 'Euraya Rosario', '', 1, 'c8d283fc', '09072019', 'GCC', 0, 1),
(00000397, 'Dagum', 'Michael Vincent', 'Regulto', NULL, '', '', 'Apalit', 'Pampanga', '', '', 0, '', '11021993', 2, NULL, 00000375, 'DagumMichaelVincent', '7b5d8a4d6ebb142d2e94447dbebf8f485d4d18a8', 0, 0, 'Michael Vincent Dagum', '', 1, '7fcf42f8', '09072019', 'GCC', 0, 1),
(00000398, 'Ebuen', 'Lillian', 'Lasaten', NULL, 'Room 103 Alpha Building, No. 77 Boni Serrano Avenue', 'Cubao', 'Quezon City', 'Metro Manila', '9178982717', 'totalbodydentistry@yahoo.com', 0, '', '99999999', 2, NULL, 00000007, 'EbuenLillian', '6083ffb5a444a5a15479ec86d03687f504188ffb', 0, 0, 'Lillian Ebuen', '', 1, 'c2720dc0', '09132019', 'GCC', 0, 1),
(00000399, 'De Guzman', 'Abigail', 'Capitulo', NULL, '#17 Bulakeña Village', 'Saog', 'Marilao', 'Bulacan', '9235867286', '', 0, '', '12091986', 2, NULL, 00000013, 'DeGuzmanAbigail', '96ebfd13820ef802ac15546fab95fceb2811dc14', 0, 0, 'Abigail De Guzman', '', 1, '756fccc4', '10012019', 'GCC', 0, 1),
(00000400, 'Gelle', 'Soledad', 'Ventura', NULL, 'Block 4 Lot 48 Phase 2 Gumamela St., Elysian Homes', 'Bahay Pari', 'Meycauayan', 'Bulacan', '9178154527', 'solgelle@yahoo.com', 0, '', '06281964', 2, NULL, 00000013, 'GelleSoledad', '260280b6d6e5b6cf406e4dcd4283af907fa48327', 0, 0, 'Soledad Gelle', '', 1, '615a5fbb', '10142019', 'GCC', 0, 1),
(00000401, 'Pelaez', 'Hannah Jane', 'Paragat', NULL, 'Block 89 Lot 9 Matahimik St.', 'Pangarap Village', 'Caloocan City', 'Metro Manila', '9212281244', 'pelaezhannah@gmail.com', 0, '', '10271998', 2, NULL, 00000151, 'PelaezHannah', '9b22fbae65aebfe7af17c97962568caa063c88e9', 0, 0, 'Hannah Jane Pelaez', '', 1, 'd6479ebf', '10192019', 'GCC', 0, 1),
(00000402, 'Ombion', 'Alysa Mae', 'Netura', NULL, '541 Malaya St.', 'Brgy. 181, Pangarap Village', 'Caloocan City', 'Metro Manila', '9060272053', 'alysaombion24@gmail.com', 0, '', '05241999', 2, NULL, 00000401, 'OmbionAlysaMae', '09168b5bc4e6b94d74a7719b100ae7e82171dbe3', 0, 0, 'Alysa Mae Ombion', '', 1, '0f61ddb2', '10192019', 'GCC', 0, 1),
(00000403, 'Nicolas', 'Rogem', 'Cay', NULL, 'Block 10 Lot 1 San Agustin St.', 'Guadanoville', 'Caloocan City', 'Metro Manila', '9169336491', 'nicolasrogem@yahoo.com', 0, '', '12021997', 2, NULL, 00000401, 'NicolasRogem', 'a6dc9244dc0396e6858554824e7079fd79bf30ff', 0, 0, 'Rogem Nicolas', '', 1, 'b87c1cb6', '10192019', 'GCC', 0, 1),
(00000404, 'Edria', 'Jordan', 'Abdon', NULL, '238 G. de Jesus St.', 'Bagong Barrio', 'Caloocan City', 'Metro Manila', '9509446046', 'longsaybako1314@gmail.com', 0, '', '03131987', 1, NULL, 00000007, 'EdriaJordan', '8eaa009cc09b6876b15b1fdb28ab790218eb7179', 0, 0, 'Jordan Edria', '', 1, 'bd2c5ba8', '10192019', 'GCC', 0, 1),
(00000405, 'Fabro', 'Kharezze', 'Fernando', NULL, '#75 Gonzales', 'East Grace Park', 'Caloocan City', 'Metro Manila', '9554519864', 'kharezze.fabro@yahoo.com', 0, '', '06251996', 2, NULL, 00000058, 'FabroKharezze', '899e23879585fd15af5fdf1b31370b4f7eee34d0', 0, 0, 'Kharezze Fabro', '', 1, '0a319aac', '10192019', 'GCC', 0, 1),
(00000406, 'Anciano', 'Hannah Mae', 'Zamora', NULL, 'Block 1 Lot 36 Phase 7 Arkanzas St.', '', 'San Jose del Monte City', 'Bulacan', '9985617120', 'hmanciano.hma@gmail.com', 0, '', '08061997', 2, NULL, 00000401, 'AncianoHannahMae', '362bd46542dc73ab4ac558771498c29ee867cfa0', 0, 0, 'Hannah Mae Anciano', '', 1, 'd317d9a1', '10192019', 'GCC', 0, 1),
(00000407, 'Arellano', 'Salvacion', 'Tagara', NULL, 'Block 75 Lot 18 Phase 12 Riverside', 'Bagong Silang, Tala', 'Caloocan City', 'Metro Manila', '9396302121', 'kristinearellano19@gmail.com', 0, '', '10061975', 2, NULL, 00000401, 'ArellanoSalvacion', 'd0b3d4a87db124c17734d013017823e5598ee877', 0, 0, 'Salvacion Arellano', '', 1, '640a18a5', '10302019', 'GCC', 0, 1),
(00000408, 'Salomon', 'Madeline', 'Sorela', NULL, 'Block 2 Lot 1 Phase E1 Mulawin Francisco Homes', '', 'San Jose del Monte City', 'Bulacan', '9285870734', '', 0, '', '03181969', 2, NULL, 00000401, 'SalomonMadeline', '7f60ca55fa9c49b16edfedae282978d1bdbf0d0f', 0, 0, 'Madeline Salomon', '', 1, 'd9b7579d', '10312019', 'GCC', 0, 1),
(00000409, 'Rafael', 'Amelia', 'Punzalan', NULL, '95 Kamuning Road', '', 'Quezon City', 'Metro Manila', '9224120793', '', 0, '', '01121950', 2, NULL, 00000377, 'RafaelAmelia', 'ed4e1cd2fee9321e9ec95c9865aebad0333f6c66', 0, 0, 'Amelia Rafael', '', 1, '6eaa9699', '11122019', 'GCC', 0, 1),
(00000410, 'Reyes', 'Teodoro', '', NULL, '', '', '', '', '9228960970', '', 0, '', '04281943', 1, NULL, 00000002, 'ReyesTeodoro', '472c9c2845d1251352365511e41ecc13e8aa8014', 0, 0, 'Teodoro Reyes', '', 1, 'bd9b4669', '11232019', 'GCC', 0, 1),
(00000411, 'Gelle', 'Hanna Alyssa', 'Ventura', NULL, 'Penthouse 10 Cityland North Residences', 'Veterans Village', 'Quezon City', 'Metro Manila', '9457983413', 'h.gelle@yahoo.com', 0, '', '05131995', 2, NULL, 00000400, 'GelleHanna', '73a99e44c0ee48ba418564abdbf9dded9bf6cee9', 0, 0, 'Hanna Alyssa Gelle', '', 1, '0a86876d', '12192019', 'GCC', 0, 1),
(00000412, 'Tee', 'Ryan Oliver', 'Qua', NULL, 'One Wilson Place', '', 'San Juan City', 'Metro Manila', '', '', 0, '', '07081973', 1, NULL, 00000002, 'TeeRyan', '22fcd29d3d1836ac9d4edc8a8295b3edcf9d08b0', 0, 0, 'Ryan Oliver Tee', '', 1, 'd3a0c460', '12292019', 'GCC', 0, 1),
(00000413, 'Cheng', 'Jenny', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000389, 'ChengJenny', '53934036351b428eed6dcd072b8b12dcf709b14e', 0, 0, 'Jenny Cheng', '', 1, '64bd0564', '01022020', 'GCC', 0, 1),
(00000414, 'Yap', 'Rogelio', 'Chiong', NULL, '113 Victory St.', 'San Perfecto', 'San Juan City', 'Metro Manila', '9224960127', 'rogeryap59@yahoo.com', 0, '', '01062020', 1, NULL, 00000002, 'YapRogelio', 'ffda159bcec443a7ec3a48f0f7ea86ebd1272107', 0, 0, 'Rogelio Yap', '', 1, '61ed427a', '01062020', 'GCC', 0, 1),
(00000415, 'Anire', 'Allan', 'Orquita', NULL, 'B-13 Unit 437 Deca Homes Vitas St.', 'Tondo', 'Manila City', 'Metro Manila', '9088887431', 'allananire@yahoo.com', 0, '', '07131972', 1, NULL, 00000058, 'AnireAllan', '1e83bafaab0d330196cfc0a4079c725cfb5b0429', 0, 0, 'Allan Anire', '', 2, 'd6f0837e', '01312020', 'GCC', 0, 1),
(00000416, '', 'Justice Knights Tracker', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 0, NULL, 00000377, 'JusticeKnights', '2bbaa04f6f246f5865ad240fbc8ce330d2da7e7f', 0, 0, 'Justice Knights Tracker ', '', 1, '0fd6c073', '02082020', 'GCC', 0, 1),
(00000417, 'Lauta', 'Kenneth', 'Llagas', '', '33 Diamond St.', 'Batasan Hills', 'Quezon City', 'Metro Manila', '9275402993', '', 0, '', '11021993', 1, '', 00000002, 'LautaKenneth', '125f62542c105562616a355568149c1871e3e658', 0, 0, 'Kenneth Lauta', '', 0, 'b8cb0177', '02172020', 'GCC', 1, 0),
(00000418, 'Tancungco', 'Mikee', 'Brabante', NULL, '615 Pag-asa St., 7th Avenue', '', 'Caloocan City', 'Metro Manila', '9177985511', 'mikee.tancungco.icf@gmail.com', 0, '', '11221995', 2, NULL, 00000417, 'TancungcoMikee', '91dfbd03eee1cc3e5e017560afed64ebdb89d7fb', 0, 0, 'Mikee Tancungco', '', 1, '05764e4f', '02172020', 'GCC', 0, 1),
(00000419, 'Ang', 'Arlene', 'Morales', '', 'Unit 1411 Altiva Cypress Towers, PDS Avenue', 'Ususan', 'Taguig City', 'Metro Manila', '9177066884', 'arlene.ang@gmail.com', 0, '', '01151965', 2, '', 00000007, 'AngArlene', '15ed11b48abb338563fb61c9af24952f19aa36dd', 0, 0, 'Arlene Ang', '', 1, 'b26b8f4b', '02282020', 'GCC', 0, 1),
(00000420, 'Nerecina', 'Malou', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000002, 'NerecinaMalou', '20b0a43354874b34c75f4bb2d7c962d097c211d1', 0, 0, 'Malou Nerecina', '', 1, '6ec4ad1b', '02292020', 'GCC', 0, 1),
(00000421, 'Tee', 'Joanna Marie', 'Chua', NULL, 'One Wilson Place', '', 'San Juan City', 'Metro Manila', '', '', 0, '', '07211980', 2, NULL, 00000412, 'TeeJoanna', '9d56ac4163b42182fd3776aaecb2f6681493798e', 0, 0, 'Joanna Marie Tee', '', 1, 'd9d96c1f', '03022020', 'GCC', 0, 1),
(00000422, 'Sevilla', 'Mary Therese Celine', 'Escubio', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000377, 'SevillaMaryThereseCeline', '5c28972404a168219f799015e6421015ed849a33', 0, 0, 'Mary Therese Celine Sevilla', '', 1, '00ff2f12', '03032020', 'GCC', 0, 1),
(00000423, 'Chua', 'Shirley Lolette', 'Lim', NULL, '35 Calvary Hill St.', 'Damayang Lagi', 'Quezon City', 'Metro Manila', '9175272482', 'shirl.event@yahoo.com', 0, '', '08281974', 2, NULL, 00000421, 'ChuaShirley', 'a867b7d7366478e50645c5b5ae7ac2a201c4e17a', 0, 0, 'Shirley Lolette Chua', '', 1, 'b7e2ee16', '03232020', 'GCC', 0, 1),
(00000424, 'Chua', 'Allan Benson', 'Lim', NULL, '35 Calvary Hill St.', 'Damayang Lagi', 'Quezon City', 'Metro Manila', '9175816234', 'abchua10@yahoo.com', 0, '', '05301979', 1, NULL, 00000423, 'ChuaAllan', '563eb074e7b9f7bd95efc8ebed3d5dec96b0ea46', 0, 0, 'Allan Benson Chua', '', 1, 'b2b2a908', '03282020', 'GCC', 0, 1),
(00000425, 'Chuaunsu', 'Nelson', 'Tan', NULL, 'Unit 1204-A Valencia Hills Condominium, N. Domingo St.', '', 'Quezon City', 'Metro Manila', '9175333717', 'nelsonc48@gmail.com', 0, '', '12181963', 1, NULL, 00000423, 'ChuaunsuNelson', '1557dddd4513db1125701b584cabb8a274863beb', 0, 0, 'Nelson Chuaunsu', '', 1, '05af680c', '04022020', 'GCC', 0, 1),
(00000426, 'Oquin', 'Arnolfo', 'Lim', NULL, '1068 Kamada St.', 'Dagat-Dagatan', 'Caloocan City', 'Metro Manila', '9185825261', '', 0, '', '08301968', 1, NULL, 00000370, 'OquinArnolfo', '259c0991debcc2df56bc17e7c35802d7d5596514', 0, 0, 'Arnolfo Oquin', '', 1, 'dc892b01', '06122020', 'GCC', 0, 1),
(00000427, 'Co', 'Jonathan Anthony', 'Chua', NULL, '35 Calvary Hill St.', 'Damayang Lagi', 'Quezon City', 'Metro Manila', '9178543837', '', 0, '', '02132001', 1, NULL, 00000017, 'CoJonathan', '4c29cdaff0d3c0ae4c26a0071d876b3918c242af', 0, 0, 'Jonathan Anthony Co', '', 1, '6b94ea05', '07012020', 'GCC', 0, 1),
(00000428, 'Ang Ngo Ching', 'Pia Charliz', 'Lim', NULL, '35 7th St.', 'Brgy. Mariana', 'Quezon City', 'Metro Manila', '9176470166', 'pia_angngoching@dlsu.edu.ph', 0, '', '07241998', 2, NULL, 00000427, 'AngNgoChingPia', 'fffe0aa8d6f605209e8187fa7815cbf7dc5ac998', 0, 0, 'Pia Charliz Ang Ngo Ching', '', 1, 'd629a53d', '07012020', 'GCC', 0, 1),
(00000429, 'Regulto', 'Ma. Emily', 'Dela Cruz', NULL, '5305 Harvest Moon Ct.', '', 'Elkgrove', 'California, USA 95758', '12547816743', 'maemilyregulto@gmail.com', 0, '', '03161969', 2, NULL, 00000001, 'RegultoMaEmily', '744b3579e0a3aadf773ecbcebca5758167c92538', 0, 0, 'Ma. Emily Regulto', '', 1, '61346439', '10022020', 'GCC', 0, 1),
(00000430, 'Chen', 'Richard', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000002, 'ChenRichard', '2156eb2fcc37f6e709ff87865122c6cc6e9c4896', 0, 0, 'Richard Chen', '', 1, 'b205b4c9', '10132020', 'GCC', 0, 1),
(00000431, 'Tinio', 'Gina', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000309, 'TinioGina', 'd2a5c87189ea7346a76bd78b80802256c9156a9e', 0, 0, 'Gina Tinio', '', 1, '051875cd', '10162020', 'GCC', 0, 1),
(00000432, 'Manuel', 'Lito', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000002, 'ManuelLito', '38362ca10f930c17f07e4d6c7abdd109d72a1d4e', 0, 0, 'Lito Manuel', '', 1, 'dc3e36c0', '10172020', 'GCC', 0, 1),
(00000433, 'Tejoso', 'Jonald', 'Tangi', NULL, 'Block 3 Lot 12 Jasmin St. Sampaguita Subd.', 'Camarin', 'Caloocan City', 'Metro Manila', '9563884968', 'jonaldtejoso@gmail.com', 0, '', '01221977', 1, NULL, 00000063, 'TejosoJonald', 'a7c43be0c2b706357250db2d9e024f31cde67d99', 0, 0, 'Jonald Tejoso', '', 1, '6b23f7c4', '11152019', 'GCC', 0, 1),
(00000434, 'Salazar', 'Jocelyn', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000381, 'SalazarJocelyn', 'cad63348bb1f024a86cd0ce7607bba6e4ffce9d9', 0, 0, 'Jocelyn Salazar', '', 1, '6e73b0da', '11182020', 'GCC', 0, 1),
(00000435, 'Gadon', 'Laugelie', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000434, 'GadonLaugelie', '56c3a7d6aa630033cf5798f1b7e07d9497e90377', 0, 0, 'Laugelie Gadon', '', 1, 'd96e71de', '12082020', 'GCC', 0, 1),
(00000436, 'DequiÃ±a', 'Nicolas Jhon', 'Castillano', '', 'Pine Tree Street', 'Buhangin', 'Davao City', 'Davao del Sur', '9061392935', 'nicolasjhondequina@gmail.com', 0, '', '06261991', 1, '', 00000394, 'DequinaNicolas', 'e954fd11e43894ca746dc557c313369ea0683074', 0, 0, 'Nicolas Jhon DequiÃ±a', '', 1, '004832d3', '03282021', 'GCC', 0, 1),
(00000437, 'Francisco', 'Romeo Jr.', 'Godoy', '', '20 Jason St., Maripaz Subd.', 'Bilog, Balangkas', 'Valenzuela City', 'Metro Manila', '9287497799', 'rgfjr14@gmail.com', 0, '', '04141965', 1, '', 00000219, 'FranciscoJun', 'a19c9950e4ae41bc1c92a2c49e0e3573e1a212ec', 0, 0, 'Romeo Francisco Jr.', '', 1, 'b755f3d7', '01122021', 'GCC', 0, 1),
(00000438, 'Nua', 'Melody Jane', 'Chua', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000002, 'NuaMelodyJane', 'db7c93c3d84ce83526b578ddaef036cd0f0c3c03', 0, 0, 'Melody Jane Nua', '', 1, '0ae8bcef', '01192021', 'GCC', 0, 1),
(00000439, 'Camayang', 'Angelo Mark', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000001, 'CamayangAngelo', '76e79e0d93ac9b2e3931677512c2dde425147821', 0, 0, 'Angelo Mark Camayang', '', 1, 'bdf57deb', '05132020', 'GCC', 0, 1),
(00000440, 'Estrella', 'Alex', 'Santos', NULL, '', '', 'Malolos City', 'Bulacan', '9158562251', '', 0, '', '12241975', 1, NULL, 00000439, 'EstrellaAlex', 'bd58c05920f7d85c5f2c80864851c983ed147334', 0, 0, 'Alex Estrella', '', 1, 'c87b7bfe', '01292021', 'GCC', 0, 1),
(00000441, 'Cabuslay', 'Roland', '', NULL, '', 'Pag-asa', 'Quezon City', 'Metro Manila', '', '', 0, '', '01011980', 1, NULL, 00000439, 'CabuslayRoland', '6d14a36a1ea7a67df751ff601204aaabb3bab368', 0, 0, 'Roland Cabuslay', '', 1, '7f66bafa', '02102021', 'GCC', 0, 1),
(00000442, 'Empenida', 'Rebecca', 'Belasa', '', 'Block 31 Lot 6 Sarangani Homes Phase 1', 'San Isidro, Lagao', 'General Santos City', 'South Cotabato', '9060170090', 'empenidarebecca@gmail.com', 0, '', '09271964', 2, '', 00000394, 'EmpenidaRebecca', 'f64793d3054e1d4100041fe47a0c84cafbe888d4', 0, 0, 'Rebecca Empenida', '', 1, 'a640f9f7', '03012021', 'GCC', 0, 1),
(00000443, 'Jugarap', 'Ruby', '', NULL, 'Bijoux Box Jewelry Shop, Gaisano Mall of GenSan', '', 'General Santos City', 'South Cotabato', '9198896249', 'jugarapruby13@gmail.com', 0, '', '99999999', 2, NULL, 00000002, 'JugarapRuby', 'c4dd37fd7e4a004e31eb7393521179b51252f042', 0, 0, 'Ruby Jugarap', '', 2, '115d38f3', '05082018', 'GCC', 0, 1),
(00000444, 'Bandal', 'Marites', '', NULL, '', 'Brgy. Oson', 'Capul', 'Northern Samar', '9282879885', '', 0, '', '99999999', 2, NULL, 00000105, 'BandalMarites', '6ed8837b11d40361c90ddc0d732ab695f0124be5', 0, 0, 'Marites Bandal', '', 1, '140d7fed', '03132019', 'GCC', 0, 1),
(00000445, 'Bonabon', 'Merba', '', NULL, '', 'Brgy. Oson', 'Capul', 'Northern Samar', '9282879885', '', 0, '', '99999999', 2, NULL, 00000105, 'BonabonMerba', 'adac3779ec2a7799ba486eb774a4d88cd22ba81e', 0, 0, 'Merba Bonabon', '', 1, 'a310bee9', '03132019', 'GCC', 0, 1),
(00000446, 'Cabico', 'Christine', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000388, 'CabicoChristine', '92438b5ef1b5e96fc6672caaf7312f510ff27489', 0, 0, 'Christine Cabico', '', 1, '7a36fde4', '10302019', 'GCC', 0, 1),
(00000447, 'Regulto', 'Pedro Alfonso', 'Dela Cruz', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000036, 'RegultoYhet', '9499ae363ba611985c6fbac81bd1e94ddeba9cc7', 0, 0, 'Pedro Alfonso Regulto', '', 1, 'cd2b3ce0', '12212019', 'GCC', 0, 1),
(00000448, 'Jumaquio', 'Marvin', '', NULL, '', '', 'Malolos City', 'Bulacan', '', '', 0, '', '99999999', 1, NULL, 00000001, 'JumaquioMarvin', '397977fa82f9edd10cdcb8b45e2a65b80ffdb2bf', 0, 0, 'Marvin Jumaquio', '', 1, '709673d8', '12232019', 'GCC', 0, 1),
(00000449, 'Platero', 'Gemma', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000376, 'PlateroGemma', 'bbb8fef3cb12635348608205a86903dffbe90ee2', 0, 0, 'Gemma Platero', '', 1, 'c78bb2dc', '01102020', 'GCC', 0, 1),
(00000450, 'Aratia', 'Arnel', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 1, NULL, 00000449, 'AratiaArnel', '0f1cd2a3cb9c97db67f5b5e5b32eea68312592ec', 0, 0, 'Arnel Aratia', '', 1, '14ba622c', '01102020', 'GCC', 0, 1),
(00000451, 'Yambao', 'Florencio', '', NULL, '', '', '', 'Arayat', '', '', 0, '', '99999999', 1, NULL, 00000001, 'YambaoFlorencio', 'aae12a0e260012f6685fa4ba13667dcb2f74b7e0', 0, 0, 'Florencio Yambao', '', 1, 'a3a7a328', '01212020', 'GCC', 0, 1),
(00000452, '', 'Aging Pinoy', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 0, NULL, 00000377, 'AgingPinoy', 'ff5a906534d47a62e61364633078bc0f98fbb4ae', 0, 0, 'Aging Pinoy ', '', 1, '7a81e025', '02082020', 'GCC', 0, 1),
(00000453, 'Lao', 'Jon Nicholas', 'Chia', NULL, '202-1 Champagne Edition, J. Escriva Drive', 'San Antonio', 'Pasig City', 'Metro Manila', '9178313808', 'jonncl@yahoo.com', 0, 'Jon Lao', '11221966', 1, NULL, 00000421, 'Toymastah', '4b6e4b5f9a2d8f0e620899e0f7a5b2d114e2cfda', 0, 0, 'Jon Nicholas Lao', '', 1, 'cd9c2121', '03262020', 'GCC', 0, 1),
(00000454, 'Tan', 'Antonio Elmer', '', NULL, 'Unit 2608 The Levels Anaheim Condominium Pacific Rim-Filinvest, Petron-Commerce Avenue', 'Alabang', 'Muntinlupa', 'Metro Manila', '9178173894', '', 0, '', '99999999', 1, NULL, 00000389, 'TanAntonioElmer', 'a6f4ce6f3558de65827b895a34ff441b50768292', 0, 0, 'Antonio Elmer Tan', '', 1, 'c8cc663f', '04012020', 'GCC', 0, 1),
(00000455, 'Tan', 'Candee', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000421, 'TanCandee', 'd8c99fd0767819e31bebc572ba55729561e58080', 0, 0, 'Candee Tan', '', 1, '7fd1a73b', '04022020', 'GCC', 0, 1),
(00000456, 'Dela Rosa', 'Mari Claire', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000421, 'DelaRosaMariClaire', '57b28ce3b02457263e928691c0603fac203b6142', 0, 0, 'Mari Claire Dela Rosa', '', 1, 'a6f7e436', '04052020', 'GCC', 0, 1),
(00000457, 'Cu', 'Marlene', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000421, 'CuMarlene', '24c1f54fe09ee0c98b9ce2e63ee584cbae8c051a', 0, 0, 'Marlene Cu', '', 1, '11ea2532', '04062020', 'GCC', 0, 1),
(00000458, 'Sy', 'Chelsea', '', NULL, 'Imperial Sky Garden Condominium, 707 Ongpin St.', 'Binondo', 'Manila City', 'Metro Manila', '9053653648', '', 0, '', '99999999', 2, NULL, 00000017, 'SyChelsea', 'b790448441496d307df28e4b98b3eba6ba076a91', 0, 0, 'Chelsea Sy', '', 1, 'ac576a0a', '04062020', 'GCC', 0, 1),
(00000459, 'Bajandi', 'Amelita', '', NULL, 'Block 5 Lot 20 #36 Executive Homes 1, Cainta Green Park Village', '', 'Cainta', 'Rizal', '9159928987', '', 0, '', '99999999', 2, NULL, 00000390, 'BajandiAmelita', '8972e3526d8fc6123af467d9974fd4ce04733bce', 0, 0, 'Amelita Bajandi', '', 1, '1b4aab0e', '04072020', 'GCC', 0, 1),
(00000460, 'Babiera', 'Fil', '', NULL, '611 Consular Area Post Proper South Side', 'Fort Bonifacio', 'Taguig City', 'Metro Manila', '9279944563', '', 0, '', '99999999', 1, NULL, 00000419, 'BabieraFil', 'c9e4aaa44abe555accea631aac5eed8ef6b7c4fc', 0, 0, 'Fil Babiera', '', 1, 'c7e5895e', '04182020', 'GCC', 0, 1),
(00000461, 'Sinag', 'Myles', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000421, 'SinagMyles', 'e0cd896d8ca23af52aa14d588239794d6442edff', 0, 0, 'Myles Sinag', '', 1, '70f8485a', '04202020', 'GCC', 0, 1),
(00000462, 'Fernando', 'Andrew', '', NULL, 'Unit 5 Casa Francesca, Victoria Road', 'Brgy. San Miguel', 'Pasig City', 'Metro Manila', '9274114782', '', 0, '', '01241970', 1, NULL, 00000423, 'FernandoAndrew', 'f488e40444494cbdf3e1665dbf500cef1d52afa3', 0, 0, 'Andrew Fernando', '', 1, 'a9de0b57', '04242020', 'GCC', 0, 1),
(00000463, 'Lim', 'Godwin', '', NULL, '', '', 'San Juan City', 'Metro Manila', '', '', 0, '', '99999999', 1, NULL, 00000002, 'LimGodwin', '480c233d367f371c0abddf109ef2fd9c88e9cfed', 0, 0, 'Godwin Lim', '', 1, '1ec3ca53', '05072020', 'GCC', 0, 1),
(00000464, 'Pastera', 'Anne', '', NULL, '', '', '', '', '', '', 0, '', '99999999', 2, NULL, 00000421, 'PasteraAnne', '82a47957ceaffeb2b8ca2dfdbb13fb144661d9c8', 0, 0, 'Anne Pastera', '', 1, '1b938d4d', '05082020', 'GCC', 0, 1),
(00000465, 'Sandoval', 'Elizabeth', '', NULL, '29 B Calamba St. corner Mariveles', 'Brgy. Salvacion, La Loma', 'Quezon City', 'Metro Manila', '9338292627', '', 0, '', '99999999', 2, NULL, 00000390, 'SandovalElizabeth', '11a622ac6b6d9b507dbe504de60da9e3e844ed67', 0, 0, 'Elizabeth Sandoval', '', 1, 'ac8e4c49', '05292020', 'GCC', 0, 1),
(00000466, 'Gay', 'Ma. Lourdes', '', NULL, '413 Damayan St.', 'Bacood, Sta. Mesa', 'Manila City', 'Metro Manila', '9338612195', '', 0, '', '99999999', 2, NULL, 00000007, 'GayMalu', '1be9e8b4427247168d8e5ff2c64737b9eb6056f0', 0, 0, 'Ma. Lourdes Gay', '', 1, '75a80f44', '06072020', 'GCC', 0, 1),
(00000467, 'Lopez', 'Jorge Jr.', '', '', '', '', '', '', '', '', 0, '', '99999999', 1, '', 00000001, 'LopezJorge', 'fa414c33d26f4b138263a3d3bd18cf1b1234de18', 0, 0, 'Jorge Lopez Jr.', '', 1, 'c2b5ce40', '06182020', 'GCC', 0, 1),
(00000468, 'Sy', 'Jane', '', NULL, '', 'Montgomery', 'Quezon City', 'Metro Manila', '', '', 0, '', '99999999', 2, NULL, 00000423, 'SyJane', '4b713f5fd478ee0c310e3d5695326c8e517d41c9', 0, 0, 'Jane Sy', '', 1, '7f088178', '07072020', 'GCC', 0, 1),
(00000469, 'Marla', 'Ellen', '', NULL, 'Lot 13 Block 165 Avocado St.', 'Purok 2, New Lower Bicutan', 'Taguig City', 'Metro Manila', '9436915168', '', 0, '', '99999999', 2, NULL, 00000366, 'MarlaEllen', '557358ef8af9065608ee6a156f1772a06d7b82be', 0, 0, 'Ellen Marla', '', 1, 'c815407c', '07112020', 'GCC', 0, 1),
(00000470, 'Fuentes', 'Eduard', '', NULL, '', '', 'Davao City', 'Davao del Sur', '9261191572', '', 0, '', '99999999', 1, NULL, 00000416, 'FuentesEduard', '2c929b01717641f7ddcb6b2db4ab7202ea4abded', 0, 0, 'Eduard Fuentes', '', 1, '1b24908c', '07212020', 'GCC', 0, 1),
(00000471, 'Cu', 'Stephen', '', NULL, 'Ace Tower 1 Condominium, Banawe St.', '', 'Quezon City', 'Metro Manila', '', '', 0, '', '99999999', 1, NULL, 00000002, 'CuStephen', 'ecd5cda8af43c021fd7ae23375aec268e5196db7', 0, 0, 'Stephen Cu', '', 1, 'ac395188', '08042020', 'GCC', 0, 1),
(00000472, 'Chan', 'Michelle', '', NULL, '', '', 'Quezon City', 'Metro Manila', '', '', 0, '', '99999999', 2, NULL, 00000309, 'ChanMichelle', '5bc67fdc0705f4899f653c02f8797c3e24dcbd35', 0, 0, 'Michelle Chan', '', 1, '751f1285', '08042020', 'GCC', 0, 1),
(00000473, 'Lopez', 'Joel', '', NULL, '2J Majorca Tower, 70 Calle Industria', 'Libis', 'Quezon City', 'Metro Manila', '9175630625', '', 0, '', '99999999', 1, NULL, 00000002, 'LopezJoel', '9f1d1d546982d21e1fb28a9e472c3a8c5d85ca9b', 0, 0, 'Joel Lopez', '', 1, 'c202d381', '08042020', 'GCC', 0, 1),
(00000474, 'Ruste', 'Zigmund Patrick', '', NULL, 'Tsekwa Store, #5 cor. Aquarius & Saturn St.', 'GSIS, Matina', 'Davao City', 'Davao del Sur', '9566337124', '', 0, '', '99999999', 1, NULL, 00000002, 'RusteZigmund', '998972dc0acb629e21d0fef63a9888aebd562322', 0, 0, 'Zigmund Patrick Ruste', '', 1, 'c752949f', '08152020', 'GCC', 0, 1),
(00000475, 'Sy', 'Jinky', '', NULL, '247 Dao Street', 'Marikina Heights', 'Marikina City', 'Metro Manila', '9173022851', '', 0, '', '99999999', 2, NULL, 00000002, 'SyJinky', '31f5f1ac73ffa2284904f87a93aa286f7bc17be4', 0, 0, 'Jinky Sy', '', 1, '704f559b', '08222020', 'GCC', 0, 1),
(00000476, 'Castillo', 'Norma', '', NULL, 'Block 4 Lot 4 Buena Perlas 2', 'Brgy. Labas', 'Sta. Rosa', 'Laguna', '9179822566', '', 0, '', '99999999', 2, NULL, 00000002, 'CastilloNorma', '0c37a1689bbde1110fcc86f9d7dff78ee839a4a9', 0, 0, 'Norma Castillo', '', 1, 'a9691696', '08242020', 'GCC', 0, 1),
(00000477, 'Fernando', 'Norvie', '', NULL, '', '', 'Odiongan', 'Romblon', '9206223465', '', 0, '', '99999999', 1, NULL, 00000002, 'FernandoNorvie', 'dbf468ddae39b395f71548e2eaa0a62fbbefa421', 0, 0, 'Norvie Fernando', '', 1, '1e74d792', '08282020', 'GCC', 0, 1),
(00000478, 'Yu', 'Andy', '', NULL, '', '', 'Quezon City', 'Metro Manila', '', '', 0, '', '99999999', 1, NULL, 00000017, 'YuAndy', 'd4104fac480a73acded22893e65d12e241921c10', 0, 0, 'Andy Yu', '', 1, 'a3c998aa', '09142020', 'GCC', 0, 1),
(00000479, 'Baguios', 'Jenelyn', 'Perez', NULL, '1631 Bulacan Street', 'Brgy. 382, Sta. Cruz', 'Manila City', 'Metro Manila', '09683793000', 'jenelynperez1997@gmail.com', 0, '', '09161997', 2, NULL, 00000001, 'BaguiosJenelyn', '75df5f0e64670d824f10e79b52edbdd86e903fcd', 0, 0, 'Jenelyn Baguios', '', 1, '14d459ae', '02222021', 'GCC', 0, 1),
(00000480, 'Go', 'Marilyn', 'Sy', NULL, 'Room 1003 S Tower, 1630 Jose Abad Santos Avenue', 'Tondo', 'Manila City', 'Metro Manila', '09178496383', '', 0, '', '03222021', 2, NULL, 00000002, 'GoMarilyn', NULL, 0, 0, '', '', 1, '280530f8', '03192018', 'grace', 0, 1),
(00000481, 'Taduan', 'Mary Anne', 'Oropel', '', '6023 Benito Hao St.', 'Mapulang Lupa', 'Valenzuela City', 'Metro Manila', '09360332500', '', 0, '', '07141986', 2, '', 00000424, 'TaduanMaryAnne', '1ba7eb0915d652eb97cc751129d410cff8ad3da1', 0, 0, '', '', 1, '62f98a67', '03072021', 'grace', 0, 1),
(00000482, 'Herrera', 'Crystal Joice', 'Aranas', '', 'Block 2 Lot 3 Perpetual Heights Subdivision', 'Sindalan', 'San Fernando City', 'Pampanga', '09175122117', 'crystaljoiceherrera@gmail.com', 0, '', '12121991', 2, '', 00000309, 'HerreraCrystal', '1f1c3c804573e53759cbc8be51f900028ea5050a', 0, 0, '', '', 1, 'fd7f5d03', '03272021', 'grace', 0, 1),
(00000483, 'Wong', 'Rennie', '', '', '17 25th Street', 'East Bajac', 'Olongapo City', 'Zambales', '09989987725', '', 0, '', '01011970', 1, '', 00000002, 'WongRennie', '69ae5abb9a13de622351396a896f36813cc1c39e', 0, 0, '', '', 4, '6bd3400e', '04162021', 'grace', 0, 1),
(00000484, 'Torres', 'Leoniwil', '', '', '', '', 'General Santos City', 'South Cotabato', '', '', 0, '', '12301961', 2, '', 00000394, 'TorresLeoniwil', 'aad2561418e676b59f2d218b78088dcd6862a5e0', 0, 0, '', '', 1, '7021b178', '04242021', 'grace', 0, 1),
(00000486, 'Diaz', 'Lory Joy', 'Belarde', '', '9223 Leonardo Bldg., Cluster 2, Spagio Berrardo Condominium, Champaca St.', 'Brgy. Sauyo', 'Quezon City', 'Metro Manila', '09163621734', 'diazloryjoy@yahoo.com', 0, '', '08011977', 2, '', 00000001, 'DiazLory', '6cb9939ba6c634ab6babb80634b9b1c0fa8d768f', 0, 0, '', '', 1, 'dd99dc14', '06112021', 'grace', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `for_encoding`
--

CREATE TABLE `for_encoding` (
  `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `dslnam` varchar(255) DEFAULT NULL,
  `dsfnam` varchar(255) NOT NULL,
  `dsmnam` varchar(255) DEFAULT NULL,
  `dsmother` varchar(64) DEFAULT NULL,
  `dsstreet` varchar(255) NOT NULL,
  `dsbrgy` varchar(255) NOT NULL,
  `dscity` varchar(255) NOT NULL,
  `dsprov` varchar(255) NOT NULL,
  `dscontact` varchar(32) DEFAULT NULL,
  `dsemail` varchar(64) DEFAULT NULL,
  `dsemail_confirm` tinyint(1) NOT NULL DEFAULT '0',
  `dsfb` varchar(64) DEFAULT NULL,
  `dsbirth` varchar(8) NOT NULL,
  `dssex` tinyint(1) NOT NULL DEFAULT '0',
  `dstin` text,
  `dssid` int(8) UNSIGNED ZEROFILL NOT NULL,
  `un` varchar(64) DEFAULT NULL,
  `pw` varchar(64) DEFAULT NULL,
  `payout` tinyint(1) DEFAULT '0',
  `pay_type` tinyint(1) NOT NULL DEFAULT '0',
  `pay_name` varchar(64) DEFAULT NULL,
  `pay_acct` varchar(32) DEFAULT NULL,
  `dsmtype` tinyint(1) DEFAULT '0',
  `discount` varchar(8) DEFAULT NULL,
  `dsencoded` varchar(8) DEFAULT NULL,
  `dsencodedby` varchar(64) DEFAULT NULL,
  `withheld` tinyint(1) NOT NULL DEFAULT '0',
  `dsstatus` int(8) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `for_encoding`
--

INSERT INTO `for_encoding` (`dsdid`, `dslnam`, `dsfnam`, `dsmnam`, `dsmother`, `dsstreet`, `dsbrgy`, `dscity`, `dsprov`, `dscontact`, `dsemail`, `dsemail_confirm`, `dsfb`, `dsbirth`, `dssex`, `dstin`, `dssid`, `un`, `pw`, `payout`, `pay_type`, `pay_name`, `pay_acct`, `dsmtype`, `discount`, `dsencoded`, `dsencodedby`, `withheld`, `dsstatus`) VALUES
(00000483, 'Wong', 'Rennie', NULL, NULL, '', '', '', '', NULL, NULL, 0, NULL, '', 0, NULL, 00000002, NULL, NULL, 0, 0, NULL, NULL, 4, NULL, '04162021', 'grace', 0, 4),
(00000486, 'Gadon', 'Ludmilla', 'Bo', 'Angelica Bea', '49 northlane st greymarville subd', 'Talon dos', 'Las Pinas City', 'Tabaco Albay', '09159425894', 'ludy_lgm@yahoo.com', 0, 'Ludmilla Bo', '07181962', 0, '', 00000434, 'LUDYG', '30ca3e55b2b7300b4cf23532180d571e14152080', 3, 0, 'Ludmilla B Gadon', '002400031181', 4, '37489131', '07152021', 'grace', 0, NULL),
(00000487, 'Narvaez', 'Ernesto', 'Lumaquin', 'Trinidad F. Lumaquin', '1187 Carola St.', 'Brgy. 480', 'Manila', 'Metro Manila', '09420426071', 'renarvaez2021@gmail.com', 0, 'narvaez.ernesto.90', '02231975', 1, '151446067', 00000410, 'NarvaezErnesto', '34e599f9b08720eb393b40f93594c1b43866196d', 2, 0, '', '', 4, '90710319', '07222021', 'grace', 0, 0),
(00000488, 'Chan', 'Maeva', 'Sy', 'Mae Yu', '94 M.L. Quezon St', 'Parang', 'Marikina', 'Metro-Manila', '09176208866', 'maevachan@yahoo.com.sg', 0, '', '04011964', 2, '', 00000002, 'Maeva', '48b1bfe0405785b965d94b1d19b0b0050b66a452', 0, 1, 'Maeva Sy Chan', '', 4, 'isvoid', '08072021', 'grace', 0, 19),
(00000489, 'Young', 'Karisse', 'Ang', 'Lim song', 'President M Roxas street', 'Industrial Valley', 'Marikina City', 'METRO MANILA', '09178485812', 'karisse88@yahoo.com', 0, 'Karisse Ang', '08072021', 2, '', 00000002, 'Karisse21', 'd328cde91051fb191bb8f7e68bd114a8c44435df', 4, 1, '', '', 4, 'd89c129f', '08072021', 'grace', 0, 0),
(00000490, 'Paua', 'Muriel', 'Bea', 'CariÃ±o', '442 Zaragosa St Tondo Manila', '1', 'Manila', 'Tondo Manila', '09498414992', 'murielbea3@gmail.com', 0, 'Muriel Bea', '08222021', 2, 'None', 00000434, 'Beamuriel', '7dde163305343b957439d2aae08c65b910b4bd56', 3, 0, 'Muriel Paua', '001590015213', 4, 'c992a8f8', '08232021', 'grace', 0, 0),
(00000999, 'Hungria', 'Maricel', 'Caldino', 'Aparecion Bea', 'B7 L25 Pedro Sabido', 'BF Vista Grande', 'Talon 2 Las Pinas City', 'NCR', '09193518309', 'celhungria@yahoo.com', 0, 'Maricel Hungria', '10112021', 2, '', 00000434, 'Maricel', '6291eb016fb499c526008ecd5f6de5a7b33e0e93', 0, 1, '', '', 4, '76b02921', NULL, NULL, 0, NULL),
(00000491, 'Trivino', 'Cheryll Anne', 'Tallud', 'Thelma Carag Tallud', '38 Rafael Palma st. PDP executive village', 'BF Homes', 'ParaÃ±aque', 'Metro Manila', '09189390704', 'chetrivino@gmail.com', 0, '', '02141978', 2, '', 00000429, 'Chetrivino', '8e94fa63a5d817f6e5b4a552456b15f9d1dc4098', 0, 1, 'Cheryll Anne TriviÃ±o', '', 4, '', '12112021', 'grace', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(5) NOT NULL,
  `name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `items` text COLLATE utf8_unicode_ci,
  `price` float NOT NULL DEFAULT '0',
  `pov` float NOT NULL DEFAULT '0',
  `referral` float NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `name`, `items`, `price`, `pov`, `referral`, `status`) VALUES
(77777, 'Share&Care:C3Plus', '88802:5\r\n88832:1', 2900, 0, 250, 0),
(77779, 'Share&Care:C-Grace', '88909:5\r\n88908:1', 2000, 0, 170, 1),
(86501, 'Dreamer:NPapaya', '88811:5', 650, 0, 100, 1),
(86510, 'FastTrack:Lucky9s', '88832:2\r\n88836:2\r\n88837:2\r\n88834:2\r\n88833:2\r\n88835:2\r\n88811:1\r\n88806:1\r\n88888:1', 3500, 0, 300, 1);

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
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `short`, `wsp`, `srp`, `web_srp`, `pov`, `sort_order`, `status`) VALUES
(77726, 'Fish Oil 1200mg (60 softgels)', 'FOil60s', '1360.00', '1700.00', '1888.00', '1360.00', 111, 1),
(77729, 'Fish Oil 1200mg (30 softgels)', 'FOil30s', '688.00', '860.00', '955.00', '688.00', 112, 1),
(77778, 'S&C: C3Plus (60 cap)', 'C3Plus60sS&C', '464.00', '0.00', '0.00', '0.00', 1001, 0),
(77780, 'S&C: C-Grace (60 cap)', 'CGrace60sS&C', '320.00', '0.00', '0.00', '0.00', 1, 1),
(79824, 'Pure Garlic 500mg (30 cap)', 'PureGarlic30s', '620.00', '775.00', '861.00', '620.00', 122, 1),
(79825, 'Pure Garlic 500mg (60 cap)', 'PureGarlic60s', '1224.00', '1530.00', '1700.00', '1224.00', 121, 1),
(79827, 'Spirulina 250mg (100 tab)', 'mSpirulina100s', '680.00', '850.00', '944.00', '680.00', 62, 1),
(79828, 'Spirulina 250mg (300 tab)', 'mSpirulina300s', '2040.00', '2550.00', '2833.00', '2040.00', 61, 1),
(79831, 'TD30 (30 ml)', 'TD30030', '316.00', '395.00', '438.00', '316.00', 457, 1),
(79832, 'TD30 (60 ml)', 'TD30060', '556.00', '695.00', '772.00', '556.00', 456, 1),
(79834, 'Respimask S (3 pcs)', 'RespiS', '180.00', '225.00', '250.00', '0.00', 452, 1),
(79835, 'Respimask S+ (3 pcs)', 'RespiS+', '180.00', '225.00', '250.00', '0.00', 453, 1),
(79836, 'Respimask M (5 pcs)', 'RespiM', '300.00', '375.00', '416.00', '0.00', 454, 1),
(79837, 'Respimask L (5 pcs)', 'RespiL', '300.00', '375.00', '416.00', '0.00', 455, 1),
(79838, 'Energy Saver (Centralized) (1 pc)', 'ESCentral', '4000.00', '5000.00', '5555.00', '0.00', 345, 1),
(79839, 'Energy Saver (Direct Heat) (1 pc)', 'ESDHeat', '4000.00', '5000.00', '5555.00', '0.00', 346, 1),
(79840, 'Energy Saver (Centralized + Direct Heat + free single Electric Stove) (1 bundle)', 'ESBundle', '8000.00', '10000.00', '11111.00', '0.00', 347, 1),
(88802, 'C3Plus (60 cap)', 'C3+60s', '464.00', '580.00', '644.00', '464.00', 1053, 0),
(88803, 'C3Plus (300 cap)', 'C3+300s', '2200.00', '2750.00', '3055.00', '2200.00', 1051, 0),
(88805, 'Papaya Soap (2 bar)', 'Papaya', '132.00', '165.00', '183.00', '132.00', 1350, 0),
(88806, 'Papaya Soap Travel Size (6 pcs)', 'PapayaTS', '100.00', '125.00', '138.00', '100.00', 351, 1),
(88808, 'Sodium Ascorbate 12g (3 sachets)', 'DSMSVC12g3s', '464.00', '580.00', '644.00', '464.00', 1032, 0),
(88809, 'Sodium Ascorbate 12g (15 sachets)', 'DSMSVC12g15s', '2200.00', '2750.00', '3055.00', '2200.00', 1031, 0),
(88811, 'Natural Papaya Soap (1 bar)', 'NPapaya', '132.00', '165.00', '183.00', '132.00', 349, 1),
(88812, 'Mangosteen Pericarp (300 cap)', 'Mangosteen300s', '2640.00', '3300.00', '3666.00', '2640.00', 181, 1),
(88820, 'Mangosteen Pericarp (60 cap)', 'Mangosteen60s', '552.00', '690.00', '766.00', '552.00', 182, 1),
(88823, 'Moringa (300 cap)', 'Moringa300s', '1960.00', '2450.00', '2722.00', '1960.00', 184, 1),
(88824, 'Moringa (60 cap)', 'Moringa60s', '416.00', '520.00', '577.00', '416.00', 185, 1),
(88825, 'Turmerin (300 cap)', 'Turmerin300s', '2280.00', '2850.00', '3166.00', '2280.00', 252, 1),
(88826, 'Turmerin (60 cap)', 'Turmerin60s', '480.00', '600.00', '666.00', '480.00', 253, 1),
(88827, 'Momordica Charantia (60 cap)', 'Charantia60s', '480.00', '600.00', '666.00', '480.00', 95, 1),
(88828, 'Guajava (60 cap)', 'Guajava60s', '504.00', '630.00', '700.00', '504.00', 127, 1),
(88829, 'Momordica Charantia (300 cap)', 'Charantia300s', '2280.00', '2850.00', '3166.00', '2280.00', 94, 1),
(88831, 'Guajava (300 cap)', 'Guajava300s', '2400.00', '3000.00', '3333.00', '2400.00', 126, 1),
(88832, 'C3Plus (30 cap)', 'C3+30s', '240.00', '300.00', '333.00', '240.00', 1054, 0),
(88833, 'Moringa (30 cap)', 'Moringa30s', '216.00', '270.00', '300.00', '216.00', 186, 1),
(88834, 'Mangosteen Pericarp (30 cap)', 'Mangosteen30s', '292.00', '365.00', '405.00', '292.00', 183, 1),
(88835, 'Turmerin (30 cap)', 'Turmerin30s', '256.00', '320.00', '355.00', '256.00', 254, 1),
(88836, 'Momordica Charantia (30 cap)', 'Charantia30s', '256.00', '320.00', '355.00', '256.00', 96, 1),
(88837, 'Guajava (30 cap)', 'Guajava30s', '268.00', '335.00', '372.00', '268.00', 128, 1),
(88838, 'C3Plus (100 cap)', 'C3+100s', '768.00', '960.00', '1066.00', '768.00', 1052, 0),
(88844, 'Colostrum (30 cap)', 'Colostrum30', '480.00', '600.00', '666.00', '480.00', 97, 1),
(88851, 'Sodium Ascorbate 3g (10 sachets)', 'SA3g10s', '464.00', '580.00', '644.00', '464.00', 1042, 0),
(88854, 'Sodium Ascorbate 3g (60 sachets)', 'SA3g60s', '2200.00', '2750.00', '3055.00', '2200.00', 1041, 0),
(88857, 'Graviola (30 cap)', 'Graviola30s', '264.00', '330.00', '366.00', '264.00', 125, 1),
(88858, 'Graviola (60 cap)', 'Graviola60s', '488.00', '610.00', '677.00', '488.00', 124, 1),
(88859, 'Graviola (300 cap)', 'Graviola300s', '2360.00', '2950.00', '3277.00', '2360.00', 123, 1),
(88860, 'Piperine (30 cap)', 'Piperine30s', '400.00', '500.00', '555.00', '400.00', 1211, 0),
(88866, 'Tongkat Ali (30 cap)', 'Tongkat30s', '480.00', '600.00', '666.00', '480.00', 251, 1),
(88873, 'Carica Papaya (30 cap)', 'Carica30s', '276.00', '345.00', '383.00', '276.00', 93, 1),
(88874, 'Carica Papaya (60 cap)', 'Carica60s', '544.00', '680.00', '755.00', '544.00', 92, 1),
(88875, 'Carica Papaya (300 cap)', 'Carica300s', '2600.00', '3250.00', '3611.00', '2600.00', 91, 1),
(88876, 'Colostrum (30 tab)', 'Colostrum30', '960.00', '1200.00', '1333.00', '960.00', 1087, 0),
(88882, 'Lucky 45 all-in-one coffee (5 sachets)', 'Lucky45v1box', '172.00', '265.00', '0.00', '172.00', 1071, 0),
(88888, 'Scalar Energy Stickers (1 pc)', 'Scalar', '150.00', '187.50', '208.00', '150.00', 348, 1),
(88893, 'Zingiber (30 cap)', 'Zingiber30s', '256.00', '320.00', '355.00', '256.00', 303, 1),
(88894, 'Zingiber (60 cap)', 'Zingiber60s', '496.00', '620.00', '688.00', '496.00', 302, 1),
(88895, 'Zingiber (300 cap)', 'Zingiber300s', '2360.00', '2950.00', '3277.00', '2360.00', 301, 1),
(88896, 'Lucky 45 all-in-one coffee (10 sachets)', 'Lucky45v1box', '200.00', '265.00', '294.00', '200.00', 71, 1),
(88897, 'Zingiber Tea (21 sachets)', 'ZingiberTea21s', '1680.00', '2100.00', '2333.00', '1680.00', 304, 1),
(88901, 'Sodium Ascorbate 12g (3 sachets)', 'DSMSVC12g3s', '320.00', '400.00', '444.00', '320.00', 32, 1),
(88902, 'Sodium Ascorbate 12g (15 sachets)', 'DSMSVC12g15s', '1480.00', '1850.00', '2055.00', '1480.00', 31, 1),
(88904, 'Sodium Ascorbate 3g (10 sachets)', 'SA3g10s', '320.00', '400.00', '444.00', '320.00', 42, 1),
(88905, 'Sodium Ascorbate 3g (60 sachets)', 'SA3g60s', '1480.00', '1850.00', '2055.00', '1480.00', 41, 1),
(88908, 'C-Grace (30 cap)', 'CG30s', '168.00', '210.00', '233.00', '168.00', 54, 1),
(88909, 'C-Grace (60 cap)', 'CG60s', '320.00', '400.00', '444.00', '320.00', 53, 1),
(88910, 'C-Grace (100 cap)', 'CG100s', '520.00', '650.00', '722.00', '520.00', 52, 0),
(88911, 'C-Grace (300 cap)', 'CG300s', '1480.00', '1850.00', '2055.00', '1480.00', 51, 1),
(88912, 'Vitamin D3 (75 softgels)', 'VitD375', '440.00', '550.00', '611.00', '440.00', 101, 1),
(88914, 'Persea Americana (30 cap)', 'Avocado30s', '224.00', '280.00', '311.00', '224.00', 83, 1),
(88915, 'Persea Americana (60 cap)', 'Avocado60s', '432.00', '540.00', '600.00', '432.00', 82, 1),
(88916, 'Persea Americana (300 cap)', 'Avocado300s', '2040.00', '2550.00', '2833.00', '2040.00', 81, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `dataset` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `dataset`) VALUES
('admin_reload', '15'),
('discount', '10'),
('min_pov', '400'),
('min_raffle', '0'),
('min_stockist', '10000'),
('min_withdraw', '1000'),
('pay_options', 'None,Cash,BPI,BDO,GCash'),
('pct_stockist', '0,3,5,7\r\n'),
('unilevel', '0,10,5,3,2,1');

-- --------------------------------------------------------

--
-- Table structure for table `stockist`
--

CREATE TABLE `stockist` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `pw` text,
  `warehouse` varchar(32) DEFAULT NULL,
  `oic` varchar(64) NOT NULL DEFAULT 'N/A',
  `upline` int(8) UNSIGNED ZEROFILL DEFAULT NULL,
  `receiver` varchar(32) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `address` text,
  `courier` varchar(32) DEFAULT NULL,
  `partners` text,
  `start_date` varchar(8) DEFAULT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stockist`
--

INSERT INTO `stockist` (`id`, `pw`, `warehouse`, `oic`, `upline`, `receiver`, `contact`, `address`, `courier`, `partners`, `start_date`, `level`, `status`) VALUES
(00000001, '469217f01c7c78206ea35605b264303cc10455c8', 'Head Office', '00000000', NULL, 'Grace Co', '09175357033', '35 Calvary Hill Street', '', NULL, '09112017', 0, 1),
(00000002, '0e788ad5cdd23b04987388905aaad84eb17ff3d5', 'GALVEZ Maryam', '00000024', 00000000, 'Maryam Galvez or Estelita Baclaa', '09237402148', 'LBC GT Town Center, Pavia, Iloilo 5001', 'LBC', '00000003\r\n00000007\r\n00000010', '12192017', 4, 1),
(00000003, '0e788ad5cdd23b04987388905aaad84eb17ff3d5', 'AL-WAHAIBI Jean', '00000031', 00000000, 'Jean Al-wahaibi', '', 'Iloilo City', 'c/o Maryam', '00000002', '12132017', 3, 1),
(00000004, '0e6cec65116438fc3ea6f58ce8532ccd5454b4e3', 'OQUIN Joyce Anne', '00000058', 00000000, 'Joyce Anne Oquin', '09271395259', 'Malabon City', 'pick-up', '', '03012018', 4, 1),
(00000005, '0e6cec65116438fc3ea6f58ce8532ccd5454b4e3', 'NEMENZO Lhou', '00000013', 00000000, 'Ma. Lourdes Nemenzo', '', '', 'pick-up', '00000008\r\n00000011', '05292018', 3, 0),
(00000007, '96b441e21bd7ef3ff9ce27a593f4d44cbe34dbfa', 'IGBANTE Jocelyn', '00000250', 00000000, 'Jocelyn Igbante', '', 'Iloilo City', 'c/o Maryam Galvez', '00000002', '08272018', 3, 1),
(00000008, '88a5bbfec5f5bd92bc176ff3c972b4b08c56409c', 'PIO Erica', '00000354', 00000000, 'Erica Pio', '', 'Cagayan Valley', '', '', '09042018', 3, 1),
(00000009, 'c9af5f7cfb8715aa48f429df0c9f5956a4842bf0', 'ARELA Coco', '00000169', 00000000, 'Ofelia', '09217760762', 'Cavite City', '', '', '09172018', 3, 1),
(00000010, 'bbe3a0bf6ab160b9325279857c873e0ee719e910', 'ASTORGA Maricar', '00000080', 00000000, 'Maricar Astorga', '', 'Iloilo City', 'c/o Maryam Galvez', '00000002', '09182018', 3, 0),
(00000011, '4547478c6e74a156c5649841d4825dfc4733b518', 'ALOG Chrizel', '00000359', 00000000, 'Chrizel Rumbaoa Alog', '', 'Cagayan Valley', '', '00000005\r\n00000008', '10312018', 3, 0),
(00000012, '7f6dcc1e1c9814b9145356e95ea3cebf58e95745', 'IPO', '00000000', NULL, 'IPO', '', 'Unit 509 Integrated Professional Offices, #14 Quezon Avenue, Quezon City', '', NULL, '01032019', 1, 1),
(00000000, '25f453314b13e4a942f34fcf03838009d9c888c0', 'TEST', '00000000', NULL, 'TEST', NULL, NULL, '', NULL, '', 0, 1),
(00000013, 'e05910c5834029e4ae616e59c3ca728393e1b8d4', 'GAMARCHA Luzbel', '00000376', 00000000, 'Luzbel Gamarcha', '', 'Cavite City', '', '00000014', '06012019', 4, 0),
(00000014, '89d278ffca591c07788bbe4a5be24a47eb5beb61', 'BUENAFE Millet', '00000391', 00000000, 'Virginia', '', 'Tagaytay City', '', '00000013', '06012019', 2, 1),
(00000006, 'ab786ce2907f9a98e2734437dea740efd6b38aa8', 'QUIMQUE Mercy', '00000328', 00000000, 'Mercy Quimque', '', 'Benguet', 'Victory Liner', '', '07032018', 3, 0),
(00000016, '7509f29a96798fe756c48dd2ed84f54edbf5eca7', 'BENITEZ Marife', '00000369', 00000000, 'Catalina Benitez', '09096450217', 'No. 79 National Road, Talimundoc, Orani, Bataan 2112', 'LBC', '00000015', '08052019', 2, 1),
(00000018, '5e7317cc0ac1bd94c1a141dcc828643a3946f36f', 'ANG Arlene', '00000419', 00000000, 'Arlene Ang', '09177066884', 'Unit 1411 Altiva Bldg., Cypress Towers, C5 Road, Taguig City', 'Grab', '00000015', '02252020', 2, 1),
(00000015, '5e7317cc0ac1bd94c1a141dcc828643a3946f36f', 'QUITAY Lorelee', '00000007', 00000000, 'Ma. Lorelee Quitay', '09279345041', '37 Camachile St., Western Bicutan, Taguig City', 'Grab', '00000016\r\n00000018', '08052019', 4, 1),
(00000020, 'b07d04a4fb72dfb2b83e38f3b154e643f6a93fd9', 'CHAN Michelle', '00000472', 00000000, 'Michelle Chan', '', 'Quezon City', '', '', '08262020', 1, 1),
(00000017, '447eb8fbf0bf78721f03c686a09cee28271dae35', 'TEE Ryan', '00000412', 00000001, 'Joanna Tee', '', '134-A Hoover St., City of San Juan', '', '00000019', '02072020', 3, 1),
(00000019, '447eb8fbf0bf78721f03c686a09cee28271dae35', 'CHUA Shirley', '00000423', 00000001, 'Shirley Chua', '', '134-A Hoover St., City of San Juan', '', '00000017', '03202020', 1, 1),
(00000021, '769a222f35aa4d3046dc358c7d05fd97e3340147', 'GANDIONCO Ross', '00000394', 00000000, 'Rosita Gandionco', '', 'Gen. Santos City', 'CaPEx', '00000022\r\n00000023', '09012020', 3, 1),
(00000022, '98e3a8747ac2327c2a0e5d2169f527ad9cec8c7f', 'AMPER Hycie', '00000436', 00000000, 'Hycie Amper', '', 'Davao City', '', '00000021', '01032021', 2, 1),
(00000023, 'c0ce39157c3ee25289e43b7794248c994bb27f10', 'EMPENIDA Rebecca', '00000442', 00000000, 'Rebecca Empenida', '', 'Gen. Santos City', '', '00000021', '03012021', 1, 1),
(00000024, '7a142662134ca5133f9e16ff3d1f2c1932fbf615', 'TADUAN Zaldy', '00000481', 00000000, 'Rizaldy Taduan', '', 'Valenzuela City', '', '', '05012021', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `stockist1`
--

CREATE TABLE `stockist1` (
  `id` int(8) UNSIGNED ZEROFILL NOT NULL,
  `pw` text,
  `warehouse` varchar(32) DEFAULT NULL,
  `oic` varchar(64) NOT NULL DEFAULT 'N/A',
  `receiver` varchar(32) DEFAULT NULL,
  `contact` varchar(32) DEFAULT NULL,
  `address` text,
  `courier` varchar(32) DEFAULT NULL,
  `partners` text,
  `start_date` varchar(8) DEFAULT NULL,
  `level` tinyint(1) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `stockist1`
--

INSERT INTO `stockist1` (`id`, `pw`, `warehouse`, `oic`, `receiver`, `contact`, `address`, `courier`, `partners`, `start_date`, `level`, `status`) VALUES
(00000001, '7895d14502db688707fe8d3385a0aab1d762900a', 'Head Office', '00000000', 'Grace Co', '09175357033', '35 Calvary Hill Street', '', NULL, '09112017', 0, 1),
(00000002, '040302cf8aa11a8ed8b0fbae998b14f182aee267', 'Iloilo Maryam', '00000024', 'Maryam Galvez or Estelita Baclaa', '09237402148', 'LBC GT Town Center, Pavia, Iloilo 5001', 'LBC', NULL, '12192017', 4, 1),
(00000003, '0e788ad5cdd23b04987388905aaad84eb17ff3d5', 'Jean Al-wahaibi', '00000031', 'Jean Al-wahaibi', '', 'Iloilo City', 'c/o Maryam', NULL, '12132017', 3, 1),
(00000004, '6430895da563d65fba8ca46a7aea5f8c6ab69851', 'Joyce Anne Oquin', '00000058', 'Joyce Anne Oquin', '09271395259', 'Malabon City', 'pick-up', NULL, '03012018', 4, 1),
(00000005, '0e6cec65116438fc3ea6f58ce8532ccd5454b4e3', 'Lhou Nemenzo', '00000013', 'Ma. Lourdes Nemenzo', '', '', 'pick-up', NULL, '05292018', 3, 0),
(00000007, '96b441e21bd7ef3ff9ce27a593f4d44cbe34dbfa', 'Jocelyn Igbante', '00000250', 'Jocelyn Igbante', '', 'Iloilo City', 'c/o Maryam Galvez', NULL, '08272018', 3, 1),
(00000008, '88a5bbfec5f5bd92bc176ff3c972b4b08c56409c', 'Erica Pio', '00000354', 'Erica Pio', '', 'Cagayan Valley', '', NULL, '09042018', 3, 1),
(00000009, 'c9af5f7cfb8715aa48f429df0c9f5956a4842bf0', 'Coco Arela', '00000169', 'Ofelia \"Coco\" Arela', '09217760762', 'Cavite City', '', NULL, '09172018', 3, 1),
(00000010, 'bbe3a0bf6ab160b9325279857c873e0ee719e910', 'Maricar Astorga', '00000080', 'Maricar Astorga', '', 'Iloilo City', 'c/o Maryam Galvez', NULL, '09182018', 3, 0),
(00000011, '4547478c6e74a156c5649841d4825dfc4733b518', 'Chrizel Alog', '00000359', 'Chrizel Rumbaoa Alog', '', 'Cagayan Valley', '', NULL, '10312018', 3, 0),
(00000012, '7f6dcc1e1c9814b9145356e95ea3cebf58e95745', 'IPO', '00000000', 'IPO', '', 'Unit 509 Integrated Professional Offices, #14 Quezon Avenue, Quezon City', '', NULL, '01032019', 1, 1),
(00000000, '25f453314b13e4a942f34fcf03838009d9c888c0', 'TEST', '00000000', 'TEST', NULL, NULL, '', NULL, '', 0, 1),
(00000013, 'e05910c5834029e4ae616e59c3ca728393e1b8d4', 'Luzbel', '00000376', 'Luzbel Gamarcha', '', 'Cavite City', '', NULL, '06012019', 4, 0),
(00000014, '89d278ffca591c07788bbe4a5be24a47eb5beb61', 'Millet Buenafe', '00000391', 'Virginia \"Millet\" Buenafe', '', 'Tagaytay City', '', NULL, '06012019', 2, 1),
(00000006, 'ab786ce2907f9a98e2734437dea740efd6b38aa8', 'Mercy Quimque', '00000328', 'Mercy Quimque', '', 'Benguet', 'Victory Liner', NULL, '07032018', 3, 0),
(00000016, '7509f29a96798fe756c48dd2ed84f54edbf5eca7', 'Marife Benitez', '00000369', 'Catalina Benitez', '09096450217', 'No. 79 National Road, Talimundoc, Orani, Bataan 2112', 'LBC', NULL, '08052019', 2, 1),
(00000018, 'a31ef5dc0640b8afab27459e758715a15bebc43a', 'Arlene Ang', '00000419', 'Arlene Ang', '09177066884', 'Unit 1411 Altiva Bldg., Cypress Towers, C5 Road, Taguig City', 'Grab', NULL, '02252020', 2, 1),
(00000015, '5e7317cc0ac1bd94c1a141dcc828643a3946f36f', 'Lorelee Quitay', '00000007', 'Ma. Lorelee Quitay', '09279345041', '37 Camachile St., Western Bicutan, Taguig City', 'Grab', NULL, '08052019', 4, 1),
(00000020, '5e7317cc0ac1bd94c1a141dcc828643a3946f36f', 'Michelle Chan', '00000472', 'Michelle Chan', '', 'Quezon City', '', NULL, '08262020', 1, 1),
(00000017, '447eb8fbf0bf78721f03c686a09cee28271dae35', 'Ryan Tee', '00000412', 'Joanna Tee', '', 'Wilson Street, San Juan City', '', NULL, '02072020', 3, 1),
(00000019, 'b07d04a4fb72dfb2b83e38f3b154e643f6a93fd9', 'NMla Shirley', '00000423', 'Shirley Chua', '', '35 Calvary Hill Street, Quezon City', '', NULL, '03202020', 1, 1),
(00000021, '769a222f35aa4d3046dc358c7d05fd97e3340147', 'Ross Gandionco', '00000394', 'Rosita Gandionco', '', 'Gen. Santos City', 'CaPEx', NULL, '09012020', 3, 1),
(00000022, '98e3a8747ac2327c2a0e5d2169f527ad9cec8c7f', 'Hycie Amper', '00000436', 'Hycie Amper', '', 'Davao City', '', NULL, '01032021', 2, 1),
(00000023, 'c0ce39157c3ee25289e43b7794248c994bb27f10', 'Rebecca Empenida', '00000442', 'Rebecca Empenida', '', 'Gen. Santos City', '', NULL, '03012021', 1, 1),
(00000024, '7a142662134ca5133f9e16ff3d1f2c1932fbf615', 'Zaldy Taduan', '00000481', 'Rizaldy Taduan', '', 'Valenzuela City', '', NULL, '05012021', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bonuses`
--
ALTER TABLE `bonuses`
  ADD PRIMARY KEY (`dsdid`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `distributors`
--
ALTER TABLE `distributors`
  ADD PRIMARY KEY (`dsdid`);

--
-- Indexes for table `distributors1`
--
ALTER TABLE `distributors1`
  ADD PRIMARY KEY (`dsdid`);

--
-- Indexes for table `for_encoding`
--
ALTER TABLE `for_encoding`
  ADD PRIMARY KEY (`dsdid`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `stockist`
--
ALTER TABLE `stockist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockist1`
--
ALTER TABLE `stockist1`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `distributors`
--
ALTER TABLE `distributors`
  MODIFY `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1001;

--
-- AUTO_INCREMENT for table `distributors1`
--
ALTER TABLE `distributors1`
  MODIFY `dsdid` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=487;

--
-- AUTO_INCREMENT for table `stockist`
--
ALTER TABLE `stockist`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `stockist1`
--
ALTER TABLE `stockist1`
  MODIFY `id` int(8) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
