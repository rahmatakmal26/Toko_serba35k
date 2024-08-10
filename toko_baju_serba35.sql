-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2024 at 12:04 PM
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
-- Database: `toko_baju_serba35`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '$2y$10$AIy0X1Ep6alaHDTofiChGeqq7k/d1Kc8vKQf1JZo0mKrzkkj6M626'),
(2, 'rahmat', '$2y$10$Eq9j34oINIu9Y3OjomR6j.p02j3wdKMFf09v9PAvxrSolveoAebDm');

-- --------------------------------------------------------

--
-- Table structure for table `bom_produk`
--

CREATE TABLE `bom_produk` (
  `kode_bom` varchar(100) NOT NULL,
  `kode_bk` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `kebutuhan` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `kode_customer` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `telp` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`kode_customer`, `nama`, `email`, `username`, `password`, `telp`) VALUES
('C0002', 'Rafi Akbar', 'a.rafy@gmail.com', 'rafi', '$2y$10$/UjGYbisTPJhr8MgmT37qOXo1o/HJn3dhafPoSYbOlSN1E7olHIb.', '0856748564'),
('C0003', 'holi', 'izuddinkhubi@gmail.com', 'holi', '$2y$10$PYm57GT4NRw5BwElvUrmfu6xR9KB2xIWp8OqgLJ1iih4eSxDYBawG', '2323'),
('C0004', 'Kain', 'izuddinkhubi@gmail.com', 'kain', '$2y$10$0mJr/adDSREVRt23iBYkfe4mspCHeZBpCq9hL8MXw567fJd.FCZsi', '12344'),
('C0005', 'Kusuma', 'izuddinkhubi@gmail.com', 'kusuma', '$2y$10$q9LiONu7RQSgAJJSFfTedOrmiHUMbMTaTi04sfvOSA1omsRhHULjK', '7878787'),
('C0006', 'Rafi', 'Rafy@gmail.com', 'rafymrx', '$2y$10$jpSi6HJC.Oq342wtIy4g8uxO48Wr6DLokXEfZt3EpiEKLGq5dk0Ma', '087804616097'),
('C0008', 'Ilham', 'ilham012024@gmail.com', 'Calon_Jenazah', '$2y$10$aGICdBdQt/R5zQsG.NaLT.21b3hNN6waGfFw5UAThCwaspHdegOy2', '081262400118'),
('C0009', 'ilham', 'rahmatakmal26@gmail.com', 'ilham123', '$2y$10$YZpsgaQdr47gtZOksdyUZ.zIG6lW/D228q79XUM8TBhfdUAurBw/6', '082211798839'),
('C0010', 'ilham2', 'rahmatakmal26@gmail.com', 'ilham2', '$2y$10$CDnnXXr7Y6mS1sS/hjIpouNkhMXyl1SWuFJnoLBMt.DJyU7gkM.nm', '082211798839'),
('C0011', 'matmal', 'matmal123@gmail.com', 'matmal', '$2y$10$frxy4BBYIqIs.4RJyB.3hu3ohRCPjv6HdnYrstI9xxcmPKjzoBF3G', '08126240011272');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `kode_bk` varchar(100) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `qty` varchar(200) NOT NULL,
  `satuan` varchar(200) NOT NULL,
  `harga` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`kode_bk`, `nama`, `qty`, `satuan`, `harga`, `tanggal`) VALUES
('M0001', 'Kain', '96', 'Kodi', 8000, '2020-10-05'),
('M0002', 'Pewarna', '500', 'ml', 200, '2020-10-04');

-- --------------------------------------------------------

--
-- Table structure for table `keranjang`
--

CREATE TABLE `keranjang` (
  `id_keranjang` int(11) NOT NULL,
  `kode_customer` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` varchar(200) NOT NULL,
  `ukuran` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keranjang`
--

INSERT INTO `keranjang` (`id_keranjang`, `kode_customer`, `kode_produk`, `nama_produk`, `qty`, `harga`, `berat`, `ukuran`) VALUES
(74, 'C0007', 'P0001', 'Mega Mendung', 2, 0, '500', 'm'),
(75, 'C0007', 'P0002', 'Batik Sarimbit ', 1, 0, '100', 'l'),
(76, 'C0007', 'P0003', 'Batik Sarimbit Kuning', 2, 0, '100', 's'),
(151, 'C0006', 'P0001', 'Baju Kaos', 2, 35000, '500', 'm'),
(152, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0002', 'Hoodie', 3, 35000, '100', 'xxl'),
(153, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', '', '', 4, 35000, '100', 'xl'),
(154, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', '', '', 4, 35000, '100', 'xl'),
(155, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', '', '', 4, 35000, '100', 'xl'),
(156, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0002', 'Hoodie', 4, 35000, '100', 'xl'),
(157, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0005', 'Baju murah', 2, 35000, '2000', 's'),
(158, '', 'P0005', 'Baju murah', 7, 35000, '2000', 'm'),
(159, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0005', 'Baju murah', 7, 35000, '2000', 's'),
(160, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0002', 'Hoodie', 1, 35000, '100', 'xl'),
(161, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0002', 'Hoodie', 1, 35000, '100', 'm'),
(162, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0005', 'Baju murah', 1, 35000, '2000', 's'),
(163, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0002', 'Hoodie', 1, 35000, '100', 'm'),
(164, 'C0010', 'P0002', 'Hoodie', 1, 35000, '100', 'l'),
(165, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0002', 'Hoodie', 2, 35000, '100', 'm'),
(166, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0002', 'Hoodie', 2, 35000, '100', 'm'),
(168, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0002', 'Hoodie', 1, 35000, '100', 'l'),
(169, '<br />\r\n<b>Warning</b>:  Undefined variable $kode_cs in <b>C:xampphtdocsPROJECT-TOKO-ONLINEdetail_pr', 'P0001', 'Baju Kaos', 8, 35000, '500', 'm');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `kode_produk` varchar(100) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `image` text NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` varchar(255) NOT NULL,
  `ukuran` varchar(255) NOT NULL,
  `berat` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`kode_produk`, `nama`, `image`, `deskripsi`, `harga`, `ukuran`, `berat`) VALUES
('P0001', 'Baju Kaos', '65771e3514a5d.jpg', '				Produk berkualitas\r\n															', '35000,35000', 'm,l', '500'),
('P0002', 'Hoodie', '65771f108c927.jpg', 'Hoodie dengan motif bagus\r\n						', '35000,35000,35000,35000,35000', 's,m,l,xl,xxl', '100'),
('P0005', 'Baju murah', '65771fae8bb25.jpg', '								Murah meriah\r\n												', '35000,35000', 's,m', '2000');

-- --------------------------------------------------------

--
-- Table structure for table `produksi`
--

CREATE TABLE `produksi` (
  `id_order` int(11) NOT NULL,
  `invoice` varchar(200) NOT NULL,
  `kode_customer` varchar(200) NOT NULL,
  `kode_produk` varchar(200) NOT NULL,
  `nama_produk` varchar(200) NOT NULL,
  `qty` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `ukuran` varchar(255) NOT NULL,
  `status` varchar(200) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `provinsi` varchar(200) NOT NULL,
  `kota` varchar(200) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `kode_pos` varchar(200) NOT NULL,
  `metode_pembayaran` varchar(255) NOT NULL,
  `paket_ekspedisi` varchar(200) NOT NULL,
  `ongkir` int(11) NOT NULL,
  `etd_ekspedisi` varchar(200) NOT NULL,
  `terima` varchar(200) NOT NULL,
  `tolak` varchar(200) NOT NULL,
  `cek` int(11) NOT NULL,
  `grand_total` int(11) NOT NULL,
  `timess` varchar(255) NOT NULL,
  `images` text NOT NULL,
  `tgl` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `produksi`
--

INSERT INTO `produksi` (`id_order`, `invoice`, `kode_customer`, `kode_produk`, `nama_produk`, `qty`, `harga`, `ukuran`, `status`, `tanggal`, `provinsi`, `kota`, `alamat`, `kode_pos`, `metode_pembayaran`, `paket_ekspedisi`, `ongkir`, `etd_ekspedisi`, `terima`, `tolak`, `cek`, `grand_total`, `timess`, `images`, `tgl`) VALUES
(82, 'INV0001', 'C0008', 'P0003', 'Batik Sarimbit Kuning', 10, 20000, 'l', 'Pesanan Baru', '09 Dec 2023 03:37:11', 'Aceh', 'Meulaboh/Aceh Barat', 'Meulaboh', '23765', 'COD', '', 0, '', '0', '0', 0, 200000, '02:37:11', '', '2023-12-09'),
(83, 'INV0002', 'C0008', 'P0002', 'Batik Sarimbit ', 2, 15000, 'xxl', '0', '09 Dec 2023 04:35:59', 'Aceh', 'Meulaboh/Aceh Barat', 'Jln. Meulaboh - Kuala Bhee, Desa Cot mancang', '23652', 'Transfer', '', 0, '', '1', '0', 0, 30008, '03:35:59', '6573d2c26eef5.png', '2023-12-09'),
(89, 'INV0003', 'C0008', 'P0001', 'Mega Mendung', 1, 20000, 'l', 'Pesanan Baru', '10 Dec 2023 11:22:18', 'Aceh', 'Meulaboh/Aceh Barat', 'seuneubok', '23765', 'Transfer', '', 0, '', '0', '0', 0, 20005, '10:22:18', '657583723df80.png', '2023-12-10'),
(90, 'INV0004', 'C0006', 'P0001', 'Baju Kaos', 4, 35000, 'm', '0', '11 Dec 2023 19:49:48', 'Aceh', 'Meulaboh/Aceh Barat', 'Desa Cot Darat Kecamatan samatiga', '23652', 'Transfer', '', 0, '', '1', '0', 0, 140002, '18:49:48', '', '2023-12-11'),
(91, 'INV0005', 'C0010', 'P0001', 'Baju Kaos', 10, 35000, 'm', 'Pesanan Baru', '14 Dec 2023 10:16:28', 'Aceh', 'Meulaboh/Aceh Barat', 'jalan. manekroo', '23652', 'COD', '', 0, '', '0', '0', 0, 350005, '09:16:28', '', '2023-12-14'),
(92, 'INV0006', 'C0010', 'P0001', 'Baju Kaos', 11, 35000, 'm', '0', '14 Dec 2023 10:18:00', 'Aceh', 'Meulaboh/Aceh Barat', 'jln. manekroo', '23652', 'Transfer', '', 0, '', '1', '0', 0, 385006, '09:18:00', '657aba4203a3a.jpeg', '2023-12-14'),
(93, 'INV0007', 'C0008', 'P0001', 'Baju Kaos', 3, 35000, 'm', 'Pesanan Baru', '20 May 2024 20:00:11', 'Aceh', 'Meulaboh/Aceh Barat', 'Susoh, Abdya', '23765', 'Transfer', '', 0, '', '0', '0', 0, 105006, '19:00:11', '', '2024-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `report_cancel`
--

CREATE TABLE `report_cancel` (
  `id_report_cancel` int(11) NOT NULL,
  `id_order` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `jumlah` varchar(100) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_inventory`
--

CREATE TABLE `report_inventory` (
  `id_report_inv` int(11) NOT NULL,
  `kode_bk` varchar(100) NOT NULL,
  `nama_bahanbaku` varchar(100) NOT NULL,
  `jml_stok_bk` int(11) NOT NULL,
  `tanggal` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_omset`
--

CREATE TABLE `report_omset` (
  `id_report_omset` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `total_omset` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report _penjualan`
--

CREATE TABLE `report _penjualan` (
  `id_report_sell` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `jumlah_terjual` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_produksi`
--

CREATE TABLE `report_produksi` (
  `id_report_prd` int(11) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `qty` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_profit`
--

CREATE TABLE `report_profit` (
  `id_report_profit` int(11) NOT NULL,
  `kode_bom` varchar(100) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kode_produk` varchar(100) NOT NULL,
  `jumlah` varchar(11) NOT NULL,
  `total_profit` varchar(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`kode_customer`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`kode_bk`);

--
-- Indexes for table `keranjang`
--
ALTER TABLE `keranjang`
  ADD PRIMARY KEY (`id_keranjang`);

--
-- Indexes for table `produksi`
--
ALTER TABLE `produksi`
  ADD PRIMARY KEY (`id_order`);

--
-- Indexes for table `report_cancel`
--
ALTER TABLE `report_cancel`
  ADD PRIMARY KEY (`id_report_cancel`);

--
-- Indexes for table `report_inventory`
--
ALTER TABLE `report_inventory`
  ADD PRIMARY KEY (`id_report_inv`);

--
-- Indexes for table `report_omset`
--
ALTER TABLE `report_omset`
  ADD PRIMARY KEY (`id_report_omset`);

--
-- Indexes for table `report _penjualan`
--
ALTER TABLE `report _penjualan`
  ADD PRIMARY KEY (`id_report_sell`);

--
-- Indexes for table `report_produksi`
--
ALTER TABLE `report_produksi`
  ADD PRIMARY KEY (`id_report_prd`);

--
-- Indexes for table `report_profit`
--
ALTER TABLE `report_profit`
  ADD PRIMARY KEY (`id_report_profit`),
  ADD UNIQUE KEY `kode_bom` (`kode_bom`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `keranjang`
--
ALTER TABLE `keranjang`
  MODIFY `id_keranjang` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `produksi`
--
ALTER TABLE `produksi`
  MODIFY `id_order` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- AUTO_INCREMENT for table `report_cancel`
--
ALTER TABLE `report_cancel`
  MODIFY `id_report_cancel` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_inventory`
--
ALTER TABLE `report_inventory`
  MODIFY `id_report_inv` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_omset`
--
ALTER TABLE `report_omset`
  MODIFY `id_report_omset` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_produksi`
--
ALTER TABLE `report_produksi`
  MODIFY `id_report_prd` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_profit`
--
ALTER TABLE `report_profit`
  MODIFY `id_report_profit` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
