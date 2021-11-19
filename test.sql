use main1811;

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
        select * from giangday where giangday.malh in (
          select malh from lophoc 
            where lophoc.malh in (select malh from hotro where hotro.manv = manv)
            and lophoc.ngayketthuc > CURRENT_TIME());
        select * from hotro where hotro.malh in (
          select malh from lophoc 
            where lophoc.malh in (select malh from hotro where hotro.manv = manv)
            and lophoc.ngayketthuc > CURRENT_TIME());
        -- xem thoikhoabieu cuar lop minh phu trach
        select * from thoikhoabieu_lh where thoikhoabieu_lh.malh in (
          select malh from lophoc 
            where lophoc.malh in (select malh from hotro where hotro.manv = manv)
            and lophoc.ngayketthuc > CURRENT_TIME());
      end;
    end if;
  else signal sqlstate '45000' set message_text = 'Khong ton tai giao vien hoac tro giang co ma nhan vien nay';
  end if;
END$$
DELIMITER ;
 