-- subquery
select eno, ename, dno, (select dname from department  where dno=e.dno) 부서명 from employee e;

--eno, ename,manager, 매니저명 출력
select eno, ename, manager, (select ename from employee  where eno = e.manager) 매니저명 from employee e; 

--부서번호가 10번인 최저급여 보다 적은사람 출력
--select min(salary) from employee where dno=10; -- 부서번호가 10번 최저급여
select ename, salary ,dno from employee where salary < (select min(salary) from employee where dno=10);

-- table 
select rownum r, A.* from  (select eno, ename, salary from employee order by salary desc) A;
-- 6~10번만 출력
select * from 
    (select rownum r, A.* from  (select eno, ename, salary from employee order by salary desc)A)
    where r between 6 and 10;

-- 조건절
select eno, ename, dno, salary from employee where salary in (
    select min(salary) from employee group by dno);

-- having scott 부서외의 부서 최소 급여자 목록을 구하시오 multi row subquery
select eno, ename, salary, dno from employee where salary in
    (select min (salary) from employee group by dno having  dno <> (
    select dno from employee where ename = 'SCOTT'));

-- exists 해당 row가 존재하는지만 확인
select eno, ename, dno from employee e where exists (
    select dno, dname from department where e.dno=10);
    
-- exists 해당 row가 존재하는지만 확인
select eno, ename, dno from employee e where not exists (
    select dno, dname from department where e.dno=40);
    
--부서번호가 30,20,10 인 직원을 출력
select dno, eno from employee where dno in (10,20,30) order by 1,2;
select dno, eno from employee e where not exists(
    select dno from employee where e.dno=40) order by 1,2;