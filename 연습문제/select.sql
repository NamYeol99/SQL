-- 1. ���� �����ڸ� �̿��Ͽ� ��� ����� ���ؼ� $300�� �޿� �λ���� �Ʒ��� ���� ������ �Ͻÿ�.
-- ��� ���� : �����ȣ ����� ����޿� �λ�޿�
select eno as �����ȣ, ename as �����, salary as ����޿�, salary+300 as �λ�޿� from employee;

-- 2. ����̸�, �޿�, ���� �� ������ ���� �� ������ ���� �ͺ��� ���
select ename as ����̸�, salary as �޿�, salary*12 as �����Ѽ��� from employee order by �����Ѽ��� desc;

-- 3. �޿��� 2000�� �Ѵ� ����� �̸��� �޿��� ���� �Ϳ��� ���� ������ ����Ͻÿ�.
select ename as ����̸�, salary as �޿� from employee where salary > 2000 order by salary desc;

-- 4. �����ȣ�� 7788�� ����� �̸��� �μ���ȣ�� ���
select ename as ����̸� ,dno as �μ���ȣ from employee where eno=7788;

-- 5. �޿��� 2000���� 3000���̿� ���Ե��� �ʴ� ����� �̸��� �μ���ȣ, �޿��� ����Ͻÿ�.
select ename as ����̸�, dno as �μ���ȣ, salary as �޿� from employee where salary not between 2000 and 3000;

-- 6.�Ի����� 1981�� 2�� 20�Ϻ��� 1981�� 5�� 1�� ���̿� �Ի��� ���� ���.
select * from employee where hiredate between '81/02/20' and '81/05/01';

-- 7. �μ���ȣ�� 20�� 30�� ���� ����� �̸��� �μ���ȣ�� ����ϵ� �̸��� �������� �����ڼ����� �������� �Ͻÿ�.
select ename, dno from employee where dno in(20,30) order by ename desc;

-- 8. ����� �޿��� 2000���� 3000���̿� ���Եǰ� �μ���ȣ�� 20 �Ǵ� 30�� ����� �̸�, �޿��� �μ���ȣ�� ����ϵ� �̸������� ������������ ���� �Ͻÿ�.
select ename, salary, dno from employee where salary between 2000 and 3000 and dno in(20,30) order by ename;

-- 9. 1981�⵵�� �Ի��� ����� �̸��� �Ի����� ����Ͻÿ�. (like �����ڿ� ���ϵ� ī�� ���)
select ename, hiredate from employee where hiredate like '81%';

-- 10. �����ڰ� ���� ����� �̸��� ��� ������ ���,
select ename, job from employee where manager is null;

-- 11. Ŀ�̼��� ���� �� �ִ� �ڰ��� �Ǵ� ����� �̸�, �޿�, Ŀ�̼��� ����ϵ� �޿� �� Ŀ�̼��� �������� �������� ���ķ� ǥ���Ͻÿ�.
select ename, salary, commission from employee where commission is not null and not commission = 0;

-- 12. �̸��� ����° ���ڰ� R�� ����� �̸��� ���
select ename from employee where ename like '__R%';

-- 13. �̸��� A�� E�� ��� �����ϰ� �ִ� ��� ���
select ename from employee where ename like '%A%' and ename like '%E%';

-- 14. ��� ������ �繫��(CLERK) �Ǵ� �������(SALESMAN)�̸鼭 �޿��� $1600, $950 �Ǵ� $1300�� �ƴ� ����� �̸�, ������, �޿��� ����Ͻÿ�.
select ename, job, salary from employee where job in('CLERK','SALESMAN') and salary not in(1600,950,1300);

-- 15. Ŀ�̼��� $500 �̻��� ����� �̸��� �޿� �� Ŀ�̼��� ���
select ename, salary, commission from employee where commission >= 500;
