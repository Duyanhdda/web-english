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
          where lophoc.makkh = makh
       );
    end;
  else signal sqlstate '45000' set message_text = 'Không tồn tại khóa học này';
  end if;
END$$
DELIMITER ;










