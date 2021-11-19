

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