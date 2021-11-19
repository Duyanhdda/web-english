DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `khoahoc_dapungyeucau`(IN `maHV` VARCHAR(255))
BEGIN
SELECT 'Các khóa học mà bạn đáp ứng được yêu cầu trình độ gồm:' AS '';
SELECT khoahoc.MaKH, khoahoc.Ten, khoahoc.Hocphi,
khoahoc.Noidung, khoahoc.Thoiluong, khoahoc.Trangthai, khoahoc.Gioihansiso, khoahoc.Yeucautrinhdo
FROM khoahoc
WHERE khoahoc.Yeucautrinhdo <= (
    SELECT trinhdo_hv.Diem
	FROM trinhdo_hv 
	WHERE trinhdo_hv.Ngaycapnhat IN(
		SELECT max(Ngaycapnhat)
		FROM trinhdo_hv
		WHERE trinhdo_hv.hocvienMaHV = maHV)
    )
    ORDER BY khoahoc.Yeucautrinhdo;
END$$
DELIMITER ;
