--ch09. 데이터 조작과 트랜잭션
--테이블에 내용을 추가하는 insert문
drop table emp2;

create table emp2
as
select eno, ename, job, hiredate, dno
from employee
where 0 = 1;

create table dept3
as
select *
from department
where 0 = 1;

insert into dept2
values(10, 'ACCOUNTING', 'NEWYORK');

insert into dept2(dno, loc, dname)
values(20, 'DALLAS', 'RESEARCH');

insert into dept2(dno, dname)
values(30, 'SALES');

insert into dept2
values(40, 'OPERATIONS', NULL);

--날짜 데이터 입력하기
insert into emp2
values(7000, 'CANDY', 'MANAGER', '2021/11/25', 10);

insert into emp2
values(7010, 'TOM', 'MANAGER', to_date('11-25-21', 'MM-DD-YY'), 10);

insert into emp2
values(7020, 'JERRY', 'SALESMAN', SYSDATE, 30);

--다른 테이블에서 데이터 복사하기
insert into dept3
select *
from department;

--테이블의 내용을 수정하는 update문
update dept2
set dname = 'PROGRAMMING'
where dno = 10;

update dept2
set dname = 'SALES',
    loc = 'SEOUL'
where dno = 10;

--30부서의 지역명을 10부서의 지역명으로 변경
update dept2
set loc = ( select loc
            from dept2
            where dno = 10)
where dno = 30;

--10부서의 부서명과 지역명을 20부서의 부서명과 지역명으로 변경
update dept2
set dname = ( select dname
              from dept2
              where dno = 20),
    loc = ( select loc
            from dept2
            where dno = 20)
where dno = 10;

update dept2
set (dname, loc) = ( select dname, loc
                     from dept2
                     where dno = 20)
where dno = 10;

--테이블의 내용을 삭제하는 delete문
delete dept2
where dno = 40;

--영업부에 근무하는 사원 삭제
delete emp2
where dno IN ( select dno
              from dept2
              where dname='SALES'); 

--ch12. 시퀀스와 인덱스 -292p
--일련번호를 자동으로 생성하는 시퀀스
--시퀀스 생성
create sequence seq_dept3
start with 10
increment by 10;

--시퀀스를 기본키에 접목하기
insert into dept3
values (seq_dept3.nextval, 'aaa', 'aaa');

--시퀀스 제거
drop sequence seq_dept3;