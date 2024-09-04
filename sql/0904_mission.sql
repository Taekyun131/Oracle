drop table users;
drop table carinfo;

create table users(
id varchar2(8), 
name varchar2(10), 
addr varchar2(10));

create table carinfo(
c_num varchar2(4),   --�ڵ��� ��ȣ
c_name varchar2(10),  -- �ڵ��� ����
 id varchar2(8));
 
insert into users values ('1111','kim','����');
insert into users values ('2222','lee','����');
insert into users values ('3333','park','����');
insert into users values ('4444','choi','����');
select * from users;

insert into carinfo values ('1234','����','1111');
insert into carinfo values ('3344','����','1111');
insert into carinfo values ('5566','����','3333');
insert into carinfo values ('6677','����','3333');
insert into carinfo values ('7788','����','4444');
insert into carinfo values ('8888','����','5555');
select * from carinfo;

/*�� �ڷḦ ȸ���� ����� �ڵ��� �����̴�.*/
/*1. ȸ���� �̸��� �ּҸ� ����Ͻÿ�.*/
select name,addr
from users;

/*2. ȸ���� �̸��� ������ �ڵ��� ��ȣ�� ����Ͻÿ�.*/
select u.name,c.c_num
from users u, carinfo c
where u.id=c.id;

/*3. �ڵ��� ��ȣ�� 7788�� �������� �̸��� �ּҸ� ����Ͻÿ�.*/
select u.name,u.addr
from users u,carinfo c
where u.id=c.id and c.c_num=7788;

/*4. �ڵ����� �������� ���� ����� �̸��� �ּҸ� ����Ͻÿ�.*/
select u.name, u.addr
from users u
left outer join carinfo c
on u.id=c.id
where c.c_num is null;

/*5. ȸ������ ����� �ڵ��� ���� ����Ͻÿ�.*/
select u.name, c.�ڵ�����
from users u 
left outer join(select id, count(*) �ڵ�����
                from carinfo
                group by id) c
on u.id=c.id;   

/*6. 2�� �̻��� ������ ȸ���� �̸��� ������ �ڵ��� ���� ����Ͻÿ�.*/

select id, count(*) �ڵ�����
from carinfo
group by id
having count(*)>=2;

select u.name, c.�ڵ�����
from users u, (select id, count(*) �ڵ�����
                from carinfo
                group by id
                having count(*)>=2) c
where u.id=c.id;



/*7. �ڵ����� ��ϵǾ� �ִµ� �����ڰ� ���� �ڵ��� ��ȣ�� ����Ͻÿ�.*/
select c.c_num
from users u
right outer join carinfo c
on u.id=c.id
where u.name is null;



-- ���� ���ʹ� 3�� ���̺��� �����ϴ� �����Դϴ�.

-- companycar ȸ�翡�� ������ �ڵ����� �ǹ�, 
--carinfo�� �������� ������ �ڵ���

create table companycar(     -- �ڵ��� ����
c_num varchar2(4),   -- ����ȣ
c_com varchar2(30), 
c_name varchar2(10),  -- ���̸�
c_price number);  -- �� ����

insert into companycar values ('1234','����','�ҳ�Ÿ',1000);
insert into companycar values ('3344','���','����',2000);
insert into companycar values ('7788','���','��2',800);
insert into companycar values ('9900','����','�׷���',2100);
select * from companycar;

/*8. ���� �ڵ����� ����ȣ, ������, �ڵ�����, ������ ����Ͻÿ�.*/
select c.c_num,c.c_com,c.c_name,c.c_price
from carinfo i,companycar c
where i.c_num=c.c_num;

/*9. ȸ�翡�� ���Ŵ� �Ͽ����� �������� ���� �ڵ����� ����ȣ, ������, �ڵ��� �̸��� ���  */
select c.c_num,c.c_com,c.c_name
from carinfo i
right outer join companycar c
on i.c_num=c.c_num
where i.c_num is null;


/*10. �ڵ��� ������ 1000���� �̻��� �ڵ����� �ڵ��� ��ȣ�� ����Ͻÿ�.*/
select c_num
from companycar
where c_price>=1000;

/*11. ������ �ڵ��� �߿� ȸ�翡�� ������ �ڵ����� �ƴ� �ڵ��� ��ȣ�� ����Ͻÿ�.*/
select i.c_num
from carinfo i
left outer join companycar c
on i.c_num=c.c_num
where c.c_num is null;

/*12. ��� ����� ������ ����Ͻÿ�. �̸�, �������� �ڵ�����ȣ, �ڵ����̸�*/

--select i.c_num ����ȣ,c.c_name ���̸�
--from carinfo i
--left outer join companycar c
--on i.c_num=c.c_num;


select u.name,t.����_����ȣ,t.���̸�
from users u
left outer join(select i.id id, i.c_num ����_����ȣ,c.c_name ���̸�
                from carinfo i
                left outer join companycar c
                on i.c_num=c.c_num) t
on u.id =t.id;


                  











