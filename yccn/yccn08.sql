DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachhocvien`(IN `maLH` VARCHAR(255))
BEGIN
SELECT hocvien.MaHV, hocvien.Ho, hocvien.Tendem, hocvien.Ten, (year(CURRENT_TIME()) - hocvien.Namsinh) as Tuoi
FROM hocvien JOIN dangky ON dangky.hocvienMaHV = hocvien.MaHV
WHERE dangky.lophocMaLH = maLH;
END$$
DELIMITER ;