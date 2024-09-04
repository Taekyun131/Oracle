create table hm(
no number(3) primary key,
name varchar2(10) not null,
point number(5) default 0,
addr varchar2(20),
indate timestamp default sysdate);
insert into hm values(1,'ȫ�浿',45,'�����',default);
insert into hm values(2,'������',50,'����',default);
insert into hm values(3,'������',43,'����',default);
select * from hm;
select no,name from hm;
select count(*) from hm;

/*����1 : ��� ����� �̸��� ������ ����Ͻÿ�.*/
select name,point from hm;
/*����2 : ������ 50�� �̸��� ����� �̸��� ������ ����Ͻÿ�.*/
select name, point from hm where point>50;
/*����3 : ������ 50�� �ʰ��� ����� ��� ����ΰ���?*/
select count(*) from hm where point<50;
/*����4 : ȫ�浿�� ������ ���� �ΰ���?*/
select point from hm where name='ȫ�浿';
/*����5: �������� ��� ������ ����ϼ���.*/
select * from hm where name='������';

/*1)��� �л��� �̸��� ����Ʈ�� ����մϴ�. ����Ʈ�� ���� ����Ʈ���� 10�� �÷��� ���*/
select name, point+10 ��������Ʈ from hm;
/*2) ��� �л��� �̸��� ����Ʈ�� ���, ����� �̸� ���� ����Ʈ ��������Ʈ
    �̸��� �л��� �̸�, ���� ����Ʈ�� ����� ����Ʈ, ��������Ʈ�� +10�� �ø� ����Ʈ*/
select name,point ��������Ʈ ,point+10 ��������Ʈ from hm;

update hm set point=100,name='��Ƽó' where name='ȫ�浿';

delete hm where name='ȫ�浿';
delete hm;

select concat('�̸�','��') �̸� from dual;/*from dual�� select ���� ������ ���߱� ���� ���*/
select * from hm where point>20 order by point desc;

/*hm���̺��� �۾�*/
/*�ǽ� 1) �̸� �ڿ� ���� �ٿ��� ����Ͻÿ�. ��� ����� �̸��� ����Ʈ�� ����մϴ�.*/
select concat(name,'��') �̸�, point 
from hm;

/*�ǽ� 2) ��� ����� �̸��� ����Ʈ�� ������� ����մϴ�.
        �̶� ���Լ����� ���� ����մϴ�. ���� ���߿� ������ ����� ���� ���� ���, ���Գ��ڴ� indate*/
select name,point,indate 
from hm 
order by indate desc;

/*�ǽ� 3) ����Ʈ�� 50�̻��� ����� �̸��� ������ ����մϴ�.
        ������ no, �̸�, ����Ʈ�� ������ ���ڿ��̴�.*/
select name,concat(no,concat(name,point)) ���� 
from hm 
where point>50;

/*�ǽ�4) ��������Ʈ�� 60 �̴�. ��� ȸ���� ��������Ʈ�� ���߱� ���ؼ� ������ ����Ʈ�� ����Ͻÿ�. 
        ����� �̸�, ��������Ʈ, ������ ����Ʈ*/
select name �̸�, point ��������Ʈ , 60-point ����������Ʈ 
from hm;


