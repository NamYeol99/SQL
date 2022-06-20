create table dept (
    dno number(2), 
    dname varchar2(14),
    -- loc varchar(2) constraint fk_dept_loc REFERENCES LOC2 (LOC)
    --constraint fk_dept_loc foreign key(loc) REFERENCES LOC (LOC)-- foreign key 컬럼 레벨 O, 테이블 레벨 O
);
create table loc2 as SELECT * from loc;
create table dept as select * from department;
alter table loc2 add constraint pk_loc2 primary key(loc); -- primary key 생성
alter table dept add CONSTRAINT fk_dept_loc FOREIGN key (loc) REFERENCES loc2(loc) on delete set null; --제약사항 추가시 삭제후 다시 생성 해야됨
alter table dept drop CONSTRAINT fk_dept_loc;
select * from dept; 
select * from loc2;
delete from loc2 where loc= 20;
drop table dept;
drop table loc2;

select * from user_objects; -- 외래키는 검색 결과에 안나옴 constraints 사용
select * from user_constraints where table_name= 'DEPT';

alter table dept add constraint fk_dept_loc foreign key(loc) REFERENCES LOC (LOC); -- 외래키 추가
alter table dept rename CONSTRAINT fk_dept_loc to fk_dept_loc2; -- 외래키명 변경
alter table dept drop constraint fk_dept_loc; -- 외래키 삭제
alter table dept modify CONSTRAINT fk_dept_loc REFERENCES department(dno);




