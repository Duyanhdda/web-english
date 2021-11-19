DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sualophoc`(IN `maLH` VARCHAR(255), IN `ngaybatdau` DATETIME, IN `ngayketthuc` DATETIME, IN `maCN` VARCHAR(255), IN `maKH` VARCHAR(255))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    SELECT 'Cập nhật lớp học thất bại, vui lòng thử lại.' AS '';
	END;
 
 	IF(maLH NOT IN (SELECT lophoc.MaLH FROM lophoc)) 
 	THEN SELECT 'Không tìm thấy lớp học cần cập nhật, hãy thử lại';
    	ELSEIF (ngaybatdau IS NOT null AND ngayketthuc IS NOT null AND (datediff(ngayketthuc, ngaybatdau)/7) < (
        		SELECT khoahoc.Thoiluong
        		FROM khoahoc
        		WHERE khoahoc.MaKH = maKH
        		)
      	 ) THEN SELECT 'Thời lượng lớp học quá ngắn so với thời lượng khóa học chứa nó.' AS '';
    	ELSE
    		UPDATE lophoc
       		 SET lophoc.Ngaybatdau = ngaybatdau,
        			lophoc.Ngayketthuc = ngayketthuc,
           			lophoc.chinhanhMaCN = maCN,
           			lophoc.khoahocMaKH = maKH
       		WHERE lophoc.MaLH = maLH;
    
 		SELECT 'Cập nhật thành công, lớp mới sau khi cập nhật như sau:' AS'';
        		SELECT * 
       		 FROM lophoc
        		WHERE lophoc.MaLH = maLH;
 	END IF;
END$$
DELIMITER ;
