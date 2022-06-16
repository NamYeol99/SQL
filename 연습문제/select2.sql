select dno, avg(salary) from employee group by dno;
-- 1. 각 부서별 평균 급여에 대하여 -500 +500 사이의 범위에 있는 사원의 부서번호, 사원버호, 이름, 급여를 구하시오.
select eno, ename, salary ,dno from employee where salary > (
    select avg(salary)-500 from employee ) and salary < (select avg(salary)+500 from employee );
select r.dno, e.eno, e.ename, e.salary from employee e, (
    select dno, round(avg(salary)) 평균급여 from employee group by dno) r where e.dno = r.dno and salary between r.평균급여-500 and r.평균급여+500;
-- 2. 사원번호가 7788인 사원과 담당 업무가 같은 사원을 표시하시오.(사원이름과 담당업무 출력)
select ename, job  from employee where job=(select job from employee where eno = 7788);

-- 3. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시하시오.(사원이름과 담당업무 출력)
select ename, job  from employee where salary > (select salary from employee where eno = 7499);

-- 4. job 별로 평균 급여가 가장 적은 job의 평균 급여를 표시하시오.
select job, avg(salary) from employee group by job having avg(salary) = (
    select min(avg(salary)) from employee group by job);

-- 5. 각 부서 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
select ename, salary, dno from employee where salary in(select min(salary) from employee group by dno) order by dno;

-- 6. 담당업무가 분석가(ANALYST)인 사원보다 급여가 적으면서 업무가 분석가가 아닌 사원들을 표시(사원번호,담당업무, 급여)하시오.
select eno, job, salary from employee where salary < all(
    select salary from employee where job='ANALYST') and job <> 'ANALYST';
    
-- 7. 부하직원이 없는 사원의 이름을 표시하시오.
select * from employee where eno not in (select distinct manager from employee where manager is not null);

-- 8. 부하직원이 있는 사원의 이름을 표시하시오.
select * from employee where eno in (select distinct manager from employee where manager is not null);

-- 9. BLAKE와 동일한 부서에 속한 사원의 이름과 입사일을 표시하는 질의를 작성하시오(단 BLAKE는 제외)
select ename, hiredate from employee where dno = (
    select dno from employee where ename = 'BLAKE') and not ename = 'BLAKE';
-- 10. 부서 위치가 BUSAN인 사원의 이름과 부서번호 및 담당 업무를 표시하시오.
select ename, e.dno, job from employee e, department d , loc l where e.dno=d.dno and d.loc=l.loc and cityname='SEOUL';
select * from employee where dno = (
    select dno from department where loc= (
        select loc from loc where cityname = 'SEOUL'));
-- 11. KING에게 보고하는 사원의 이름과 급여를 표시하시오.
select ename, salary from employee where manager = (
    select eno from employee where ENAME = 'KING');

-- 12.평균 급여보다 많은 급여를 받고 이름에 M이 포함된 사원과 같은 부서에서 근무하는 사원의 사원번호, 이름, 급여를 표시하시오.
select DNO, eno, ename, salary from employee where salary > (
    select avg(salary) from employee) and DNO IN(select dno from employee where ename LIKE '%M%');
    
-- 13. 담당업무가 ANALYST 인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오.
select ename from employee where dno in (
    select  dno from employee where job = 'ANALYST');
    
-- 14. 부서번호, 부서명, 부서별 인원수를 출력하시오.
select dno, dname, (
    select count(dno) from employee where dno = d.dno ) from department d;
    
-- 15. 각 근무 지역에 대해 근무지역명, 지역번호, 지역별 사원수, 지역별 모든 사원의 평균 급여를 출력하시오.
select cityname, d.loc, count(eno), avg(salary) from employee e, department d, loc l 
    where e.dno = d.dno and d.loc=l.loc group by cityname, d.loc;
    