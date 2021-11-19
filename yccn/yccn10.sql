
-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ------ YCCN: Xem danh sách học viên của 1 lớp do GV/TG phụ trách -----

	------------ Bảng tạm 1: Danh sách học viên của 1 lớp học -------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachhocvien`(IN `maLH` VARCHAR(255))
BEGIN
SELECT hocvien.MaHV, hocvien.Ho, hocvien.Tendem, hocvien.Ten, (year(CURRENT_TIME()) - hocvien.Namsinh) as Tuoi
FROM hocvien JOIN dangky ON dangky.hocvienMaHV = hocvien.MaHV
WHERE dangky.lophocMaLH = maLH;
END$$
DELIMITER ;

	------------ Bảng tạm 2: Danh sách lớp học do một giáo viên/trợ giảng phụ trách -----------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `danhsachlop_phutrach`(IN `maNV` VARCHAR(255))
BEGIN 
SELECT lophoc.MaLH, lophoc.khoahocMaKH, khoahoc.Ten
FROM lophoc JOIN khoahoc ON lophoc.khoahocMaKH = khoahoc.MaKH
WHERE lophoc.MaLH IN(
    SELECT giangday.lophocMaLH
    FROM giangday
    WHERE giangday.giaovienNhanvien = maNV
    )
OR lophoc.MaLH IN(
    SELECT hotro.lophocMaLH
    FROM hotro
    WHERE hotro.trogiangNhanvien = maNV
    );
END$$
DELIMITER ;

	---------------------BẢNG CHÍNH---------------------------------	

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachhocvien_GV_TG`(IN `maNV` VARCHAR(255), IN `maLH` VARCHAR(255))
BEGIN
CASE LEFT(maNV,2)
WHEN 'GV' THEN
	IF (maLH IN (
        SELECT giangday.lophocMaLH
        FROM giangday
        WHERE giangday.giaovienNhanvien = maNV
        )
    ) THEN CALL xemdanhsachhocvien(maLH);
    ELSE 
    SELECT 'Đây không phải lớp do bạn phụ trách, vui lòng nhập lại. Sau đây là các lớp do bạn phụ trách' AS '';
    CALL danhsachlop_phutrach(maNV);
    END IF;


WHEN 'TG' THEN 
	IF (maLH IN (
        SELECT hotro.lophocMaLH
        FROM hotro
        WHERE hotro.trogiangNhanvien = maNV
        )
    ) THEN CALL xemdanhsachhocvien(maLH);
    ELSE 
    SELECT 'Đây không phải lớp do bạn phụ trách, vui lòng nhập lại. Sau đây là các lớp do bạn phụ trách' AS '';
    CALL danhsachlop_phutrach(maNV);
    END IF;

END CASE;
END$$
DELIMITER ;
