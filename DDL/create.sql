create table dept(dno number(2,0), dname varchar(14), loc varchar(13));
desc dept;
select * from dept;
create table dept2 as select * from department; --table ����, subquery ���
select * from dept2;
create table dept3 as select * from department where 1=0; --table ����, ������ ���� ������ ������ ����ȵ�, subquery ���
select * from dept3;

comment on table dept is 'department';
select * from user_tab_comments where table_name = 'DEPT'; -- table comments Ȯ��

comment on column dept.dno is '�μ���ȣ'; -- column�� comment �ޱ�
comment on column dept.dname is '�μ���';
comment on column dept.loc is '�����ڵ�';
select * from user_col_comments where table_name = 'DEPT'; -- column comments Ȯ��

select * from tab; -- ���̺� ����
select * from user_tables; -- ����ڰ� ���� ���̺� ����
select * from dba_tables; -- ���� ��� ���� X
select * from all_tables;
SELECT * FROM USER_ROLE_PRIVS; -- ���� ����

truncate table  dept2; --column �߶󳻱�
drop table dept2;
drop table dept;
select * from dept2; 

