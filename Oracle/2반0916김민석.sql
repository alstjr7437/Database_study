--where ���� �̿��� ���� �˻�

--�μ���ȣ�� 10�� ��� ���
select ename, job, dno
from employee
where dno = 10;

--�޿��� 1500 �̻��� ��� �˻�
select ename, salary
from employee
where salary >= 1500;           --�޿��� 1500�̻��� ��� �˻�

--SCOTT ��� ���� �˻�
select *
from employee
where ename = 'SCOTT';           --���ڷ� �Ҷ� ����� ������ �빮�� �ҹ��� �����ϱ�!

--�Ի����� 1981/01/01 ������ ����� �˻� --��¥ ������ ��ȸ
select *
from employee
where hiredate <= '1981/01/01';

--�μ���ȣ�� 10�̰� ������ MANAGER�� ��� �˻�
select *
from employee
where dno = 10 and job = 'MANAGER';     --and�� �Ѵ� �ش� 

--�μ���ȣ�� 10�̰ų� ������ MANAGER�� ��� �˻�
select *
from employee
where dno = 10 or job = 'MANAGER';      --or�� �����ϳ��� �ش��ص� ���

--�μ���ȣ�� 10�� �ƴ� ��� �˻�
select *
from employee
where not dno = 10;

select *
from employee
where dno <> 10;        --not�� �ᵵ �ǰ� ���� �ʴٴ� <>, !=�� ����ص� ������.

--�޿��� 1000���� 1500 ������ ��� �˻�       ���� ������ �� �������� �̿�
select *
from employee
where salary >= 1000 and salary <= 1500;

--�޿��� 1000 �̸��̰ų� 1500 �ʰ��� ��� �˻� ������ 
select *
from employee
where salary < 1000 or salary > 1500;

--Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ��� �˻�
select *
from employee
where commission = 300 or commission = 500 or commission = 1400;

--�޿��� 1000���� 1500 ������ ��� �˻�             -between�̿�
select *
from employee
where salary between 1000 and 1500;

--�޿��� 1000 �̸��̰ų� 1500 �ʰ��� ��� �˻� ������  -between�̿�
select *
from employee
where salary not between 1000 and 1500;

--1982�⿡ �Ի��� ��� �˻�      --1982�� �Ի��� ��� ���� 1��1�Ϻ��� 12��31�ϱ��� �Ի�Ȯ��
select *
from employee
where hiredate between '1982/01/01' and '1982/12/31';

--Ŀ�̼��� 300�̰ų� 500�̰ų� 1400�� ��� �˻�    -in
select *
from employee
where commission in(300, 500, 1400);

--Ŀ�̼��� 300, 500, 1400�� �ƴ� ��� �˻�    -in
select *
from employee
where commission not in(300, 500, 1400);

--like �����ڿ� ���ϵ� ī��  - %(����� ��� ����), _(�ѱ��� ��� ����)
--����̸��� F�� �����ϴ� ��� �˻�
select *
from employee
where ename like 'F%';      -- ���ϵ� ī�� �̿�� =�� ����ϸ� �ȵǰ� like������ �̿��ϱ�

--�̸��� M�� ���ԵǾ� �ִ� ��� �˻�
select *
from employee
where ename like '%M%';

--�̸��� N���� ������ ��� �˻�
select *
from employee
where ename like '%N';

--�̸��� �� ��° ��¥�� A�� ��� �˻�
select *
from employee
where ename like '_A%';

--�̸��� �ι�° ���ڰ� A�� �ƴ� ��� �˻�
select *
from employee
where ename not like '_A%';

--null�� ���� ������
--����� Ŀ�̼� �˻�
select ename, commission
from employee;

--Ŀ�̼��� null�� ��� �˻�      -- is null�� �̿��ϸ� null�ΰ� �˻�
select ename, commission
from employee
where commission is null;

--Ŀ�̼��� null�� �ƴ� ��� �˻�   --is not null �̿�
select ename, commission
from employee
where commission is not null;

--������ ���� order by ��
select *
from employee
order by ename; --�������� 

select *
from employee
order by ename desc; --�������� 

--�޿� ���� ������ �˻�
select *
from employee
order by salary desc;

--�ֱ� �Ի��� ������ �˻�     --�ֱ��̴� ���ڰ� ����ū���� ���� �������� desc
select *
from employee
order by hiredate desc;

--�޿� ���� ��, ������ �޿��Ͻ� �̸� ������ �˻�
select *
from employee
order by salary desc, ename asc;        --��� ���� �˻��� �ǰ� order�� �������� �´�