use main1811;

-- SU DUNG - GT - KH ------------------------------------------------------------------------------------

DELIMITER $$
drop trigger if exists trg_before_sudung_insert;
create trigger trg_before_sudung_insert
before insert
on `sudung`
for each row
begin
	if ((select count(*) from `sudung` where MaKH = new.MaKH) = 3)
            then 
		signal sqlstate '45000' set message_text = 'MyTriggerError: cannot insert new giaotrinh in sudung table';
	else -- luu lai su thay doi
		insert into `change_log` value (CURRENT_TIME(), 'insert giao trinh ' + new.magt + ' into khoa hoc' + new.makh);
	end if;
END $$
delimiter ;

DELIMITER $$
drop trigger if exists trg_before_sudung_delete;
create trigger trg_before_sudung_delete
before delete
on sudung
for each row
begin
	if ((select count(*) from sudung where MaKH = old.MaKH) = 1)
            then 
		signal sqlstate '45000' set message_text = 'MyTriggerError: cannot delete giaotrinh from sudung table';
	else -- luu lai su thay doi
		insert into change_log value (CURRENT_TIME(), 'delete giao trinh ' + old.magt + ' from khoa hoc' + old.makh);
	end if;
END $$
delimiter ;


-- delete from `sudung` where giaotrinhMaGT='KN005_GT01' and khoahocMaKH='KN001';
INSERT INTO `sudung` (`maGT`, `MaKH`) VALUES
('KN002_GT01', 'KN001');