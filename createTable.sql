DROP database IF EXISTS main1811;
CREATE DATABASE main1811;
USE main1811;


CREATE TABLE `HOCVIEN` (
  `MaHV` varchar(255) ,
  `Ho` varchar(255)  DEFAULT NULL,
  `Tendem` varchar(255)  DEFAULT NULL,
  `Ten` varchar(255)  DEFAULT NULL,
  `Gioitinh` enum('male','female')  DEFAULT NULL,
  `Email` varchar(255)  DEFAULT NULL,
  `Namsinh` int(4)  DEFAULT NULL,
  `Sonha` varchar(255)  DEFAULT NULL,
  `Duong` varchar(255)  DEFAULT NULL,
  `Quanhuyen` varchar(255)  DEFAULT NULL,
  `Tinhtp` varchar(255)  DEFAULT NULL,
  `Sodienthoai` int(11)  DEFAULT NULL,
  primary key (MaHV)
) ;

CREATE TABLE `PHUHUYNH` (
  `TenPH` varchar(255) ,
  `Namsinh` int(4) DEFAULT NULL,
  `Gioitinh` enum('male','female') DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Quanhe` varchar(255) DEFAULT NULL,
  `MaHV` varchar(255),
  `Sodienthoai` int(11) DEFAULT NULL,
  primary key (TenPH, MaHV),
  foreign key (MaHV) references HOCVIEN(MaHV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `KHOAHOC` (
  `MaKH` varchar(255) ,
  `Ten` varchar(255) DEFAULT NULL,
  `Hocphi` int(8) DEFAULT NULL,
  `Noidung` varchar(255) DEFAULT NULL,
  `Thoiluong` int(2) DEFAULT NULL,
  `Trangthai` enum('opening','closed') DEFAULT NULL,
  `Gioihansiso` int(3) DEFAULT NULL,
  `Yeucautrinhdo` float(2,1) DEFAULT NULL,
  primary key (MaKH)
) ;

CREATE TABLE `CHINHANH` (
  `MaCN` varchar(255) ,
  `Ten` varchar(255) DEFAULT NULL,
  `Sonha` varchar(255) DEFAULT NULL,
  `Duong` varchar(255) DEFAULT NULL,
  `Quanhuyen` varchar(255) DEFAULT NULL,
  `Tinhtp` varchar(255) DEFAULT NULL,
  primary key (MaCN)
) ;

CREATE TABLE `LOPHOC` (
  `MaLH` varchar(255) ,
  `Ngaybatdau` datetime DEFAULT NULL,
  `Ngayketthuc` datetime DEFAULT NULL,
  `Siso` int(3) DEFAULT NULL,
  `MaCN` varchar(255) ,
  `MaKH` varchar(255) ,
  primary key (MaLH),
  foreign key(MaCN) references chinhanh(MaCN) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key(MaKH) references khoahoc(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `KHOAKYNANG` (
  `Phanloai` varchar(255) DEFAULT NULL,
  `MaKH` varchar(255) ,
  primary key (MaKH),
  foreign key (MaKH) references KHOAHOC(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `KHOAONTHI` (
  `Muctieu` varchar(255) DEFAULT NULL,
  `Loaichungchi` varchar(255) DEFAULT NULL,
  `MaKH` varchar(255) ,
  primary key (MaKH),
  foreign key (MaKH) references KHOAHOC(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `KHOATHIEUNHI` (
  `MaKH` varchar(255) ,
  primary key (MaKH),
  foreign key (MaKH) references KHOAHOC(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `KHOATHIEUNIEN` (
  `MaKH` varchar(255) ,
  primary key (MaKH),
  foreign key (MaKH) references KHOAHOC(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `GIAOTRINH` (
  `MaGT` varchar(255) ,
  `Ten` varchar(255) DEFAULT NULL,
  `Namxuatban` int(4) DEFAULT NULL,
  primary key (MaGT)
) ;

CREATE TABLE `NHANVIEN` (
  `MaNV` varchar(255) ,
  `Ho` varchar(255) DEFAULT NULL,
  `Tendem` varchar(255) DEFAULT NULL,
  `Ten` varchar(255) DEFAULT NULL,
  `Namsinh` int(4) DEFAULT NULL,
  `Gioitinh` enum('male','female') DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Sodienthoai` int(11) DEFAULT NULL,
  primary key (MaNV)
) ;

CREATE TABLE `QUANLYGIAODUC` (
  `MaNV` varchar(255) ,
  primary key (MaNV),
  foreign key (MaNV) references NHANVIEN(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `GIAOVIEN` (
  `Kinhnghiem` int(2) DEFAULT NULL,
  `MaNV` varchar(255) ,
  primary key (MaNV),
  foreign key (MaNV) references NHANVIEN(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `TROGIANG` (
  `Kinhnghiem` int(2) DEFAULT NULL,
  `MaNV` varchar(255) ,
  primary key (MaNV),
  foreign key (MaNV) references NHANVIEN(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

-- TAO BANG MOI LIEN KET - 8 cai

CREATE TABLE `SUDUNG` (
  `MaGT` varchar(255) ,
  `MaKH` varchar(255) ,
  primary key (MaGT, MaKH),
  foreign key (MaGT) references GIAOTRINH(MaGT) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (MaKH) references KHOAHOC(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `DIEUCHINH_KH` (
  `MaKH` varchar(255) ,
  `QLGDmaNV` varchar(255) ,
  primary key (MaKH, QLGDmaNV),
  foreign key (MaKH) references KHOAHOC(MaKH) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (QLGDmaNV) references QUANLYGIAODUC(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `DIEUCHINH_LH` (
  `MaLH` varchar(255) ,
  `QLGDmaNV` varchar(255) ,
  primary key (MaLH, QLGDmaNV),
  foreign key (MaLH) references LOPHOC(MaLH) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (QLGDmaNV) references QUANLYGIAODUC(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `DANGKY` (
  `Ngaydangky` datetime DEFAULT NULL,
  `MaLH` varchar(255) ,
  `MaHV` varchar(255) ,
  primary key (MaLH, MaHV),
  foreign key (MaLH) references LOPHOC(MaLH) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (MaHV) references HOCVIEN(MaHV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `GIANGDAY` (
  `MaLH` varchar(255) ,
  `maNV` varchar(255) ,
  primary key (MaLH, maNV),
  foreign key (MaLH) references LOPHOC(MaLH) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (maNV) references GIAOVIEN(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `HOTRO` (
  `MaLH` varchar(255) ,
  `maNV` varchar(255) ,
  primary key (MaLH, maNV),
  foreign key (MaLH) references LOPHOC(MaLH) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (maNV) references TROGIANG(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `CONGTAC_GV` (
  `maNV` varchar(255) ,
  `MaCN` varchar(255) ,
  primary key (maNV, MaCN),
  foreign key (maNV) references GIAOVIEN(MaNV) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (MaCN) references CHINHANH(MaCN) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `CONGTAC_TG` (
  `maNV` varchar(255) ,
  `MaCN` varchar(255) ,
  primary key (maNV, MaCN),
  foreign key (maNV) references TROGIANG(MaNV) ON DELETE CASCADE ON UPDATE CASCADE,
  foreign key (MaCN) references CHINHANH(MaCN) ON DELETE CASCADE ON UPDATE CASCADE
) ;

-- TAO BANG THUOC TINH DA TRI - 14 cai

CREATE TABLE `TACGIA_GT` (
  `Tacgia` varchar(255) ,
  `MaGT` varchar(255) ,
  primary key (Tacgia, MaGT),
  foreign key (MaGT) references GIAOTRINH(MaGT) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `KYNANG_KKN` (
  `Kynang` varchar(255) ,
  `MaKH` varchar(255) ,
  primary key (Kynang, MaKH),
  foreign key (MaKH) references KHOAKYNANG(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `NGOAIKHOA_KTNHI` (
  `Ngoaikhoa` varchar(255) ,
  `MaKH` varchar(255) ,
  primary key (Ngoaikhoa, MaKH),
  foreign key (MaKH) references KHOATHIEUNHI(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `KYNANGSONG_KTNIEN` (
  `Kynangsong` varchar(255) ,
  `MaKH` varchar(255) ,
  primary key (Kynangsong, MaKH),
  foreign key (MaKH) references KHOATHIEUNIEN(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `DANHGIA_KH` (
  `Ten` varchar(255) ,
  `Noidung` varchar(255) ,
  `MaKH` varchar(255) ,
  primary key (Ten, Noidung, MaKH),
  foreign key (MaKH) references KHOAHOC(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `DOITUONG_KH` (
  `Doituong` varchar(255) ,
  `MaKH` varchar(255) ,
  primary key (Doituong, MaKH),
  foreign key (MaKH) references KHOAHOC(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `UUDAI_KH` (
  `Uudai` varchar(255) ,
  `MaKH` varchar(255) ,
  primary key (Uudai, MaKH),
  foreign key (MaKH) references KHOAHOC(MaKH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `THOIKHOABIEU_LH` (
  `Ngay` enum('2','3','4','5','6','7','8') ,
  `Giobatdau` int(4) ,
  `Gioketthuc` int(4) ,
  `MaLH` varchar(255) ,
  primary key (Ngay, Giobatdau, Gioketthuc, MaLH),
  foreign key (MaLH) references LOPHOC(MaLH) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `TRINHDO_HV` (
  `Diem` float(2,1) ,
  `Ngaycapnhat` datetime ,
  `MaHV` varchar(255) ,
  primary key (Diem, Ngaycapnhat, MaHV),
  foreign key (MaHV) references HOCVIEN(MaHV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `TRINHDO_GV` (
  `trinhdo` varchar(255) ,
  `maNV` varchar(255) ,
  primary key (trinhdo, maNV),
  foreign key (maNV) references GIAOVIEN(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `TRINHDO_TG` (
  `trinhdo` float(2,1) ,
  `maNV` varchar(255) ,
  primary key (trinhdo, maNV),
  foreign key (maNV) references TROGIANG(MaNV) ON DELETE CASCADE ON UPDATE CASCADE
) ;

CREATE TABLE `CHANGE_LOG` (
  `thoigian` datetime,
  `noidung` varchar(255),
  primary key (thoigian, noidung)
)