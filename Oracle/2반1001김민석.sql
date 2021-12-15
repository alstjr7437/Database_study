--4�� ȥ���غ���
--6�� ������� ���ӻ�� ����� ���, ���ӻ���� ���� ����� NULL��ſ� 0���� ���
select eno, ename, nvl(manager, 0) as "nvl �Լ�", nvl2(manager, manager, 0) as "nvl2 �Լ�"
from employee;

--7�� decode �Լ��� ���޿� ���� �޿��� �λ� --> case�����ε� �ۼ��غ���
--'ANALYST' : 200, 'SALESMAN' : 180, 'MANAGER' : 150, 'CLERK' : 100
select eno, ename, job, salary, decode(job, 'ANALYST', salary + 200,
                                            'SALESMAN', salary + 180,
                                            'MANAGER', salary + 150,
                                            'CLERK', salary + 100,
                                            salary ) as update_salary
from employee
order by salary desc;

--case������ �ۼ�
select eno, ename, job, salary,
    case when job = 'ANALYST' then salary + 200
         when job = 'SALESMAN' then salary + 180
         when job = 'MANAGER' then salary + 150
         when job = 'CLERK' then salary + 100
         else salary end as update_salary
from employee
order by salary desc;

--5�� �׷��Լ�
--������� �޿� �Ѿ�, ��վ�, �ְ��, �ּҾ�
select sum(salary), round(avg(salary), 1) , max(salary), min(salary)
from employee;

--���� �ֱٿ� �Ի��� ����� ���� �������� �Ի��� ����� �Ի��� �˻�
select max(hiredate), min(hiredate)
from employee;

--Ŀ�̼��� �Ѿ��� �˻� �ٸ� �����ڿʹ� �޸� �÷� ���� null�� ���� ������.
select sum(commission)
from employee;

--��ü ��� �� ���ϱ�
select count(*)
from employee;

--Ŀ�̼��� �� �� �ִ� ��� �� ���ϱ�
select count(commission)
from employee;

--���� ������ ���� ���ϱ�
select count(distinct job)
from employee;

--�޿��� �ְ�� �˻�
select max(salary)   -- ename ������ �¾ƾ���!
from employee;

--group by : Ư�� �÷��� �������� �׷캰�� ���� �� ���
--�μ��� ��� �޿� ���ϱ�
select dno, round(avg(salary), 1)
from employee
group by dno
order by 2 desc;

--�μ���, ���޺�, �ο���, �޿� �Ѿ� ���ϱ�
select dno, job, count(*), sum(salary)
from employee
group by dno, job
order by dno asc, 3 desc;

--Having : �׷� ��� ����
--�μ��� �޿��� �ְ��, �ְ���� 3000�̻� ���
select dno, max(salary)
from employee
having max(salary) >= 3000
group by dno
order by 2 desc;

select dno, salary
from employee
order by dno;

--���޺� �޿��� �Ѿ�, �޿� �Ѿ��� 5000�̻�, manager ����
select job, sum(salary)
from employee
where job <> 'MANAGER'      --manager ����
group by job
having sum(salary) >= 5000  --�޿� �Ѿ� 5000 �̻�
order by 2 desc;

--�μ��� ��ձ޿��� �ְ�� ���ϱ�, �׷��Լ��� 2�� ���� ��ø�� ���� 
select round(max(avg(salary)), 1)
from employee
group by dno;