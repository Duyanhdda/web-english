-- yccn 03

-- cap nhat thong tin khoa hoc
-- update bang su dung (giao trinh - khoa hoc)
-- update trang thai cua khoa hoc

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

-- select * from sudung where khoahocmakh='KN001'; 

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

-- delete from `sudung` where giaotrinhMaGT='KN002_GT01' and khoahocMaKH='KN001';
-- delete from `sudung` where giaotrinhMaGT='KN003_GT01' and khoahocMaKH='KN001';
-- delete from `sudung` where giaotrinhMaGT='KN004_GT01' and khoahocMaKH='KN001';
-- delete from `sudung` where giaotrinhMaGT='KN001_GT01' and khoahocMaKH='KN001';



-- demo

-- INSERT INTO `sudung` (`giaotrinhMaGT`, `khoahocMaKH`) VALUES
-- ('KN002_GT01', 'KN001');

update sudung set giaotrinhMaGT='KN002_GT01'
where giaotrinhMaGT='KN001_GT01'
and khoahocMaKH='KN001';

-- update trang thai cua khoa hoc

-- set @inputMaKH = 'makh';

-- update khoahoc 
-- 	set trangthai = if(trangthai='opening','closed','opening')
--     where makh = @inputMaKH;



-- chinh sua giao trinh su dung
-- DELIMITER $$
-- CREATE DEFINER=`root`@`localhost` PROCEDURE `updateGTsudung`(IN `maKH` VARCHAR(255), IN `maGT` VARCHAR(255))
-- BEGIN
-- 	-- kiem tra co khoa hoc khong
--     -- kiem tra co giao trinh khong
-- END $$
-- DELIMITER ;


