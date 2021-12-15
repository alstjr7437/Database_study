select substr(hiredate, 1, 2) as ³âµµ, substr(hiredate, 4, 2) as ´Þ
from employee;

select *
from employee
where substr(hiredate, 4, 2) = '04';

select *
from employee
where mod(eno, 2)='0';

select hiredate, TO_CHAR(hiredate, 'YY/MON/DD DY')
from employee;

select TRUNC(sysdate-TO_DATE('2021/01/01', 'yyyy/mm/dd'))
from dual;

select eno, ename, nvl(manager, 0) as MANAGER
from employee;

select eno, ename, job, salary, decode(job, 'ANALYST', salary + 200,
                                            'SALESMAN', salary + 180,
                                            'MANAGER', salary + 150,
                                            'CLERK', salary + 100,
                                            salary) as UPDATE_SALARY
from employee;

select eno, ename, job, salary, case when job = 'ANALYST' then salary + 200
                                     when job = 'SALESMAN' then salary + 180
                                     when job = 'MANAGER' then salary + 150
                                     when job = 'CLERK' then salary + 100
                                            end as UPDATE_SALARY
from employee;
