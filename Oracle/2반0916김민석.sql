--where 절을 이용한 조건 검색

--부서번호가 10인 사람 출력
select ename, job, dno
from employee
where dno = 10;

--급여가 1500 이상인 사원 검색
select ename, salary
from employee
where salary >= 1500;           --급여가 1500이상인 사원 검색

--SCOTT 사원 정보 검색
select *
from employee
where ename = 'SCOTT';           --문자로 할때 저장된 정보는 대문자 소문자 조심하기!

--입사일이 1981/01/01 이전인 사원만 검색 --날짜 데이터 조회
select *
from employee
where hiredate <= '1981/01/01';

--부서번호가 10이고 직급이 MANAGER인 사원 검색
select *
from employee
where dno = 10 and job = 'MANAGER';     --and는 둘다 해당 

--부서번호가 10이거나 직급이 MANAGER인 사원 검색
select *
from employee
where dno = 10 or job = 'MANAGER';      --or은 둘중하나만 해당해도 출력

--부서번호가 10이 아닌 사원 검색
select *
from employee
where not dno = 10;

select *
from employee
where dno <> 10;        --not을 써도 되고 같지 않다는 <>, !=을 사용해도 가능함.

--급여가 1000에서 1500 사이인 사원 검색       관계 연산자 및 논리연산자 이용
select *
from employee
where salary >= 1000 and salary <= 1500;

--급여가 1000 미만이거나 1500 초과인 사원 검색 연산자 
select *
from employee
where salary < 1000 or salary > 1500;

--커미션이 300이거나 500이거나 1400인 사원 검색
select *
from employee
where commission = 300 or commission = 500 or commission = 1400;

--급여가 1000에서 1500 사이인 사원 검색             -between이용
select *
from employee
where salary between 1000 and 1500;

--급여가 1000 미만이거나 1500 초과인 사원 검색 연산자  -between이용
select *
from employee
where salary not between 1000 and 1500;

--1982년에 입사한 사원 검색      --1982년 입사한 사원 볼때 1월1일부터 12월31일까지 입사확인
select *
from employee
where hiredate between '1982/01/01' and '1982/12/31';

--커미션이 300이거나 500이거나 1400인 사원 검색    -in
select *
from employee
where commission in(300, 500, 1400);

--커미션이 300, 500, 1400이 아닌 사원 검색    -in
select *
from employee
where commission not in(300, 500, 1400);

--like 연산자와 와일드 카드  - %(몇글자 상관 없음), _(한글자 상관 없음)
--사원이름이 F로 시작하는 사원 검색
select *
from employee
where ename like 'F%';      -- 와일드 카드 이용시 =를 사용하면 안되고 like연산자 이용하기

--이름에 M이 포함되어 있는 사원 검색
select *
from employee
where ename like '%M%';

--이름이 N으로 끝나는 사원 검색
select *
from employee
where ename like '%N';

--이름의 두 번째 글짜가 A인 사원 검색
select *
from employee
where ename like '_A%';

--이름의 두번째 글자가 A가 아닌 사원 검색
select *
from employee
where ename not like '_A%';

--null을 위한 연산자
--사원의 커미션 검색
select ename, commission
from employee;

--커미션이 null인 사원 검색      -- is null을 이용하면 null인것 검색
select ename, commission
from employee
where commission is null;

--커미션이 null이 아닌 사원 검색   --is not null 이용
select ename, commission
from employee
where commission is not null;

--정렬을 위한 order by 절
select *
from employee
order by ename; --오름차순 

select *
from employee
order by ename desc; --내림차순 

--급여 높은 순으로 검색
select *
from employee
order by salary desc;

--최근 입사일 순으로 검색     --최근이니 숫자가 가장큰것이 위라서 내림차순 desc
select *
from employee
order by hiredate desc;

--급여 높은 순, 동일한 급여일시 이름 순으로 검색
select *
from employee
order by salary desc, ename asc;        --모든 조건 검색이 되고 order이 마지막에 온다