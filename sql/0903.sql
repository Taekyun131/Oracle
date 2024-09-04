select grade, count(*) �ο���
from users
group by grade;

/*����1) �׷캰 �ο����� ����ϵ� �г��� ������������ ����*/
select grade, count(*) �ο���
from users
group by grade
order by grade asc;
/*����2) �׷캰 �ְ����� �������� ����Ͻÿ�*/
select grade, max(point) �ְ���, min(point) ������
from users
group by grade
order by grade asc;
/*����3) �׷캰 �ְ����� ȹ���� ����� �̸���?*/
select grade,max(point) �ְ���, name
from users group by grade;--����: name�� �׷�ȭ��������--

/*Ȯ�ι���*/
/*1) 3�г�� 4�г� ���� �׷��� �ο����� ����Ͻÿ�.*/
select grade,count(*) 
from users
where grade=3 or grade=4 
group by grade;

/*2) 1�г�� 2�г��� �ְ����� �������� �������̸� ����Ͻÿ�*/
select grade, max(point)-min(point)
from users
where grade=1 or grade=2
group by grade;

/*3) �ֹι�ȣ 2�ڸ��� �¾ �⵵�̴�. ���� �⵵�� �¾ ����� ī���� �Ͻÿ�
    �̶� �¾ �⵵�� �ο����� ����Ѵ�.*/
select substr(jumin,1,2) �¾_�⵵, count(*) �ο���
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

/*���� ���� ������ ȹ���� ����� �̸��� ������?*/
select max(point)
from users;
select name, point
from users
where point=(select max(point) from users);
