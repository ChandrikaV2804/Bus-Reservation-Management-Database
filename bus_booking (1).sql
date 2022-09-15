-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2022 at 01:00 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_booking`
--

-- --------------------------------------------------------

--
-- Table structure for table `booked`
--

CREATE TABLE `booked` (
  `id` int(30) NOT NULL,
  `schedule_id` int(30) NOT NULL,
  `ref_no` text NOT NULL,
  `name` varchar(250) NOT NULL,
  `qty` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT 0 COMMENT '1=Paid, 0- Unpaid',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `booked`
--

INSERT INTO `booked` (`id`, `schedule_id`, `ref_no`, `name`, `qty`, `status`, `date_updated`) VALUES
(1, 1, '202009091727', 'swathi', 1, 1, '2022-01-11 07:21:08'),
(2, 1, '202009091626', 'deepak', 2, 0, '2022-01-11 07:21:31'),
(3, 1, '202009099953', 'suraj', 3, 1, '2022-01-11 07:22:17'),
(4, 3, '202201116897', 'rama lakshmi', 2, 0, '2022-01-13 14:15:49'),
(5, 3, '202201111513', 'latha', 1, 0, '2022-01-13 14:16:01'),
(6, 4, '202201114570', 'mamatha', 1, 1, '2022-01-13 14:16:12'),
(123456793, 3, '202201289964', 'chammppuuu', 2, 0, '2022-01-28 12:08:50');

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `bus_number` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0 = inactive, 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`id`, `name`, `bus_number`, `status`, `date_updated`) VALUES
(3, 'ksrtc', '2001', 1, '2022-01-11 07:06:25'),
(4, 'vrl', '2002', 1, '2022-01-11 07:06:51'),
(5, 'sugama', '2003', 1, '2022-01-11 12:21:34'),
(6, 'airavatha', '2004', 1, '2022-01-11 12:21:57');

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `id` int(30) NOT NULL,
  `terminal_name` text NOT NULL,
  `city` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= inactive , 1= active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`id`, `terminal_name`, `city`, `state`, `status`, `date_updated`) VALUES
(1, 'tirupathi bus station', 'tirupati', 'andra pradesh', 1, '2022-01-11 07:07:59'),
(2, 'kempegowda bus station', 'banglore south', 'karnataka', 1, '2022-01-11 07:09:31'),
(3, 'sringeri', 'chikamangaluru', 'karnataka', 1, '2022-01-11 12:22:36'),
(4, 'hyderbad bus station', 'hyderbad', 'andra pradesh', 1, '2022-01-11 12:24:15'),
(5, 'sirsi', 'uttar kannada', 'karnataka', 1, '2022-01-11 12:25:20'),
(6, 'chennai', 'chennai', 'tamil nadu', 1, '2022-01-11 12:25:58'),
(7, 'hospet', 'vijayanagara ', 'karnataka', 1, '2022-01-11 12:29:51'),
(8, 'goa', 'goa', 'goa', 1, '2022-01-11 12:32:30'),
(9, 'mangalore bus station', 'mangalore', 'karnataka', 1, '2022-01-11 12:52:35'),
(10, 'udupi', 'udupi', 'karnataka', 1, '2022-01-11 12:53:06');

-- --------------------------------------------------------

--
-- Table structure for table `schedule_list`
--

CREATE TABLE `schedule_list` (
  `id` int(30) NOT NULL,
  `bus_id` int(30) NOT NULL,
  `from_location` int(30) NOT NULL,
  `to_location` int(30) NOT NULL,
  `departure_time` datetime NOT NULL,
  `eta` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1,
  `availability` int(11) NOT NULL,
  `price` text NOT NULL,
  `date_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `schedule_list`
--

INSERT INTO `schedule_list` (`id`, `bus_id`, `from_location`, `to_location`, `departure_time`, `eta`, `status`, `availability`, `price`, `date_updated`) VALUES
(1, 4, 2, 1, '2022-01-13 23:00:00', '2022-01-14 07:00:00', 1, 40, '1050', '2022-01-11 01:45:04'),
(2, 3, 2, 1, '2020-09-12 02:45:00', '2020-09-12 05:00:00', 0, 30, '250', '2022-01-11 01:42:49'),
(3, 3, 1, 1, '2022-01-11 21:00:00', '2022-01-12 07:00:00', 1, 35, '750', '2022-01-11 01:42:35'),
(4, 3, 2, 1, '2022-01-11 23:00:00', '2022-01-12 09:00:00', 1, 30, '750', '2022-01-11 01:46:57'),
(5, 4, 1, 2, '2022-01-13 21:00:00', '2022-01-14 08:00:00', 1, 40, '1050', '2022-01-11 01:48:23'),
(6, 5, 3, 2, '2022-01-16 18:00:00', '2022-01-17 09:00:00', 1, 32, '850', '2022-01-11 07:46:45'),
(7, 5, 2, 3, '2022-01-20 22:00:00', '2022-01-11 10:00:00', 1, 32, '850', '2022-01-11 07:47:27'),
(8, 6, 2, 7, '2022-01-19 19:00:00', '2022-01-11 06:00:00', 1, 45, '450', '2022-01-11 07:51:33'),
(9, 6, 2, 8, '2022-01-22 23:00:00', '2022-01-23 08:00:00', 1, 45, '550', '2022-01-11 07:52:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(150) NOT NULL,
  `user_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = admin, 2= faculty , 3 = student',
  `username` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT ' 0 = incative , 1 = active',
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `user_type`, `username`, `password`, `status`, `date_updated`) VALUES
(1, 'chandrika v g', 1, 'chandrika', 'chandrika123', 1, '2022-01-11 07:02:57'),
(2, 'bhoomika u bhatt', 1, 'bhoomikaubhatt', 'bhoomika123', 1, '2022-01-11 11:36:52');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booked`
--
ALTER TABLE `booked`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedule_list`
--
ALTER TABLE `schedule_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booked`
--
ALTER TABLE `booked`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=123456794;

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `schedule_list`
--
ALTER TABLE `schedule_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
