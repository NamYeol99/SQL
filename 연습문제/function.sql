-- 1. 모든 사원의 급여 최고액, 최저액, 총액 및 평균 급여를 출력하라.
select max(salary)as 최고액, min(salary) as 최저액, sum(salary) as 총액, round(avg(salary))as 평균급여 from employee; --1

-- 2. 각 담당 업무 유형별로 급여 최고액, 최저액, 총액 및 평균액을 출력하시오.
select job, max(salary) as 최고액, min(salary) as 최저액, sum(salary) as 총액, round(avg(salary))as 평균액 from employee group by job; --2

-- 3. count(*)함수를 이용하여 담당업무가 동일한 사원수를 출력하시오.
select job, count(*) from employee group by job; --3

-- 4. 관리자 수를 나열하시오.
selEct job, count(job) from employee group by job having job = 'MANAGER';
select * from employee where eno in(select distinct manager from employee where manager is not null);
select DISTINCT manager from employee where manager is not null;

-- 5. 급여 최고액과 최저액의 차이를 출력하시오.
select max(salary)-min(salary) from employee; --5

-- 6. 직급별 사원의 최저 급여를 출력하시오, 관리자를 알 수 없는 사원 및 최저 급여가 2000 미만인 그룹은 제외시키고 결과를 급여에 대한 내림차순으로 정렬하여 출력하시오.
select job, min(salary)as 최저액 from employee where manager is not null 
    group by job having min(salary) > 2000 order by 최저액 desc; --6
    
-- 7. 각 부서에 대해 부서번호, 사원수, 부서 내의 모든 사원의 평균 급여를 출력하시오.
select dno, count(eno), round(avg(salary)) from employee group by dno; --7

-- 8. 각 부서에 대해 부서번호, 이름, 지역명, 사원수, 부서내의 모든 사원의 평균 급여를 출력하시오.
select dno, decode(dno, 10, 'ACCOUNTING', 20, 'RESEARCH', 30, 'SALES') 이름,
    decode(dno, 10, 'LONDON', 20, 'SEOUL', 30, 'NEWYORK'),
    count(*), round(avg(salary)) from employee group by dno; -- 8
select e.dno, dname, cityname, count(e.dno),round(avg(salary))
    from employee e, department d, loc l
    where e.dno=d.dno and d.loc=l.loc group by e.dno, d.dname, l.cityname; -- 8
    
-- 9. 업무를 표시한 다음 해당 업무에 대해 부서번호별 부서별 및 부서 10,20,30의 급여 총액을 각각 출력하시오. 
-- 각 컬럼의 별칭은 각각 job, 부서 10, 부서 20, 부서 30, 총액으로 지정하시오
select job, e.dno, (select dname from department where dno=e.dno)dname, sum(salary) 
from employee e group by job, dno order by job, dno; --9

