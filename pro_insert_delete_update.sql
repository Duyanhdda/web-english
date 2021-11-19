use main1811;


-- SU DUNG ---------------------------------------------------------------------------------------



DELIMITER $$
drop procedure if exists `sudung_insert`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sudung_insert`(IN `maGT` VARCHAR(255), IN `maKH` varchar(255))
begin
    insert into `sudung` values (magt, makh);
END$$
DELIMITER ;

DELIMITER $$
drop procedure if exists `sudung_delete`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sudung_delete`(IN `maGT` VARCHAR(255), IN `maKH` varchar(255))
begin
	if exists (select * from sudung where sudung.magt = magt and sudung.makh = makh) then
	begin
        delete from `sudung` where sudung.maGT = magt and sudung.maKH = makh; 
	end;
	else signal sqlstate '45000' set message_text = 'MyProcedureError: không tồn tại khóa học nào sử dụng giáo trình này';
	end if;
END$$
DELIMITER ;

DELIMITER $$
drop procedure if exists `sudung_update`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sudung_update`(IN `maGTold` VARCHAR(255), IN `maGTnew` VARCHAR(255), IN `maKH` varchar(255))
begin 
    update `sudung` set sudung.magt = magtnew
    where sudung.magt = magtold and sudung.makh = makh;
END$$
DELIMITER ;
        
-- KHOA HOC ----------------------------------------------------------------------------

DELIMITER $$
drop procedure if exists `khoahoc_update`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `khoahoc_update`(
    IN `maKH` VARCHAR(255), 
    IN `hocphi` INT(4), 
    IN `noidung` VARCHAR(255), 
    IN `trangthai` ENUM('opening','closed'), 
    IN `ghsiso` INT(4), 
    IN `yctd` INT(4))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    signal sqlstate '45000' set message_text = 'MyProcedureError: Cập nhật lớp học thất bại, vui lòng thử lại'; 	    
	END;

 	IF(maKH NOT IN (SELECT khoahoc.MaKH FROM khoahoc)) 
 	THEN
 		signal sqlstate '45000' set message_text = 'MyProcedureError: không tồn tại khóa học'; 	    
    ELSE
    	UPDATE khoahoc
        SET khoahoc.Hocphi = hocphi,
            khoahoc.Noidung = noidung,
            khoahoc.Trangthai = trangthai,
            khoahoc.Gioihansiso = ghsiso,
            khoahoc.Yeucautrinhdo = yctd
        WHERE khoahoc.MaKH = maKH;
 	END IF;
END$$
DELIMITER ;



        
-- LOP HOC ----------------------------------------------------------------------------

DELIMITER $$
drop procedure if exists `lophoc_insert`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lophoc_insert`(
    IN `maLH` VARCHAR(255), 
    IN `ngaybatdau` DATETIME, 
    IN `ngayketthuc` DATETIME, 
    IN `maCN` VARCHAR(255), 
    IN `maKH` VARCHAR(255))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    signal sqlstate '45000' set message_text = 'Thêm lớp học thất bại, vui lòng thử lại.';
	END;
	insert into lophoc(MaLH, Ngaybatdau, Ngayketthuc, Siso, MaCN,MaKH) 
	values(maLH, ngaybatdau, ngayketthuc, 0, maCN, maKH);
END$$
DELIMITER ;




DELIMITER $$
drop procedure if exists `lophoc_update`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lophoc_update`(
    IN `maLH` VARCHAR(255), 
    IN `ngaybatdau` DATETIME, 
    IN `ngayketthuc` DATETIME, 
    IN `maCN` VARCHAR(255), 
    IN `maKH` VARCHAR(255))
BEGIN	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    signal sqlstate '45000' set message_text = 'Cập nhật lớp học thất bại, vui lòng thử lại.';
	END;
    
    IF (maLH NOT IN (SELECT lophoc.MaLH FROM lophoc)) 
        THEN signal sqlstate '45000';
    end if;
    
    UPDATE lophoc
        SET lophoc.Ngaybatdau = ngaybatdau,
            lophoc.Ngayketthuc = ngayketthuc,
            lophoc.MaCN = maCN,
            lophoc.MaKH = maKH
    WHERE lophoc.MaLH = maLH;
END$$
DELIMITER ;




DELIMITER $$
drop procedure if exists `lophoc_delete`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `lophoc_delete`(IN `maLH` VARCHAR(255))
BEGIN	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    signal sqlstate '45000' set message_text = 'Xóa lớp học thất bại, vui lòng thử lại.';
	END;

    IF(maLH NOT IN (SELECT lophoc.MaLH FROM lophoc)) 
        THEN signal sqlstate '45000';
    end if;

    DELETE FROM lophoc WHERE lophoc.MaLH = maLH;
    
    
END$$
DELIMITER ;

-- GV - TG ----------------------------------------------------------------

DELIMITER $$
drop procedure if exists `capnhat_giangday_Giaovien`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `capnhat_giangday_Giaovien`(
    IN `maLH` VARCHAR(255),
    IN `maGV1` VARCHAR(255),
    IN `maGV2` VARCHAR(255))
BEGIN	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    signal sqlstate '45000' set message_text = 'Cap nhat giao vien phu trach lop hoc that bai';
	END;

    IF(maLH NOT IN (SELECT lophoc.MaLH FROM lophoc)) 
        THEN signal sqlstate '45000';
    end if;

    if (maLH in (select giangday.malh from giangday))
    then begin
      delete from giangday where giangday.malh = malh;
      insert into giangday values (malh, magv1), (malh, magv2);
    end;
    else insert into giangday values (malh, magv1), (malh, magv2);
    end if;   
    
END$$
DELIMITER ;

DELIMITER $$
drop procedure if exists `capnhat_hotro_Trogiang`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `capnhat_hotro_Trogiang`(
    IN `maLH` VARCHAR(255),
    IN `maTG1` VARCHAR(255),
    IN `maTG2` VARCHAR(255))
BEGIN	
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    signal sqlstate '45000' set message_text = 'Cap nhat tro giang phu trach lop hoc that bai';
	END;

    IF(maLH NOT IN (SELECT lophoc.MaLH FROM lophoc)) 
        THEN signal sqlstate '45000';
    end if;

    if (maLH in (select giangday.malh from giangday))
    then begin
      delete from hotro where giangday.malh = malh;
      insert into hotro values (malh, maTG1), (malh, maTG2);
    end;
    else insert into hotro values (malh, maTG1), (malh, maTG2);
    end if;   
    
END$$
DELIMITER ;

