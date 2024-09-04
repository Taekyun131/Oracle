create table muser(
id int,
reg_num varchar2(8) not null,
name varchar2(10 char),
grade int,
salary int,
time int);

create sequence muser_no
increment by 1
start with 10
;

insert into muser values(muser_no.nextval,'870205-1','�̽���',1,10000,34);
insert into muser values(muser_no.nextval,'880405-1','������',2,20000,31);
insert into muser values(muser_no.nextval,'770715-2','���̼�',4,40000,32);
insert into muser values(muser_no.nextval,'010205-3','������',1,10000,30);
insert into muser values(muser_no.nextval,'810205-2','������',2,20000,34);
insert into muser values(muser_no.nextval,'820219-2','���¿�',3,30000,35);
insert into muser values(muser_no.nextval,'020205-3','�����',1,10000,30);
insert into muser values(muser_no.nextval,'970214-2','������',2,20000,31);
insert into muser values(muser_no.nextval,'040205-4','������',4,40000,31);
insert into muser values(muser_no.nextval,'770225-1','���翵',5,50000,30);
insert into muser values(muser_no.nextval,'770905-2','�̽ż�',4,40000,34);
insert into muser values(muser_no.nextval,'050208-3','�̹߲�',2,20000,30);
insert into muser values(muser_no.nextval,'051205-4','�̿���',1,10000,34);
insert into muser values(muser_no.nextval,'891215-1','���¾�',3,30000,30);
insert into muser values(muser_no.nextval,'670805-1','������',2,20000,34);
insert into muser values(muser_no.nextval,'840207-1','���̷�',1,10000,35);
insert into muser values(muser_no.nextval,'770405-1','��õ��',1,10000,31);

select * from muser;
drop table muser;

/*1 grade�� 3�� ����� ��� ����ΰ���?*/
select count(*)
from muser
where grade=3;

/*2 grade�� 1,2,4�� ������� salary�� ����� ���Ͻÿ�.*/
select avg(salary)
from muser
where grade=1 or grade=2 or grade=4;

/*3 salary�� 20000 �̸��� ����� �� ����Դϱ�?*/
select count(*)
from muser
where salary<20000;

/*4 salary�� 30000 �̻��� ����� salary ����� ���Ͻÿ�.*/
select avg(salary)
from muser
where salary>=30000;

/*5 77��� �߿�  salary�� ���� ���� ����� �̸��� ���̿� salary�� ����Ͻÿ�.*/
select name,124-substr(reg_num,1,2)+1 ����,salary
from (select* from muser where substr(reg_num,1,2)=77)
where salary=(select min(salary) from muser where substr(reg_num,1,2)=77);  

/*6 ��� ����� �̸���, ����(���� �� ������� 0205)�� ����Ͻÿ�*/
select name,substr(reg_num,3,4) ����
from muser;

/*7 ������ ��� �޿��� ���Ͻÿ�.*/
select avg(salary)
from muser
where substr(reg_num,-1,1)=1 or substr(reg_num,-1,1)=3;

/*8 ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿��� ����Ͻÿ�*/
select name,salary
from muser
where salary>(select avg(salary) from muser);

/*9 ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸���, �޿�, ��ձ޿��� ����Ͻÿ�*/
--select avg(salary)
--from muser
--where salary>(select avg(salary) from muser);

select name,salary, avg(salary) over() ��ձ޿�
from muser
where salary>(select avg(salary) from muser);

/*10 �������� ��ձ޿����� ���� ���������� ��� ����Դϱ�*/

--select avg(salary)
--from muser
--where substr(reg_num,-1,1)=2 or substr(reg_num,-1,1)=4;
--
--select * from muser where substr(reg_num,-1,1)=1 or substr(reg_num,-1,1)=3;

select count(*)
from (select * from muser where substr(reg_num,-1,1)=1 or substr(reg_num,-1,1)=3)
where salary>(select avg(salary)from muser where substr(reg_num,-1,1)=2 or substr(reg_num,-1,1)=4);

/*11 grade�� ��� �޿��� ����ϼ���..*/
select grade,avg(salary)
from muser
group by grade;

/*12 �׷캰 ��ձ޿��� ��ü ��պ��� ���� �׷��� ����Ͻÿ�.*/
select grade
from muser
group by grade
having avg(salary)>(select avg(salary) from muser);

/*13 �������� ���� ������ ����Ͻÿ�. (��� ���´� �̸�, ����(grade*salary*time) */
select name, grade*salary*time ����
from muser;

/*14 �������� ������ ����Ͻÿ�. (��� ���� �̸�, ����(������ ���Ǵ� ���� ����Ѵ�)*/
select name, decode(substr(reg_num,-1,1),1,'��',2,'��',3,'��',4,'��')as ����
from muser;

/*15 time�� �ٹ��ð�. �ٹ��ð��� 31�̻��� ����� �̸��� ����Ͻÿ�.*/
select name
from muser
where time>31;

/*16 ¦���⵵�� �¾ ������� �̸��� ��� ����Ͻÿ�.*/
select name
from muser
where mod((substr(reg_num,1,2)),2)=0;

/*17 �������� ��������� ����Ͻÿ�. (��� ���´� �̸��� �������(97��1��2��))*/
select name,substr(reg_num,1,2)||'��'||substr(reg_num,3,2)||'��'||substr(reg_num,5,2)||'��' �������
from muser;

/*18 ���������� ���Ƹ� �����ϱ� ���� ��å���� time�� 2�ð������ϱ�� �ߴ�. �̸� ó�� �Ͻÿ�.*/
select time+2 as �����ð�
from (select * from muser where substr(reg_num,-1,1)=2 or substr(reg_num,-1,1)=4);

/*19 ���̺� �ο����� ����Դϱ�*/
select mod(124-substr(reg_num,1,2),100)+1 ����,count(*)
from muser
group by mod(124-substr(reg_num,1,2),100)+1;

/*20 2�г�׷�� 4�г� �׷��� ��� ����Դϱ�*/
select grade,count(*)
from muser
where grade=2 or grade=4
group by grade;

/*�߰�����*/
/*#1) ��� ����� �¾ �� ���ñ��� �� ���� �������� ����Ͻÿ�
(�������: �̸�, �ֹι�ȣ, ���ݱ�����ƿ¿���)*/
--select substr(sysdate,4,2)from dual;
select name,reg_num, (mod(124-substr(reg_num,1,2),100)*12 +(select substr(sysdate,4,2)from dual)-(substr(reg_num,3,2))) ��ƿ¿���
from muser;

/*#2) time�� ���̷� ��. 30~31���� ��ƿ� ������ ��, 32�� �̻��� ��ƿ� ������ �� ���ϱ�*/
select time,sum(time*12+(select substr(sysdate,4,2)from dual))
from muser
group by time;


/*#3) ���ɺ� �޿��� ��, over()�Լ� �̿�*/
select distinct mod(124-substr(reg_num,1,2),100)  ���� ,sum(salary)
over(partition by substr(reg_num,1,2)) �޿���_�� 
from muser;


/*#4) ���ɺ� �ο���, over()�Լ� �̿�*/
select distinct mod(124-substr(reg_num,1,2),100) ����,
count(mod(124-substr(reg_num,1,2),100)) 
over(partition by mod(124-substr(reg_num,1,2),100))�ο�
from muser;

/*#5)��޺� �޿��� �ְ�޿�, over()�Լ� �̿�*/
select distinct grade,max(salary) over(partition by grade) �ְ�޿�
from muser;


