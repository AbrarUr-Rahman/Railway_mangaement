-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 07, 2019 at 06:05 PM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railway`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `ID` int(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Date` date NOT NULL,
  `From_Station` varchar(30) NOT NULL,
  `Destination` varchar(30) NOT NULL,
  `No.Of_Seats` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `passanger`
--

CREATE TABLE `passanger` (
  `ID` int(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passanger`
--

INSERT INTO `passanger` (`ID`, `Name`, `Email`, `password`) VALUES
(1, 'samiul', 'samiul@gmail.com', '1234567890'),
(2, 'abir', 'abir@gmail.com', '1234567890'),
(3, 'sadad', 'dadad@comgsgs.', 'gfgdgdgd');

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `T.ID` int(30) NOT NULL,
  `Route.No` int(10) NOT NULL,
  `From_Station` varchar(30) NOT NULL,
  `Destination` varchar(30) NOT NULL,
  `Start_Time` time NOT NULL,
  `Arrival_Time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`T.ID`, `Route.No`, `From_Station`, `Destination`, `Start_Time`, `Arrival_Time`) VALUES
(702, 2, 'Dhaka', 'Chittagong', '15:00:00', '20:10:00'),
(704, 2, 'Dhaka', 'Chittagong', '07:45:00', '13:50:00'),
(709, 3, 'Dhaka', 'Sylhet', '06:35:00', '13:20:00'),
(726, 4, 'Dhaka', 'Khulna', '06:20:00', '16:20:00'),
(739, 3, 'Dhaka', 'Sylhet', '21:50:00', '05:20:00'),
(753, 1, 'Dhaka', 'Rajshahi', '14:40:00', '20:45:00'),
(764, 4, 'Dhaka', 'Khulna', '19:00:00', '05:10:00'),
(771, 5, 'Dhaka', 'Rangpur', '09:00:00', '19:03:00'),
(791, 1, 'Dhaka', 'Rajshahi', '13:15:00', '18:00:00'),
(797, 5, 'Dhaka', 'Rangpur', '20:45:00', '05:03:00');

-- --------------------------------------------------------

--
-- Table structure for table `station`
--

CREATE TABLE `station` (
  `Station_Name` varchar(30) NOT NULL,
  `Location` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `station`
--

INSERT INTO `station` (`Station_Name`, `Location`) VALUES
('Chittagong', 'Chittagong'),
('Dhaka', 'Dhaka'),
('Khulna', 'Khulna'),
('Rajshahi', 'Rajshahi'),
('Rangpur', 'Rangpur'),
('Sylhet', 'Sylhet');

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `T.ID` int(30) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `offday` varchar(30) NOT NULL,
  `No.of_seats` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`T.ID`, `Name`, `offday`, `No.of_seats`) VALUES
(702, 'Subarna', 'Sunday', 500),
(704, 'Mahanagar', 'Friday', 500),
(709, 'Parabat', 'Wednesday', 500),
(726, 'Sundarban', 'Saturday', 500),
(739, 'Upaban', 'Friday', 500),
(753, 'Silkcity', 'Sunday', 500),
(764, 'Chitra', 'Thursday', 500),
(771, 'Rangpur', 'Friday', 500),
(791, 'Banalata', 'Saturday', 500),
(797, 'Kurigram', 'Wednesday', 500);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`ID`,`Name`),
  ADD KEY `Name` (`Name`);

--
-- Indexes for table `passanger`
--
ALTER TABLE `passanger`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`T.ID`,`Route.No`);

--
-- Indexes for table `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`Station_Name`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`T.ID`,`Name`),
  ADD UNIQUE KEY `Name` (`Name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `passanger`
--
ALTER TABLE `passanger`
  MODIFY `ID` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `passanger` (`ID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`Name`) REFERENCES `train` (`Name`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`T.ID`) REFERENCES `train` (`T.ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
