DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `huydangkylophoc`(`MaHV` VARCHAR(255), `MaLH` VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(255);
    DECLARE getdate datetime;
    DECLARE ac int(11);

	SELECT Siso INTO ac FROM lophoc WHERE  lophoc.MaLH = MaLH LIMIT 1;
	SELECT Ngaydangky INTO getdate FROM dangky WHERE lophocMaLH = MaLH AND hocvienMaHV = MaHV LIMIT 1;
	
    IF (getdate > CURDATE() - INTERVAL 1 WEEK) THEN 
    	DELETE FROM `dangky` WHERE lophocMaLH = MaLH AND hocvienMaHV = MaHV;
        UPDATE `lophoc` SET`Siso`=ac-1 WHERE lophoc.MaLH = MaLH;
        SET result = 'Succesfully!';
    ELSE 
    	SET result = 'Error! ban da dang ky qua 7 ngay';
    END IF;
    RETURN result;
         

END$$
DELIMITER ;