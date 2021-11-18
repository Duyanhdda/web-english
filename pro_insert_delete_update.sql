use main1811;


-- KHOA HOC ---------------------------------------------------------------------------------------



DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sudung_insert`(IN `maGT` VARCHAR(255), IN `maKH` varchar(255))
begin
  
    -- check exists
    if exists (select * from )

end;
    
END$$
DELIMITER ;

-- ----------------- Cập nhật thông tin khóa học --------------------


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `suakhoahoc`(IN `maKH` VARCHAR(255), IN `hocphi` INT(4), IN `noidung` VARCHAR(255), IN `trangthai` ENUM('opening','closed'), IN `ghsiso` INT(4), IN `yctd` INT(4))
    DETERMINISTIC
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    SELECT 'Cập nhật lớp học thất bại, vui lòng thử lại.' AS '';
	END;
 
 	IF(maKH NOT IN (SELECT khoahoc.MaKH FROM khoahoc)) 
 	THEN
 		SELECT 'Không tìm thấy khóa học cần cập nhật, hãy thử lại';
 	    
    ELSE
    	UPDATE khoahoc
        SET khoahoc.Hocphi = hocphi,
            khoahoc.Noidung = noidung,
            khoahoc.Trangthai = trangthai,
            khoahoc.Gioihansiso = ghsiso,
            khoahoc.Yeucautrinhdo = yctd
        WHERE khoahoc.MaKH = maKH;
    
 		SELECT 'Cập nhật thành công, khóa học mới sau khi cập nhật như sau:' AS'';
        SELECT * 
        FROM khoahoc
        WHERE khoahoc.MaKH = maKH;
 	END IF;
END$$
DELIMITER ;