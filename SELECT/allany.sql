-- all : 서브쿼리 값을 포함시키지 않음
select eno, ename, job, salary from employee where salary <= all (
    select salary from employee where job='SALESMAN');
-- any : 서브쿼리 값을 포함 시킴
select eno, ename, job, salary from employee where salary < any (
    select salary from employee where job='SALESMAN');
