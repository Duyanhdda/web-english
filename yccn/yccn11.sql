DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `dangkylophoc`(`MaHV` VARCHAR(255), `MaLH` VARCHAR(255)) RETURNS varchar(255) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE result VARCHAR(255);
    DECLARE bd int(11);
    DECLARE MaKHfromin VARCHAR(255);
    DECLARE trinhdokh int(11);
	DECLARE trinhdohv int(11);
    DECLARE ac int(11);
    DECLARE getdate datetime;
    DECLARE getdatekhtrung datetime;
   

	SELECT khoahocMaKH INTO MaKHfromin FROM lophoc WHERE lophoc.MaLH = MaLH LIMIT 1;
	SELECT Gioihansiso INTO bd FROM khoahoc WHERE  khoahoc.MaKH = MaKHfromin LIMIT 1;
	SELECT Yeucautrinhdo INTO trinhdokh FROM khoahoc WHERE  khoahoc.MaKH = MaKHfromin LIMIT 1;
    SELECT Diem INTO trinhdohv FROM trinhdo_hv WHERE Ngaycapnhat
              IN (SELECT MAX(getmax) FROM (SELECT Ngaycapnhat AS getmax FROM trinhdo_hv WHERE  trinhdo_hv.hocvienMaHV = MaHV) AS T)
              AND hocvienMaHV = MaHV LIMIT 1;
	SELECT Siso,Ngaybatdau INTO ac,getdate FROM lophoc WHERE  lophoc.MaLH = MaLH LIMIT 1;
               
               
    IF(SELECT EXISTS (SELECT khoahocMaKH FROM lophoc WHERE lophoc.MaLH IN( SELECT lophocMaLH FROM dangky WHERE dangky.hocvienMaHV = MaHV) 
        AND  lophoc.khoahocMaKH  =  MaKHfromin ))  THEN
    	SELECT Ngayketthuc INTO getdatekhtrung FROM lophoc WHERE lophoc.MaLH IN( SELECT lophocMaLH FROM dangky WHERE hocvienMaHV = MaHV) AND lophoc.khoahocMaKH = MaKHfromin LIMIT 1;
    ELSE
    	SET getdatekhtrung = '1900-01-01 00:00:00';
    END IF;
    	    
    IF (SELECT EXISTS (SELECT `Ngay`, `Giobatdau`, `Gioketthuc` FROM (
        SELECT `Ngay`, `Giobatdau`, `Gioketthuc` FROM `thoikhoabieu_lh` WHERE lophocMaLH 
    	IN (SELECT lophocMaLH FROM dangky WHERE hocvienMaHV = MaHV)
        AND lophocMaLH IN (SELECT MaLH FROM `lophoc` WHERE Ngayketthuc > CURDATE())
   						
        UNION ALL
        SELECT `Ngay`, `Giobatdau`, `Gioketthuc` FROM `thoikhoabieu_lh` WHERE lophocMaLH = MaLH) AS T 
        GROUP BY `Ngay`, `Giobatdau`, `Gioketthuc`
        HAVING COUNT(*) = 2) = 0 ) THEN
        IF 	(trinhdohv >= trinhdokh) THEN
            IF (getdate > CURDATE() - INTERVAL 2 WEEK) THEN 
                IF (bd > ac) THEN
                    IF(getdatekhtrung < getdate) THEN
                        INSERT INTO `dangky`(`Ngaydangky`, `lophocMaLH`, `hocvienMaHV`) VALUES (CURDATE(),MaLH,MaHV);
                        UPDATE `lophoc` SET`Siso`=ac+1 WHERE lophoc.MaLH = MaLH;
                        SET result = 'Succesfully!';
                    ELSE
                        SET result = 'Error! Ban chua ket thuc khoa hoc nay';	
                    END IF;
                ELSE 
                    SET result = 'Error! Lop da day';
                END IF;
             ELSE
                 SET result = 'Error! Lop da bat dau 2 tuan';
             END IF;
        ELSE
        	SET result = 'Error! Ban khong du trinh do';
        END IF;
    ELSE
    	SET result = 'Error! Trung thoi khoa bieu';
    END IF;
    RETURN result;
         

END$$
DELIMITER ;