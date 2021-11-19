use main1811;

set @makh = 'KN001';

select * from lophoc natural join chinhanh 
        where lophoc.makh = @makh and lophoc.ngaybatdau > CURRENT_TIME();
 