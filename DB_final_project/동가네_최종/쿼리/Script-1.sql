/*트리거*/
/*리뷰테이블에서 UPDATE되면 상품테이블의 평균별점 계산*/
drop trigger if exists update_star

delimiter //
create trigger update_star
after insert 
on review
for each row 
begin 
	update goods set star=(select round(avg(star),1) from review  where i_num=new.i_num)
							where i_num=new.i_num;
end
delimiter ;


create trigger back_star
after delete 
on review
for each row 
begin 
	update goods set star=(select round(avg(star),1) from review  where i_num=old.i_num)
							where i_num=old.i_num;
end
delimiter ;

drop trigger back_star;
show triggers from rental;
select * from review;
select * from goods;S
insert into review ()

select avg(star)
from review
;

-- select i_num,i_name,avg(star)
-- from review
-- group by i_num;

-- select i_name,avg(star) from review group by i_name;
-- 
-- 
-- select * from star;
-- 
-- drop view star;
-- create view star as (
-- select i_name, avg(star) 평균
-- from review
-- group by i_name);
-- 
-- drop view star;


create trigger UPDATE_POINT
	after insert
	on BUY
	for each row 
	begin
		UPDATE MEMBER set Mem_POINT=mem_point+new.mem_POINT
			where ID=new.ID;
	end
DELIMITER;





