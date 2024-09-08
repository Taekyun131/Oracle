/*트리거*/
/*리뷰테이블에서 UPDATE되면 상품테이블의 평균별점 계산*/
drop trigger if exists update_star
delimiter //
create trigger update_star
after insert 
on review
for each row 
begin 
	update goods set star=select avg(star) from review group by i_name  where i_name=new.i_name;
				
end//
delimiter ;

select i_name, avg(star) from review group by i_name;

avg(select star from review where i_name='삼성 QLED TV 65인치' group by i_name);

select avg(star) from review where i_name='삼성 QLED TV 65인치' group by i_name;



select * from goods;

from review
