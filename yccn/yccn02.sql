
-- ------ YCCN: Xem danh sách các lớp của mỗi khóa học và thông tin chi tiết -----


	-- --------- Bảng tạm 1: Trả về danh sách giáo viên/trợ giảng của mỗi lớp học -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsach_GV_TG_LH`(IN `maKH` VARCHAR(255), IN `type` INT(4) UNSIGNED)
BEGIN
	CASE type
    WHEN 0 THEN
    SELECT lophoc.MaLH, giangday.giaovienNhanvien AS Giao_Vien
    FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH
    WHERE lophoc.MaLH IN (SELECT MaLH
			FROM lophoc
			WHERE khoahocMaKH = maKH
			);
    
    WHEN 1 THEN
    SELECT lophoc.MaLH, hotro.trogiangNhanvien AS Tro_Giang
    FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH
    WHERE lophoc.MaLH IN (SELECT MaLH
			FROM lophoc
			WHERE khoahocMaKH = maKH
			);
    END CASE;
END$$
DELIMITER ;

	-- --------- Bảng tạm 2: Trả về thời khóa biểu của mỗi lớp học -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemtkb_LH`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT thoikhoabieu_lh.lophocMaLH, thoikhoabieu_lh.Ngay, thoikhoabieu_lh.Giobatdau, thoikhoabieu_lh.Gioketthuc
	FROM thoikhoabieu_lh
	WHERE thoikhoabieu_lh.lophocMaLH IN (SELECT MaLH
					FROM lophoc
					WHERE khoahocMaKH = maKH
					);
END$$
DELIMITER ;

	-- --------- Bảng tạm 3: Trả về danh sách lớp học của khóa học -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsach_LH`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT *
        FROM lophoc
	WHERE lophoc.khoahocMaKH = maKH; 
END$$
DELIMITER ;

	-- --------------------------- 	BẢNG CHÍNH ---------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemchitiet_KH_GV`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT 'Danh sách lớp học của khóa học: ' AS '';
   	CALL xemdanhsach_LH(maKH);
	SELECT 'Thời khóa biểu của mỗi lớp học: ' AS '';
   	CALL xemtkb_LH(maKH);
	SELECT 'Danh sách giáo viên của lớp học: ' AS '';
	CALL xemdanhsach_GV_TG_LH(maKH, 0);
	SELECT 'Danh sách trợ giảng của lớp học: ' AS '';
   	CALL xemdanhsach_GV_TG_LH(maKH, 1);
END$$
DELIMITER ;
