
-- ------ YCCN: Xem danh sách các khóa học và thông tin chi tiết (học viên) -----

	-- --------------------------- 	BẢNG CHÍNH ---------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemchitiet_KH_HV`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT 'Danh sách lớp học của khóa học: ' AS '';
   	CALL xemdanhsach_LH(maKH);
	SELECT 'Thời khóa biểu của mỗi lớp học: ' AS '';
   	CALL xemtkb_LH(maKH);
END$$
DELIMITER ;

call xemchitiet_KH_HV('OT001');