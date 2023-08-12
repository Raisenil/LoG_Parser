-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 12, 2023 at 04:05 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `log_parser`
--

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `Timestamp` varchar(255) NOT NULL,
  `Request_Name` varchar(100) NOT NULL,
  `Status` varchar(100) NOT NULL,
  `Count` int(255) NOT NULL,
  `Host_Name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`id`, `Timestamp`, `Request_Name`, `Status`, `Count`, `Host_Name`) VALUES
(81, '2023-08-12 20:03:38', 'GET', '301', 36, 'Raisenil'),
(82, '2023-08-12 20:03:38', 'GET', '200', 9396, 'Raisenil'),
(83, '2023-08-12 20:03:38', 'GET', '403', 92, 'Raisenil'),
(84, '2023-08-12 20:03:38', 'GET', '302', 11, 'Raisenil'),
(85, '2023-08-12 20:03:38', 'GET', '405', 1, 'Raisenil'),
(86, '2023-08-12 20:03:38', 'GET', '499', 4, 'Raisenil'),
(87, '2023-08-12 20:03:38', 'GET', '404', 1, 'Raisenil'),
(88, '2023-08-12 20:03:38', 'POST', '200', 346731, 'Raisenil'),
(89, '2023-08-12 20:03:38', 'POST', '400', 824, 'Raisenil'),
(90, '2023-08-12 20:03:38', 'POST', '403', 2, 'Raisenil'),
(91, '2023-08-12 20:03:38', 'POST', '301', 1, 'Raisenil'),
(92, '2023-08-12 20:03:38', 'POST', '404', 6, 'Raisenil'),
(93, '2023-08-12 20:03:38', 'POST', '502', 1, 'Raisenil'),
(94, '2023-08-12 20:03:38', 'POST', '307', 3, 'Raisenil'),
(95, '2023-08-12 20:03:38', 'POST', '499', 1, 'Raisenil'),
(96, '2023-08-12 20:03:38', 'HEAD', '302', 14, 'Raisenil'),
(97, '2023-08-12 20:03:38', 'HEAD', '200', 23, 'Raisenil'),
(98, '2023-08-12 20:03:38', 'HEAD', '301', 5, 'Raisenil'),
(99, '2023-08-12 20:03:38', 'OPTIONS', '301', 1, 'Raisenil'),
(100, '2023-08-12 20:03:38', 'OPTIONS', '400', 2, 'Raisenil');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
