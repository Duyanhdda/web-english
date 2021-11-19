
-- xem danh sach cac chi nhanh
use main1511;
DELIMITER $$
drop procedure if exists xemdanhsachchinhanh;
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachchinhanh`(IN `mahv` VARCHAR(255))
BEGIN 
SELECT 'Danh sách toàn bộ chi nhánh' as ' ';
	select * from chinhanh;

SELECT 'Danh sách chi nhánh cùng quận với học viên:' as ' ';
	select * from chinhanh where chinhanh.quanhuyen = (select quanhuyen from hocvien where hocvien.mahv = mahv);
END$$
DELIMITER ;