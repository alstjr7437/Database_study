--4장 혼자해보기
--6번 사원들의 직속상관 사번을 출력, 직속상관이 없는 사원은 NULL대신에 0으로 출력
select eno, ename, nvl(manager, 0) as "nvl 함수", nvl2(manager, manager, 0) as "nvl2 함수"
from employee;

--7번 decode 함수로 직급에 따라 급여를 인상 --> case문으로도 작성해보기
--'ANALYST' : 200, 'SALESMAN' : 180, 'MANAGER' : 150, 'CLERK' : 100
select eno, ename, job, salary, decode(job, 'ANALYST', salary + 200,
                                            'SALESMAN', salary + 180,
                                            'MANAGER', salary + 150,
                                            'CLERK', salary + 100,
                                            salary ) as update_salary
from employee
order by salary desc;

--case문으로 작성
select eno, ename, job, salary,
    case when job = 'ANALYST' then salary + 200
         when job = 'SALESMAN' then salary + 180
         when job = 'MANAGER' then salary + 150
         when job = 'CLERK' then salary + 100
         else salary end as update_salary
from employee
order by salary desc;

--5장 그룹함수
--사원들의 급여 총액, 평균액, 최고액, 최소액
select sum(salary), round(avg(salary), 1) , max(salary), min(salary)
from employee;

--가장 최근에 입사한 사원과 가장 오래전에 입사한 사원의 입사일 검색
select max(hiredate), min(hiredate)
from employee;

--커미션의 총액을 검색 다른 연산자와는 달리 컬럼 값이 null인 것은 제외함.
select sum(commission)
from employee;

--전체 사원 수 구하기
select count(*)
from employee;

--커미션을 알 수 있는 사원 수 구하기
select count(commission)
from employee;

--직급 종류의 개수 구하기
select count(distinct job)
from employee;

--급여의 최고액 검색
select max(salary)   -- ename 갯수가 맞아야함!
from employee;

--group by : 특정 컬럼을 기준으로 그룹별로 나눌 때 사용
--부서별 평균 급여 구하기
select dno, round(avg(salary), 1)
from employee
group by dno
order by 2 desc;

--부서별, 직급별, 인원수, 급여 총액 구하기
select dno, job, count(*), sum(salary)
from employee
group by dno, job
order by dno asc, 3 desc;

--Having : 그룹 결과 제한
--부서별 급여의 최고액, 최고액이 3000이상 출력
select dno, max(salary)
from employee
having max(salary) >= 3000
group by dno
order by 2 desc;

select dno, salary
from employee
order by dno;

--직급별 급여의 총액, 급여 총액이 5000이상, manager 제외
select job, sum(salary)
from employee
where job <> 'MANAGER'      --manager 제외
group by job
having sum(salary) >= 5000  --급여 총액 5000 이상
order by 2 desc;

--부서별 평균급여의 최고액 구하기, 그룹함수는 2번 까지 중첩이 가능 
select round(max(avg(salary)), 1)
from employee
group by dno;