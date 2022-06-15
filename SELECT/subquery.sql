-- subquery
select eno, ename, dno, (select dname from department  where dno=e.dno) �μ��� from employee e;

--eno, ename,manager, �Ŵ����� ���
select eno, ename, manager, (select ename from employee  where eno = e.manager) �Ŵ����� from employee e; 

--�μ���ȣ�� 10���� �����޿� ���� ������� ���
--select min(salary) from employee where dno=10; -- �μ���ȣ�� 10�� �����޿�
select ename, salary ,dno from employee where salary < (select min(salary) from employee where dno=10);

-- table 
select rownum r, A.* from  (select eno, ename, salary from employee order by salary desc) A;
-- 6~10���� ���
select * from 
    (select rownum r, A.* from  (select eno, ename, salary from employee order by salary desc)A)
    where r between 6 and 10;

-- ������
select eno, ename, dno, salary from employee where salary in (
    select min(salary) from employee group by dno);

-- having scott �μ����� �μ� �ּ� �޿��� ����� ���Ͻÿ� multi row subquery
select eno, ename, salary, dno from employee where salary in
    (select min (salary) from employee group by dno having  dno <> (
    select dno from employee where ename = 'SCOTT'));

-- exists �ش� row�� �����ϴ����� Ȯ��
select eno, ename, dno from employee e where exists (
    select dno, dname from department where e.dno=10);
    
-- exists �ش� row�� �����ϴ����� Ȯ��
select eno, ename, dno from employee e where not exists (
    select dno, dname from department where e.dno=40);
    
--�μ���ȣ�� 30,20,10 �� ������ ���
select dno, eno from employee where dno in (10,20,30) order by 1,2;
select dno, eno from employee e where not exists(
    select dno from employee where e.dno=40) order by 1,2;