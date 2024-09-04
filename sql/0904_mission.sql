drop table users;
drop table carinfo;

create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4),   --자동차 번호
c_name varchar2(10),  -- 자동차 종류
 id varchar2(8));
 
insert into users values ('1111','kim','수원');
insert into users values ('2222','lee','서울');
insert into users values ('3333','park','대전');
insert into users values ('4444','choi','대전');
select * from users;

insert into carinfo values ('1234','중형','1111');
insert into carinfo values ('3344','소형','1111');
insert into carinfo values ('5566','중형','3333');
insert into carinfo values ('6677','중형','3333');
insert into carinfo values ('7788','중형','4444');
insert into carinfo values ('8888','중형','5555');
select * from carinfo;

/*위 자료를 회원이 등록한 자동차 정보이다.*/
/*1. 회원의 이름과 주소를 출력하시오.*/
select name,addr
from users;

/*2. 회원의 이름과 소유한 자동차 번호를 출력하시오.*/
select u.name,c.c_num
from users u, carinfo c
where u.id=c.id;

/*3. 자동차 번호가 7788인 소유자의 이름과 주소를 출력하시오.*/
select u.name,u.addr
from users u,carinfo c
where u.id=c.id and c.c_num=7788;

/*4. 자동차를 소유하지 않은 사람의 이름과 주소를 출력하시오.*/
select u.name, u.addr
from users u
left outer join carinfo c
on u.id=c.id
where c.c_num is null;

/*5. 회원수별 등록한 자동차 수를 출력하시오.*/
select u.name, c.자동차수
from users u 
left outer join(select id, count(*) 자동차수
                from carinfo
                group by id) c
on u.id=c.id;   

/*6. 2대 이상을 소유한 회원의 이름과 소유한 자동차 수를 출력하시오.*/

select id, count(*) 자동차수
from carinfo
group by id
having count(*)>=2;

select u.name, c.자동차수
from users u, (select id, count(*) 자동차수
                from carinfo
                group by id
                having count(*)>=2) c
where u.id=c.id;



/*7. 자동차는 등록되어 있는데 소유자가 없는 자동차 번호를 출력하시오.*/
select c.c_num
from users u
right outer join carinfo c
on u.id=c.id
where u.name is null;



-- 다음 부터는 3개 테이블을 조인하는 문제입니다.

-- companycar 회사에서 구매한 자동차를 의미, 
--carinfo는 직원에게 배정한 자동차

create table companycar(     -- 자동차 정보
c_num varchar2(4),   -- 차번호
c_com varchar2(30), 
c_name varchar2(10),  -- 차이름
c_price number);  -- 차 가격

insert into companycar values ('1234','현다','소나타',1000);
insert into companycar values ('3344','기와','축제',2000);
insert into companycar values ('7788','기와','레2',800);
insert into companycar values ('9900','현다','그랭저',2100);
select * from companycar;

/*8. 배정 자동차의 차번호, 제조사, 자동차명, 가격을 출력하시오.*/
select c.c_num,c.c_com,c.c_name,c.c_price
from carinfo i,companycar c
where i.c_num=c.c_num;

/*9. 회사에서 구매는 하였지만 배정되지 않은 자동차의 차번호, 제조자, 자동차 이름을 출력  */
select c.c_num,c.c_com,c.c_name
from carinfo i
right outer join companycar c
on i.c_num=c.c_num
where i.c_num is null;


/*10. 자동차 가격이 1000만원 이상인 자동차의 자동차 번호를 출력하시오.*/
select c_num
from companycar
where c_price>=1000;

/*11. 배정된 자동차 중에 회사에서 구매한 자동차가 아닌 자동차 번호를 출력하시오.*/
select i.c_num
from carinfo i
left outer join companycar c
on i.c_num=c.c_num
where c.c_num is null;

/*12. 모든 사람의 정보를 출력하시오. 이름, 배정받은 자동차번호, 자동차이름*/

--select i.c_num 차번호,c.c_name 차이름
--from carinfo i
--left outer join companycar c
--on i.c_num=c.c_num;


select u.name,t.배정_차번호,t.차이름
from users u
left outer join(select i.id id, i.c_num 배정_차번호,c.c_name 차이름
                from carinfo i
                left outer join companycar c
                on i.c_num=c.c_num) t
on u.id =t.id;


                  











