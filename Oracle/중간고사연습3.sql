select max(salary) as 최고, min(salary) as 최저, sum(salary) as 합계, round(avg(salary)) as 평균
from employee;

select job, max(salary) as 최고, min(salary) as 최저, sum(salary) as 합계, round(avg(salary)) as 평균
from employee
group by job;

select job, count(*)
from employee
group by job;

select count(manager)
from employee;

select max(salary)-min(salary) as DIFFERNCE
from employee;

select job, min(salary)
from employee
group by job
having min(salary) >= 2000
order by 2 desc;

select dno, count(*) as "Number of People", round(avg(salary), 2)
from employee
group by dno
order by dno;

select decode(dno, 10, 'ACC',
                   20, 'RES',
                   30, 'SAL',
                   40, 'OPA' )as dname, 
       decode(dno, 10, 'NEW',
                   20, 'DAL',
                   30, 'CHI',
                   40, 'BOS') as Location,
       count(*) as "Number of People", 
       round(avg(salary)) as "Salary"
from employee
group by dno;

select job, dno,
            nvl(decode(dno, 10, sum(salary)), 0) as "부서 10",
            nvl(decode(dno, 20, sum(salary)), 0) as "부서 20",
            nvl(decode(dno, 30, sum(salary)), 0) as "부서 30",
            max(salary)
from employee
group by job, dno
order by dno ;