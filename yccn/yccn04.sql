-- ----------------------------------------------
-- ----------------------------------------------
-- ------ YCCN: thống kê số liệu kinh doanh -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `solieukinhdoanh`()
    NO SQL
begin
SELECT 'Tổng số lớp đang mở:' as ' ';
	SELECT COUNT(lophoc.MaLH) AS So_Lop_Mo
    FROM lophoc
    WHERE lophoc.Ngayketthuc > CURRENT_TIME();

SELECT 'Tổng số lớp đang mở của mỗi khóa học:' as ' ';
	SELECT khoahoc.MaKH, khoahoc.Ten, COUNT(lophoc.MaLH) AS So_Lop_Mo
    FROM khoahoc JOIN lophoc ON khoahoc.MaKH = lophoc.khoahocMaKH
    WHERE lophoc.Ngayketthuc < CURRENT_TIME()
    GROUP BY khoahoc.MaKH;
    
SELECT 'Trung bình số học viên đăng ký mỗi ngày:' as ' ';
    SELECT (COUNT(DISTINCT dangky.hocvienMaHV) / (max(date(dangky.Ngaydangky)) - MIN(date(dangky.Ngaydangky)))) as Trung_Binh_HV
    FROM dangky;
    
SELECT 'Trung bình số lượt đăng ký mỗi ngày:' as ' ';
    SELECT (COUNT(dangky.hocvienMaHV) / (max(date(dangky.Ngaydangky)) - MIN(date(dangky.Ngaydangky)))) as Trung_Binh_Luot_Dangky
    FROM dangky;

SELECT 'Tổng số học viên:' as ' ';
	SELECT COUNT(DISTINCT dangky.hocvienMaHV)
    FROM dangky;

SELECT 'Tổng số học viên ở mỗi chi nhánh:' as ' ';
	SELECT chinhanh.MaCN, chinhanh.Ten, COUNT(DISTINCT dangky.hocvienMaHV) AS So_Hoc_Vien
    FROM chinhanh JOIN lophoc ON chinhanh.MaCN = lophoc.chinhanhMaCN JOIN dangky ON lophoc.MaLH = dangky.lophocMaLH
    GROUP BY chinhanh.MaCN;
end$$
DELIMITER ;