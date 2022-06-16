-- 1. 다음표에 명시된 대로 dtpt2 테이블을 생성하시오.
create table dept2(dno number(2,0), dname varchar2(14), loc varchar2(13), regdate timestamp);

-- 2. 다음표에 명시된 대로 emp2 테이블을 생성하시오.
create table emp2(eno number(2,0), ename varchar2(14), dno number(2,0), regdate timestamp);

-- 3. 위에서 작성한 emp2 테이블을 아래와 같이 수정하시오.
desc emp2;
alter table emp2 modify ENO number(4);
alter table emp2 modify ENAME varchar2(25);
alter table emp2 modify regdate date;

-- 4. employee 테이블을 복사해서 employee2 테이블을 생성하되 컬럼명을 (emp_id, name, sal, dept_id)으로만 지정하시오.
drop table employee2;
create table employee2(emp_id, name, sal, dept_id) as select eno, ename, salary, dno from employee;
desc employee2;

-- 5. employee2 테이블을 emp3로 변경하시오.
alter table employee2 rename to emp3;
desc emp3;

-- 6. emp2와 emp3 테이블을 지우기 위한 쿼리를 작성하시오.
drop table emp2;
drop table emp3;

-- 7. dept2 테이블에서 dname을 지우시오.
desc dept2;
alter table dept2 drop column dname;

-- 8. dept2 테이블에서 loc 칼럼을 unused로 표시하시오.
alter table dept2 set unused(loc);

-- 9. dept 테이블에서 unused 칼럼을 모두 제거하시오
alter table dept2 drop unused columns;

-- 10. employee 테이블의 구조만 복사하여 emp_insert란 이름의 빈 테이블을 만드시오.
create table emp_insert as SELECT * FROM employee where 1=0;

-- 11. 본인을 emp_insert 테이블에 추가하되 sysdate를 이용해서 입사일을 오늘 날짜로 입력하시오. 
insert into emp_insert (ename,hiredate) values('kny', sysdate);
select * from emp_insert;

-- 12. emp_insert 테이블에 옆 사람을 추가하되 to_date 함수를 이용해서 입사일을 어제 날짜로 입력하시오.
insert into emp_insert (ename,hiredate) values('aaa', to_date('22/06/14','yy/mm/dd'));

-- 13. employee 테이블의 구조와 내용을 복사하여 emp_copy 테이블을 만드시오.
create table emp_copy as select * from employee;

-- 14. emp_copy 테이블에서 사원번호가 7788인 사원의 부서번호를 10번으로 수정하시오.
select * from emp_copy;
update emp_copy set dno=10 where eno = 7788;
-- 15. emp_copy 테이블에서 사원번호가 7788인 사원의 담당업무 및 급여를 사원번호 7499의 담당업무와 급여를 일치시키시오.
update emp_copy set(job,salary) = (
    select job,salary from emp_copy where eno = 7499) where eno = 7788;
    
-- 16. emp_copy 테이블에서 사원번호가 7369의 업무가 동일한 모든 사원의 부서번호를 7369사원의 부서번호로 갱신하시오.
update emp_copy set dno =(
    select dno from emp_copy where eno = 7369) where job=(
    select job from emp_copy where eno = 7369);
    
-- 17. department 테이블의 구조와 내용을 복사하여 dept_copy란 이름의 테이블로 만드시오.
create table dept_copy as select * from department;

-- 18. dept_copy 테이블에서 부서명이 research인 부서를 제거하시오.
select * from dept_copy;
delete dept_copy where dname = 'RESEARCH';

-- 19. dept_copy 테이블에서 부서번호가 10, 40인 부서를 제거하시오
delete dept_copy where dno in(10,40);