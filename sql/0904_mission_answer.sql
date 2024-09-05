/*3. �ڵ��� ��ȣ�� 7788�� �������� �̸��� �ּҸ� ����Ͻÿ�*/
�ڵ��� ��ȣ�� 7788�� ������ where
�������� �̸��� �ּҴ� users ������ �ڵ��� ��ȣ�� carinfo
--1) ������ �ؼ� �������� 7788�� �ڵ����� �������� ������ ���>����
select u.name, u.addr
from users u, carinfo i
where u.id=i.id and i.c_num='7788';
--2) 7788 �������� ȸ�����̵� �˻��� �� ������� �� ������ ����>��������
select id
from carinfo
where c_num='7788';

select name,addr
from users
where id= (select id
            from carinfo
            where c_num='7788');



/*4. �ڵ����� �������� ���� ����� �̸��� �ּҸ� ����Ͻÿ�.*/
--�̸��� �ּҴ� users//�ڵ����� �������� ���� ����̶�� ����
--      carinfo ���̺��� ������ ����.. �̳�����, �ƿ�������...

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


--left outer join�� �ٸ� ǥ���--
select u.name,u.addr
from users u, carinfo c
where u.id=c.id(+) and c_name is null;  

--right outer join�� �ٸ� ǥ���--
select u.name,u.addr
from users u, carinfo c
where u.id(+)=c.id and c_name is null; 


/*5. ȸ������ ����� �ڵ��� ���� ����Ͻÿ�.*/
--ȸ���� ����, users�����δ� ȸ���� �ڵ����� �� �� ������
--users�� carinfo ���̺��� ����...�ʿ��� ������ �̳�����
--�̳������� �� �Ŀ� ȸ������ �׷��� ����� ī���� ���踦 ����
select u.*,c.*
from users u, carinfo c
where u.id=c.id;

select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by u.id;  --���������� ���� ������ u.id�� �׷�ȭ����>>����
                --select u.name�� ������
                
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id,u.name);     --group by�� ���ռӼ����� ����


/*6. 2�� �̻��� ������ ȸ���� �̸��� ������ �ڵ��� ���� ����Ͻÿ�.*/
--5���� ���, ������ 2�� �̻��̶�� ������ �߰�>>having�� ����
select u.name, count(*)
from users u, carinfo c
where u.id=c.id
group by (u.id,u.name)
having count(*)>=2;


/*7. �ڵ����� ��ϵǾ� �ִµ� �����ڰ� ���� �ڵ��� ��ȣ�� ����Ͻÿ�.*/
--���� ���� ���̺�� ���߿� ���� ���̺��� ������ ���..
--�������� ���̺��� carinfo, �ι�°�� ���� ���̺� users
--�ڵ����� ��ϵǾ� �ִµ� �����ڰ� ������..�̳�����
--�̳����ο� �������� ���ϴ� Ʃ���� ���Ѵ�...�ƿ�������
--�ƿ��������� ���� � ���̺��� left�� �� ���ΰ�?? ù��° left ����

select c.c_num
from carinfo c
left outer join users u
on c.id=u.id
where u.id is null;

select c.c_num
from carinfo c, users u
where c.id=u.id(+) and u.id is null;


/*8. ���� �ڵ����� ����ȣ, ������, �ڵ�����, ������ ����Ͻÿ�.*/
--carinfo ���� �ڵ����� ������ ����..����ȣ�� carinfo�� �ذᰡ��������
--������� �ڵ������ ������ companycar���̺� �����Ƿ� �̳����� �ʿ�
select c.c_num,cc.c_com,cc.c_name,cc.c_price
from carinfo c, companycar cc
where c.c_num=cc.c_num;


/*9. ȸ�翡�� ���Ŵ� �Ͽ����� �������� ���� �ڵ����� ����ȣ, ������, �ڵ��� �̸��� ���  */
--���̺��� ���� ����
--companycar ���̺� ������ �ڵ��� ������ Ȯ��, �� �ڵ����� �����Ǿ�������
--Ȯ���ϱ� ���ؼ� carinfo ���̺��� Ȯ��.. ������ �ڵ����� �̳����� �ʿ�
--������ �ȵ� �ڵ����� �ƿ��� ���� �ʿ�.. �̶� companycar�� left table
select c.c_num,c.c_com,c.c_name
from companycar c
left outer join carinfo cc
on c.c_num=cc.c_num
where cc.c_num is null;

/*10. �ڵ��� ������ 1000���� �̻��� �ڵ����� �ڵ��� ��ȣ�� ����Ͻÿ�.*/
--�ڵ��� ������ 1000���� �̻��̶�� ������ companycar���� �ذᰡ��
--���ϴ� �ڵ��� ��ȣ�� companycar���� �ذᰡ�� ..��, ���� �ʿ����
select c_name
from companycar
where c_price>=1000;


/*11. ������ �ڵ��� �߿� ȸ�翡�� ������ �ڵ����� �ƴ� �ڵ��� ��ȣ�� ����Ͻÿ�.*/
--���� ���̺��� carinfo ,comanycar
--outer join >>carinfo ���̺��� left
select c.c_num
from carinfo c
left outer join companycar c1
on c.c_num=c1.c_num
where c1.c_com is null;


/*12. ��� ����� ������ ����Ͻÿ�. �̸�, �������� �ڵ�����ȣ, �ڵ����̸�*/
--���� ���̺��� users, carinfo, companycar
--�����ؼ� ����� ���� ���̺���
--users.name    carinfo.c_num   companycar.c_name
--��, ���̺� 3���� ����.. �̶��� ������ ���ϰ� ������� 2���� �����ϰ�
--�� ����� �����̺�� ���� ���̺��� ����
select u.name, NVL(c.c_num,'����'), NVL(cc.c_name,'����')
from users u
left outer join carinfo c
on u.id=c.id
left outer join companycar cc
on c.c_num=cc.c_num;

--**����**
--���̺��� ������ �ߺ��� �ּ�ȭ�ϱ� ���� ����ȭ �Ǿ�� �ϰ�,
--����ȭ�� ���̺��� �и��ϴ� �ǹ̰� �ִ�.
--�׷��� ���񽺸� �̿��ϴ� �����忡���� 2�� �̻��� ���̺��� 
--���εǾ�� �ϴ� ��찡 �ִ�.
--�׷��� ����ȭ�� �������� �����̰�, ������ ���񽺸� �����ϴ� ������ ����̴�.
--�׷��� 2�� �̻��� ���̺��� ���εǾ�� �ϴ� ���񽺴� 
--���񽺰� �̿�ɶ����� DB�� ���ο����� ����ؾ� �ϰ� ������ �����ϴ�.
--�ذ�å�� �������� ���̺��� �����ϵ�, ���ΰ���� ��ģ ������ ���̺��� ����� ���̴�.
--������ ���̺��� �������� ���̺��� ����Ʈ�� ��������ִ�.
--�̷� ������ ���̺��� ���� �Ѵ�.

--12���� ���񽺸� �����ϱ� ���� view�� ����
create view all_users as 
(select u.name name, NVL(c.c_num,'����') carnum, NVL(cc.c_name,'����') carname
from users u
left outer join carinfo c
on u.id=c.id
left outer join companycar cc
on c.c_num=cc.c_num);

select * from all_users;--view �̸����� ��ȸ����





