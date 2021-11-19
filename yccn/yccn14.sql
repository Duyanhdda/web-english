DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `capnhatthongtincanhan`(IN `MaHV1` VARCHAR(255) CHARSET utf8mb4, IN `Ho1` VARCHAR(255) CHARSET utf8mb4, IN `Tendem1` VARCHAR(255) CHARSET utf8mb4, IN `Ten1` VARCHAR(255) CHARSET utf8mb4, IN `Gioitinh1` ENUM('male','female','','') CHARSET utf8mb4, IN `Email1` VARCHAR(255) CHARSET utf8mb4, IN `Namsinh1` INT(4), IN `Sonha1` VARCHAR(255) CHARSET utf8mb4, IN `Duong1` VARCHAR(255) CHARSET utf8mb4, IN `Quanhuyen1` VARCHAR(255) CHARSET utf8mb4, IN `Tinh1` VARCHAR(255) CHARSET utf8mb4, IN `Sodienthoai1` INT(11), OUT `result` VARCHAR(255) CHARSET utf8mb4)
    MODIFIES SQL DATA
BEGIN
IF (SELECT EXISTS (SELECT * FROM hocvien WHERE hocvien.MaHV = MaHV1)) THEN
	UPDATE `hocvien` SET `Ho`=Ho1,`Tendem`=Tendem1,`Ten`=Ten1,`Gioitinh`=Gioitinh1,
`Email`=Email1,`Namsinh`=Namsinh1,`Sonha`=Sonha1,`Duong`=Duong1,
`Quanhuyen`=Quanhuyen1,`Tinhtp`=Tinh1,`Sodienthoai`=Sodienthoai1 WHERE hocvien.MaHV = MaHV1;
	SET @result = 'Update successfully';
ELSE 
	INSERT INTO `hocvien`(`MaHV`, `Ho`, `Tendem`, `Ten`, `Gioitinh`, `Email`, `Namsinh`, `Sonha`, `Duong`, `Quanhuyen`, `Tinhtp`, `Sodienthoai`) VALUES (MaHV1,Ho1,Tendem1,Ten1,Gioitinh1,Email1,Namsinh1,Sonha1,Duong1,Quanhuyen1
    ,Tinh1,Sodienthoai1);
    SET @result = 'Insert successfully';
    END IF;
    SELECT @result;
END$$
DELIMITER ;



