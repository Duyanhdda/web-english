DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `chuyenlophoc`(`MaHV` VARCHAR(255), `MaLHchuyenden` VARCHAR(255), `MaLHhientai` VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	DECLARE a VARCHAR(255);
    DECLARE b VARCHAR(255);
    DECLARE MaKHhientai VARCHAR(255);
    DECLARE MaKHchuyenden VARCHAR(255);
    SELECT khoahocMaKH INTO MaKHhientai FROM lophoc WHERE lophoc.MaLH = MaLHhientai LIMIT 1;
    SELECT khoahocMaKH INTO MaKHchuyenden FROM lophoc WHERE lophoc.MaLH = MaLHchuyenden LIMIT 1;
    
    IF (MaKHhientai = MaKHchuyenden) THEN 
    
        DELETE FROM `dangky` WHERE dangky.lophocMaLH = MaLHhientai AND dangky.hocvienMaHV = MaHV;
        SET a = dangkylophoc(MaHV,MaLHchuyenden);
        IF(a != 'Succesfully!') THEN
            SET b = dangkylophoc(MaHV,MaLHhientai);
        END IF;
    ELSE 
    	SET a = 'Hai lop hoc khac khoa hoc!';
    END IF;
    RETURN a; 

END$$
DELIMITER ;