-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: May 07, 2018 at 04:01 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

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
-- Table structure for table `challange`
--

CREATE TABLE `challange` (
  `id_event_FK` int(11) NOT NULL,
  `deskripsi_challange` varchar(255) NOT NULL,
  `pembuat_challange` int(11) NOT NULL,
  `waktu_mulai` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `waktu_selesai` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `daftar_gath`
--

CREATE TABLE `daftar_gath` (
  `FK_id_gath` int(11) NOT NULL,
  `FK_id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `daftar_komunitas`
--

CREATE TABLE `daftar_komunitas` (
  `id_user_FK` int(11) NOT NULL,
  `id_komunitas_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `daftar_reward`
--

CREATE TABLE `daftar_reward` (
  `FK_id_reward` int(11) NOT NULL,
  `FK_id_use` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id_event` int(11) NOT NULL,
  `id_komunitas_FK` int(11) NOT NULL,
  `nama_event` varchar(255) NOT NULL,
  `tanggal` date NOT NULL,
  `reward_points` int(10) NOT NULL,
  `reward_xp` int(10) NOT NULL,
  `tipe` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `gath`
--

CREATE TABLE `gath` (
  `id_gath` int(11) NOT NULL,
  `id_event_FK` int(11) NOT NULL,
  `materi` varchar(255) NOT NULL,
  `lokasi` text NOT NULL,
  `waktu` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `komunitas`
--

CREATE TABLE `komunitas` (
  `id_komunitas` int(11) NOT NULL,
  `nama_komunitas` varchar(255) NOT NULL,
  `deskripsi_komunitas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `komunitas`
--

INSERT INTO `komunitas` (`id_komunitas`, `nama_komunitas`, `deskripsi_komunitas`) VALUES
(1, 'Agribot', 'Agribot merupakan komunitas robotik mahasiswa Ilmu Komputer Institut Pertanian Bogor yang telah berdiri sejak tahun 2014. Pada awalnya kegiatan komunitas Agribot dibimbing oleh Vektor Dewanto, S.T. M.Eng dengan jumlah anggota awal berkisar 7-10 orang. Unt'),
(2, 'Agriweb', 'Agriweb adalah komunitas yang memfasilitasi mahasiswa untuk saling berkumpul, belajar dan berjejaring untuk mengembangkan pengetahuan mereka di bidang website. Adapun pembahasan yang dibahas dalam komunitas ini meliputi serba-serbi web, web hosting dan se'),
(3, 'Android Mobile Development', 'Develop native app using android studio'),
(4, 'Game Dev', 'create fun games using unity and oop concept'),
(5, 'Data Mining', 'menggali informasi yang unik dari data dan ikut serta dalam berbagai perlombaan'),
(6, 'CSI', 'Keamanan jaringan atau Network Security merupakan hal yang saat ini sangat dibutuhkan, karena semua komputer terkoneksi satu sama lain, integrasi suatu data akan dipertaruhkan. Sebagai mahasiswa Ilmu Komputer maka diperlukan pengetahuan tentang keamanan k'),
(7, 'Competitive Programming', 'Komunitas Competitive Programming (CP) mengasah kemampuan anggotanya untuk meningkatkan kecepatan dan ketepatan pemecahan suatu masalah dan mengimplementasikannya dalam bentuk algoritme dengan menggunakan hukum dan teori yang berlaku.'),
(8, 'Creative Design', 'Creative Design merupakan komunitas yang berada di Ilmu Komputer IPB yang bertujuan untuk mewadahi minat mahasiswa Ilmu Komputer dalam bidang desain grafis, untuk kemudian diterapkan pada user interface aplikasi/web, dengan memerhatikan user experience.'),
(9, 'Mixed Reality', 'komunitas ini akan mengeksplorasi AR-Kit dan AR-Core yang merupakan teknologi AR-VR terkini. Komunitas ini juga mencoba menjalin kerja sama dengan beberapa institusi seperti Google dan Indonesia VR/AR Association (INVRA) untuk mendapatkan dukungan berupa ');

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
  `role` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`, `email`, `titile`, `xp`, `points`, `role`) VALUES
(1, 'Jodhi', 'jodhigan', '123', 'jod@gmail.com', 'noob', 0, 0, 0),
(3, 'raka', 'rka11', '123', 'rka@gmail.com', 'noob', 0, 0, 0),
(4, 'Dadi', 'Dadi12', '123', 'dd@gmail.com', 'noob', 0, 0, 0),
(5, 'kokoh bulet', 'kok14', '123', 'koh112@gmail.com', 'noob', 0, 0, 0),
(6, 'Abeh', 'ab35', '123', 'Abeh@gmail.com', 'noob', 0, 0, 0),
(7, 'jinks', 'jinks32', '123', 'Jinkss@gmail.com', 'noob', 0, 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `challange`
--
ALTER TABLE `challange`
  ADD KEY `id_event_FK` (`id_event_FK`),
  ADD KEY `pembuat_challagne` (`pembuat_challange`);

--
-- Indexes for table `daftar_gath`
--
ALTER TABLE `daftar_gath`
  ADD KEY `FK_id_gath` (`FK_id_gath`),
  ADD KEY `FK_id_user` (`FK_id_user`);

--
-- Indexes for table `daftar_komunitas`
--
ALTER TABLE `daftar_komunitas`
  ADD KEY `id_user_FK` (`id_user_FK`),
  ADD KEY `id_komunitas_FK` (`id_komunitas_FK`);

--
-- Indexes for table `daftar_reward`
--
ALTER TABLE `daftar_reward`
  ADD KEY `FK_id_reward` (`FK_id_reward`),
  ADD KEY `FK_user` (`FK_id_use`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `komunitas_FK` (`id_komunitas_FK`);

--
-- Indexes for table `gath`
--
ALTER TABLE `gath`
  ADD PRIMARY KEY (`id_gath`),
  ADD KEY `FK_ID_Event` (`id_event_FK`);

--
-- Indexes for table `komunitas`
--
ALTER TABLE `komunitas`
  ADD PRIMARY KEY (`id_komunitas`);

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
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gath`
--
ALTER TABLE `gath`
  MODIFY `id_gath` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `komunitas`
--
ALTER TABLE `komunitas`
  MODIFY `id_komunitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

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

--
-- Constraints for dumped tables
--

--
-- Constraints for table `challange`
--
ALTER TABLE `challange`
  ADD CONSTRAINT `id_event_FK` FOREIGN KEY (`id_event_FK`) REFERENCES `event` (`id_event`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pembuat_challagne` FOREIGN KEY (`pembuat_challange`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `daftar_gath`
--
ALTER TABLE `daftar_gath`
  ADD CONSTRAINT `FK_id_gath` FOREIGN KEY (`FK_id_gath`) REFERENCES `gath` (`id_gath`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_id_user` FOREIGN KEY (`FK_id_user`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `daftar_komunitas`
--
ALTER TABLE `daftar_komunitas`
  ADD CONSTRAINT `id_komunitas_FK` FOREIGN KEY (`id_komunitas_FK`) REFERENCES `komunitas` (`id_komunitas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `id_user_FK` FOREIGN KEY (`id_user_FK`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `daftar_reward`
--
ALTER TABLE `daftar_reward`
  ADD CONSTRAINT `FK_id_reward` FOREIGN KEY (`FK_id_reward`) REFERENCES `reward` (`id_reward`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`FK_id_use`) REFERENCES `user` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `komunitas_FK` FOREIGN KEY (`id_komunitas_FK`) REFERENCES `komunitas` (`id_komunitas`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `gath`
--
ALTER TABLE `gath`
  ADD CONSTRAINT `FK_ID_Event` FOREIGN KEY (`id_event_FK`) REFERENCES `event` (`id_event`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
