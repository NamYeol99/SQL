create view v_emp_dep as
    select eno, ename, salary, job, hiredate, e.dno, dname
    from employee e, department d where  e.dno=d.dno;
select * from v_emp_dep where dno = 10;

create or replace view v_emp_sal as
    select eno, ename, salary ���� from emp;

insert into "v_emp_sal" values(100,'kny', 5000);

create view v_dno_sum as select dno, sum(salary) ��, round(avg(salary)) ��� from employee group by dno; -- insert �Ұ���

create or replace force view v_sales as select * from sales; -- force : �ش� ���̺��� ��� ��������
create table sales as select * from emp;
select * from v_sales;

create or replace force view v_emp as
    select eno, ename, salary, job from emp 
        --WHERE JOB ='MANAGER' WITH CHECK OPTION; -- JOB�� MANAGER�� �����ϰ� ����
        WHERE SALARY > 0 WITH CHECK OPTION;
        --WHERE SALATY > 0 WITH READ ONLY; -- INSERT �ȵǰ� ����
        
    
insert into v_emp values(18123,'kny', 10, 'CLERK');
alter table emp add job varchar2(20);
select * from emp;



drop view v_emp_sal;