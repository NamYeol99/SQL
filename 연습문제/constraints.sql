--1. employee ���̺��� ������ �����Ͽ� emp_copy�� ���̺��� �����,
-- �����ȣ�� my_emp_pk ��� primary key�� �����Ѵ�.  
create table emp_copy as select * from employee where 1=0;
alter table emp_copy add CONSTRAINT my_emp_pk PRIMARY key(eno,dno); 
alter table emp_copy drop CONSTRAINT my_emp_pk;

--2. ���� ���������� �˻��ϱ� ���� ������ �ۼ��Ͻÿ�.
select * from user_objects;
select * from user_constraints where constraint_name = 'MY_EMP_PK';
desc emp_copy;

--3. employee ���̺��� Ŀ�̼� �÷��� 0���� ū ������ �Է��ϵ��� ���������� �����Ͻÿ�.
alter table emp_copy add CONSTRAINT ck_emp_com check(COMMISSION > 0);

--4. department ���̺��� ������ �����Ͽ� dep_copy�� ���̺��� ����� emp_copy ���̺�� �ܷ�Ű�� cascade�� �����϶�
create table dep_copy as select * from department;

alter table dep_copy add CONSTRAINT fk_dep FOREIGN key(dno) REFERENCES emp_copy(dno) on delete CASCADE;
select * from user_constraints where constraint_name = 'fk_dep';
desc dep_copy;
select * from emp_copy;
select * from dep_copy;