
	-- --------- Bảng tạm 1: Trả về danh sách giáo viên/trợ giảng của các lớp do một giáo viên/trợ giảng phụ trách -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachlop_GV_TG_temp`(IN `maNV` VARCHAR(255), IN `type` INT(4) UNSIGNED)
BEGIN
	CASE type
    WHEN 0 THEN
    SELECT lophoc.MaLH, giangday.giaovienNhanvien AS Giao_Vien
    FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH LEFT JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH
    WHERE lophoc.MaLH IN (
        SELECT giangday.lophocMaLH
        FROM giangday
        WHERE giangday.giaovienNhanvien = maNV
		)
    OR lophoc.MaLH IN (
        SELECT hotro.lophocMaLH
        FROM hotro
        WHERE hotro.trogiangNhanvien = maNV
        )
    GROUP BY lophoc.MaLH, giangday.giaovienNhanvien
    ORDER BY lophoc.MaLH;
    
    WHEN 1 THEN
    SELECT lophoc.MaLH, hotro.trogiangNhanvien AS Tro_Giang
    FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH LEFT JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH
    WHERE lophoc.MaLH IN (
        SELECT giangday.lophocMaLH
        FROM giangday
        WHERE giangday.giaovienNhanvien = maNV
		)
    OR lophoc.MaLH IN (
        SELECT hotro.lophocMaLH
        FROM hotro
        WHERE hotro.trogiangNhanvien = maNV
        )
    GROUP BY lophoc.MaLH, hotro.trogiangNhanvien
    ORDER BY lophoc.MaLH;
    END CASE;
END$$
DELIMITER ;

	-- --------- Bảng tạm 2: Trả về thời khóa biểu các lớp do một giáo viên/trợ giảng phụ trách -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachlop_GV_TG_tkb`(IN `maNV` VARCHAR(255))
BEGIN
SELECT thoikhoabieu_lh.lophocMaLH, thoikhoabieu_lh.Ngay, thoikhoabieu_lh.Giobatdau, thoikhoabieu_lh.Gioketthuc
FROM thoikhoabieu_lh
WHERE thoikhoabieu_lh.lophocMaLH IN (
        SELECT giangday.lophocMaLH
        FROM giangday
        WHERE giangday.giaovienNhanvien = maNV
		)
OR thoikhoabieu_lh.lophocMaLH IN (
        SELECT hotro.lophocMaLH
        FROM hotro
        WHERE hotro.trogiangNhanvien = maNV
        )
ORDER BY thoikhoabieu_lh.lophocMaLH;
END$$
DELIMITER ;

	-- --------------------------- 	BẢNG CHÍNH ---------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachlop_GV_TG`(IN `maNV` VARCHAR(255))
BEGIN
	SELECT 'Các lớp mà bạn phụ trách là:' AS ' ';
	CASE LEFT(maNV,2)
    WHEN 'GV' THEN
        SELECT lophoc.MaLH, lophoc.Ngaybatdau, lophoc.Ngayketthuc, lophoc.Siso, lophoc.chinhanhMaCN, lophoc.khoahocMaKH, khoahoc.Ten
        FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH JOIN khoahoc ON lophoc.khoahocMaKH = khoahoc.MaKH
        WHERE giangday.giaovienNhanvien = maNV;
    WHEN 'TG' THEN
    	SELECT lophoc.MaLH, lophoc.Ngaybatdau, lophoc.Ngayketthuc, lophoc.Siso, lophoc.chinhanhMaCN, lophoc.khoahocMaKH, khoahoc.Ten
        FROM lophoc JOIN hotro ON lophoc.MaLH = hotro.lophocMaLH JOIN khoahoc ON lophoc.khoahocMaKH = khoahoc.MaKH
        WHERE hotro.trogiangNhanvien = maNV;
    END CASE;
    -- -----------------    
    SELECT 'Danh sách giáo viên của các lớp' AS '';
	call xemdanhsachlop_GV_TG_temp(maNV,0);
    SELECT 'Danh sách trợ giảng của các lớp' AS '';
    CALL xemdanhsachlop_GV_TG_temp(maNV,1);

    -- --------------------------------
    SELECT 'Thời khóa biểu của các lớp:' AS '';
    CALL xemdanhsachlop_GV_TG_tkb(maNV);
    
END$$
DELIMITER ;
