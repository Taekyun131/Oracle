
select m.id, m.name,m.b_date,m.addr,m.p_num,
		b.i_num,b.i_name,b.r_day,b.m_money,
		j.jjim_num,j.jjim_name
from member m
left outer join buy b
on m.id=b.id
left outer join jjim j
on m.id=j.id
order by m.id asc;



select m.id, m.name,b.i_num,b.i_name,b.r_day,b.m_money,j.jjim_num,j.jjim_name
from member m
left outer join buy b
on m.id=b.id
left outer join jjim j
on m.id=j.id
order by m.id asc;
select rpad('*',length(pwd),'*')
from member;

create view mypage as(select m.id, m.name, rpad('*',length(m.pwd),'*') 비밀번호,m.mem_point,
								b.i_num,b.i_name,b.r_day,b.m_money,
								j.jjim_name,
								r.r_write
						from member m
						left outer join buy b
						on m.id=b.id
						left outer join jjim j
						on m.id=j.id
						left outer join review r
						on m.id=r.id
						
order by m.id asc
);
select * from mypage where id in('user014','user018','user004') ;
drop view mypage;

create table jjim(
id varchar(10),
jjim_num int,
jjim_name varchar(30)
);

select * from jjim;




insert into jjim (id,jjim_num,jjim_name) values
('user012',14, '발뮤다 토스터기'),
('user030',16, '한일 선풍기'),
('user018',27, '브레빌 커피머신'),
('user002',54, '소니 4K UHD 블루레이 플레이어'),
('user002',57, '브레빌 커피머신');


