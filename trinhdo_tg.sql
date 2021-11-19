-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 19, 2021 lúc 09:16 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `maindb`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `trinhdo_tg`
--

CREATE TABLE `trinhdo_tg` (
  `trinhdo` int(11) NOT NULL,
  `trogiangNhanvien` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `trinhdo_tg`
--

INSERT INTO `trinhdo_tg` (`trinhdo`, `trogiangNhanvien`) VALUES
(7, 'TG001'),
(7, 'TG003'),
(8, 'TG002'),
(8, 'TG004');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `trinhdo_tg`
--
ALTER TABLE `trinhdo_tg`
  ADD PRIMARY KEY (`trinhdo`,`trogiangNhanvien`),
  ADD KEY `trogiangNhanvien` (`trogiangNhanvien`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `trinhdo_tg`
--
ALTER TABLE `trinhdo_tg`
  ADD CONSTRAINT `trinhdo_tg_ibfk_1` FOREIGN KEY (`trogiangNhanvien`) REFERENCES `trogiang` (`nhanvienMaNV`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
