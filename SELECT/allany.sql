select eno, ename, job, salary from employee where salary <= all (
    select salary from employee where job='SALESMAN');

select eno, ename, job, salary from employee where salary < any (
    select salary from employee where job='SALESMAN');
