select dno, avg(salary) from employee group by dno;
-- 1. �� �μ��� ��� �޿��� ���Ͽ� -500 +500 ������ ������ �ִ� ����� �μ���ȣ, �����ȣ, �̸�, �޿��� ���Ͻÿ�.
select eno, ename, salary ,dno from employee where salary > (
    select avg(salary)-500 from employee ) and salary < (select avg(salary)+500 from employee );
select r.dno, e.eno, e.ename, e.salary from employee e, (
    select dno, round(avg(salary)) ��ձ޿� from employee group by dno) r where e.dno = r.dno and salary between r.��ձ޿�-500 and r.��ձ޿�+500;
-- 2. �����ȣ�� 7788�� ����� ��� ������ ���� ����� ǥ���Ͻÿ�.(����̸��� ������ ���)
select ename, job  from employee where job=(select job from employee where eno = 7788);

-- 3. �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ���Ͻÿ�.(����̸��� ������ ���)
select ename, job  from employee where salary > (select salary from employee where eno = 7499);

-- 4. job ���� ��� �޿��� ���� ���� job�� ��� �޿��� ǥ���Ͻÿ�.
select job, avg(salary) from employee group by job having avg(salary) = (
    select min(avg(salary)) from employee group by job);

-- 5. �� �μ� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
select ename, salary, dno from employee where salary in(select min(salary) from employee group by dno) order by dno;

-- 6. �������� �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м����� �ƴ� ������� ǥ��(�����ȣ,������, �޿�)�Ͻÿ�.
select eno, job, salary from employee where salary < all(
    select salary from employee where job='ANALYST') and job <> 'ANALYST';
    
-- 7. ���������� ���� ����� �̸��� ǥ���Ͻÿ�.
select * from employee where eno not in (select distinct manager from employee where manager is not null);

-- 8. ���������� �ִ� ����� �̸��� ǥ���Ͻÿ�.
select * from employee where eno in (select distinct manager from employee where manager is not null);

-- 9. BLAKE�� ������ �μ��� ���� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�(�� BLAKE�� ����)
select ename, hiredate from employee where dno = (
    select dno from employee where ename = 'BLAKE') and not ename = 'BLAKE';
-- 10. �μ� ��ġ�� BUSAN�� ����� �̸��� �μ���ȣ �� ��� ������ ǥ���Ͻÿ�.
select ename, e.dno, job from employee e, department d , loc l where e.dno=d.dno and d.loc=l.loc and cityname='SEOUL';
select * from employee where dno = (
    select dno from department where loc= (
        select loc from loc where cityname = 'SEOUL'));
-- 11. KING���� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�.
select ename, salary from employee where manager = (
    select eno from employee where ENAME = 'KING');

-- 12.��� �޿����� ���� �޿��� �ް� �̸��� M�� ���Ե� ����� ���� �μ����� �ٹ��ϴ� ����� �����ȣ, �̸�, �޿��� ǥ���Ͻÿ�.
select DNO, eno, ename, salary from employee where salary > (
    select avg(salary) from employee) and DNO IN(select dno from employee where ename LIKE '%M%');
    
-- 13. �������� ANALYST �� ����� �Ҽӵ� �μ��� ������ �μ��� ����� ǥ���Ͻÿ�.
select ename from employee where dno in (
    select  dno from employee where job = 'ANALYST');
    
-- 14. �μ���ȣ, �μ���, �μ��� �ο����� ����Ͻÿ�.
select dno, dname, (
    select count(dno) from employee where dno = d.dno ) from department d;
    
-- 15. �� �ٹ� ������ ���� �ٹ�������, ������ȣ, ������ �����, ������ ��� ����� ��� �޿��� ����Ͻÿ�.
select cityname, d.loc, count(eno), avg(salary) from employee e, department d, loc l 
    where e.dno = d.dno and d.loc=l.loc group by cityname, d.loc;
    