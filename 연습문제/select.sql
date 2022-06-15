-- 1. 덧셈 연사자를 이용하여 모든 사원에 대해서 $300의 급여 인상분을 아래와 같이 나오게 하시오.
-- 출력 순서 : 사원번호 사원명 현재급여 인상급여
select eno as 사원번호, ename as 사원명, salary as 현재급여, salary+300 as 인상급여 from employee;

-- 2. 사원이름, 급여, 연간 총 수입을 연간 총 수입이 많은 것부터 출력
select ename as 사원이름, salary as 급여, salary*12 as 연간총수입 from employee order by 연간총수입 desc;

-- 3. 급여가 2000을 넘는 사원의 이름과 급여를 많은 것에서 작은 순으로 출력하시오.
select ename as 사원이름, salary as 급여 from employee where salary > 2000 order by salary desc;

-- 4. 사원번호가 7788인 사원의 이름과 부서번호를 출력
select ename as 사원이름 ,dno as 부서번호 from employee where eno=7788;

-- 5. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 부서번호, 급여를 출력하시오.
select ename as 사원이름, dno as 부서번호, salary as 급여 from employee where salary not between 2000 and 3000;

-- 6.입사일이 1981년 2월 20일부터 1981년 5월 1일 사이에 입사한 직원 출력.
select * from employee where hiredate between '81/02/20' and '81/05/01';

-- 7. 부서번호가 20및 30에 속한 사원의 이름과 부서번호를 출력하되 이름을 기준으로 영문자순으로 내림차순 하시오.
select ename, dno from employee where dno in(20,30) order by ename desc;

-- 8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력하되 이름순으로 오름차순으로 정렬 하시오.
select ename, salary, dno from employee where salary between 2000 and 3000 and dno in(20,30) order by ename;

-- 9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오. (like 연산자와 와일드 카드 사용)
select ename, hiredate from employee where hiredate like '81%';

-- 10. 관리자가 없는 사원의 이름과 담당 업무를 출력,
select ename, job from employee where manager is null;

-- 11. 커미션으 받을 수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순 정렬로 표시하시오.
select ename, salary, commission from employee where commission is not null and not commission = 0;

-- 12. 이름의 세번째 문자가 R인 사원의 이름을 출력
select ename from employee where ename like '__R%';

-- 13. 이름에 A와 E를 모두 포함하고 있는 사원 출력
select ename from employee where ename like '%A%' and ename like '%E%';

-- 14. 담당 업무가 사무원(CLERK) 또는 영업사원(SALESMAN)이면서 급여가 $1600, $950 또는 $1300이 아닌 사원의 이름, 담당업무, 급여를 출력하시오.
select ename, job, salary from employee where job in('CLERK','SALESMAN') and salary not in(1600,950,1300);

-- 15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력
select ename, salary, commission from employee where commission >= 500;
