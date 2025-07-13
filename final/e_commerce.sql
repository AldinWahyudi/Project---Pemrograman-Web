-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Jul 2025 pada 08.44
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_commerce`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `total_items` int(11) DEFAULT NULL,
  `total_amount` bigint(20) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `shipping_address` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `total_items`, `total_amount`, `created_at`, `payment_method`, `shipping_address`) VALUES
(1, 1, 11999000, '2025-07-09 03:37:54', NULL, NULL),
(2, 1, 11999000, '2025-07-09 03:38:45', NULL, NULL),
(3, 0, 0, '2025-07-09 03:40:23', NULL, NULL),
(4, 1, 11999000, '2025-07-09 03:46:51', '', ''),
(5, 0, 0, '2025-07-09 03:47:02', '', ''),
(6, 0, 0, '2025-07-09 03:53:08', '', ''),
(7, 0, 0, '2025-07-09 03:55:29', '', ''),
(8, 0, 0, '2025-07-09 03:59:26', '', ''),
(9, 1, 11999000, '2025-07-09 06:29:12', 'Bank Transfer', 'ss'),
(10, 3, 33988000, '2025-07-09 09:10:06', 'COD', 'denis'),
(11, 1, 123456789, '2025-07-10 03:18:35', 'Bank Transfer', 'bnbn'),
(12, 1, 210000000, '2025-07-10 10:55:51', 'COD', 'saddad'),
(13, 1, 54000000, '2025-07-12 04:27:47', 'E-Wallet', 'vn vv'),
(14, 1, 21000000, '2025-07-12 04:31:22', 'E-Wallet', 'vcvcvc'),
(15, 1, 45000000, '2025-07-12 07:03:20', 'COD', 'hjkl');

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `item_detail` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `item_detail`, `created_at`) VALUES
(1, 2, 'Sony ZV-E10 × 1', '2025-07-09 01:38:45'),
(2, 4, 'Sony ZV-E10 × 1', '2025-07-09 01:46:51'),
(3, 9, 'Sony ZV-E10 × 1', '2025-07-09 04:29:12'),
(4, 10, 'Sony ZV-E10 × 2', '2025-07-09 07:10:06'),
(5, 10, 'Canon EOS M50 Mark II × 1', '2025-07-09 07:10:06'),
(6, 11, 'salvatore × 1', '2025-07-10 01:18:35'),
(7, 12, 'weyu x1000 × 1', '2025-07-10 08:55:51'),
(8, 13, 'GEXEN PolarCore 1 – Defy the Cold × 1', '2025-07-12 02:27:47'),
(9, 14, 'SNILOR ERILIY escape × 1', '2025-07-12 02:31:22'),
(10, 15, 'Dignite Glacior 35 – Cold Design × 1', '2025-07-12 05:03:20');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`id`, `name`, `brand`, `price`, `image`, `created_at`, `description`) VALUES
(19, 'Akira x Deadpool ', 'Akira Digital', 12000000, 'uploads/1752282769_e0b01a1c-6504-44c9-a77a-29d755226d3d.jpg', '2025-07-12 01:12:49', 'Siap-siap untuk menangkap momen dengan gaya paling nyentrik dan penuh aksi! Kolaborasi epik antara AKIRA, brand kamera kebanggaan pecinta fotografi, dan Deadpool, anti-hero ikonik Marvel, menghadirkan kamera edisi spesial yang tak hanya canggih tapi juga penuh karakter.\r\n\r\n🔥 Desain Eksklusif Deadpool\r\nBalutan warna merah-hitam khas Deadpool, lengkap dengan detail grafis dan logo resmi menjadikan kamera ini bukan cuma alat foto, tapi juga koleksi keren bagi fans sejati.\r\n\r\n📸 Fitur Unggulan AKIRA\r\nDibekali dengan teknologi unggulan: resolusi tinggi, fokus super cepat, dan mode malam yang tajam. Cocok untuk yang suka aksi cepat atau potret gaya cinematic ala Wade Wilson.\r\n\r\n🎁 Bonus Merchandise\r\nSetiap pembelian unit edisi ini dilengkapi dengan bonus eksklusif seperti strap bertema Deadpool, stiker limited edition, dan kartu kolektor resmi.'),
(20, 'Camra PDPC Cohor Edition', 'Camra', 30000000, 'uploads/1752282909_d790cb65-e3d4-46a8-a073-e42daaca563e.jpg', '2025-07-12 01:15:09', 'Inilah Camra PDPC Cohor Edition, kamera edisi khusus yang dirancang untuk mewakili semangat pembelajaran, kolaborasi, dan keberagaman dalam program PDPC. Dengan desain lensa dinamis dan warna latar pelangi yang cerah, kamera ini tak hanya menangkap gambar—tapi juga merayakan momen berharga bersama cohort-mu.\r\n\r\n🌈 Desain Ceria dan Penuh Makna\r\nWarna-warni latar yang ikonik merepresentasikan keberagaman ide, kreativitas, dan semangat komunitas. Cocok untuk mereka yang ingin tampil beda dan bermakna.\r\n\r\n📸 Teknologi Gambar Unggulan\r\n\r\nLensa ultra-clear dengan efek warna alami\r\n\r\nAuto-focus cepat dan presisi tinggi\r\n\r\nCocok untuk dokumentasi kegiatan, vlog, hingga konten kreatif\r\n\r\n🎓 Edisi Terbatas untuk Para Visioner\r\nDirancang sebagai simbol pencapaian dan perjalanan selama program PDPC. Memiliki label “Cohor Edition” sebagai bukti kebanggaan dan eksklusivitas.\r\n\r\n🎁 Isi dalam Box:\r\n\r\nCamra PDPC Cohor Edition\r\n\r\nStrap bertema cohort\r\n\r\nBuku mini perjalanan PDPC\r\n\r\nKartu edisi kolektor'),
(21, 'VIREX Reddix One', 'VIREX', 8000000, 'uploads/1752283071_6e397b2f-9002-4670-848c-f21a123da1fc.jpg', '2025-07-12 01:17:51', 'Perkenalkan VIREX Reddix One, kamera digital compact dengan performa modern dalam balutan desain retro-futuristik. Warna merah gloss yang mencolok berpadu dengan bodi logam perak, menjadikannya gadget yang tampil beda sekaligus premium.\r\n\r\n📷 Desain Retro, Teknologi Masa Kini\r\nSentuhan klasik dengan tampilan minimalis, dikombinasikan dengan sensor modern untuk hasil jepretan jernih dan tajam. Cocok untuk content creator, traveler, dan pecinta street photography.'),
(22, 'BLAXX OF-1C', 'BLAXX', 8000000, 'uploads/1752283243_a89c7e5f-737d-4144-8184-04c6d72a4efe.jpg', '2025-07-12 01:20:43', 'Masuki dunia fotografi profesional dengan BLAXX OF-1C, kamera flagship dari BLAXX yang dirancang untuk fotografer serius, videografer tangguh, dan kreator konten yang menginginkan performa maksimal dalam bodi tangguh dan elegan.\r\n\r\n🖤 Desain Premium & Ergonomis\r\nDibalut warna hitam matte dengan grip karet anti-slip, BLAXX OF-1C tidak hanya terlihat garang, tetapi juga mantap di genggaman—siap menemani setiap momen pentingmu.\r\n\r\n🔍 Fitur Unggulan BLAXX OF-1C\r\n\r\nLensa BLAXX KL 20i untuk kejernihan luar biasa dan depth yang dramatis\r\n\r\nSensor CMOS Full Frame 30MP untuk warna alami dan noise minimal\r\n\r\nKecepatan shutter tinggi untuk menangkap aksi cepat tanpa blur\r\n\r\nPerekaman video 4K UHD 60fps dengan sistem stabilisasi canggih\r\n\r\nDual slot SD dan port USB-C untuk transfer cepat\r\n\r\n⚙️ Ideal untuk:\r\nFotografi jurnalistik, travel, dokumenter, wedding, hingga produksi sinematik.'),
(23, 'Nimon ML-Pro', 'Nimon', 5000000, 'uploads/1752283363_1ac99639-18c2-4833-9ba8-d94813c5ad65.jpg', '2025-07-12 01:22:43', 'Rasakan keunggulan optik dan ketajaman teknologi dalam satu perangkat dengan Nimon ML-Pro. Dirancang untuk fotografer profesional dan kreator visual yang menuntut kualitas maksimal dari setiap jepretan.\r\n\r\n🖤 Desain Solid, Tampilan Elegan\r\nBalutan hitam matte dengan lekukan ergonomis dan tombol kontrol presisi memberikan kenyamanan maksimal saat digunakan dalam sesi panjang. Logo Nimon dan aksen metalik menunjukkan kelasnya sebagai kamera premium.\r\n\r\n🔍 Spesifikasi Unggulan:\r\nSensor Full Frame 26.8MP dengan reproduksi warna akurat\r\nLensa ML Pro Series – ketajaman ekstrem dan depth yang mengesankan\r\nISO hingga 51200 untuk kondisi pencahayaan rendah\r\nPerekaman video 6K Ultra HD, dukungan log profile dan slow motion\r\nStabilizer internal 5-axis dan layar sentuh articulating\r\n\r\n📱 Fitur Modern:\r\nWiFi + Bluetooth untuk kontrol jarak jauh dan transfer cepat\r\nDual card slot untuk produktivitas tinggi\r\nMode ML (Manual-Logic) eksklusif dari Nimon, untuk kontrol kreatif penuh'),
(24, 'Coountry Heritage 55', 'Coountry', 30000000, 'uploads/1752283474_a0e762a4-e0d2-4761-a6bc-8d58575ba8e9.jpg', '2025-07-12 01:24:34', 'Hadirkan kembali romantisme fotografi klasik dengan Coountry Heritage 55, kamera analog edisi koleksi yang menggabungkan desain retro otentik dengan keandalan mekanis khas era keemasan. Dibuat untuk para pecinta seni visual dan penggemar vintage sejati.\r\n\r\n📷 Estetika Klasik yang Abadi\r\nDengan bodi berbalut kulit sintetis hitam, logam emas pucat, dan ukiran halus pada lensa, Coountry Heritage 55 bukan hanya kamera—tapi juga karya seni.\r\n\r\n🧭 Fitur Mekanik Autentik:\r\n\r\nLensa putar dengan pengaturan aperture dan shutter manual\r\n\r\nSistem lipat klasik (folding camera)\r\n\r\nKompatibel dengan film 35mm untuk hasil jepretan bertekstur\r\n\r\nDial pengaturan yang responsif, membawa kamu ke pengalaman fotografi murni'),
(25, 'Coountry Duochrome 66', 'Coountry', 23000000, 'uploads/1752283549_7b446c05-8560-43f3-95e3-c71a46f10e02.jpg', '2025-07-12 01:25:49', 'Kamera Coountry Duochrome 66 adalah bentuk penghormatan terhadap era keemasan fotografi analog. Dengan desain twin-lens retro yang otentik dan bodi lipat khas medium format, kamera ini diciptakan bagi mereka yang mencintai detail, tekstur, dan karakter dalam setiap gambar.\r\n\r\n🎞️ Twin Lens, Double the Soul\r\nDilengkapi dua lensa utama: satu untuk pengambilan gambar, satu lagi untuk viewfinder, menciptakan pengalaman membidik yang unik, khas kamera TLR (Twin Lens Reflex) klasik.\r\n\r\n🔍 Spesifikasi Khas Vintage:\r\n\r\nKompatibel dengan film 120 medium format\r\n\r\nFokus manual dengan viewfinder atas (waist-level finder)\r\n\r\nShutter mekanik presisi tinggi\r\n\r\nMaterial logam & kulit sintetis, tahan lama dan berkarakter'),
(26, 'SAJA BOYA Classic Vibe', 'SAJA', 14200000, 'uploads/1752283938_a0c55a79-97dc-4635-9432-cdae7d001295.jpg', '2025-07-12 01:32:18', 'SAJA BOYA Classic Vibe bukan sekadar kamera—ini adalah pernyataan sikap. Dengan desain lipat khas era 50-an dan bodi logam kokoh berbalut kulit, kamera ini mengajakmu kembali ke masa ketika setiap foto diambil dengan penuh pertimbangan dan rasa.\r\n\r\n📷 Karakter Kuat, Nama Berani\r\nNama “SAJA BOYA” mencerminkan keunikan dan kebebasan gaya. Kamera ini cocok untuk kamu yang percaya bahwa seni visual tidak harus konvensional.\r\n\r\n🧭 Fitur Mekanis Antik:\r\n\r\nLensa fixed fokus dengan pengaturan aperture manual\r\n\r\nJendela bidik klasik untuk pengalaman membidik autentik\r\n\r\nBodi lipat (folding) praktis untuk dibawa ke mana saja\r\n\r\nMenggunakan film 35mm – hasilkan efek grain alami yang dicari banyak fotografer modern\r\n\r\n🎞️ Untuk yang Mau Beda:\r\nCocok untuk seniman visual, fotografer indie, hingga kolektor barang unik. Dengan SAJA BOYA, kamu tak hanya memotret—kamu membuat pernyataan.'),
(27, 'SAJA Poétika 75', 'SAJA', 7400000, 'uploads/1752284005_a6e6c2d3-c08c-448f-af04-75077185f915.jpg', '2025-07-12 01:33:25', 'Kamera SAJA Poétika 75 hadir sebagai ode untuk masa ketika fotografi adalah seni yang lambat, penuh makna, dan jujur. Desain lipat bergaya awal abad ke-20 dipadukan dengan finishing kulit hitam dan lensa perak, menjadikannya ikon nostalgia yang siap mengabadikan momen dengan karakter yang tak tergantikan.\r\n\r\n🖤 Estetik Puisi dalam Kamera\r\nLabel “SAJA” di atas lensa bukan hanya merek—ia adalah sikap: sederhana, tajam, dan penuh rasa. Kamera ini membawa kembali romantisme analog dalam dunia yang serba instan.\r\n\r\n📷 Spesifikasi Emosional:\r\n\r\nSistem lipat klasik (folding mechanism)\r\n\r\nLensa SAJA Optics 75mm f/3.5 dengan efek vignette alami\r\n\r\nPengoperasian manual penuh – karena kontrol ada di tangan kreator\r\n\r\nMenggunakan film 120 format – menghasilkan grain dan kedalaman khas\r\n\r\n📜 Untuk Siapa Kamera Ini?\r\nBuat mereka yang menulis puisi dengan cahaya. Cocok untuk seniman, fotografer jalanan, kolektor antik, dan siapa pun yang menghargai proses.'),
(28, 'Dignite Glacior 35 – Cold Design', 'Dignite', 45000000, 'uploads/1752284080_eda52262-8aa2-487b-9d81-ab5a4b04cfb8.jpg', '2025-07-12 01:34:40', 'Dignite Glacior 35 adalah kamera rangefinder klasik yang memadukan ketangguhan mekanikal dengan keanggunan desain dingin. Dirancang untuk fotografer yang menghargai presisi, minimalisme, dan estetika Eropa, Glacior 35 bukan hanya kamera—ia adalah pernyataan gaya.\r\n\r\n❄️ Tampil Dingin, Kerja Panas\r\nDengan bodi logam perak dingin dan grip kulit hitam bertekstur, kamera ini tampil kokoh namun tetap nyaman digenggam dalam segala kondisi—baik di studio, jalanan kota, maupun lanskap bersalju.\r\n\r\n🔍 Spesifikasi Inti:\r\n\r\nLensa Dignite ICAR 45mm f/2.8 – tajam, cepat, dan natural\r\n\r\nSistem rangefinder manual – membidik dengan kontrol penuh\r\n\r\nMenggunakan film 35mm klasik\r\n\r\nDial pengaturan aperture dan kecepatan yang presisi\r\n\r\nCold-tested mechanism – siap untuk kondisi ekstrem\r\n\r\n🎒 Untuk Fotografer Sejati\r\nCocok untuk kamu yang mencintai proses—bukan hanya hasil. Karena kamera ini tidak akan membantu kamu menebak-nebak: semua ada di tangan dan mata.'),
(29, 'CEMRITA Grand Époque', 'CEMRITA', 70000000, 'uploads/1752284140_f88a0cff-7c9e-4636-9279-2dda0dd9421a.jpg', '2025-07-12 01:35:40', 'Memperkenalkan CEMRITA Grand Époque, kamera folding edisi prestise yang tak hanya memotret dunia—tapi juga menuliskannya dalam detail. Dengan ukiran perak tangan di bagian panel lensa, dan mekanisme lipat presisi tinggi, kamera ini membawa kemewahan dan kemurnian dalam satu bingkai.\r\n\r\n🌿 Keindahan Tak Hanya pada Gambar, Tapi pada Alatnya\r\nSetiap detail CEMRITA Grand Époque dirancang untuk memikat: dari engrave floral yang memesona, hingga tombol logam dengan tekstur mekanik halus.\r\n\r\n📷 Spesifikasi Artistik:\r\n\r\nLensa CEMRITA 80mm f/3.5, dengan hasil lembut dan creamy bokeh\r\n\r\nUkiran logam presisi, disesuaikan secara eksklusif\r\n\r\nFokus manual dan pengaturan aperture klasik\r\n\r\nFilm 120 format untuk pengalaman medium format sejati\r\n\r\nMekanisme folding yang kuat namun anggun\r\n\r\n🎨 Untuk Kolektor, Seniman, dan Pecinta Desain\r\nLebih dari sekadar alat fotografi, kamera ini adalah simbol gaya hidup klasik dan elegan. Cocok menghiasi studio, galeri seni, atau di tangan fotografer yang tahu rasa.'),
(30, 'GEXEN PolarCore 1 – Defy the Cold', 'GEXEN', 54000000, 'uploads/1752284208_92de49e4-1c79-4e0d-af4e-6c7dc1d968e2.jpg', '2025-07-12 01:36:48', 'GEXEN PolarCore 1 adalah kamera profesional yang dirancang untuk kondisi ekstrem. Dengan bodi berlapis es dan lensa tahan suhu rendah, kamera ini diciptakan bagi para penjelajah visual yang berani menantang kutub dunia maupun malam beku di puncak gunung.\r\n\r\n🌌 Tahan Beku. Tahan Guncang. Tahan Batas.\r\nGexen menghadirkan lini \"PolarCore\" untuk para fotografer ekspedisi. Dari desain grip frost-resistant hingga internal sealing yang menjaga performa di suhu -30°C, kamera ini tidak pernah menyerah.\r\n\r\n📸 Spesifikasi Unggulan:\r\n\r\nSensor GEX-RX 26MP APS-C, optimalkan hasil dalam cahaya minim\r\n\r\nLensa OMTALENOX FloaOF 24mm f/1.4 – ultra-wide, ultra-bright\r\n\r\nWeathersealed total – tahan salju, hujan es, dan kelembaban ekstrem\r\n\r\nMode Frost HDR™: menangkap spektrum salju & cahaya utara dengan presisi\r\n\r\nBaterai cryo-core untuk performa maksimal saat beku\r\n\r\n🧭 Untuk Siapa Kamera Ini?\r\nPendaki, ekspedisioner Arktik, pemburu aurora, jurnalis iklim, atau siapa saja yang tidak hanya memotret keindahan alam, tapi juga bertempur bersamanya.'),
(31, 'Naitor Cador', 'Cador', 11000000, 'uploads/1752284269_cb9b2fea-6a88-4fec-8665-e465deee5dd4.jpg', '2025-07-12 01:37:49', 'Naitor Cador adalah kamera analog edisi terbatas yang memadukan desain klasik penuh karakter dengan teknologi optik presisi. Dibalut dalam warna biru pastel ceria dan dilengkapi ilustrasi ala pelancong era 50-an, kamera ini bukan sekadar alat dokumentasi—tapi karya seni yang hidup.\r\n\r\n🎨 Estetika Vintage yang Otentik\r\nDari motif bunga salju di bodi hingga ilustrasi pejalan kaki ikonik di sisi samping, setiap detail membawa nuansa nostalgia—cocok untuk kolektor dan penggemar kamera retro.\r\n\r\n📷 Fitur Unggulan:\r\n\r\nLensa MACION ME 50mm f/2.4 coated classic glass\r\n\r\nFokus manual presisi dengan click aperture\r\n\r\nBodi ringan dengan konstruksi solid aluminium\r\n\r\nKompatibel dengan film 35mm\r\n\r\nDesain ergonomis untuk genggaman nyaman saat perjalanan\r\n\r\n🌍 Didesain untuk Petualang Romantis\r\nNaitor Cador adalah pilihan sempurna bagi fotografer yang mencintai perjalanan dengan nuansa sentimental dan sentuhan personal di setiap jepretan.'),
(32, 'SNILOR ERILIY escape', 'Snilor', 21000000, 'uploads/1752284342_7dfc228e-4175-43a7-838c-0508d4f38163.jpg', '2025-07-12 01:39:02', 'SNILOR ERILIY hadir sebagai kamera analog edisi terbatas dengan tampilan penuh warna dan keberanian. Terinspirasi dari semangat eksplorasi luar angkasa dan karnaval bintang, kamera ini ditujukan bagi mereka yang berani tampil beda.\r\n\r\n🌟 Desain yang Tak Biasa, Untuk Jiwa Tak Biasa\r\nBalutan warna merah, putih, biru, dan ikon bintang serta planet menjadikan kamera ini layaknya kapsul waktu penuh gaya. Cocok untuk pecinta desain pop-retro maupun kolektor kamera unik.\r\n\r\n📷 Spesifikasi Utama:\r\n\r\nLensa ERILIY Pro 50mm f/1.8 untuk hasil tajam dalam berbagai pencahayaan\r\n\r\nKompatibel dengan film 35mm\r\n\r\nDial manual kontrol ISO dan kecepatan rana\r\n\r\nBody coated anti-selip dan ringan\r\n\r\nJendela bidik optik jernih\r\n\r\nSeri edisi “CM” (Cosmic Model)\r\n\r\n🚀 Untuk Siapa Kamera Ini?\r\nSNILOR adalah kamera untuk seniman visual, remaja kreatif, dan siapa pun yang ingin menyuarakan warna dalam setiap jepretan.');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `role` varchar(10) DEFAULT 'user'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `password`, `birthdate`, `gender`, `role`) VALUES
(1, 'Admin', NULL, 'admin@shop.com', '$2y$10$vgd6TTouRZ4zeXuqQ8mGuuGIccqTyDS1WPhRJIa093gWk7kGNCkBK', '0000-00-00', 'male', 'admin'),
(2, 'roblox', '', 'robloxislife@roblox.blox', '$2y$10$JC.knJsXEsF6ajQ22ivpQOCKWHtXqaoi6EkpUvcn2n6SHsP1Ectvq', '0000-00-00', 'male', 'user');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT untuk tabel `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
