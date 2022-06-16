create SEQUENCE emp_seq INCREMENT by 10 start with 10; -- primary key에 사용되는 정보 sequence로 활용
insert into emp(eno,ename) VALUES(emp_seq.nextval, 'asd');
insert into dept(dno, dname) values(emp_seq.nextval, 'research');
create table dept as select * from department where 1=0;
select * from emp;
select * from dept;
select * from user_sequences;
select * from user_objects where object_type = 'SEQUENCE';
SELECT emp_seq.currval from dual;
drop SEQUENCE emp_seq;