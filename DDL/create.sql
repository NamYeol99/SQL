create table dept(dno number(2,0), dname varchar(14), loc varchar(13));
desc dept;
select * from dept;
create table dept2 as select * from department; --table 복사, subquery 사용
select * from dept2;
create table dept3 as select * from department where 1=0; --table 복사, 구조는 복사 되지만 내용은 복사안됨, subquery 사용
select * from dept3;

comment on table dept is 'department';
select * from user_tab_comments where table_name = 'DEPT'; -- table comments 확인

comment on column dept.dno is '부서번호'; -- column에 comment 달기
comment on column dept.dname is '부서명';
comment on column dept.loc is '지역코드';
select * from user_col_comments where table_name = 'DEPT'; -- column comments 확인

select * from tab; -- 테이블 보기
select * from user_tables; -- 사용자가 만든 테이블 보기
select * from dba_tables; -- 권한 없어서 실행 X
select * from all_tables;
SELECT * FROM USER_ROLE_PRIVS; -- 권한 보기

truncate table  dept2; --column 잘라내기
drop table dept2;
drop table dept;
select * from dept2; 

