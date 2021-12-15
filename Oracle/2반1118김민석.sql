--ch08. ���̺� ����/����/�����ϱ�
--���̺� ������ ����� create table��
create table dept ( dno number(2),
                    dname varchar2(14),
                    loc varchar2(13) );
                    
create table dept2
as
select *
from department;

create table dept3
as
select *
from department
where 0=1;

create table dept20
as
select eno,ename,salary*12 as annsal
from employee
where dno = 20;

--���̺� ������ �����ϴ� alter table��
--Į�� �߰� 210p
alter table dept20
add(birth date);

--Į�� ���� 211p
alter table dept20
modify ename varchar2(30);

--Į�� ���� 212p
alter table dept20
drop column ename;

--���̺���� �����ϴ� rename�� 214p
rename dept20 to emp20;

--���̺� ������ �����ϴ� drop table�� 215p
drop table emp20;

--���̺��� ��� �����͸� �����ϴ� truncate table��
truncate table dept2;

--ch10. ������ ���Ἲ�� ��������
create table customer (
    id varchar(20) constraint customer_id_pk primary key,
    pwd varchar(20) constraint customer_pwd_nn not null,
    name varchar(20) constraint customer_name_nn not null,
    phomne varchar(30),
    address varchar(100) );
    
create table emp2 (
    eno varchar(4) constraint emp2_eno_pk primary key,
    ename varchar(10) constraint emp2_ename_nn not null,
    job varchar(9),
    dno number(2) constraint emp2_dno_fk references department );
