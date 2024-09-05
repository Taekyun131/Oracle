/*3. 자동차 번호가 7788인 소유자의 이름과 주소를 출력하시오*/
자동차 번호가 7788은 조건절 where
소유자의 이름과 주소는 users 문제는 자동차 번호는 carinfo
--1) 조인을 해서 조건절로 7788인 자동차의 소유자의 정보를 출력>조인
select u.name, u.addr
from users u, carinfo i
where u.id=i.id and i.c_num='7788';
--2) 7788 소유자의 회원아이디를 검색한 후 결과값을 본 쿼리의 조건>서브쿼리
select id
from carinfo
where c_num='7788';

select name,addr
from users
where id= (select id
            from carinfo
            where c_num='7788');



/*4. 자동차를 소유하지 않은 사람의 이름과 주소를 출력하시오.*/
--이름과 주소는 users//자동차를 소유하지 않은 사람이라는 조건
--      carinfo 테이블을 참조해 봐야.. 이너조인, 아우터조인...

select u.*,c.*
from users u
left outer join carinfo c
on u.id=c.id
where c_name is null;

select u.name,u.addr
from users u
left outer join carinfo c
on u.id =c.id
where c_name is null;


--left outer join의 다른 표기법--
select u.name,u.addr
from users u, carinfo c
where u.id=c.id(+) and c_name is null;  

--right outer join의 다른 표기법--
select u.name,u.addr
from users u, carinfo c
where u.id(+)=c.id and c_name is null; 


/*5. 회원수별 등록한 자동차 수를 출력하시오.*/
--회원별 집계, users만으로는 회원의 자동차를 알 수 없으니
--users와 carinfo 테이블을 조인...필요한 조인은 이너조인
--이너조인을 한 후에 회원으로 그룹을 만들고 카운팅 집계를 하자
select u.*,c.*
from users u, carinfo c
where u.id=c.id;

select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by u.id;  --동명이인일 수도 있으니 u.id로 그룹화하자>>에러
                --select u.name은 다중행
                
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id,u.name);     --group by를 복합속성으로 정의


/*6. 2대 이상을 소유한 회원의 이름과 소유한 자동차 수를 출력하시오.*/
--5번과 비슷, 조건이 2대 이상이라는 조건이 추가>>having이 적합
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id,u.name)
having count(*)>=2;


/*7. 자동차는 등록되어 있는데 소유자가 없는 자동차 번호를 출력하시오.*/
--먼저 보는 테이블과 나중에 보는 테이블의 순서를 기억..
--먼저보는 테이블으 carinfo, 두번째로 보는 테이블 users
--자동차가 등록되어 있는데 소유자가 누군지..이너조인
--이너조인에 참여하지 못하는 튜플을 원한다...아우터조인
--아우터조인일 때는 어떤 테이블을 left로 볼 것인가?? 첫번째 left 지정

select c.c_num
from carinfo c
left outer join users u
on c.id=u.id
where u.id is null;

select c.c_num
from carinfo c, users u
where c.id=u.id(+) and u.id is null;


/*8. 배정 자동차의 차번호, 제조사, 자동차명, 가격을 출력하시오.*/
--carinfo 배정 자동차의 정보로 가정..차번호는 carinfo로 해결가능하지만
--제조사와 자동차명과 가격은 companycar테이블에 있으므로 이너조인 필요
select c.c_num,cc.c_com,cc.c_name,cc.c_price
from carinfo c, companycar cc
where c.c_num=cc.c_num;


/*9. 회사에서 구매는 하였지만 배정되지 않은 자동차의 차번호, 제조자, 자동차 이름을 출력  */
--테이블을 보는 순서
--companycar 테이블에 보유한 자동차 정보를 확인, 이 자동차가 배정되었는지를
--확인하기 위해서 carinfo 테이블을 확인.. 배정된 자동차는 이너조인 필요
--배정이 안된 자동차는 아우터 조인 필요.. 이때 companycar를 left table
select c.c_num,c.c_com,c.c_name
from companycar c
left outer join carinfo cc
on c.c_num=cc.c_num
where cc.c_num is null;

/*10. 자동차 가격이 1000만원 이상인 자동차의 자동차 번호를 출력하시오.*/
--자동차 가격이 1000만원 이상이라는 조건은 companycar에서 해결가능
--언하는 자동차 번호도 companycar에서 해결가능 ..즉, 조인 필요없음
select c_name
from companycar
where c_price>=1000;


/*11. 배정된 자동차 중에 회사에서 구매한 자동차가 아닌 자동차 번호를 출력하시오.*/
--관련 테이블은 carinfo ,comanycar
--outer join >>carinfo 테이블을 left
select c.c_num
from carinfo c
left outer join companycar c1
on c.c_num=c1.c_num
where c1.c_com is null;


/*12. 모든 사람의 정보를 출력하시오. 이름, 배정받은 자동차번호, 자동차이름*/
--관련 테이블은 users, carinfo, companycar
--조인해서 만들고 싶은 테이블은
--users.name    carinfo.c_num   companycar.c_name
--즉, 테이블 3개를 조인.. 이때는 순서를 정하고 순서대로 2개씩 조인하고
--그 결과의 논리테이블과 다음 테이블을 조인
select u.name, NVL(c.c_num,'없음'), NVL(cc.c_name,'없음')
from users u
left outer join carinfo c
on u.id=c.id
left outer join companycar cc
on c.c_num=cc.c_num;

--**고찰**
--테이블은 데이터 중복을 최소화하기 위해 정규화 되어야 하고,
--정규화는 테이블을 분리하는 의미가 있다.
--그런데 서비스를 이용하는 고객입장에서는 2개 이상의 테이블이 
--조인되어야 하는 경우가 있다.
--그래서 정규화는 설계자의 입장이고, 조인은 서비스를 제공하는 입장의 기술이다.
--그런데 2개 이상의 테이블이 조인되어야 하는 서비스는 
--서비스가 이용될때마다 DB가 조인연산을 계속해야 하고 쿼리도 복잡하다.
--해결책은 물리적인 테이블은 유지하되, 조인결과를 합친 논리적인 테이블을 만드는 것이다.
--논리적인 테이블은 물리적인 테이블의 데이트로 만들어져있다.
--이런 논리적인 테이블을 뷰라고 한다.

--12번의 서비스를 제공하기 위해 view를 생성
create view all_users as 
(select u.name name, NVL(c.c_num,'없음') carnum, NVL(cc.c_name,'없음') carname
from users u
left outer join carinfo c
on u.id=c.id
left outer join companycar cc
on c.c_num=cc.c_num);

select * from all_users;--view 이름으로 조회가능





