-- all : �������� ���� ���Խ�Ű�� ����
select eno, ename, job, salary from employee where salary <= all (
    select salary from employee where job='SALESMAN');
-- any : �������� ���� ���� ��Ŵ
select eno, ename, job, salary from employee where salary < any (
    select salary from employee where job='SALESMAN');
