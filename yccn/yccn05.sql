DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `themlophoc`(IN `maLH` VARCHAR(255), IN `ngaybatdau` DATETIME, IN `ngayketthuc` DATETIME, IN `maCN` VARCHAR(255), IN `maKH` VARCHAR(255))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    SELECT 'Thêm lớp học thất bại, vui lòng thử lại.' AS '';
	END;
    
    IF (ngaybatdau IS NOT null AND ngayketthuc IS NOT null AND (datediff(ngayketthuc, ngaybatdau)/7) < (
        SELECT khoahoc.Thoiluong
        FROM khoahoc
        WHERE khoahoc.MaKH = maKH
        )
       ) THEN
    SELECT 'Thời lượng lớp học quá ngắn so với thời lượng khóa học chứa nó.' AS '';
    ELSE
	insert into lophoc(MaLH, Ngaybatdau, Ngayketthuc, Siso, chinhanhMaCN, khoahocMaKH) 
	values(maLH, ngaybatdau, ngayketthuc, 0, maCN, maKH);
    SELECT 'Thêm lớp học thành công, dưới đây là lớp vừa thêm trong bảng lớp học' AS '';
    SELECT *
    FROM lophoc
    WHERE lophoc.MaLH = maLH;
    
    END if;
END$$
DELIMITER ;
