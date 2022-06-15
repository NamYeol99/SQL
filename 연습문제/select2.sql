select avg(salary) from employee;
-- 1. 각 부서별 평균 급여에 대하여 -500 +500 사이의 범위에 있는 사원의 부서번호, 사원버호, 이름, 급여를 구하시오.
select ename, salary ,dno from employee where salary > (
    select avg(salary)-500 from employee) and salary < (select avg(salary)+500 from employee);

-- 2. 사원번호가 7788인 사원과 담당 업무가 같은 사원을 표시하시오.(사원이름과 담당업무 출력)
select ename, job  from employee where job=(select job from employee where eno = 7788);

-- 3. 사원번호가 7499인 사원보다 급여가 많은 사원을 표시하시오.(사원이름과 담당업무 출력)
select ename, job  from employee where salary > (select salary from employee where eno = 7788);

-- 4. job 별로 평균 급여가 가장 적은 job의 평균 급여를 표시하시오.
select job, avg(salary) from employee group by job having avg(salary) = (
    select min(avg(salary)) from employee group by job);

-- 5. 각 부서 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.
select ename, salary, dno from employee where salary in(select min(salary) from employee group by dno) order by dno;

-- 6. 담당업무가 분석가(ANALYST)인 사원보다 급여가 적으면서 업무가 분석가가 아닌 사원들을 표시(사원번호,담당업무, 급여)하시오.
select eno, job, salary from employee where salary < all(
    select salary from employee where job='ANALYST') and job <> 'ANALYST';
    
-- 7. 부하직원이 없는 사원의 이름을 표시하시오.

-- 11. KING에게 보고하는 사원의 이름과 급여를 표시하시오.
select ename, salary from employee where manager = (
    select eno from employee where ENAME = 'KING');

-- 12.
    
    