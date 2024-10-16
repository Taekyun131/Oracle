select grade, count(*) 인원수
from users
group by grade;

/*응용1) 그룹별 인원수를 출력하되 학년을 오름차순으로 정렬*/
select grade, count(*) 인원수
from users
group by grade
order by grade asc;
/*응용2) 그룹별 최고점과 최저점을 출력하시오*/
select grade, max(point) 최고점, min(point) 최저점
from users
group by grade
order by grade asc;
/*응용3) 그룹별 최고점을 획득한 사람의 이름은?*/
select grade,max(point) 최고점, name
from users group by grade;--에러: name은 그룹화되지않음--

/*확인문제*/
/*1) 3학년과 4학년 각각 그룹의 인원수를 출력하시오.*/
select grade,count(*) 
from users
where grade=3 or grade=4 
group by grade;

/*2) 1학년과 2학년의 최고점과 최저점의 점수차이를 출력하시오*/
select grade, max(point)-min(point)
from users
where grade=1 or grade=2
group by grade;

/*3) 주민번호 2자리는 태어난 년도이다. 같은 년도에 태어난 사람을 카운팅 하시오
    이때 태어난 년도와 인원수로 출력한다.*/
select substr(jumin,1,2) 태어난_년도, count(*) 인원수
from users
group by substr(jumin,1,2)
order by substr(jumin,1,2) asc;
    
select grade,avg(point) 
from users
group by grade 
having avg(point)>=
(select avg(point) from users);

select m.name,m.addr
from (select*from users) m;

select m.name,m.addr
from (select*from users) m
where m.grade=3;

/*가장 높은 점수를 획득한 사람의 이름과 점수는?*/
select max(point)
from users;
select name, point
from users
where point=(select max(point) from users);
