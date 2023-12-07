-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 06, 2023 at 03:23 PM
-- Server version: 10.11.2-MariaDB-log
-- PHP Version: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `diread`
--

-- --------------------------------------------------------

--
-- Table structure for table `actors`
--

CREATE TABLE `actors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` enum('admin','reader') NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `id` int(11) NOT NULL,
  `p_issn` varchar(255) DEFAULT NULL,
  `e_issn` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `judul` varchar(255) DEFAULT NULL,
  `penulis` varchar(255) DEFAULT NULL,
  `tahun_terbit` int(11) DEFAULT NULL,
  `penerbit` varchar(255) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `no_edisi` int(11) DEFAULT NULL,
  `jumlah_halaman` int(11) DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`id`, `p_issn`, `e_issn`, `keyword`, `judul`, `penulis`, `tahun_terbit`, `penerbit`, `volume`, `no_edisi`, `jumlah_halaman`, `pdf`, `reference`, `created_at`, `updated_at`) VALUES
(1, '2339-2401', '2477-0221', 'Perilaku Sosial, Anak Putus Sekolah.', 'Perilaku Sosial Anak Putus Sekolah', 'Rahmad. M, Muhlis Madani, Risfaisal', 2016, 'Program Studi Pendidikan Sosiologi Fakultas Keguruan dan Ilmu Pendidikan Univeersitas Muhammadiyah Makassar', 4, 2, 10, 'Books/500-1382-1-PB.pdf', 'https://journal.unismuh.ac.id/index.php/equilibrium/article/view/500', '2023-12-06 14:52:28', '2023-12-06 14:52:28'),
(2, '2252-7877', '2548-3582', 'maggot, budidaya, penghematan biaya pakan', 'Analisis Usaha Budidaya Maggot sebagai Alternatif Pakan Lele', 'Rizal Ula Ananta Fauzi, Eka Resty Novieta Sari', 2018, 'Department of Agro-Industrial Technology, Faculty of Agricultural Technology, Universitas Brawijaya, Indonesia', 7, 1, 8, 'Books/312-1411-1-PB.pdf', 'https://industria.ub.ac.id/index.php/industri/article/view/312', '2023-12-06 14:52:28', '2023-12-06 14:52:28'),
(3, '2252-861x', '2715-2685', 'Agroindustri, Tahu, Pendapatan, Biaya, dan Efisiensi', 'ANALISIS USAHA AGROINDUSTRI TAHU DI DESA KAMPUNG MEDAN KECAMATAN KUANTAN HILIR KABUPATEN KUANTAN SINGINGI', 'Erlangga Marsila , Elfi Indrawanis dan Jamalludin', 2022, 'Fakultas Pertanian, Universitas Islam Kuantan Singingi', 11, 2, 7, 'Books/2214-ArticleText-9396-1-10-20220518.pdf', 'https://www.ejournal.uniks.ac.id/index.php/GREEN/article/view/2214', '2023-12-06 14:52:28', '2023-12-06 14:52:28'),
(4, '', '2807-5633', 'Indonesian, Indonesian Education Report Card, educational unit.', 'Rapor Pendidikan Indonesia: Quo Vadis Kualitas Pendidikan Indonesia?', 'Dwi Shintia, Masduki Asbari, Fadhila Khairunisa, Nurul Azizah', 2023, 'Journal of Information Systems and Management (JISMA)', 2, 6, 4, 'Books/ArticleText-0206-18-21.pdf', 'https://jisma.org/index.php/jisma/article/view/633', '2023-12-06 14:52:28', '2023-12-06 14:52:28'),
(5, '3021-7474', '3021-7466', 'education, effective, interactive, Technology, virtual reality', 'Analisa Pengaruh Virtual Reality Terhadap Perkembangan Pendidikan Indonesia', 'Charles, Delvian Yosuky,Tio Sania Rachmi, Eryc', 2023, 'Pusat Riset dan Inovasi Nasional, Universitas Sains dan Teknologi Komputer Semarang', 1, 3, 14, 'Books/40-53+Analisa+Pengaruh+Virtual+Reality+Terhadap+Perkembangan+Pendidikan+Indonesia.pdf', 'https://jurnal.stikes-ibnusina.ac.id/index.php/INOVED/article/view/206', '2023-12-06 14:52:28', '2023-12-06 14:52:28'),
(6, '2580-3735', '2580-1147', 'Akhlak, Media Pembelajaran, Pengembangan', 'Pengembangan Game Interaktif Wordwall untuk Meningkatkan Akhlak Terpuji Siswa Sekolah Dasar', 'Olisna Olisna, Milhatun Zannah, Auliani Sukma, Ani Nur Aeni', 2022, 'Universitas Pahlawan Tuanku Tambusai', 6, 3, 11, 'Books/admin,+97.+Olisna+4133+-+4143.pdf', 'https://jbasic.org/index.php/basicedu/article/view/2737', '2023-12-06 14:52:28', '2023-12-06 14:52:28'),
(7, '', '2723-6390', 'Pengembangan Aplikasi, Game Edukatif, Literasi Budaya, Anak Usia Dini', 'Strategi Literasi Budaya Anak Usia Dini melalui Pengembangan Game Edukatif', 'Esti Kurniawati Mahardika, Tiara Sevi Nurmanita, Khaerul Anam, Mario Aditya Prasetyo', 2023, 'Perkumpulan Pengelola Jurnal PAUD Indonesia', 4, 2, 14, 'Books/287-ArticleText-1948-1-10-20231117.pdf', 'https://www.murhum.ppjpaud.org/index.php/murhum/article/view/287', '2023-12-06 14:52:28', '2023-12-06 14:52:28'),
(8, '2356-1327', '2549-8959', 'game edukasi 3d, cinta tanah air, anak usia dini', 'Pengembangan Game Edukasi 3D untuk Menumbuhkan Cinta Tanah Air Sejak Dini', 'Indaria Tri Hariyani, Norma Diana Fitri', 2023, 'Universitas Pahlawan Tuanku Tambusai', 7, 2, 14, 'Books/3378-18624-3-PB.pdf', 'https://mail.obsesi.or.id/index.php/obsesi/article/view/3378', '2023-12-06 14:52:28', '2023-12-06 14:52:28'),
(9, '2580-3735', '2580-1147', 'Game Edukasi, Android, Hasil Belajar', 'Pengembangan Game Edukasi Berbasis Android untuk Meningkatkan Hasil Belajar Siswa di Sekolah Dasar', 'Ririn Windawati, Henny Dewi Koeswanti', 2021, 'Universitas Pahlawan Tuanku Tambusai', 5, 2, 12, 'Books/admin,+64+Ririn+Windawati+1027-1038.pdf', 'https://jbasic.org/index.php/basicedu/article/view/835', '2023-12-06 14:52:28', '2023-12-06 14:52:28'),
(10, '', '1411-3201', 'E-commerce, Model View Controller, Website', 'WEBSITE E-COMMERCE MENGGUNAKAN MODEL VIEW CONTROLLER ( MVC ) DENGAN FRAMEWORK CODEIGNITER Studi Kasus : Toko Miniatur', 'Donni Prabowo', 2015, 'Universitas Amikom Yogyakarta', 16, 1, 7, 'Books/225-705-1-PB.pdf', 'https://ojs.amikom.ac.id/index.php/dasi/article/view/225', '2023-12-06 14:52:28', '2023-12-06 14:52:28'),
(11, '2339-2401', '2477-0221', 'Perilaku Sosial, Anak Putus Sekolah.', 'Perilaku Sosial Anak Putus Sekolah', 'Rahmad. M, Muhlis Madani, Risfaisal', 2016, 'Program Studi Pendidikan Sosiologi Fakultas Keguruan dan Ilmu Pendidikan Univeersitas Muhammadiyah Makassar', 4, 2, 10, 'Books/500-1382-1-PB.pdf', 'https://journal.unismuh.ac.id/index.php/equilibrium/article/view/500', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(12, '2252-7877', '2548-3582', 'maggot, budidaya, penghematan biaya pakan', 'Analisis Usaha Budidaya Maggot sebagai Alternatif Pakan Lele', 'Rizal Ula Ananta Fauzi, Eka Resty Novieta Sari', 2018, 'Department of Agro-Industrial Technology, Faculty of Agricultural Technology, Universitas Brawijaya, Indonesia', 7, 1, 8, 'Books/312-1411-1-PB.pdf', 'https://industria.ub.ac.id/index.php/industri/article/view/312', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(13, '2252-861x', '2715-2685', 'Agroindustri, Tahu, Pendapatan, Biaya, dan Efisiensi', 'ANALISIS USAHA AGROINDUSTRI TAHU DI DESA KAMPUNG MEDAN KECAMATAN KUANTAN HILIR KABUPATEN KUANTAN SINGINGI', 'Erlangga Marsila , Elfi Indrawanis dan Jamalludin', 2022, 'Fakultas Pertanian, Universitas Islam Kuantan Singingi', 11, 2, 7, 'Books/2214-ArticleText-9396-1-10-20220518.pdf', 'https://www.ejournal.uniks.ac.id/index.php/GREEN/article/view/2214', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(14, '', '2807-5633', 'Indonesian, Indonesian Education Report Card, educational unit.', 'Rapor Pendidikan Indonesia: Quo Vadis Kualitas Pendidikan Indonesia?', 'Dwi Shintia, Masduki Asbari, Fadhila Khairunisa, Nurul Azizah', 2023, 'Journal of Information Systems and Management (JISMA)', 2, 6, 4, 'Books/ArticleText-0206-18-21.pdf', 'https://jisma.org/index.php/jisma/article/view/633', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(15, '3021-7474', '3021-7466', 'education, effective, interactive, Technology, virtual reality', 'Analisa Pengaruh Virtual Reality Terhadap Perkembangan Pendidikan Indonesia', 'Charles, Delvian Yosuky,Tio Sania Rachmi, Eryc', 2023, 'Pusat Riset dan Inovasi Nasional, Universitas Sains dan Teknologi Komputer Semarang', 1, 3, 14, 'Books/40-53+Analisa+Pengaruh+Virtual+Reality+Terhadap+Perkembangan+Pendidikan+Indonesia.pdf', 'https://jurnal.stikes-ibnusina.ac.id/index.php/INOVED/article/view/206', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(16, '2580-3735', '2580-1147', 'Akhlak, Media Pembelajaran, Pengembangan', 'Pengembangan Game Interaktif Wordwall untuk Meningkatkan Akhlak Terpuji Siswa Sekolah Dasar', 'Olisna Olisna, Milhatun Zannah, Auliani Sukma, Ani Nur Aeni', 2022, 'Universitas Pahlawan Tuanku Tambusai', 6, 3, 11, 'Books/admin,+97.+Olisna+4133+-+4143.pdf', 'https://jbasic.org/index.php/basicedu/article/view/2737', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(17, '', '2723-6390', 'Pengembangan Aplikasi, Game Edukatif, Literasi Budaya, Anak Usia Dini', 'Strategi Literasi Budaya Anak Usia Dini melalui Pengembangan Game Edukatif', 'Esti Kurniawati Mahardika, Tiara Sevi Nurmanita, Khaerul Anam, Mario Aditya Prasetyo', 2023, 'Perkumpulan Pengelola Jurnal PAUD Indonesia', 4, 2, 14, 'Books/287-ArticleText-1948-1-10-20231117.pdf', 'https://www.murhum.ppjpaud.org/index.php/murhum/article/view/287', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(18, '2356-1327', '2549-8959', 'game edukasi 3d, cinta tanah air, anak usia dini', 'Pengembangan Game Edukasi 3D untuk Menumbuhkan Cinta Tanah Air Sejak Dini', 'Indaria Tri Hariyani, Norma Diana Fitri', 2023, 'Universitas Pahlawan Tuanku Tambusai', 7, 2, 14, 'Books/3378-18624-3-PB.pdf', 'https://mail.obsesi.or.id/index.php/obsesi/article/view/3378', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(19, '2580-3735', '2580-1147', 'Game Edukasi, Android, Hasil Belajar', 'Pengembangan Game Edukasi Berbasis Android untuk Meningkatkan Hasil Belajar Siswa di Sekolah Dasar', 'Ririn Windawati, Henny Dewi Koeswanti', 2021, 'Universitas Pahlawan Tuanku Tambusai', 5, 2, 12, 'Books/admin,+64+Ririn+Windawati+1027-1038.pdf', 'https://jbasic.org/index.php/basicedu/article/view/835', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(20, '', '1411-3201', 'E-commerce, Model View Controller, Website', 'WEBSITE E-COMMERCE MENGGUNAKAN MODEL VIEW CONTROLLER ( MVC ) DENGAN FRAMEWORK CODEIGNITER Studi Kasus : Toko Miniatur', 'Donni Prabowo', 2015, 'Universitas Amikom Yogyakarta', 16, 1, 7, 'Books/225-705-1-PB.pdf', 'https://ojs.amikom.ac.id/index.php/dasi/article/view/225', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(21, '2355-9055', '2443-3640', 'website, ecommerce, penjualan, online, rikascollection', 'Perancangan Website E-Commerce Rikas Collection', 'Tubagus Riko Rivanthio', 2020, 'TEMATIK : Jurnal Teknologi Informasi dan Komunikasi�', 7, 2, 10, 'Books/485-ArticleText-637-1-10-20201230.pdf', 'https://jurnal.plb.ac.id/index.php/tematik/article/view/485', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(22, '2303-7533', '2339-2352', 'Lahan Sempit, Sistem Hidroponik', 'PEMANFAATAN LAHAN DENGAN MENGGUNAKAN SISTEM HIDROPONIK', 'Ida Syamsu Roidah', 2015, 'English Education : Journal of English Teaching and Research', 1, 2, 8, 'Books/14-ArticleText-22-1-10-20140916.pdf', 'https://journal.unita.ac.id/index.php/bonorowo/article/view/14', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(23, '', '2714-8785', 'Hidroponik, Teknologi, Pekarangan', 'Peningkatan Pendapatan Masyarakat Melalui Pemanfaatan Pekarangan Dengan Tekhnik Budidaya Hidroponik', 'Yudha Andriansyah Putra, Gustina Siregar, Sri Utami', 2019, 'Universitas Muhammadiyah Sumatera Utara', 1, 1, 6, 'Books/3589-7161-1-PB.pdf', 'https://jurnal.umsu.ac.id/index.php/snk/article/view/3589', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(24, '2623-2308', '2623-0119', 'Web Scraping, Text Mining, Akuisisi Informasi, Kategorisasi Informasi, Hidroponik', 'Implementasi Web Scrapping dan Text Mining untuk Akuisisi dan Kategorisasi Informasi dari Internet (Studi Kasus: Tutorial Hidroponik)', 'Agung Priyanto, Muhammad Rifqi Ma\'arif', 2018, 'Department of Information Systems, Universitas Atma Jaya Yogyakarta', 1, 1, 9, 'Books/clara_hetty_p,+3.+Implementasi+Web+Scraping+dan+Text+Mining+untuk+Akuisisi+dan+Kategorisasi+Informasi+Laman+Web+Tentang+Hidroponik.pdf', 'https://ojs.uajy.ac.id/index.php/IJIS/article/view/1664', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(25, '2541-1896', '2614-8714', 'sistem penjualan, incremental, Internet of Things (IoT), produk pertanian, Kabupaten Bogor', 'PENGGUNAAN INTERNET OF THINGS DALAM PEMASARAN PRODUK PERTANIAN', 'Helina Apriyani,�Sismadi Sismadi,�Sefrika Sefrika', 2018, 'Jusikom : Jurnal Sistem Komputer Musirawas', 3, 2, 9, 'Books/367-ArticleText-936-4-10-20221111.pdf', 'https://jurnal.univbinainsan.ac.id/index.php/jusikom/article/view/367', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(26, '2087-1716', '2548-7779', 'Soil moisture, Sensor, Arduino', 'MONITORING KELEMBABAN TANAH PERTANIAN MENGGUNAKAN SOIL MOISTURE SENSOR FC-28 DAN ARDUINO UNO', 'Husdi Husdi', 2018, 'Prodi Teknik Informatika FIK Universitas Muslim Indonesia', 10, 2, 7, 'Books/315-1016-2-PB.pdf', 'https://jurnal.fikom.umi.ac.id/index.php/ILKOM/article/view/315', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(27, '', '2654-5411', 'Badan Layanan Umum Daerah, Pengelolaan Keuangan', 'EVALUASI POLA PENGELOLAAN KEUANGAN SETELAH PENERAPAN BLUD DI PUSKESMAS SOREANG KABUPATEN BANDUNG', 'Ayu Laili Rahmiyati, Gunawan Irianto, Agus Riyanto, Husnia Dwi Rizkiyanti', 2020, 'Sekolah Tinggi Ilmu Kesehatan Jenderal Achmad Yani Cimahi', 2, 1, 9, 'Books/30-ArticleText-108-2-10-20210204.pdf', 'https://ejournal.stikesjayc.id/index.php/PLT/article/view/30', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(28, '0215-0832', '2986-2655', 'Implementasi Program Keluarga Harapan', 'IMPLEMENTASI PROGRAM KELUARGA HARAPAN DI DESA JANGKAR KECAMATAN JANGKAR KABUPATEN SITUBONDO', 'Farida Hanum, Nina Sa\'idah Fitriyah, Rifatul Husna', 2021, 'Fakultas�Ilmu Sosial dan Ilmu Politik�Universitas Abdurachman Saleh Situbondo', 17, 2, 14, 'Books/2010-109-11210-1-10-20220907.pdf', 'https://unars.ac.id/ojs/index.php/acton/article/view/2010', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(29, '2337-7607', '2337-7593', 'Pengendalian lampu, Mikrokontroller, IoT, Praktik', 'Penerapan Internet of Things Untuk Pengendalian Lampu Menggunakan NodeMCU ESP8266 Sebagai Media Pembelajaran Praktik Di Politeknik Kelautan Dan Perikanan Sorong', 'Egbert Josua Sirait, Andreas Pujianto, Boby Wisely Ziliwu', 2023, 'Universitas Pendidikan Muhammadiyah Sorong', 11, 1, 13, 'Books/2933-ArticleText-7159-1-10-20230119.pdf', 'https://unimuda.e-journal.id/jurnalpendidikan/article/view/2933', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(30, '', '2655-5263', 'Internet of Things (IoT), Kemitraan untuk Mencapai Tujuan, Monitoring Kondisi Air, Teknologi', 'Pelatihan Rancang Bangun Sistem Monitoring Kondisi Air Tambak Berbasis Internet of Things (IoT) di SMK Perikanan dan Kelautan Kecamatan Puger Kabupaten Jember', 'Alfian Pramudita Putra, Riries Rulaningtyas, Franky Chandra Satria Arisgraha', 2021, 'Program Studi Magister Pendidikan IPA Universitas Mataram', 4, 4, 6, 'Books/1007-1-10-20211015.pdf', 'https://jppipa.unram.ac.id/index.php/jpmpi/article/view/1007', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(31, '', '2745-9292', 'akuaponik, Budidaya Lobster, Aplikasi Mobile, IoT', 'Implementasi Budidaya Lobster dengan Sistem Pertanian Akuaponik Berbasis IoT (Internet of Things)', 'Irfan Mirda, Handrio, Bagus Wahyu Pratomo , Melvi, Ardian Ulvan, Aryanto', 2022, 'Politeknik Negeri Cilacap', 3, 1, 6, 'Books/1573-ArticleText-5182-1-10-20221012.pdf', 'https://ejournal.pnc.ac.id/index.php/ejoint/article/view/1573', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(32, '2614-3259', '2599-3410', 'Firm value, Environmental Accounting, Capital Structure, Financial Performance', 'Pengaruh Akuntansi Lingkungan Dan Struktur Modal Terhadap Nilai Perusahaan Dengan Kinerja Keuangan Sebagai Variabel Moderasi', 'Yani Yani, Anny Widiasmara, Abd Rohman Taufiq', 2023, 'LPPM STIE Al-Wasliyah Sibolga', 6, 2, 12, 'Books/1234-ArticleText-4271-1-10-20230511.pdf', 'https://stiealwashliyahsibolga.ac.id/jurnal/index.php/jesya/article/view/1234', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(33, '2614-3259', '2599-3410', 'Citra Bank, Penanganan Keluhan, Kepuasan dan Loyalitas', 'Pengaruh Citra Bank dan Penanganan Keluhan terhadap Kepuasan dan Loyalita Nasabah Tabungan pada Bank NTB Syariah Cabang Mataram', 'Listya Ayuningsih Surya Pratiwi, Muh Salahuddin, Pongky Arie Wijaya', 2023, 'LPPM STIE Al-Wasliyah Sibolga', 6, 2, 11, 'Books/1228-ArticleText-4272-1-10-20230511.pdf', 'https://stiealwashliyahsibolga.ac.id/jurnal/index.php/jesya/article/view/1228', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(34, '2964-3260', '2964-3252', 'SAK EMKM, Financial Reports, MSMEs', 'Penerapan Standar Akuntansi Keuangan Entitas Mikro Kecil dan Menengah (SAK EMKM) Dalam Penyusunan Laporan Keuangan Pada Istiqamah Store Di Lhkosemauwe', 'Intan Fitri Panisa Harahap, Tuti Anggraini, Kusmilawaty Kusmilawaty', 2023, 'Sekolah Tinggi Ilmu Administrasi (STIA) Yappi Makassar', 1, 5, 15, 'Books/VOLUME+1,+NO.+5,Okt+2023+Hal+342-359.pdf', 'http://journal-stiayappimakassar.ac.id/index.php/srj/article/view/693', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(35, '2964-3260', '2964-3252', 'Tafakkur, Sepak Bola, Religius, Sains', 'Tafakkur Filosofis-Analogis Sepak Boladalam Terminologi Religius dan Sains', 'Robingun Suyud El Syam, Akhmad Khoiri', 2023, 'Sekolah Tinggi Ilmu Administrasi (STIA) Yappi Makassar', 1, 5, 11, 'Books/SRJ+-+VOLUME+1,+NO.+5,+Oktober++2023+Hal+01-10.pdf', 'https://journal-stiayappimakassar.ac.id/index.php/srj/article/view/573', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(36, '2655-1365', '2654-5497', 'Sistem Akuntansi Keuangan, Kompetensi SDM, Sistem Pengendalian Internal, Kualitas', 'Analisis Sistem Akuntansi Keuangan Daerah dalam Menentukan Kualitas Laporan Keuangan di Kabupaten Jayapura', 'Gratiana D.H.D Puspita , Apner Siang , Taufik Rachman , Alfida Dogopia', 2023, 'Universitas Pahlawan Tuanku Tambusai', 5, 1, 11, 'Books/1112-ArticleText-2851-1-10-20230123.pdf', 'https://www.jonedu.org/index.php/joe/article/view/1112', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(37, '0853-8638', '2089-8045', 'Artificial Neural Network, Convolutional Neural Network, Deep Learning, Machine Learning, Segmentasi Gambar', 'PENERAPAN HYPERPARAMETER CONVOLUTIONAL NEURAL NETWORK (CNN) DALAM MEMBANGUN MODEL SEGMENTASI GAMBAR MENGGUNAKAN ARSITEKTUR U-NET DENGAN TENSORFLOW', 'Tri Sulistyorini, Erma Sova, Nelly Sofie, Revida Iriana Napitupulu', 2023, 'Jurnal Ilmiah Informatika Komputer', 28, 2, 10, 'Books/6959-24282-1-PB.pdf', 'https://ejournal.gunadarma.ac.id/index.php/infokom/article/view/6959', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(38, '', '2580-1643', 'E-Commerce, System Pembayaran, Naives Bayes, Decision Tree.', 'Sentiment Analysis Marketplaces Digital menggunakan Machine Learning', 'Feliks Ferianro Kiedrowsky, Andrianingsih', 2023, 'Lembaga Otonom Lembaga Informasi dan Riset Indonesia (KITA INFO dan RISET)', 7, 3, 7, 'Books/document.pdf', 'https://journal.lembagakita.org/index.php/jtik/article/view/1002', '2023-12-06 14:54:04', '2023-12-06 14:54:04'),
(39, '2808-8832', '2808-8670', 'media pembelajaran, mobile learning, game edukasi LACAKU', 'PENGEMBANGAN MEDIA PEMBELAJARAN MATEMATIKA BERBASIS MOBILE LEARNING MELALUI GAME EDUKASI LACAKU PADA MATERI ALJABAR', 'Annisah, Reflina, Ella Andhany', 2023, 'Fakultas Ilmu Tarbiyah dan Keguruan, UIN Sumatera Utara', 3, 2, 8, 'Books/13.ANNISAH213-220.pdf', 'https://ejournal.yana.or.id/index.php/relevan/article/view/850', '2023-12-06 14:54:05', '2023-12-06 14:54:05'),
(40, '0852-0941', '2549-0907', 'protection, privacy, personal data, cloud computing', 'KONSEP PERLINDUNGAN HUKUM ATAS PRIVASI DAN DATA PRIBADI DIKAITKAN DENGAN PENGGUNAAN CLOUD COMPUTING DI INDONESIA', 'Sinta Dewi', 2016, 'Faculty of Law, Universitas Sebelas Maret', 5, 1, 9, 'Books/8712-15812-1-PB.pdf', 'https://jurnal.uns.ac.id/yustisia/article/view/8712', '2023-12-06 14:54:05', '2023-12-06 14:54:05');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20231203144346-create-users.js'),
('20231204033513-create-actors.js'),
('20231206093510-books.js');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `actors`
--
ALTER TABLE `actors`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `actors`
--
ALTER TABLE `actors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `books`
--
ALTER TABLE `books`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
