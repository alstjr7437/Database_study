--ch09. ������ ���۰� Ʈ�����
--���̺� ������ �߰��ϴ� insert��
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

--��¥ ������ �Է��ϱ�
insert into emp2
values(7000, 'CANDY', 'MANAGER', '2021/11/25', 10);

insert into emp2
values(7010, 'TOM', 'MANAGER', to_date('11-25-21', 'MM-DD-YY'), 10);

insert into emp2
values(7020, 'JERRY', 'SALESMAN', SYSDATE, 30);

--�ٸ� ���̺��� ������ �����ϱ�
insert into dept3
select *
from department;

--���̺��� ������ �����ϴ� update��
update dept2
set dname = 'PROGRAMMING'
where dno = 10;

update dept2
set dname = 'SALES',
    loc = 'SEOUL'
where dno = 10;

--30�μ��� �������� 10�μ��� ���������� ����
update dept2
set loc = ( select loc
            from dept2
            where dno = 10)
where dno = 30;

--10�μ��� �μ���� �������� 20�μ��� �μ���� ���������� ����
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

--���̺��� ������ �����ϴ� delete��
delete dept2
where dno = 40;

--�����ο� �ٹ��ϴ� ��� ����
delete emp2
where dno IN ( select dno
              from dept2
              where dname='SALES'); 

--ch12. �������� �ε��� -292p
--�Ϸù�ȣ�� �ڵ����� �����ϴ� ������
--������ ����
create sequence seq_dept3
start with 10
increment by 10;

--�������� �⺻Ű�� �����ϱ�
insert into dept3
values (seq_dept3.nextval, 'aaa', 'aaa');

--������ ����
drop sequence seq_dept3;