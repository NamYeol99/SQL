select * from employee;
select * from employee where dno = 10;
select eno, ename, job, salary from employee;
select ename || '(' || eno || ')', job, salary from employee;
select ename, job, salary, salary*12+nvl(commission,0) "1년치 연봉" from employee;

select eno ,ename, d.dno, dname from employee e, department d where e.dno = d.dno;
select dno, dname, d.loc, cityname from department d, loc l where d.loc = l.loc order by l.loc desc;

select * from employee order by dno asc, salary desc; --asc = 오름차순 desc = 내림차순

select * from employee;

SELECT * FROM employee WHERE ename = upper('smith'); -- upper = 대문자로 변환
select eno, lower(ename) from employee where ename = upper('smith'); 
select * from employee where hiredate > '85/01/01';
select * from employee where salary  between 1000 and 2000; --salary >= 1000 and salary <= 2000;
select * from employee where dno in(10,20); --dno = 10 or dno = 20;

select * from employee where dno <> 30;
select * from employee where not(dno <> 30);
select * from employee where commission is NULL; -- is not NULL
select * from employee where dno not in(20,30);
select * from employee where nvl(commission, 0) = 0;
select eno, ename, commission, nvl2(commission, commission+12, 0) from employee; --null이면 0, null이 아니면 commission+12
select eno, ename, commission, nvl(commission, 0) a from employee; --null이면 0
select * from employee where ename like 'A%' ; --A로 시작하는 ename 찾기
