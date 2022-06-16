create table customer (
    id varchar2(20) not null,
    pwd varchar2(20) not null,
    name varchar2(30) constraint nn_name not null,
    phone varchar2(20),
    address varchar2(100)
);
select * from user_constraints;
insert into customer(id,pwd,name) VALUES('vstar','1234','kny');
alter table customer modify phone CONSTRAINT nn_phone not null; --not null 추가
alter table customer modify phone constraint nn_phone null; --drop 이랑 같은 효과
alter table customer drop CONSTRAINT nn_phone; -- 삭제

desc customer;
select * from customer;

-- CHECK
create table emp (
    eno number(4) CONSTRAINT pk_emp_eno PRIMARY key,
    ename varchar2(20),
    salary number(7) CONSTRAINT ck_emp_salary check(salary > 0), -- salary 값이 0 이상일때만 적용
    commission number(7) DEFAULT 0 -- 입력 값 없을시 0입력
);
drop table emp;
insert into emp(eno,ename,salary) VALUES(1, 'kny', 10000);
select * from emp;
desc emp;