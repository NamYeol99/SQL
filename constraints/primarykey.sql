create table dept (
    dno number(2),  --constraint pk_d1 primary key,
    dname varchar2(14),
    loc varchar(2)
    --,CONSTRAINT pk_d1 primary key(dno) -- primary key �÷� ���� O, ���̺� ���� O
);
select * from user_objects where OBJECT_NAME = 'DEPT'; 
drop table dept;
select * from user_constraints where table_name= 'DEPT';
alter table dept add constraint pk_d1 primary key(dno); -- primary key ����
alter table dept rename CONSTRAINT pk_d1 to pk_d2; -- �⺻Ű�� ����
alter table dept drop constraint pk_d1; -- �⺻Ű ����

show recyclebin; -- ������ ����
purge recyclebin; -- ������ �����
