create table dept (
    dno number(2),  --constraint pk_d1 primary key,
    dname varchar2(14),
    loc varchar(2)
    --,CONSTRAINT pk_d1 primary key(dno) -- primary key 컬럼 레벨 O, 테이블 레벨 O
);
select * from user_objects where OBJECT_NAME = 'DEPT'; 
drop table dept;
select * from user_constraints where table_name= 'DEPT';
alter table dept add constraint pk_d1 primary key(dno); -- primary key 생성
alter table dept rename CONSTRAINT pk_d1 to pk_d2; -- 기본키명 변경
alter table dept drop constraint pk_d1; -- 기본키 삭제

show recyclebin; -- 휴지통 보기
purge recyclebin; -- 휴지통 지우기
