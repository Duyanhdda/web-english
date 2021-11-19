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
		signal sqlstate '45000' set message_text = 'MyTriggerError: khóa học đã sử dụng 3 giáo trình';
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
		signal sqlstate '45000' set message_text = 'MyTriggerError: khóa học phải sử dụng ít nhất 1 giáo trình';
	else -- luu lai su thay doi
		insert into change_log value (CURRENT_TIME(), 'delete giao trinh ' + old.magt + ' from khoa hoc' + old.makh);
	end if;	 
END $$
delimiter ;


-- LOP HOC ----------------------------------------------------------------



DELIMITER $$
drop trigger if exists trg_before_lophoc_insert;
create trigger trg_before_lophoc_insert
before insert
on lophoc
for each row
begin
	IF (new.ngaybatdau IS NOT null 
		AND new.ngayketthuc IS NOT null 
        AND (datediff(new.ngayketthuc, new.ngaybatdau)/7) < (SELECT khoahoc.Thoiluong FROM khoahoc WHERE khoahoc.MaKH = new.maKH))
		THEN signal sqlstate '45000' set message_text = 'MyTriggerError: Thời lượng lớp học quá ngắn so với thời lượng khóa học chứa nó.';
        -- THEN insert into change_log value (CURRENT_TIME(), 'MyTriggerError: Thời lượng lớp học quá ngắn so với thời lượng khóa học chứa nó.');
	end if;
	-- luu lai su thay doi
	insert into change_log value (CURRENT_TIME(), 'insert lop hoc moi: ');
END $$
delimiter ;

-- select datediff(curdate(), curdate())/7;
-- SELECT khoahoc.Thoiluong FROM khoahoc WHERE khoahoc.MaKH = 'KN001';

DELIMITER $$
drop trigger if exists trg_before_lophoc_update;
create trigger trg_before_lophoc_update
before update
on lophoc
for each row
begin
		
	IF (new.ngaybatdau IS NOT null 
		AND new.ngayketthuc IS NOT null 
        AND (datediff(new.ngayketthuc, new.ngaybatdau)/7) < (SELECT khoahoc.Thoiluong FROM khoahoc WHERE khoahoc.MaKH = new.maKH))
		THEN signal sqlstate '45000' set message_text = 'MyTriggerError: Thời lượng lớp học quá ngắn so với thời lượng khóa học chứa nó.';
        -- THEN insert into change_log value (CURRENT_TIME(), 'MyTriggerError: Thời lượng lớp học quá ngắn so với thời lượng khóa học chứa nó.');
	end if;
		-- luu lai su thay doi
			insert into change_log value (CURRENT_TIME(), 'update lop hoc: ');
END $$
delimiter ;


DELIMITER $$
drop trigger if exists trg_before_lophoc_delete;
create trigger trg_before_lophoc_delete
before delete
on lophoc
for each row
begin
		
		insert into change_log value (CURRENT_TIME(), 'delete lop hoc: ');
END $$
delimiter ;