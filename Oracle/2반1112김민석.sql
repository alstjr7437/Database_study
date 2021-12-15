--ch07 서브쿼리

--SCOTT과 동일한 부서에서 근무하는 사원 검색
select ename, dno
from employee
where dno = ( select dno
              from employee
              where ename = 'SCOTT');
              
--최소 급여를 받는 사원의 이름, 담당업무, 급여 검색
select ename, job, salary
from employee
where salary = ( select min(salary)
                 from employee);
                 
--30번 부서에서 최소 급여를 구한 후,
--부서별 최소급여가 구한 최소급여보다 큰 부서만 검색
select dno, min(salary)
from employee
group by dno
having min(salary) > ( select min(salary)
                      from employee
                      where dno = 30 ); 
                       
--다중 행 서브 쿼리
--부서별 최소 급여를 받는 사원의 이름 검색
select ename, salary, dno   
from employee
where salary in ( select min(salary)
                 from employee
                 group by dno );
                 
--직급이 SALESMAN이 아니면서 급여가 SALESMAN보다 높은 사원 검색
select ename, job, salary
from employee 
where salary < any ( select salary
                     from employee
                     where job = 'SALESMAN')
and job <> 'SALESMAN';     
                    
--직급이 SALESMAN이 아니면서 급여가 모든 SALESMAN보다 높은 사원 검색
select ename, job, salary
from employee
where salary < all (select salary
                    from employee
                    where job = 'SALESMAN')
and job <> 'SALESMAN';

--혼자해보기(195p)
--1번
select ename, job
from employee
where job = (select job
             from employee
             where eno = 7788);

--2번
select ename, job 
from employee
where salary > (select salary
                from employee
                where eno = 7499);

--3번
select ename, job, salary
from employee
where salary = (select min(salary)
                from employee);

--4번 
select job, round(avg(salary), 1)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                     from employee
                     group by job);
                     
--5번
select ename, salary, dno
from employee
where salary in (select min(salary)
                from employee
                group by dno);

--6번
select eno, ename, job, salary
from employee
where salary < any (select salary 
                    from employee
                    where job = 'ANALYST');

--9번
select ename, hiredate
from employee
where dno = (select dno
             from employee
             where ename = 'BLAKE')
and ename <> 'BLAKE';

--10번
select eno, ename
from employee
where salary > (select avg(salary)
                from employee)
order by salary;

--11번
select eno, ename
from employee
where dno in (select dno
             from employee
             where ename like '%K%');

--12번
select ename, dno, job
from employee
where dno = (select dno
             from department
             where loc = 'DALLAS');

--13번
select ename, salary
from employee
where manager = (select eno
                 from employee
                 where ename = 'KING');

--14번
select dno, ename, job
from employee
where dno = (select dno
             from department
             where dname = 'RESEARCH');

--15번
select eno, ename, salary
from employee
where salary > (select avg(salary)
                from employee)
and ename in (select ename
              from employee
              where ename like '%M%');

--16번
select job, avg(salary)
from employee
group by job
having avg(salary) = (select min(avg(salary))
                      from employee
                      group by job );