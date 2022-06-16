--1. employee 테이블의 구조를 복사하여 emp_copy란 테이블을 만들고,
-- 사원번호에 my_emp_pk 라는 primary key를 생성한다.  
create table emp_copy as select * from employee where 1=0;
alter table emp_copy add CONSTRAINT my_emp_pk PRIMARY key(eno,dno); 
alter table emp_copy drop CONSTRAINT my_emp_pk;

--2. 위의 제약조건을 검색하기 위한 쿼리를 작성하시오.
select * from user_objects;
select * from user_constraints where constraint_name = 'MY_EMP_PK';
desc emp_copy;

--3. employee 테이블의 커미션 컬럼에 0보다 큰 값만을 입력하도록 제약조건을 지정하시오.
alter table emp_copy add CONSTRAINT ck_emp_com check(COMMISSION > 0);

--4. department 테이블의 구조를 복사하여 dep_copy란 테이블을 만들고 emp_copy 테이블과 외래키를 cascade로 설정하라
create table dep_copy as select * from department;

alter table dep_copy add CONSTRAINT fk_dep FOREIGN key(dno) REFERENCES emp_copy(dno) on delete CASCADE;
select * from user_constraints where constraint_name = 'fk_dep';
desc dep_copy;
select * from emp_copy;
select * from dep_copy;