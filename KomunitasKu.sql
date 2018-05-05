-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 05, 2018 at 11:34 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `KomunitasKu`
--

-- --------------------------------------------------------

--
-- Table structure for table `reward`
--

CREATE TABLE `reward` (
  `id_reward` int(11) NOT NULL,
  `nama_reward` varchar(255) NOT NULL,
  `deskripsi_reward` varchar(255) NOT NULL,
  `syarat_point` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reward`
--

INSERT INTO `reward` (`id_reward`, `nama_reward`, `deskripsi_reward`, `syarat_point`) VALUES
(5, 'pulpen', 'buat nulis', 20),
(6, 'binder', 'buat nyatet', 25),
(7, 'kertas binder A4', 'buat nulis', 30);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `titile` varchar(255) NOT NULL DEFAULT 'noob',
  `xp` int(255) NOT NULL DEFAULT '0',
  `points` int(255) NOT NULL DEFAULT '0',
  `daftar_komunitas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `email`, `titile`, `xp`, `points`, `daftar_komunitas`) VALUES
(1, 'Jodhi', 'jodhigan', '123', 'jod@gmail.com', 'noob', 0, 0, 'CSI'),
(3, 'raka', 'rka11', '123', 'rka@gmail.com', 'noob', 0, 0, 'CSI'),
(4, 'Dadi', 'Dadi12', '123', 'dd@gmail.com', 'noob', 0, 0, 'CSI'),
(5, 'kokoh bulet', 'kok14', '123', 'koh112@gmail.com', 'noob', 0, 0, 'Data mining'),
(6, 'Abeh', 'ab35', '123', 'Abeh@gmail.com', 'noob', 0, 0, 'CSI'),
(7, 'jinks', 'jinks32', '123', 'Jinkss@gmail.com', 'noob', 0, 0, 'AMD');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `reward`
--
ALTER TABLE `reward`
  ADD PRIMARY KEY (`id_reward`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reward`
--
ALTER TABLE `reward`
  MODIFY `id_reward` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
