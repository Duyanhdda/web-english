use main1811;


-- XEM KHOA HOC ---------------------------------------------------------------------------------------
DELIMITER $$
drop procedure if exists `DanhsachKhoaHoc`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhsachKhoaHoc`()
begin
  select *
    from khoahoc;
END$$
DELIMITER ;


DELIMITER $$
drop procedure if exists `ThongTinChiTietKH_hientai`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThongTinChiTietKH_hientai`(IN `maKH` VARCHAR(255))
begin
  if exists (select maKH from khoahoc where khoahoc.makh = makh)
    then begin
      call DanhSachGVthuocKH_hientai(makh);
      call DanhSachTGthuocKH_hientai(makh);
      call DanhSachGTrinhthuocKH(makh);
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;


DELIMITER $$
drop procedure if exists `ThongTinChiTietKH_toanbo`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThongTinChiTietKH_toanbo`(IN `maKH` VARCHAR(255))
begin
  if exists (select maKH from khoahoc where khoahoc.makh = makh)
    then begin
      call DanhSachGVthuocKH_toanbo(makh);
      call DanhSachTGthuocKH_toanbo(makh);
      call DanhSachGTrinhthuocKH(makh);
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;


-- XEM GIAO VIEN ---------------------------------------------------------------------------------------
-- KHOA HOC 

DELIMITER $$
drop procedure if exists `DanhSachGVthuocKH_hientai`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhSachGVthuocKH_hientai`(IN `maKH` VARCHAR(255))
begin
  if exists (select maKH from khoahoc where khoahoc.makh = makh)
    then begin
      select *
        from NHANVIEN
      where NHANVIEN.MaNV in (
        select MaNV
          from LOPHOC join GIANGDAY on lophoc.maLH = giangday.maLH
              join nhanvien on nhanvien.maNV = giangday.maNV
          where lophoc.maKH = maKH and lophoc.Ngayketthuc > CURRENT_TIME()
      );
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;

DELIMITER $$
drop procedure if exists `DanhSachGVthuocKH_toanbo`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhSachGVthuocKH_toanbo`(IN `maKH` VARCHAR(255))
begin
  if exists (select * from khoahoc where khoahoc.makh = makh)
    then begin
      select *
        from NHANVIEN
      where NHANVIEN.MaNV in (
        select MaNV
          from LOPHOC join GIANGDAY on lophoc.maLH = giangday.maLH
              join nhanvien on nhanvien.maNV = giangday.maNV
          where lophoc.maKH = maKH
        );
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;

-- LOP HOC

DELIMITER $$
drop procedure if exists `DanhSachGVthuocLH`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhSachGVthuocLH`(IN `maLH` VARCHAR(255))
begin
  if exists (select * from lophoc where lophoc.maLH = maLH)
    then begin
      select *
        from NHANVIEN
      where NHANVIEN.MaNV in (
        select MaNV
          from LOPHOC join GIANGDAY on lophoc.maLH = giangday.maLH
              join nhanvien on nhanvien.maNV = giangday.maNV
          where lophoc.maLH = maLH
        );
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại lớp học này';
  end if;
END$$
DELIMITER ;

-- XEM TRO GIANG ---------------------------------------------------------------------------------------
DELIMITER $$
drop procedure if exists `DanhSachTGthuocKH_hientai`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhSachTGthuocKH_hientai`(IN `maKH` VARCHAR(255))
begin
  if exists (select * from khoahoc where khoahoc.makh = makh)
    then begin
      select *
        from NHANVIEN
      where NHANVIEN.MaNV in (
          select MaNV
            from LOPHOC join hotro on lophoc.maLH = hotro.maLH
                join nhanvien on nhanvien.maNV = hotro.TGmaNV
            where lophoc.maKH = maKH and lophoc.Ngayketthuc > CURRENT_TIME()
      );
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;

DELIMITER $$
drop procedure if exists `DanhSachTGthuocKH_toanbo`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhSachTGthuocKH_toanbo`(IN `maKH` VARCHAR(255))
begin
  if exists (select * from khoahoc where khoahoc.makh = makh)
    then begin
      select *
        from NHANVIEN
      where NHANVIEN.MaNV in (
          select MaNV
            from LOPHOC join hotro on lophoc.maLH = hotro.maLH
                join nhanvien on nhanvien.maNV = hotro.TGmaNV
            where lophoc.maKH = maKH
      );
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;

-- LOP HOC

DELIMITER $$
drop procedure if exists `DanhSachTGthuocLH`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhSachTGthuocLH`(IN `maLH` VARCHAR(255))
begin
  if exists (select * from lophoc where lophoc.maLH = maLH)
    then begin
      select *
        from NHANVIEN
      where NHANVIEN.MaNV in (
        select MaNV
          from LOPHOC join HOTRO on lophoc.maLH = HOTRO.maLH
              join nhanvien on nhanvien.maNV = HOTRO.maNV
          where lophoc.maLH = maLH
          );
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại lớp học này';
  end if;
END$$
DELIMITER ;


-- XEM GIAO TRINH ---------------------------------------------------------------------------------------
DELIMITER $$
drop procedure if exists `DanhSachGTrinhthuocKH`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhSachGTrinhthuocKH`(IN `maKH` VARCHAR(255))
begin
  if exists (select * from lophoc where lophoc.maLH = maLH)
    then begin
      select *
        from giaotrinh
      where giaotrinh.MaGT in (
        select MaGT
          from sudung
          where sudung.maKH = maKH
      );
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;


-- XEM LOP HOC ---------------------------------------------------------------------------------------
DELIMITER $$
drop procedure if exists `DanhSachLHthuocKH_hientai`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhSachLHthuocKH_hientai`(IN `maKH` VARCHAR(255))
begin
  if exists (select maKH from khoahoc where khoahoc.makh = makh)
    then begin
      select *
        from lophoc
       where lophoc.makh = makh and lophoc.Ngayketthuc > CURRENT_TIME();
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;


DELIMITER $$
drop procedure if exists `DanhSachLHthuocKH_toanbo`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhSachLHthuocKH_toanbo`(IN `maKH` VARCHAR(255))
begin
  if exists (select maKH from khoahoc where khoahoc.makh = makh)
    then begin
      select *
        from lophoc
       where lophoc.makh = makh;
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;


DELIMITER $$
drop procedure if exists `ThongTinChiTietLH`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ThongTinChiTietLH`(IN `maLH` VARCHAR(255))
begin
  if exists (select maLH from lophoc where lophoc.maLH = maLH)
    then begin
      call DanhSachGVthuocLH(maLH);
      call DanhSachTGthuocLH(maLH);
      call XemTKBcuaLH(maLH);
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại lớp học này';
  end if;
END$$
DELIMITER ;


DELIMITER $$
drop procedure if exists `DanhsachLH_phutrach`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhsachLH_phutrach`(IN `maNV` VARCHAR(255))
begin
  if exists (select maNV from NHANVIEN where nhanvien.maNV = maNV)
    then begin
      if exists (select manv from giangday where giangday.manv = manv) then
        select * from lophoc where lophoc.malh in (select malh from giangday where giangday.manv = manv);        
      else
        select * from lophoc where lophoc.malh in (select malh from hotro where hotro.manv = manv);        
      end if;
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại mã nhân viên này';
  end if;
END$$
DELIMITER ;


DELIMITER $$
-- drop procedure if exists `DanhsachLH_phutrach_Thongtinchitiet`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhsachLH_phutrach_Thongtinchitiet`(
  IN `maNV` VARCHAR(255),
  IN `trangthai` ENUM('hientai', 'toanbo'))
begin
  if (manv in (select manv from giangday)) then  -- neu nhan vien la giao vien
    if (trangthai = 'toanbo') then -- xem toan bo nhung lop ma minh phu trach
      begin
        select * from lophoc where lophoc.malh in (select malh from giangday where giangday.manv = manv);
        -- xem giao vien va tro giang phu trach cung lop voi minh
        select * from giangday where giangday.malh in (
          select malh from lophoc where lophoc.malh in (
            select malh from giangday where giangday.manv = manv));
        select * from hotro where hotro.malh in (
          select malh from lophoc where lophoc.malh in (
            select malh from giangday where giangday.manv = manv));
        -- xem thoikhoabieu cuar lop minh phu trach
        select * from thoikhoabieu_lh where thoikhoabieu_lh.malh in (
          select malh from lophoc where lophoc.malh in (
            select malh from giangday where giangday.manv = manv));
      end;
    else 
      begin -- xem nhung lop dang mo ma minh phu trach
        select * from lophoc 
          where lophoc.malh in (select malh from giangday where giangday.manv = manv)
          and lophoc.ngayketthuc > CURRENT_TIME();
        -- xem giao vien va tro giang phu trach cung lop voi minh
        select * from giangday where giangday.malh in (
          select malh from lophoc 
            where lophoc.malh in (select malh from giangday where giangday.manv = manv)
            and lophoc.ngayketthuc > CURRENT_TIME());
        select * from hotro where hotro.malh in (
          select malh from lophoc 
            where lophoc.malh in (select malh from giangday where giangday.manv = manv)
            and lophoc.ngayketthuc > CURRENT_TIME());
        -- xem thoikhoabieu cuar lop minh phu trach
        select * from thoikhoabieu_lh where thoikhoabieu_lh.malh in (
          select malh from lophoc 
            where lophoc.malh in (select malh from giangday where giangday.manv = manv)
            and lophoc.ngayketthuc > CURRENT_TIME());
      end;
    end if;

  else if (manv in (select manv from hotro)) THEN -- neu nhan vien  la tro giang
    if (trangthai = 'toanbo') then -- xem toan bo nhung lop ma minh phu trach
      begin
        select * from lophoc where lophoc.malh in (select malh from hotro where hotro.manv = manv);
        -- xem giao vien va tro giang phu trach cung lop voi minh
        select * from giangday where giangday.malh in (
          select malh from lophoc where lophoc.malh in (
            select malh from hotro where hotro.manv = manv));
        select * from hotro where hotro.malh in (
          select malh from lophoc where lophoc.malh in (
            select malh from hotro where hotro.manv = manv));
        -- xem thoikhoabieu cuar lop minh phu trach
        select * from thoikhoabieu_lh where thoikhoabieu_lh.malh in (
          select malh from lophoc where lophoc.malh in (
            select malh from hotro where hotro.manv = manv));
      end;
    else 
      begin -- xem nhung lop dang mo ma minh phu trach
        select * from lophoc 
          where lophoc.malh in (select malh from hotro where hotro.manv = manv)
          and lophoc.ngayketthuc > CURRENT_TIME();
        -- xem giao vien va tro giang phu trach cung lop voi minh
        select * from giangday 
          where giangday.malh in (select malh from lophoc 
            where lophoc.malh in (select malh from hotro where hotro.manv = manv)
            and lophoc.ngayketthuc > CURRENT_TIME());
        select * from hotro 
          where hotro.malh in (select malh from lophoc 
            where lophoc.malh in (select malh from hotro where hotro.manv = manv)
            and lophoc.ngayketthuc > CURRENT_TIME());
        -- xem thoikhoabieu cuar lop minh phu trach
        select * from thoikhoabieu_lh 
          where thoikhoabieu_lh.malh in (select malh from lophoc 
            where lophoc.malh in (select malh from hotro where hotro.manv = manv)
            and lophoc.ngayketthuc > CURRENT_TIME());
      end;
    end if;
  else signal sqlstate '45000' set message_text = 'Khong ton tai giao vien hoac tro giang co ma nhan vien nay';
  end if;
END$$
DELIMITER ;









-- XEM THOI KHOA BIEU---------------------------------------------------------------------------------------


DELIMITER $$
drop procedure if exists `XemTKBcuaLH`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XemTKBcuaLH`(IN `maLH` VARCHAR(255))
begin
  if exists (select maLH from lophoc where lophoc.malh = malh)
    then begin
      select *
        from thoikhoabieu_lh
       where thoikhoabieu_lh.malh = malh;
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại lớp học này';
  end if;
END$$
DELIMITER ;


DELIMITER $$
drop procedure if exists `XemTKBcuaKH_hientai`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `XemTKBcuaKH_hientai`(IN `maKH` VARCHAR(255))
begin
  if exists (select maKH from khoahoc where lophoc.maKH = maKH)
    then begin
      select *
        from thoikhoabieu_lh
       where thoikhoabieu_lh.malh in (
         select malh
           from lophoc
          where lophoc.makh = makh
       ) and thoikhoabieu_lh.ngayketthuc > CURRENT_TIME();
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;



-- THONG KE SO LIEU KINH DOANH ---------------------------------------------------------------

DELIMITER $$
drop procedure if exists `solieukinhdoanh`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `solieukinhdoanh`()
begin
	SELECT COUNT(lophoc.MaLH) AS Tongso_LH_dang_mo
    FROM lophoc
    WHERE lophoc.Ngayketthuc > CURRENT_TIME();

	SELECT khoahoc.MaKH, khoahoc.Ten, COUNT(lophoc.MaLH) AS Tongso_LH_dangmo_moi_KH
    FROM khoahoc JOIN lophoc ON khoahoc.MaKH = lophoc.MaKH
    WHERE lophoc.Ngayketthuc < CURRENT_TIME()
    GROUP BY khoahoc.MaKH;
    
    SELECT (COUNT(DISTINCT dangky.MaHV) / (max(date(dangky.Ngaydangky)) - MIN(date(dangky.Ngaydangky)))) as Trung_Binh_HV_Dangky_Moingay
    FROM dangky;

    SELECT (COUNT(dangky.MaHV) / (max(date(dangky.Ngaydangky)) - MIN(date(dangky.Ngaydangky)))) as Trung_Binh_Luot_Dangky_Moingay
    FROM dangky;

    SELECT COUNT(DISTINCT dangky.MaHV) as So_HV_dang_theo_hoc
    FROM dangky;

    SELECT chinhanh.MaCN, chinhanh.Ten, COUNT(DISTINCT dangky.MaHV) AS Tongso_HV_moi_CN
    FROM chinhanh JOIN lophoc ON chinhanh.MaCN = lophoc.MaCN JOIN dangky ON lophoc.MaLH = dangky.MaLH
    GROUP BY chinhanh.MaCN;
end$$
DELIMITER ;



-- HOC VIEN -----------------------------------------------------------------------------------


DELIMITER $$
drop procedure if exists `solieukinhdoanh`;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DanhsachHVthuocLH`(IN `maLH` VARCHAR(255))
BEGIN
  SELECT hocvien.MaHV, hocvien.Ho, hocvien.Tendem, hocvien.Ten, (year(CURRENT_TIME()) - hocvien.Namsinh) as Tuoi
  FROM hocvien JOIN dangky ON dangky.hocvienMaHV = hocvien.MaHV
  WHERE dangky.lophocMaLH = maLH;
END$$
DELIMITER ;











