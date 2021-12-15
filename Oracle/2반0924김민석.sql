--4�� �پ��� �Լ�
--�Ϲ� �Լ�
--null �� ó�� : nvl / nvl2(���� ��ü�� �ü�����)
--����� ���� ����ϱ�
select ename, salary, commission, salary*12+nvl(commission, 0) as ����
from employee
order by ���� desc;

select ename, salary, commission, nvl2(commission, salary*12+commission, salary*12) as ����
from employee
order by 4 desc;

--�����Ǻ��ϴ� switch case �� : decode - �Լ�(��ȣ)�� �̿��� decode
--�μ� �̸� ����ϱ�
select ename, dno, decode(dno, 10, 'ACCOUNTING',
                               20, 'RESARCH',
                               30, 'SALES',
                               40, 'OPERATIONS',
                               'DEFAULT') as �μ���
from employee
order by dno;

--���� �Ǻ��ϴ� if else�� : case�� - ���� �����ڸ� �̿��ؼ� �پ��� ���ǽ�(�پ��� ���ǽ��� decode�� �ٸ� Ư¡)�� �ϼ�
--�μ� �̸� ����ϱ�
select ename, dno, case when dno = 10 then 'ACCOUNTING'
                        when dno = 20 then 'RESARCH'
                        when dno = 30 then 'SALES'
                        when dno = 40 then 'OPERATIONS'
                        else 'DEFAULT'
                    end as �μ���
from employee
order by dno;

--ȥ���غ���
--1�� substr �Լ��� ����Ͽ� ������� �Ի��� �⵵�� �Ի��� �޸� ���
select hiredate, substr(hiredate, 1, 2) as �⵵, substr(hiredate, 4, 2) as ��
from employee;

--2�� substr �Լ��� ����Ͽ� 4���� �Ի��� ����� ���
select *
from employee
where substr(hiredate, 4, 2) = '04';

--3�� mod �Լ��� ����Ͽ� �����ȣ�� ¦���� ����� �˻�
select *
from employee
where mod(eno, 2) = 0;

--4�� �Ի����� ������ 2�ڸ�(YY), ����(MON)�� ǥ���ϰ� ������ ���(DY)�� ���
select hiredate, to_char(hiredate, 'yy/mon/dd dy')
from employee;

--5�� ���� ��ĥ�� �������� ���, ���� ��ĥ�� ���Ҵ��� ���
--���� ��¥���� ���� 1��1���� �� ����� ���, to_date �Լ��� ����Ͽ� ������ ���� ��ġ
select trunc(sysdate - to_date('21/01/01')) as ������¥,
       trunc(to_date('21/12/31') - sysdate) as ������¥
from dual;

select trunc(sysdate - to_date('2021-01-01', 'yyyy-mm-dd')) as ������,
       trunc(to_date('2021-12-31', 'yyyy-mm-dd') - sysdate) as ������
from dual;

--6�� ������� ���ӻ�� ����� ���, ���ӻ���� ���� ����� NULL��ſ� 0���� ���
select eno, ename, nvl2(manager, manager, 0)
from employee;

--7�� decode �Լ��� ���޿� ���� �޿��� �λ� --> case�����ε� �ۼ��غ���
--'ANALYST' : 200, 'SALESMAN' : 180, 'MANAGER' : 150, 'CLERK' : 100
select eno, ename, job, salary, decode(job, 'ANALYST', salary + 200,
                                            'SALESMAN', salary + 180,
                                            'MANAGER', salary + 150,
                                            'CLERK', salary + 100) as �λ�
from employee;

--case������ �ۼ�
select eno, ename, job, salary, case when job = 'ANALYST' then salary + 200
                                     when job = 'SALESMAN' then salary + 180
                                     when job = 'MANAGER' then salary + 150
                                     when job = 'CLERK' then salary + 100 end as �λ�
from employee;
