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
-- Cấu trúc bảng cho bảng `trinhdo_hv`
--

CREATE TABLE `trinhdo_hv` (
  `Diem` int(11) NOT NULL,
  `Ngaycapnhat` datetime NOT NULL,
  `hocvienMaHV` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `trinhdo_hv`
--

INSERT INTO `trinhdo_hv` (`Diem`, `Ngaycapnhat`, `hocvienMaHV`) VALUES
(4, '2020-01-15 05:40:50', '1912123'),
(5, '2021-01-15 05:40:50', '1912190'),
(6, '2021-08-15 05:40:50', '1912190'),
(6, '2021-11-05 05:40:50', '1912123'),
(7, '2021-11-11 05:40:50', '1912190');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `trinhdo_hv`
--
ALTER TABLE `trinhdo_hv`
  ADD PRIMARY KEY (`Diem`,`Ngaycapnhat`,`hocvienMaHV`),
  ADD KEY `hocvienMaHV` (`hocvienMaHV`);

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `trinhdo_hv`
--
ALTER TABLE `trinhdo_hv`
  ADD CONSTRAINT `trinhdo_hv_ibfk_1` FOREIGN KEY (`hocvienMaHV`) REFERENCES `hocvien` (`MaHV`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
