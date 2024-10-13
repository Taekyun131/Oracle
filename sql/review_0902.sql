create table users(
no int primary key,
name varchar2(10),
addr varchar2(10),
point number,
grade varchar2(1),
jumin varchar2(8));


insert into users values (1,'kimsu','suwon',99.12,1,'820405-1');
insert into users values (2,'leesu','suwon city',89.00,2,'970805-2');
insert into users values (3,'choihee','seoul',88.21,1,'910204-2');
insert into users values (4,'leesil','suwon',77.62,4,'850405-1');
insert into users values (5,'james','seoul',60.22,1,'871105-1');
insert into users values (6,'parksuji','suwon',90.12,3,'880405-2');
insert into users values (7,'kimrae','yougin',89.96,3,'820105-1');
insert into users values (8,'sangJin','youngin',99.31,3,'990420-2');
insert into users values (9,'Leechan','incheon',79.12,2,'970605-2');
insert into users values (10,'kimmi','incheon',79.92,1,'810505-1');
insert into users values (11,'ryusu','seoul',85.32,4,'861205-2');
insert into users values (12,'Gosu',null,82.13,4,'810715-1');

select * from users;

1. ��� ������� �̸��� ������ ��������� �˻��Ͻÿ�.  
select name, point,jumin
from users;

2. 80�� �̻��� ����� �̸��� �ּ�, ������ �˻��Ͻÿ�.
select name,addr,point
from users
where point>=80;
3. �̸��� kim���� ���۵Ǵ� ����� �̸��� �ּҿ� ������ �˻��Ͻÿ�.
select name,addr,point
from users
where name like 'kim%';
4. ���� �������� +10���� ������ ������ ����Ͻÿ�.
   ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.
   select point+10 as ��������
   from users;
  
5. 1�г��� ������ +1���� �÷��� ����ϼ���. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select point+1 AS "1�г�����"
from users
where grade=1;

6. B����� ȹ���� ����� �̸�, �ּ�, ������ ����ϼ��� (B��� 80�� �̻� 90�� �̸��Դϴ�)
select name,addr,point
from users
where point>=80 and point<90;
 7. ���� ��� �� NULL�� ���� �Է����� ���� ���Դϴ�.
   �ּҸ� �Է����� ���� �л��� �̸���, �ּ�, �г�, ����, �ֹι�ȣ�� ����ϼ���
   select name,addr,grade,point,jumin
   from users
   where addr is null;
8. 4�г��� ������ 10%�� �ø� ������ ����ϼ���.
   (��, ���������ʹ� �ݿ����� �ʴ´�)
   select point*1.1 as "4�г�����"
   from users
   where grade=4;
9. ������ ���� �л����� ����ϼ���.  ��ȣ, �̸�, �ּ�, ����Ʈ
select no,name,addr,point
from users
order by point asc;
 10. �г��� ������������ �����Ͻÿ�, �� �г��� ���� �� ��� ����Ʈ�� ���� ����� ���� ��µ˴ϴ�.
     ����� ��ȣ, �̸�, �г�, ����Ʈ 
     select no,name,grade,point
     from users
     order by grade asc, point desc;
11. ������ �������� -10�� ������ ��� 80�� �̻��� ����� �̸��� ����, ������ ��� ������ ����ϼ���.?
select name, point,point-10 as "��������"
from users
where point>=80;

12. 2�г��� ��� �л��� ����Ͻÿ� . ��� �÷�����
    �̸� �ּ� �г����� ����Ͻÿ�. ���⼭ �̸��� name�÷�, �ּҴ� addr�÷�, �г��� grade�÷��� �ǹ�
select name as "�̸�", addr as "�ּ�", grade as "�г�"
from users
where grade=2;
�߰�����  -- ����Ŭ �Լ��� �˻��� ������
13. �л��� �� ����Դϱ�? 
select count(*)
from users;
14. 1�г��� �� ����Դϱ�?
select count(*)
from users
where grade=1;
15. ��� �л��� �̸��� �г��� ����Ͻÿ�. �� �̸��� ��� �ҹ��ڷθ� ����Ͻÿ�. 
select lower(name) as "�ҹ���" ,grade
from users;

16. 2�г� �л��� �̸��� �г��� ����Ͻÿ�. ������ ���ؼ� �ּҴ� �ձ��� 2���ڸ� ����Ͻÿ�.
select name,grade,substr(addr,1,2) as "�ּ�"
from users
where grade=2;
17. ��� �л��� ������ ���� �ڸ��� �����Ͻÿ�. - �ݿø� ���� (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select trunc(point,-1) as "����"
from users;
18. ��� �л��� ������ �ݿø��Ͽ� ����Ͻÿ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select round(point) as "�ݿø�"
from users;
19. 2�г��� ��� ����Դϱ�?
select count(*) as "2�г� �ο���"
from users
where grade=2;
20. 1�г��� 80�� �̻��� ����Դϱ�?
select count(*)
from users
where grade=1 and point>=80;
21. 3�г��� ����� �����Դϱ�?
select avg(point)
from users
where grade=3;
22. ��ü �л� �� �ְ����� �����Դϱ�?
select min(point)
from users;
23. 2�г� �� ���� ���� ������ ȹ���� ������ �����Դϱ�?
?select min(point)
from users
where grade=2;

��Ǫ�� ����
24. ������ ���ؼ� �ּҸ� ��� ������� �ʰ� ���� �� ���ڸ� ����ϰ� �ڿ� *�� �ϳ� ������.
   (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
   ��)suwon  >> su*
   select substr(addr,1,3)||'*'
   from users;
25. �̸��� �� �տ� *�� �� �ڿ���*�� ������ ����Ѵ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�.)
select '*'||name||'*'
from users;
26. ��������� �״�� ������� ����
    xx �� xx �� xx �� �������� ����Ѵ�. (��, ���� �����Ϳ� �ݿ����� �ʽ��ϴ�. ������ �����Ѵ�)
    select substr(jumin,1,2)||' ��'||
            substr(jumin,3,2)||' ��'||
            substr(jumin,5,2)||' ��' as "�������"
    from users;
27. �̸�, ����Ʈ, �г�, �������, ������ �߰��Ѵ�. ������ ������Ϸ� �Ǵ��ϸ� ������ ���ڰ�1�̸� ��
    2�̸� ����� ǥ���Ѵ�. 
    select name,point,grade,
            substr(jumin,1,2)||' ��'||
            substr(jumin,3,2)||' ��'||
            substr(jumin,5,2)||' ��' as "�������",
            decode(substr(jumin,8,1),1,'��',2,'��') as "����"
    from users;
            