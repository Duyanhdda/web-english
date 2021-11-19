-- ------ YCCN: Xem danh sách các khóa học và thông tin chi tiết ------ --


	-- --------- Bảng tạm 1: Trả về danh sách giáo viên/trợ giảng của mỗi lớp học -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsach_GV_TG`(IN `maKH` VARCHAR(255), IN `type` INT(4) UNSIGNED)
BEGIN
	CASE type
    WHEN 0 THEN
    SELECT lophoc.khoahocMaKH, giangday.giaovienNhanvien AS Giao_Vien
    FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH
    WHERE lophoc.khoahocMaKH = maKH;
    
    WHEN 1 THEN
    SELECT lophoc.khoahocMaKH, hotro.trogiangNhanvien AS Tro_Giang
    FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH
    WHERE lophoc.khoahocMaKH = maKH;
    END CASE;
END$$
DELIMITER ;

	-- --------- Bảng tạm 2: Trả về danh sách giáo trình của mỗi lớp học -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsach_GT`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT giaotrinh.MaGT, giaotrinh.Ten, giaotrinh.Namxuatban
	FROM giaotrinh JOIN sudung ON sudung.giaotrinhMaGT = giaotrinh.MaGT
	WHERE sudung.khoahocMaKH = maKH;
END$$
DELIMITER ;

	-- --------------------------- 	BẢNG CHÍNH ---------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemchitiet_KH`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT 'Danh sách giáo viên của mỗi lớp học: ' AS '';
	CALL xemdanhsach_GV_TG(maKH, 0);
	SELECT 'Danh sách trợ giảng của mỗi lớp học: ' AS '';
   	CALL xemdanhsach_GV_TG(maKH, 1);
	SELECT 'Danh sách giáo trình của mỗi lớp học: ' AS '';
   	CALL xemdanhsach_GT(maKH);
END$$
DELIMITER ;
