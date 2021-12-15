create table etype (
    etno number(2) constraint etno_pk primary key,
    etname varchar2(20) not null );
    
create table equipment (
    eno number(2) constraint eno_pk primary key,
    ename varchar2(100) not null,
    eattack number(20),
    edefense number(20), 
    limit varchar2(20),
    price number(20),
    etno number(2) constraint equipment_etno_fk references etype );
    
create table place (
    pno number(2) constraint pno_pk primary key,
    pname varchar2(20) not null,
    dangerous number(10) );
    
create table job (
    jno number(2) constraint jno primary key,
    jname varchar2(20) not null,
    jhigh number(2),
    jlevel number(10) default 1,
    jstats varchar2(20),
    aform varchar2(20) not null,
    pno number(2) constraint job_pno_fk references place );
    
create table character (
    cno number(2) constraint cno_pk primary key,
    gender varchar(20) not null,
    stats varchar(20) default '1/1/1/1',
    cattack number(20),
    cdefense number(20),
    appearance varchar(20),
    formation date not null,
    jno number(2) constraint character_jno_fk references job );
    
create table monster (
    mno number(2) constraint mno_pk primary key,
    mname varchar(20) not null,
    mattack number(20),
    mhealth number(20),
    gold number(30),
    type varchar(20),
    pno number(2) constraint monster_pno_fk references place );
    