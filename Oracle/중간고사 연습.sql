select ename, salary, salary+300
from employee;

select ename, salary, salary*12+100
from employee
order by 3 desc;

select ename, salary
from employee
where 2000 < salary
order by salary desc;

select ename, dno
from employee
where eno = 7788;

select ename, salary
from employee
where salary not between 2000 and 3000;

select ename, job, hiredate
from employee
where hiredate between '1981/02/20' and '1981/05/01';

select ename, dno
from employee
where dno in(20, 30)
order by ename desc;

select ename, salary, dno
from employee
where salary between 2000 and 3000 and dno in (20, 30)
order by ename;

select ename, hiredate
from employee
where hiredate like '81%';

select ename, job
from employee
where manager is null;

select ename, salary, commission
from employee
where commission is not null
order by salary, commission;

select ename
from employee
where ename like '__R%';

select ename
from employee
where ename like '%A%' and ename like '%E%';

select ename, job, salary
from employee
where job in('CLERK', 'SALESMAN')
      and salary not in (1600, 950, 1300);
    
select ename, salary, commission
from employee
where commission >= 500;