select avg(salary) from employee;
-- 1. �� �μ��� ��� �޿��� ���Ͽ� -500 +500 ������ ������ �ִ� ����� �μ���ȣ, �����ȣ, �̸�, �޿��� ���Ͻÿ�.
select ename, salary ,dno from employee where salary > (
    select avg(salary)-500 from employee) and salary < (select avg(salary)+500 from employee);

-- 2. �����ȣ�� 7788�� ����� ��� ������ ���� ����� ǥ���Ͻÿ�.(����̸��� ������ ���)
select ename, job  from employee where job=(select job from employee where eno = 7788);

-- 3. �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ���Ͻÿ�.(����̸��� ������ ���)
select ename, job  from employee where salary > (select salary from employee where eno = 7788);

-- 4. job ���� ��� �޿��� ���� ���� job�� ��� �޿��� ǥ���Ͻÿ�.
select job, avg(salary) from employee group by job having avg(salary) = (
    select min(avg(salary)) from employee group by job);

-- 5. �� �μ� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.
select ename, salary, dno from employee where salary in(select min(salary) from employee group by dno) order by dno;

-- 6. �������� �м���(ANALYST)�� ������� �޿��� �����鼭 ������ �м����� �ƴ� ������� ǥ��(�����ȣ,������, �޿�)�Ͻÿ�.
select eno, job, salary from employee where salary < all(
    select salary from employee where job='ANALYST') and job <> 'ANALYST';
    
-- 7. ���������� ���� ����� �̸��� ǥ���Ͻÿ�.

-- 11. KING���� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�.
select ename, salary from employee where manager = (
    select eno from employee where ENAME = 'KING');

-- 12.
    
    