create table dept (
    dno number(2), 
    dname varchar2(14),
    -- loc varchar(2) constraint fk_dept_loc REFERENCES LOC2 (LOC)
    --constraint fk_dept_loc foreign key(loc) REFERENCES LOC (LOC)-- foreign key �÷� ���� O, ���̺� ���� O
);
create table loc2 as SELECT * from loc;
create table dept as select * from department;
alter table loc2 add constraint pk_loc2 primary key(loc); -- primary key ����
alter table dept add CONSTRAINT fk_dept_loc FOREIGN key (loc) REFERENCES loc2(loc) on delete set null; --������� �߰��� ������ �ٽ� ���� �ؾߵ�
alter table dept drop CONSTRAINT fk_dept_loc;
select * from dept; 
select * from loc2;
delete from loc2 where loc= 20;
drop table dept;
drop table loc2;

select * from user_objects; -- �ܷ�Ű�� �˻� ����� �ȳ��� constraints ���
select * from user_constraints where table_name= 'DEPT';

alter table dept add constraint fk_dept_loc foreign key(loc) REFERENCES LOC (LOC); -- �ܷ�Ű �߰�
alter table dept rename CONSTRAINT fk_dept_loc to fk_dept_loc2; -- �ܷ�Ű�� ����
alter table dept drop constraint fk_dept_loc; -- �ܷ�Ű ����
alter table dept modify CONSTRAINT fk_dept_loc REFERENCES department(dno);




