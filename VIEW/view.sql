create view v_emp_dep as
    select eno, ename, salary, job, hiredate, e.dno, dname
    from employee e, department d where  e.dno=d.dno;
select * from v_emp_dep where dno = 10;

create or replace view v_emp_sal as
    select eno, ename, salary 연봉 from emp;

insert into "v_emp_sal" values(100,'kny', 5000);

create view v_dno_sum as select dno, sum(salary) 합, round(avg(salary)) 평균 from employee group by dno; -- insert 불가능

create or replace force view v_sales as select * from sales; -- force : 해당 테이블이 없어도 생성가능
create table sales as select * from emp;
select * from v_sales;

create or replace force view v_emp as
    select eno, ename, salary, job from emp 
        --WHERE JOB ='MANAGER' WITH CHECK OPTION; -- JOB이 MANAGER만 가능하게 설정
        WHERE SALARY > 0 WITH CHECK OPTION;
        --WHERE SALATY > 0 WITH READ ONLY; -- INSERT 안되게 설정
        
    
insert into v_emp values(18123,'kny', 10, 'CLERK');
alter table emp add job varchar2(20);
select * from emp;



drop view v_emp_sal;