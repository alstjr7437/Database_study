--ch6. 테이블 조인하기
--equl join
--165p 
select employee.ename, employee.dno, department.dname, department.loc
from employee, department
where employee.dno = department.dno;

--168p~170p 별칭 사용 및 여러가지 조인 방법
--일반적인 조인 방법
select e.ename, e.dno, d.dname, d.loc
from employee e, department d
where e.dno = d.dno --조인 조건
and e.dno = 20;     --검색 조건

--natural join 
select e.ename, dno, d.dname, d.loc         --natural join 쓰는 dno는 별칭X
from employee e natural join department d
where dno = 20;     --검색 조건

--join ~ using
select e.ename, dno, d.dname, d.loc         --using 쓰는 dno는 별칭X
from employee e join department d
using(dno)          --조인 검색
where dno = 20;     --검색 조건

--join ~ on
select e.ename, e.dno, d.dname, d.loc
from employee e join department d
on e.dno = d.dno    --조인 조건
and e.dno = 20;     --검색 조건

--171p non-equl join
--사원의 급여와 급여등급 검색
select e.ename, e.salary, s.grade
from employee e, salgrade s
where e.salary between losal and hisal;

select e.ename, e.salary, s.grade
from employee e join salgrade s
on e.salary between losal and hisal;

--사원이름, 부서이름, 급여, 급여등급 검색
select e.ename, d.dname, e.salary, s.grade
from employee e, department d, salgrade s
where e.dno = d.dno
and e.salary between losal and hisal;

--join on은 2개만 한번에는 2개만
select e.ename, d.dname, e.salary, s.grade      
from employee e join department d 
on e.dno = d.dno
join salgrade s
on e.salary between losal and hisal;

--173p self join
--사원이름, 직속상관 이름 검색
select e.ename as 사원이름, m.ename as 직속상관이름
from employee e, employee m
where e.manager = m.eno;

select e.ename as 사원이름, m.ename as 직속상관이름
from employee e join employee m
on e.manager = m.eno;

--175p outer join  --왼쪽 오른쪽 어떤 null을 포함 시킬건지 정하는것
select e.ename as 사원이름, m.ename as 직속상관이름
from employee e left outer join employee m
on e.manager = m.eno;

--178p 혼자해보기
--1번
select e.ename, e.dno, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename = 'SCOTT';

--2번
select e.ename, d.dname, d.loc
from employee e join department d
on e.dno = d.dno;

--3번
select dno, e.job, d.loc
from employee e join department d
using(dno)
where dno = 10;

--4번
select e.ename, d.dname, loc
from employee e natural join department d
where loc = 'CHICAGO'
and commission > 0;

--5번
select e.ename, d.dname
from employee e, department d
where e.dno = d.dno
and e.ename like '%A%';

--6번
select ename, job, dno, dname
from employee e natural join department d
where loc = 'NEW YORK';

--8번
select e.ename as "employee", e.manager as "Emp#", m.eno as "Manager", m.ename as "Mgr#"
from employee e left outer join employee m
on e.manager = m.eno
order by e.eno desc;

--9번
select e.ename as 이름, e.dno as 부서번호, d.ename as 동료
from employee e join employee d
on e.dno = d.dno
where e.ename = 'SCOTT'
and not d.ename = 'SCOTT';

--10번
select d.ename, d.hiredate
from employee e join employee d
on e.hiredate < d.hiredate
where e.ename = 'WARD'
order by 2;

--11번
select e.ename, e.hiredate, d.ename, d.hiredate
from employee e join employee d
on e.hiredate < d.hiredate
and e.manager = d.eno;

select e.ename, e.hiredate, d.ename, d.hiredate
from employee e join employee d
on e.manager = d.eno
and e.hiredate <= d.hiredate;