-- 1. Equi ������ ����Ͽ� scott ����� �μ���ȣ�� �μ��̸��� ����Ͻÿ�.
select e.dno, dname from employee e, department d where e.dno= d.dno and ename = 'SCOTT';

-- 2. inner join �� on �����ڸ� ����Ͽ� ����̸��� �Բ� �� ����� �Ҽӵ� �μ��̸��� �������� ����Ͻÿ�.
SELECT ENAME,DNAME,CITYNAME FROM EMPLOYEE E, DEPARTMENT D, LOC L
    WHERE E.DNO=D.DNO AND D.LOC=L.LOC;
    
SELECT ENAME,DNAME,CITYNAME FROM EMPLOYEE E INNER JOIN DEPARTMENT D ON(E.DNO=D.DNO) INNER JOIN LOC L
    ON (D.LOC=L.LOC);

-- 3. inner join�� using �����ڸ� ����Ͽ� 10�� �μ��� ���ϴ� ��� ��� ������ �������(�� ������ ǥ��)�� �μ��� �������� �����Ͽ� ����Ͻÿ�.
SELECT ENAME,DNO,DNAME,JOB,CITYNAME FROM EMPLOYEE INNER JOIN DEPARTMENT USING(DNO) INNER JOIN LOC
    USING(LOC) WHERE DNO=10;

-- 4. natural join�� ����Ͽ� Ŀ�̼��� �޴� ��� ����� �̸�, �μ���, �������� ����Ͻÿ�.
SELECT ENAME,COMMISSION,DNO,DNAME,CITYNAME 
    FROM EMPLOYEE NATURAL INNER JOIN DEPARTMENT NATURAL INNER JOIN LOC 
    WHERE COMMISSION IS NOT NULL AND COMMISSION<>0 ;
-- 5. equi ���ΰ� wildcard�� ����Ͽ� �̸��� A�� ���Ե� ��� ����� �̸��� �μ����� ����Ͻÿ�.
SELECT ENAME,D.DNO,DNAME,CITYNAME 
    FROM EMPLOYEE E,DEPARTMENT D,LOC L
    WHERE E.DNO=D.DNO AND D.LOC=L.LOC AND ENAME LIKE '%A%';
-- 6. natural join�� ����Ͽ� Newyork�� �ٹ��ϴ� ��� ����� �̸�, ����, �μ���ȣ �� �μ����� ����Ͻÿ�.
SELECT ENAME,DNO,DNAME,CITYNAME FROM EMPLOYEE NATURAL INNER JOIN DEPARTMENT NATURAL INNER JOIN LOC
    WHERE CITYNAME='NEWYORK';

-- 7. self join�� ����Ͽ� ����� �̸� �� �����ȣ�� ������ �̸� �� ������ ��ȣ�� �Բ� ����Ͻÿ�.
SELECT E.ENO,E.ENAME,E.MANAGER,M.ENAME FROM EMPLOYEE E, EMPLOYEE M WHERE E.MANAGER = M.ENO;

-- 8. outer join, self join�� ����Ͽ� �����ڰ� ���� �����  �����Ͽ� �����ȣ�� �������� �������� �����Ͽ� ����Ͻÿ�.
SELECT E.ENO,E.ENAME,E.MANAGER,M.ENAME FROM EMPLOYEE E, EMPLOYEE M 
    WHERE E.MANAGER=M.ENO(+) ORDER BY E.ENO DESC;
SELECT E.ENO,E.ENAME,E.MANAGER,M.ENAME FROM EMPLOYEE E LEFT OUTER JOIN EMPLOYEE M 
    ON(E.MANAGER=M.ENO) ORDER BY E.ENO DESC;
    
-- 9. self join �� ����Ͽ� �����, �μ���ȣ, ������ ����� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�.
SELECT T.ENAME, T.DNO FROM EMPLOYEE E, EMPLOYEE T
    WHERE E.DNO=T.DNO AND E.ENAME='SCOTT' AND T.ENAME<>'SCOTT';
    
select ename, dno from employee where dno = (select dno from employee where ename='SCOTT');

-- 10. self join �� ����Ͽ� ward ������� �ʰ� �Ի��� ������̸��� �Ի����� ����Ͻÿ�.
select ename, hiredate from employee where hiredate >
    (select hiredate from employee where ename='WARD');

-- 11. self join�� ����Ͽ� ������ ���� ���� �Ի��� ��� ����� �̸� �� �Ի����� �������� �̸� �� �Ի��ϰ� �Բ� ����Ͻÿ�.
select e.eno, e.ename, e.hiredate, e.manager, m.ename fom employee e, employee m  where e.hiredate < m.hiredate and e.manager=m.eno(+) order by e.hiredate;

select e.eno, e.ename, e.hiredate
    from employee e left outer join employee m on(e.manager=m.eno)
    where e.hiredate < m.hiredate order by e.hiredate;
