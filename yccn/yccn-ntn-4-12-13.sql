-- yccn 4 12 13
use maindb;


-- xem danh sach cac chi nhanh
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

-- xem danh sach dang ky cua minh o thoi diem hien tai
select * from hocvien;
select * from lophoc;
select * from dangky;
set @userID = 1911837;

select * 
	from lophoc
    where lophoc.MaLH in ( 
		select dangky.lophocMaLH 
			from dangky
            where dangky.hocvienMaHV = @userID            
    ) and lophoc.ngayketthuc > current_date();
    
-- cap nhat thong tin khoa hoc
-- update bang su dung (giao trinh - khoa hoc)
-- update trang thai cua khoa hoc


-- update bang su dung (giao trinh - khoa hoc)
-- aka them / xoa / thay doi giao trinh
-- hai ben deu phai co san
-- kiem tra khoa phai co 1 - 3 giao trinh

use main1511;
DELIMITER $$
drop trigger if exists trg_before_sudung_insert;
create trigger trg_before_sudung_insert
before insert
on sudung
for each row
begin
	if ((select count(*) from sudung where khoahocMaKH=new.khoahocMaKH) = 3)
            then 
		signal sqlstate '45000' set message_text = 'MyTriggerError: cannot insert new giaotrinh in sudung table';
	-- else -- luu lai su thay doi
	-- 	insert into sudung value (new.giaotrinhmagt, new.khoahocmakh);
	end if;
END $$
delimiter ;

select * from sudung where khoahocmakh='KN001';

INSERT INTO `sudung` (`giaotrinhMaGT`, `khoahocMaKH`) VALUES ('KN002_GT01', 'KN001');
INSERT INTO `sudung` (`giaotrinhMaGT`, `khoahocMaKH`) VALUES ('KN003_GT01', 'KN001');
INSERT INTO `sudung` (`giaotrinhMaGT`, `khoahocMaKH`) VALUES ('KN004_GT01', 'KN001');

use main1511;
DELIMITER $$
create trigger trg_before_sudung_delete
before delete
on sudung
for each row
begin
	if ((select count(*) from sudung where khoahocMaKH=old.khoahocMaKH) = 1)
            then 
		signal sqlstate '45000' set message_text = 'MyTriggerError: cannot delete giaotrinh from sudung table';
	-- else -- luu lai su thay doi
	-- 	insert into sudung value (new.giaotrinhmagt, new.khoahocmakh);
	end if;
END $$
delimiter ;

delete from `sudung` where giaotrinhMaGT='KN002_GT01' and khoahocMaKH='KN001';
delete from `sudung` where giaotrinhMaGT='KN003_GT01' and khoahocMaKH='KN001';
delete from `sudung` where giaotrinhMaGT='KN004_GT01' and khoahocMaKH='KN001';
delete from `sudung` where giaotrinhMaGT='KN001_GT01' and khoahocMaKH='KN001';

-- trigger update if duplicate - no need

INSERT INTO `sudung` (`giaotrinhMaGT`, `khoahocMaKH`) VALUES
('KN002_GT01', 'KN001');

update sudung set giaotrinhMaGT='KN002_GT01'
where giaotrinhMaGT='KN001_GT01'
and khoahocMaKH='KN001';

-- update trang thai cua khoa hoc

set @inputMaKH = 'makh';

update khoahoc 
	set trangthai = if(trangthai='opening','closed','opening')
    where makh = @inputMaKH;



    

