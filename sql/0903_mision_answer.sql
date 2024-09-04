select * from muser;

/*����Ǫ�� ����
1. select ���� ����
2. select ���� ����
3. select �� �ϼ�
4. ������ �ϼ� ���� �κ� ��� ä���� ����(�Լ�, ��������, group by, order by...)*/


/*1) grade�� 3�� ����� ��� ����ΰ���?*/
select count(*)         --���ϴ� ���� �ο���..�÷����� �ذ�Ұ�..�Լ����
from muser
where grade=3;          --grade�� 3�� ����� Ʃ���� ���������̶� �� �� ���� 


--2) grade�� 1,2,4�� ������� salary�� ����� ���Ͻÿ�.
select avg(salary)         --�÷����� �Լ��� ����ؾ��Ѵ�.
from muser
where grade in (1,2,4);      --in �����ڴ� or�� �ǹ̰� �ִ�.
--where grade=1 or grade=2 or grade=4
--group by                --�׷��� ����: �׷캰 ������ ���
--order by


--3) salary�� 20000 �̸��� ����� �� ����Դϱ�?
select count(*)
from muser
where salary<20000;
--group by
--order by


--5) 77����߿�
--salary�� ���� ���� ����� �̸��� ���̿� salary�� ����Ͻÿ�.
select  --�̸��� ���̿� salary
from muser
where   --77����߿�
--group by
--order by
/*77��� ���� �׽�Ʈ ����*/
select substr(reg_num,1,2) from muser; --�߰��ܰ�
--�������� ����
select 
from muser
where substr(reg_num,1,2)=77 ;
/*77��� ���� �׽�Ʈ ��*/

/*77��� �߿��� ���� ���� salary �̾Ƴ�����.*/
select min(salary)
from muser
where substr(reg_num,1,2)=77;

--���� ���� salary�� �˸� ���� ���� salary�� ��������
--���� ���� salary�� �޴� ����� Ʃ���� ������ �� �ִ�.
select * 
from muser
where substr(reg_num,1,2)=77 and salary=10000;

--10000�� ����� �����ϸ� �ȵȴ�. ���������� ����
select name �̸�, reg_num ���� ,salary �޿�
from muser
where substr(reg_num,1,2)=77 and salary=(
    select min(salary)
    from muser
    where substr(reg_num,1,2)=77);

--���̸� ����Ѵ�.. �׷��� �� ������ �ֹι�ȣ�� ���
--�÷����� �ذᰡ���Ѱ�?����?�Լ�? ��������> ���İ� �Լ��� �ʿ�
select 1900+substr(reg_num,1,2) from muser;
select * from muser;
--�м�: ����� 1900�� �����ϸ� 2000�� ���� ����ڴ� ���������Ͱ� ��
--���ǿ� ���� 1900 �Ǵ� 2000�� �÷��� ����� �Ѵ�.
--�˻���: ����Ŭ ���� > decode
select substr(reg_num,8,1) from muser;
select substr(reg_num,8,1) a,
        decode(substr(reg_num,8,1),'1',1900,'2',1900,2000) b
from muser;
select substr(reg_num,8,1) a,
        decode(substr(reg_num,8,1),'1',1900,'2',1900,2000) b,
        decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)+substr(reg_num,1,2) c
from muser;

--���������� �����غ��ϴ�.
select name �̸�,
        (extract(year from sysdate))-(decode(substr(reg_num,8,1),'1',1900,'2',1900,2000)
        +substr(reg_num,1,2)) ����,
        salary �޿�
from muser
where substr(reg_num,1,2)=77 and salary=(
    select min(salary)
    from muser
    where substr(reg_num,1,2)=77);
        
--������ �� �ִ� ����
select name, min(salary)
from muser
where substr(reg_num,1,2)=77;  --���������� ������� ������


--7) ������ ��� �޿��� ���Ͻÿ�.
select avg(salary) --��ձ޿�
from muser
where substr(reg_num,8,1) in ('1','3')          --����? �÷����� �ȵȴ�. �����̳� �Լ��� ��������..�Լ��� ���� �ʿ�
--group by
--order by


--8) ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸��� �޿��� ����Ͻÿ�
select name, salary
from muser
where --��ձ޿����� ���� �޿� �޴� ����� Ʃ�� ����
        --�÷���ü�� �ذ�?����?�Լ�?��������?
        --��ձ޿��� ��������� ������ �ϼ� ->��������
select name,salary
from muser
where salary>
    (select avg(salary)
    from muser);


--9) ��ü ��ձ޿����� ���� �޿��� �޴� ����� �̸��� �޿�, ��ձ޿��� ���
select name,salary,
    (select avg(salary) --��Į�� ��������, ���å..����
    from muser) ��ձ޿�  --����?�Լ�?��������
from muser
where salary>
    (select avg(salary)
    from muser);
    --������ ������..�ֳ��ϸ� ������ select���� 
    --Ʃ���� �ϳ��� �ϼ��ذ� ������ ���������� �����Ѵ�.
    --������ ���������� ��� �����ϱ� �����̴�.


--12) �׷캰 ��ձ޿��� ��ü ��պ��� ���� �׷��� ����Ͻÿ�.

--�׷캰 ����� ���Ѵ�...�� �׷��߿� ��ü ��պ��� ���� �׷� ����
select grade, avg(salary)
from muser
--where
group by grade having avg(salary)>(
                                    select avg(salary)
                                    from muser);                               
--order by
  

--14) �������� ������ ����Ͻÿ�. (��� ���� �̸�, ����(������ ���Ǵ� ���� ����Ѵ�)
select name,
        decode(substr(reg_num,8,1),'1','��','3','��','��') ����
from muser;
--where
--group by
--order by

/*����Ŭ�� ���ǿ� ���� ó���ϴ� ������ case when then else end*/
--case when then else end�� ������ �м�
--case
--      when ����1 then ����1�� ���� ��� ����
--      when ����2 then ����2�� ���� ��� ����
--      else ����1�� ����2 ����͵� ������ ���� ��� ����
--end
select name �̸�,
        case
            when substr(reg_num,8,1) in ('1','3') then '��'
            else '��'
        end ����
from muser;

select distinct grade, salary from muser;
--distinct�� �ߺ��� �÷��� �����ϰ� select������ �ѹ��� ����� ����
--�ߺ����� ������ select ���� ������ ��ü ���� �ߺ��̴�.
--#3�� �������� ���ɺ�(time �÷�) �޿��� ��.over �Լ� �̿�
select  distinct 
        time ����, 
        sum(salary) over(partition by time) ����
from muser;

--#2������
    
select 
    ( select trunc(sum(months_between(sysdate,substr(reg_num,1,6))))
    from muser where time in (30,31) ) as �������,
    (select trunc(sum(months_between(sysdate,substr(reg_num,1,6))))
    from muser where time>=32) as ����
from dual;





