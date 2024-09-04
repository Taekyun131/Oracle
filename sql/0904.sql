create table stu(
no number,
name varchar2(5 char),
tel varchar2(13));

create table pp(
no number,
e_name varchar2(4),
e_point number(3));

insert into stu values(1,'hong','1111');
insert into stu values(2,'kim','2222');
insert into stu values(3,'lee','3333');
insert into pp values(1,'java',70);
insert into pp values(1,'html',90);
insert into pp values(3,'java',80);
commit;
select * from stu;
select * from pp;

/*join: 1�� �̻��� ���̺��� �������� ��ġ�� ��*/
/*����: -full join: �ΰ��� ���̺��� ��� ��ġ�� ��
        ����� n*m���� ����ŭ ������ �Ǿ� Ʃ���� ���������.
        -inner join: ������ �����ϳ�. ���ǿ� ���� ��츸 �����Ѵ�.
                    ����: �����̳�����(==), �񵿵��̳�����(!=)
        -outer join: inner join + join�� �������� ���� Ʃ�ñ��� ���
                    ����: ���̺� ������ ��ġ�� ����
                        left outer join, right outer join
                        
    ������ ������ � ���̺��� �����ұ�? � ������ ����ұ�?*/

/*���� full join �غ���..���� ���������� ����������. �ӵ�������*/
select s.no,s.name,s.tel,p.no,p.e_name,p.e_point
from stu s,pp p;

/*�����̳�����*/
select s.no,s.name,p.no,p.e_name,p.e_point
from stu s,pp p
where s.no=p.no;
--�����̳������� ������ ���� ǥ����� �ִ�.
select s.no,s.name,p.no,p.e_name,p.e_point
from stu s          --left table
inner join pp p     --right table
on s.no=p.no;

/*�񵿵��̳�����*/
select s.no,s.name,p.no,p.e_name,p.e_point
from stu s,pp p
where s.no!=p.no;

/*�ƿ�������*/
select s.no,s.name,p.no,p.e_name,p.e_point
from stu s          
left outer join pp p    --left outer join /right table=pp
on s.no=p.no;

select s.no,s.name,p.no,p.e_name,p.e_point
from stu s          
right outer join pp p    --right outer join/ left table = stu
on s.no=p.no;



--������ �� �л����� �̸��� ����� ������ ����Ͻÿ�
--2���� ���̺��� ���ľ���//����..���� �÷��� ��ħ..�̳�����

select s.name,p.e_name,p.e_point
from stu s,pp p
where s.no=p.no;

--ȫ�浿�� �̸��� ����� ������ ����Ͻÿ�..�̳����� �ʿ�
select s.name,p.e_name,p.e_point
from stu s, pp p
where s.no=p.no and s.name='hong';

--������ ġ���� ���� �л����� �̸��� ����Ͻÿ�
--�̳����ο� �������� ���� Ʃ���� �����̹Ƿ� �ƿ��� ����
--1. left outer join �ذ�
select s.name
from stu s
left outer join pp p
on s.no=p.no
where p.no is null;


                            



    
        