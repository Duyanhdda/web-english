-- ------ YCCN 1 : Xem danh sách các khóa học và thông tin chi tiết ------ --


	-- --------- Bảng tạm 1: Trả về danh sách giáo viên/trợ giảng của mỗi lớp học -----

DELIMITER $$
drop procedure if exists `xemdanhsach_GV_TG`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsach_GV_TG`(IN `maKH` VARCHAR(255), IN `type` INT(4) UNSIGNED)
BEGIN
	CASE type
    WHEN 0 THEN
    SELECT lophoc.MaLH, giangday.giaovienNhanvien AS MaGiaoVien, nhanvien.Ho AS HoGV, nhanvien.Tendem AS TendemGV, nhanvien.Ten AS TenGV
    FROM lophoc 
            JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH 
            JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH 
            JOIN nhanvien ON nhanvien.MaNV = giangday.giaovienNhanvien
    WHERE lophoc.khoahocMaKH = maKH;
    
    WHEN 1 THEN
    SELECT lophoc.MaLH, hotro.trogiangNhanvien AS MaTroGiang, nhanvien.Ho AS HoTG, nhanvien.Tendem AS TendemTG, nhanvien.Ten AS TenTG
    FROM lophoc 
            JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH 
            JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH 
            JOIN nhanvien ON nhanvien.MaNV = hotro.trogiangNhanvien
    WHERE lophoc.khoahocMaKH = maKH;
    END CASE;
END$$
DELIMITER ;

	-- --------- Bảng tạm 2: Trả về danh sách giáo trình của mỗi lớp học -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsach_GT`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT giaotrinh.MaGT, giaotrinh.Ten, giaotrinh.Namxuatban
	FROM giaotrinh JOIN sudung ON sudung.giaotrinhMaGT = giaotrinh.MaGT
	WHERE sudung.khoahocMaKH = maKH;
END$$
DELIMITER ;

	-- --------------------------- 	BẢNG CHÍNH ---------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemchitiet_KH`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT 'Danh sách giáo viên của mỗi lớp học: ' AS '';
	CALL xemdanhsach_GV_TG(maKH, 0);
	SELECT 'Danh sách trợ giảng của mỗi lớp học: ' AS '';
   	CALL xemdanhsach_GV_TG(maKH, 1);
	SELECT 'Danh sách giáo trình của mỗi lớp học: ' AS '';
   	CALL xemdanhsach_GT(maKH);
END$$
DELIMITER ;
-- ------ YCCN 2: Xem danh sách các lớp của mỗi khóa học và thông tin chi tiết -----


	-- --------- Bảng tạm 1: Trả về danh sách giáo viên/trợ giảng của mỗi lớp học -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsach_GV_TG_LH`(IN `maKH` VARCHAR(255), IN `type` INT(4) UNSIGNED)
BEGIN
	CASE type
    WHEN 0 THEN
    SELECT lophoc.MaLH, giangday.giaovienNhanvien AS MaGiaoVien, nhanvien.Ho AS HoGV, nhanvien.Tendem AS TendemGV, nhanvien.Ten AS TenGV
    FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH JOIN nhanvien ON nhanvien.MaNV = giangday.giaovienNhanvien
    WHERE lophoc.MaLH IN (SELECT MaLH
			FROM lophoc
			WHERE khoahocMaKH = maKH
			);
    
    WHEN 1 THEN
    SELECT lophoc.MaLH, hotro.trogiangNhanvien AS MaTroGiang, nhanvien.Ho AS HoTG, nhanvien.Tendem AS TendemTG, nhanvien.Ten AS TenTG
    FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH JOIN nhanvien ON nhanvien.MaNV = hotro.trogiangNhanvien
    WHERE lophoc.MaLH IN (SELECT MaLH
			FROM lophoc
			WHERE khoahocMaKH = maKH
			);
    END CASE;
END$$
DELIMITER ;

	-- --------- Bảng tạm 2: Trả về thời khóa biểu của mỗi lớp học -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemtkb_LH`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT thoikhoabieu_lh.lophocMaLH, thoikhoabieu_lh.Ngay, thoikhoabieu_lh.Giobatdau, thoikhoabieu_lh.Gioketthuc
	FROM thoikhoabieu_lh
	WHERE thoikhoabieu_lh.lophocMaLH IN (SELECT MaLH
					FROM lophoc
					WHERE khoahocMaKH = maKH
					);
END$$
DELIMITER ;

	-- --------- Bảng tạm 3: Trả về danh sách lớp học của khóa học -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsach_LH`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT *
        FROM lophoc
	WHERE lophoc.khoahocMaKH = maKH; 
END$$
DELIMITER ;

	-- --------------------------- 	BẢNG CHÍNH ---------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemchitiet_KH_GV`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT 'Danh sách lớp học của khóa học: ' AS '';
   	CALL xemdanhsach_LH(maKH);
	SELECT 'Thời khóa biểu của mỗi lớp học: ' AS '';
   	CALL xemtkb_LH(maKH);
	SELECT 'Danh sách giáo viên của mỗi lớp học: ' AS '';
	CALL xemdanhsach_GV_TG_LH(maKH, 0);
	SELECT 'Danh sách trợ giảng của mỗi lớp học: ' AS '';
   	CALL xemdanhsach_GV_TG_LH(maKH, 1);
END$$
DELIMITER ;

--  -----------------YCCN 3 Cập nhật thông tin khóa học---------------------
-- ---------------- Cập nhật giáo trình dùng cho khóa học --------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `capnhat_GT_KH`(IN `maKH` VARCHAR(255), IN `maGT1` VARCHAR(255), IN `maGT2` VARCHAR(255), IN `maGT3` VARCHAR(255))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    SELECT 'Thao tác thất bại, hãy thử lại' AS '';
	END;
    
	IF(maKH NOT IN (SELECT khoahoc.MaKH FROM khoahoc))
    THEN SELECT 'Không tìm thấy khóa học, hãy thử lại.' AS '';
    
    ELSEIF (maGT1 like '' AND maGT2 like '' AND maGT3 LIKE '') 
    THEN SELECT 'Một khóa học có ít nhất 1 giáo trình.' AS '';
    
    ELSEIF ((maGT1 = maGT2 AND maGT1 NOT LIKE '' AND maGT2 NOT LIKE '')  OR (maGT1 = maGT3 AND maGT1 NOT LIKE '' AND maGT3 NOT LIKE '') OR (maGT2 = maGT3 AND maGT2 NOT LIKE '' AND maGT3 NOT LIKE ''))
    THEN SELECT 'Có các mã giáo trình bị trùng lặp.' AS '';
    
    ELSEIF ((maGT1 NOT IN (SELECT giaotrinh.MaGT FROM giaotrinh) AND maGT1 NOT LIKE '') OR (maGT2 NOT IN (SELECT giaotrinh.MaGT FROM giaotrinh) AND maGT2 NOT LIKE '') OR (maGT3 NOT IN (SELECT giaotrinh.MaGT FROM giaotrinh) AND maGT3 NOT LIKE ''))
    THEN SELECT 'Không tìm thấy giáo trình, hãy thử lại' AS '';
    
    ELSE 
    DELETE FROM sudung
    WHERE sudung.khoahocMaKH = maKH;
    
    IF (maGT1 NOT LIKE '')
    THEN
    	INSERT INTO sudung(khoahocMaKH, giaotrinhMaGT) 
        VALUES (maKH, maGT1);
    END IF;
    
    IF (maGT2 NOT LIKE '')
    THEN
    	INSERT INTO sudung(khoahocMaKH, giaotrinhMaGT) 
        VALUES (maKH, maGT3);
    END IF;

    IF (maGT3 NOT LIKE '')
    THEN
    	INSERT INTO sudung(khoahocMaKH, giaotrinhMaGT) 
        VALUES (maKH, maGT3);
    END IF;
    
    SELECT 'Cập nhật thành công, giáo trình của khóa học này trong bảng sử dụng' AS '';
    SELECT *
    FROM sudung
    WHERE sudung.khoahocMaKH = maKH;
    
    END IF;
    
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
-- ----------------------------------------------
-- ----------------------------------------------
-- ------ YCCN  4 : thống kê số liệu kinh doanh -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `solieukinhdoanh`()
    NO SQL
begin
SELECT 'Tổng số lớp đang mở:' as ' ';
	SELECT COUNT(lophoc.MaLH) AS So_Lop_Mo
    FROM lophoc
    WHERE lophoc.Ngayketthuc > CURRENT_TIME();

SELECT 'Tổng số lớp đang mở của mỗi khóa học:' as ' ';
	SELECT khoahoc.MaKH, khoahoc.Ten, COUNT(lophoc.MaLH) AS So_Lop_Mo
    FROM khoahoc JOIN lophoc ON khoahoc.MaKH = lophoc.khoahocMaKH
    WHERE lophoc.Ngayketthuc < CURRENT_TIME()
    GROUP BY khoahoc.MaKH;
    
SELECT 'Trung bình số học viên đăng ký mỗi ngày:' as ' ';
    SELECT (COUNT(DISTINCT dangky.hocvienMaHV) / (max(date(dangky.Ngaydangky)) - MIN(date(dangky.Ngaydangky)))) as Trung_Binh_HV
    FROM dangky;
    
SELECT 'Trung bình số lượt đăng ký mỗi ngày:' as ' ';
    SELECT (COUNT(dangky.hocvienMaHV) / (max(date(dangky.Ngaydangky)) - MIN(date(dangky.Ngaydangky)))) as Trung_Binh_Luot_Dangky
    FROM dangky;

SELECT 'Tổng số học viên:' as ' ';
	SELECT COUNT(DISTINCT dangky.hocvienMaHV)
    FROM dangky;

SELECT 'Tổng số học viên ở mỗi chi nhánh:' as ' ';
	SELECT chinhanh.MaCN, chinhanh.Ten, COUNT(DISTINCT dangky.hocvienMaHV) AS So_Hoc_Vien
    FROM chinhanh JOIN lophoc ON chinhanh.MaCN = lophoc.chinhanhMaCN JOIN dangky ON lophoc.MaLH = dangky.lophocMaLH
    GROUP BY chinhanh.MaCN;
end$$
DELIMITER ;

-- 
---------------- YCCN 5 :Thêm lớp học --------------------------
-- 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `themlophoc`(IN `maLH` VARCHAR(255), IN `ngaybatdau` DATETIME, IN `ngayketthuc` DATETIME, IN `maCN` VARCHAR(255), IN `maKH` VARCHAR(255))
BEGIN
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
	BEGIN
    ROLLBACK;
    SELECT 'Thêm lớp học thất bại, vui lòng thử lại.' AS '';
	END;
    
    IF (ngaybatdau IS NOT null AND ngayketthuc IS NOT null AND (datediff(ngayketthuc, ngaybatdau)/7) < (
        SELECT khoahoc.Thoiluong
        FROM khoahoc
        WHERE khoahoc.MaKH = maKH
        )
       ) THEN
    SELECT 'Thời lượng lớp học quá ngắn so với thời lượng khóa học chứa nó.' AS '';
    ELSE
	insert into lophoc(MaLH, Ngaybatdau, Ngayketthuc, Siso, chinhanhMaCN, khoahocMaKH) 
	values(maLH, ngaybatdau, ngayketthuc, 0, maCN, maKH);
    SELECT 'Thêm lớp học thành công, dưới đây là lớp vừa thêm trong bảng lớp học' AS '';
    SELECT *
    FROM lophoc
    WHERE lophoc.MaLH = maLH;
    
    END if;
END$$
DELIMITER ;

-- 
---------------- YCCN 6 :Sửa lớp học --------------------------
-- 
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

-- 
---------------- YCCN 7 :Xóa lớp học --------------------------
-- 
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xoalophoc`(IN `maLH` INT(255))
BEGIN
	IF (maLH NOT IN (SELECT lophoc.MaLH FROM lophoc WHERE lophoc.MaLH = maLH)) THEN
    SELECT 'Không tìm thấy lớp học muốn xóa.' AS '';
    ELSE
    SELECT 'Đã tìm thấy lớp cần xóa.' AS '';
    -- -- xóa ở bảng lớp học --
    DELETE FROM lophoc
    WHERE lophoc.MaLH = maLH;
    -- -- xóa ở bảng đăng ký --
    DELETE FROM dangky
    WHERE dangky.lophocMaLH = maLH;
    -- -- xóa ở bảng giảng dạy --
    DELETE FROM giangday 
    WHERE giangday.lophocMaLH = maLH;
    -- -- xóa ở bảng hỗ trợ --
    DELETE FROM hotro 
    WHERE hotro.lophocMaLH = maLH;
    -- -- xóa ở bảng thời khóa biểu --
    DELETE FROM thoikhoabieu_lh
    WHERE thoikhoabieu_lh.lophocMaLH = maLH;
    
    SELECT 'Đã xóa thành công lớp học có mã trên khỏi các bảng lophoc, dangky, giangday, hotro, thoikhoabieu_lh.' AS '';
    SELECT 'Bảng lophoc sau khi xóa giá trị trên' AS '';
    SELECT *
    FROM lophoc;
    END IF;
END$$
DELIMITER ;

-- 
---------------- YCCN 8 :Xem danh sách học viên mỗi lớp và thông tin chi tiết --------------------------
-- 

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachhocvien`(IN `maLH` VARCHAR(255))
BEGIN
SELECT hocvien.MaHV, hocvien.Ho, hocvien.Tendem, hocvien.Ten, (year(CURRENT_TIME()) - hocvien.Namsinh) as Tuoi
FROM hocvien JOIN dangky ON dangky.hocvienMaHV = hocvien.MaHV
WHERE dangky.lophocMaLH = maLH;
END$$
DELIMITER ;

-- 
---------------- YCCN 9 :Xem danh sách lớp học mình phụ trách và chi tiết --------------------------
-- 

	-- --------- Bảng tạm 1: Trả về danh sách giáo viên/trợ giảng của các lớp do một giáo viên/trợ giảng phụ trách -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachlop_GV_TG_temp`(IN `maNV` VARCHAR(255), IN `type` INT(4) UNSIGNED)
BEGIN
	CASE type
    WHEN 0 THEN
    SELECT lophoc.MaLH, giangday.giaovienNhanvien AS Giao_Vien
    FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH LEFT JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH
    WHERE lophoc.MaLH IN (
        SELECT giangday.lophocMaLH
        FROM giangday
        WHERE giangday.giaovienNhanvien = maNV
		)
    OR lophoc.MaLH IN (
        SELECT hotro.lophocMaLH
        FROM hotro
        WHERE hotro.trogiangNhanvien = maNV
        )
    GROUP BY lophoc.MaLH, giangday.giaovienNhanvien
    ORDER BY lophoc.MaLH;
    
    WHEN 1 THEN
    SELECT lophoc.MaLH, hotro.trogiangNhanvien AS Tro_Giang
    FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH LEFT JOIN hotro ON hotro.lophocMaLH = lophoc.MaLH
    WHERE lophoc.MaLH IN (
        SELECT giangday.lophocMaLH
        FROM giangday
        WHERE giangday.giaovienNhanvien = maNV
		)
    OR lophoc.MaLH IN (
        SELECT hotro.lophocMaLH
        FROM hotro
        WHERE hotro.trogiangNhanvien = maNV
        )
    GROUP BY lophoc.MaLH, hotro.trogiangNhanvien
    ORDER BY lophoc.MaLH;
    END CASE;
END$$
DELIMITER ;

	-- --------- Bảng tạm 2: Trả về thời khóa biểu các lớp do một giáo viên/trợ giảng phụ trách -----

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachlop_GV_TG_tkb`(IN `maNV` VARCHAR(255))
BEGIN
SELECT thoikhoabieu_lh.lophocMaLH, thoikhoabieu_lh.Ngay, thoikhoabieu_lh.Giobatdau, thoikhoabieu_lh.Gioketthuc
FROM thoikhoabieu_lh
WHERE thoikhoabieu_lh.lophocMaLH IN (
        SELECT giangday.lophocMaLH
        FROM giangday
        WHERE giangday.giaovienNhanvien = maNV
		)
OR thoikhoabieu_lh.lophocMaLH IN (
        SELECT hotro.lophocMaLH
        FROM hotro
        WHERE hotro.trogiangNhanvien = maNV
        )
ORDER BY thoikhoabieu_lh.lophocMaLH;
END$$
DELIMITER ;

	-- --------------------------- 	BẢNG CHÍNH ---------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachlop_GV_TG`(IN `maNV` VARCHAR(255))
BEGIN
	SELECT 'Các lớp mà bạn phụ trách là:' AS ' ';
	CASE LEFT(maNV,2)
    WHEN 'GV' THEN
        SELECT lophoc.MaLH, lophoc.Ngaybatdau, lophoc.Ngayketthuc, lophoc.Siso, lophoc.chinhanhMaCN, lophoc.khoahocMaKH, khoahoc.Ten
        FROM lophoc JOIN giangday ON lophoc.MaLH = giangday.lophocMaLH JOIN khoahoc ON lophoc.khoahocMaKH = khoahoc.MaKH
        WHERE giangday.giaovienNhanvien = maNV;
    WHEN 'TG' THEN
    	SELECT lophoc.MaLH, lophoc.Ngaybatdau, lophoc.Ngayketthuc, lophoc.Siso, lophoc.chinhanhMaCN, lophoc.khoahocMaKH, khoahoc.Ten
        FROM lophoc JOIN hotro ON lophoc.MaLH = hotro.lophocMaLH JOIN khoahoc ON lophoc.khoahocMaKH = khoahoc.MaKH
        WHERE hotro.trogiangNhanvien = maNV;
    END CASE;
    -- -----------------    
    SELECT 'Danh sách giáo viên của các lớp' AS '';
	call xemdanhsachlop_GV_TG_temp(maNV,0);
    SELECT 'Danh sách trợ giảng của các lớp' AS '';
    CALL xemdanhsachlop_GV_TG_temp(maNV,1);

    -- --------------------------------
    SELECT 'Thời khóa biểu của các lớp:' AS '';
    CALL xemdanhsachlop_GV_TG_tkb(maNV);
    
END$$
DELIMITER ;


-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ------ YCCN 10 : Xem danh sách học viên của 1 lớp do GV/TG phụ trách -----
-- ----------------------------------------------------------------------

	------------ Bảng tạm 1: Danh sách học viên của 1 lớp học -------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachhocvien`(IN `maLH` VARCHAR(255))
BEGIN
SELECT hocvien.MaHV, hocvien.Ho, hocvien.Tendem, hocvien.Ten, (year(CURRENT_TIME()) - hocvien.Namsinh) as Tuoi
FROM hocvien JOIN dangky ON dangky.hocvienMaHV = hocvien.MaHV
WHERE dangky.lophocMaLH = maLH;
END$$
DELIMITER ;

	------------ Bảng tạm 2: Danh sách lớp học do một giáo viên/trợ giảng phụ trách -----------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `danhsachlop_phutrach`(IN `maNV` VARCHAR(255))
BEGIN 
SELECT lophoc.MaLH, lophoc.khoahocMaKH, khoahoc.Ten
FROM lophoc JOIN khoahoc ON lophoc.khoahocMaKH = khoahoc.MaKH
WHERE lophoc.MaLH IN(
    SELECT giangday.lophocMaLH
    FROM giangday
    WHERE giangday.giaovienNhanvien = maNV
    )
OR lophoc.MaLH IN(
    SELECT hotro.lophocMaLH
    FROM hotro
    WHERE hotro.trogiangNhanvien = maNV
    );
END$$
DELIMITER ;

	---------------------BẢNG CHÍNH---------------------------------	

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemdanhsachhocvien_GV_TG`(IN `maNV` VARCHAR(255), IN `maLH` VARCHAR(255))
BEGIN
CASE LEFT(maNV,2)
WHEN 'GV' THEN
	IF (maLH IN (
        SELECT giangday.lophocMaLH
        FROM giangday
        WHERE giangday.giaovienNhanvien = maNV
        )
    ) THEN CALL xemdanhsachhocvien(maLH);
    ELSE 
    SELECT 'Đây không phải lớp do bạn phụ trách, vui lòng nhập lại. Sau đây là các lớp do bạn phụ trách' AS '';
    CALL danhsachlop_phutrach(maNV);
    END IF;


WHEN 'TG' THEN 
	IF (maLH IN (
        SELECT hotro.lophocMaLH
        FROM hotro
        WHERE hotro.trogiangNhanvien = maNV
        )
    ) THEN CALL xemdanhsachhocvien(maLH);
    ELSE 
    SELECT 'Đây không phải lớp do bạn phụ trách, vui lòng nhập lại. Sau đây là các lớp do bạn phụ trách' AS '';
    CALL danhsachlop_phutrach(maNV);
    END IF;

END CASE;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ------ YCCN 11 : Đăng ký lớp học -----
-- ----------------------------------------------------------------------
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

-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ------ YCCN 12 : Hủy đăng ký lớp học -----
-- ----------------------------------------------------------------------
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

-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ------ YCCN 13 : Chuyển lớp học -----
-- ----------------------------------------------------------------------

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

-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ------ YCCN 14 : Cập nhật thông tin cá nhân -----
-- ----------------------------------------------------------------------

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

-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ------ YCCN 15 : Xem danh sách lớp học mỗi khóa và chi tiết cho khách(Học viên) -----
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemchitiet_KH_HV`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT 'Danh sách lớp học của khóa học: ' AS '';
   	CALL xemdanhsach_LH(maKH);
	SELECT 'Thời khóa biểu của mỗi lớp học: ' AS '';
   	CALL xemtkb_LH(maKH);
END$$
DELIMITER ;

call xemchitiet_KH_HV('OT001');

	-- --------------------------- 	BẢNG CHÍNH ---------------------------------------------------

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `xemchitiet_KH_HV`(IN `maKH` VARCHAR(255))
BEGIN
	SELECT 'Danh sách lớp học của khóa học: ' AS '';
   	CALL xemdanhsach_LH(maKH);
	SELECT 'Thời khóa biểu của mỗi lớp học: ' AS '';
   	CALL xemtkb_LH(maKH);
END$$
DELIMITER ;

-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ------ YCCN 16 : Xem danh sách các chi nhánh -----
-- ----------------------------------------------------------------------

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

-- ----------------------------------------------------------------------
-- ------ YCCN 17 : Xem danh sách các chi nhánh -----
-- ----------------------------------------------------------------------
DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE xemdanhsachdangky_HV`(IN maHV` VARCHAR(255))
BEGIN
	SELECT khoahoc.MaKH, khoahoc.Ten, lophoc.MaLH, lophoc.Ngaybatdau, lophoc.Ngayketthuc
    FROM khoahoc JOIN lophoc ON lophoc.khoahocMaKH = khoahoc.MaKH JOIN dangky ON dangky.lophocMaLH = lophoc.MaLH
    WHERE dangky.hocvienMaHV = maHV
    AND lophoc.Ngayketthuc > CURRENT_TIME();
END$$
DELIMITER ;

-- ----------------------------------------------------------------------
-- ----------------------------------------------------------------------
-- ------ YCCN 18 : Xem các khóa học mà trình độ của mình có thể đáp ứng yêu cầu -----
-- ----------------------------------------------------------------------
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





