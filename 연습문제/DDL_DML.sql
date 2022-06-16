-- 1. ����ǥ�� ��õ� ��� dtpt2 ���̺��� �����Ͻÿ�.
create table dept2(dno number(2,0), dname varchar2(14), loc varchar2(13), regdate timestamp);

-- 2. ����ǥ�� ��õ� ��� emp2 ���̺��� �����Ͻÿ�.
create table emp2(eno number(2,0), ename varchar2(14), dno number(2,0), regdate timestamp);

-- 3. ������ �ۼ��� emp2 ���̺��� �Ʒ��� ���� �����Ͻÿ�.
desc emp2;
alter table emp2 modify ENO number(4);
alter table emp2 modify ENAME varchar2(25);
alter table emp2 modify regdate date;

-- 4. employee ���̺��� �����ؼ� employee2 ���̺��� �����ϵ� �÷����� (emp_id, name, sal, dept_id)���θ� �����Ͻÿ�.
drop table employee2;
create table employee2(emp_id, name, sal, dept_id) as select eno, ename, salary, dno from employee;
desc employee2;

-- 5. employee2 ���̺��� emp3�� �����Ͻÿ�.
alter table employee2 rename to emp3;
desc emp3;

-- 6. emp2�� emp3 ���̺��� ����� ���� ������ �ۼ��Ͻÿ�.
drop table emp2;
drop table emp3;

-- 7. dept2 ���̺��� dname�� ����ÿ�.
desc dept2;
alter table dept2 drop column dname;

-- 8. dept2 ���̺��� loc Į���� unused�� ǥ���Ͻÿ�.
alter table dept2 set unused(loc);

-- 9. dept ���̺��� unused Į���� ��� �����Ͻÿ�
alter table dept2 drop unused columns;

-- 10. employee ���̺��� ������ �����Ͽ� emp_insert�� �̸��� �� ���̺��� ����ÿ�.
create table emp_insert as SELECT * FROM employee where 1=0;

-- 11. ������ emp_insert ���̺� �߰��ϵ� sysdate�� �̿��ؼ� �Ի����� ���� ��¥�� �Է��Ͻÿ�. 
insert into emp_insert (ename,hiredate) values('kny', sysdate);
select * from emp_insert;

-- 12. emp_insert ���̺� �� ����� �߰��ϵ� to_date �Լ��� �̿��ؼ� �Ի����� ���� ��¥�� �Է��Ͻÿ�.
insert into emp_insert (ename,hiredate) values('aaa', to_date('22/06/14','yy/mm/dd'));

-- 13. employee ���̺��� ������ ������ �����Ͽ� emp_copy ���̺��� ����ÿ�.
create table emp_copy as select * from employee;

-- 14. emp_copy ���̺��� �����ȣ�� 7788�� ����� �μ���ȣ�� 10������ �����Ͻÿ�.
select * from emp_copy;
update emp_copy set dno=10 where eno = 7788;
-- 15. emp_copy ���̺��� �����ȣ�� 7788�� ����� ������ �� �޿��� �����ȣ 7499�� �������� �޿��� ��ġ��Ű�ÿ�.
update emp_copy set(job,salary) = (
    select job,salary from emp_copy where eno = 7499) where eno = 7788;
    
-- 16. emp_copy ���̺��� �����ȣ�� 7369�� ������ ������ ��� ����� �μ���ȣ�� 7369����� �μ���ȣ�� �����Ͻÿ�.
update emp_copy set dno =(
    select dno from emp_copy where eno = 7369) where job=(
    select job from emp_copy where eno = 7369);
    
-- 17. department ���̺��� ������ ������ �����Ͽ� dept_copy�� �̸��� ���̺�� ����ÿ�.
create table dept_copy as select * from department;

-- 18. dept_copy ���̺��� �μ����� research�� �μ��� �����Ͻÿ�.
select * from dept_copy;
delete dept_copy where dname = 'RESEARCH';

-- 19. dept_copy ���̺��� �μ���ȣ�� 10, 40�� �μ��� �����Ͻÿ�
delete dept_copy where dno in(10,40);