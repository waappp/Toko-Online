-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Feb 2022 pada 08.37
-- Versi server: 10.4.20-MariaDB
-- Versi PHP: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `toko_online`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(10) NOT NULL,
  `nama_admin` varchar(30) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `level` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id_admin`, `nama_admin`, `username`, `password`, `level`) VALUES
(5, 'Hukama Niamul Wafa', 'Wap', '55d758e70e1cf5a16222dcb328be0d', 1),
(6, 'Wafa', 'Wap', '123', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_raket` int(10) NOT NULL,
  `id_transaksi` int(10) NOT NULL,
  `id_raket` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `subtotal` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembeli`
--

CREATE TABLE `pembeli` (
  `id_pembeli` int(10) NOT NULL,
  `username` varchar(30) NOT NULL,
  `password` int(11) NOT NULL,
  `nama_pembeli` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `pembeli`
--

INSERT INTO `pembeli` (`id_pembeli`, `username`, `password`, `nama_pembeli`, `alamat`, `telepon`) VALUES
(1, 'wafa', 123, 'Wafa', 'Kediri', 812345);

-- --------------------------------------------------------

--
-- Struktur dari tabel `raket`
--

CREATE TABLE `raket` (
  `id_raket` int(10) NOT NULL,
  `merk` varchar(30) NOT NULL,
  `harga` int(10) NOT NULL,
  `stok` int(10) NOT NULL,
  `foto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `raket`
--

INSERT INTO `raket` (`id_raket`, `merk`, `harga`, `stok`, `foto`) VALUES
(2, 'Yonex', 800000, 8, 'yonex.jpg'),
(3, 'Hi-Qua', 700000, 7, 'Hi-Qua.jpg'),
(4, 'Astec', 300000, 13, 'astec.jfif'),
(5, 'Pro Ace', 900000, 3, 'proace.png'),
(6, 'Victor', 1200000, 1, 'victor.jfif'),
(7, 'Fly Power', 600000, 6, 'flypower.jpg'),
(8, 'Reinforce Speed', 300000, 12, 'Rs.jfif'),
(9, 'Li-Ning', 1300000, 20, 'lining.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) NOT NULL,
  `id_pembeli` int(10) NOT NULL,
  `id_admin` int(10) NOT NULL,
  `tanggal_transaksi` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indeks untuk tabel `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD KEY `id_transaksi` (`id_transaksi`,`id_raket`);

--
-- Indeks untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  ADD PRIMARY KEY (`id_pembeli`);

--
-- Indeks untuk tabel `raket`
--
ALTER TABLE `raket`
  ADD PRIMARY KEY (`id_raket`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_pembeli` (`id_pembeli`,`id_admin`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `pembeli`
--
ALTER TABLE `pembeli`
  MODIFY `id_pembeli` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `raket`
--
ALTER TABLE `raket`
  MODIFY `id_raket` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(10) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
