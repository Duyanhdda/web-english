DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xoalophoc`(IN `maLH` INT(255))
BEGIN
	IF (maLH NOT IN (SELECT lophoc.MaLH FROM lophoc WHERE lophoc.MaLH = maLH)) THEN
    SELECT 'Không tìm thấy lớp học muốn xóa.' AS '';
    ELSE
    SELECT 'Đã tìm thấy lớp cần xóa.' AS '';
    -- -- xóa ở bảng lớp học --
    DELETE FROM lophoc
    WHERE lophoc.MaLH = maLH;
    -- -- xóa ở bảng đăng ký --
    DELETE FROM dangky
    WHERE dangky.lophocMaLH = maLH;
    -- -- xóa ở bảng giảng dạy --
    DELETE FROM giangday 
    WHERE giangday.lophocMaLH = maLH;
    -- -- xóa ở bảng hỗ trợ --
    DELETE FROM hotro 
    WHERE hotro.lophocMaLH = maLH;
    -- -- xóa ở bảng thời khóa biểu --
    DELETE FROM thoikhoabieu_lh
    WHERE thoikhoabieu_lh.lophocMaLH = maLH;
    
    SELECT 'Đã xóa thành công lớp học có mã trên khỏi các bảng lophoc, dangky, giangday, hotro, thoikhoabieu_lh.' AS '';
    SELECT 'Bảng lophoc sau khi xóa giá trị trên' AS '';
    SELECT *
    FROM lophoc;
    END IF;
END$$
DELIMITER ;
