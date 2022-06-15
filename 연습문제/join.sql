-- 1. Equi 조인을 사용하여 scott 사원의 부서번호와 부서이름을 출력하시오.
select e.dno, dname from employee e, department d where e.dno= d.dno and ename = 'SCOTT';

-- 2. inner join 과 on 연산자를 사용하여 사원이름과 함께 그 사원이 소속된 부서이름과 지역명을 출력하시오.
SELECT ENAME,DNAME,CITYNAME FROM EMPLOYEE E, DEPARTMENT D, LOC L
    WHERE E.DNO=D.DNO AND D.LOC=L.LOC;
    
SELECT ENAME,DNAME,CITYNAME FROM EMPLOYEE E INNER JOIN DEPARTMENT D ON(E.DNO=D.DNO) INNER JOIN LOC L
    ON (D.LOC=L.LOC);

-- 3. inner join과 using 연산자를 사용하여 10번 부서에 속하는 모든 담당 업무의 고유목록(한 번씩만 표시)을 부서의 지역명을 포함하여 출력하시오.
SELECT ENAME,DNO,DNAME,JOB,CITYNAME FROM EMPLOYEE INNER JOIN DEPARTMENT USING(DNO) INNER JOIN LOC
    USING(LOC) WHERE DNO=10;

-- 4. natural join을 사용하여 커미션을 받는 모든 사원의 이름, 부서명, 지역명을 출력하시오.
SELECT ENAME,COMMISSION,DNO,DNAME,CITYNAME 
    FROM EMPLOYEE NATURAL INNER JOIN DEPARTMENT NATURAL INNER JOIN LOC 
    WHERE COMMISSION IS NOT NULL AND COMMISSION<>0 ;
-- 5. equi 조인과 wildcard를 사용하여 이름에 A가 포함된 모든 사원의 이름과 부서명을 출력하시오.
SELECT ENAME,D.DNO,DNAME,CITYNAME 
    FROM EMPLOYEE E,DEPARTMENT D,LOC L
    WHERE E.DNO=D.DNO AND D.LOC=L.LOC AND ENAME LIKE '%A%';
-- 6. natural join을 사용하여 Newyork에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
SELECT ENAME,DNO,DNAME,CITYNAME FROM EMPLOYEE NATURAL INNER JOIN DEPARTMENT NATURAL INNER JOIN LOC
    WHERE CITYNAME='NEWYORK';

-- 7. self join을 사용하여 사원의 이름 및 사원번호를 관리자 이름 및 관리자 번호와 함께 출력하시오.
SELECT E.ENO,E.ENAME,E.MANAGER,M.ENAME FROM EMPLOYEE E, EMPLOYEE M WHERE E.MANAGER = M.ENO;

-- 8. outer join, self join을 사용하여 관리자가 없는 사원을  포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
SELECT E.ENO,E.ENAME,E.MANAGER,M.ENAME FROM EMPLOYEE E, EMPLOYEE M 
    WHERE E.MANAGER=M.ENO(+) ORDER BY E.ENO DESC;
SELECT E.ENO,E.ENAME,E.MANAGER,M.ENAME FROM EMPLOYEE E LEFT OUTER JOIN EMPLOYEE M 
    ON(E.MANAGER=M.ENO) ORDER BY E.ENO DESC;
    
-- 9. self join 을 사용하여 사원명, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오.
SELECT T.ENAME, T.DNO FROM EMPLOYEE E, EMPLOYEE T
    WHERE E.DNO=T.DNO AND E.ENAME='SCOTT' AND T.ENAME<>'SCOTT';
    
select ename, dno from employee where dno = (select dno from employee where ename='SCOTT');

-- 10. self join 을 사용하여 ward 사원보다 늦게 입사한 사원의이름과 입사일을 출력하시오.
select ename, hiredate from employee where hiredate >
    (select hiredate from employee where ename='WARD');

-- 11. self join을 사용하여 관리자 보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오.
select e.eno, e.ename, e.hiredate, e.manager, m.ename fom employee e, employee m  where e.hiredate < m.hiredate and e.manager=m.eno(+) order by e.hiredate;

select e.eno, e.ename, e.hiredate
    from employee e left outer join employee m on(e.manager=m.eno)
    where e.hiredate < m.hiredate order by e.hiredate;
