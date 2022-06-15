select * from dept2;
DESC DEPT2;
insert into dept2 values(10,'ACCOUNTING', 40); -- column 추가
insert into dept2 (DNO,DNAME) values(20,'RESEARCH');
insert into dept2 (DNO) values(30);
alter table dept2 modify dno not null; -- 제약성 null X
insert into dept2 select * from department;
rollback; -- 이전 commit 한 곳까지만 복구한다.
commit; -- 자동 commit 되는경우 : sql*plus가 정상 종료된 경우, DDL과 DCL 명령문을 수행된 경우
alter table  dept2 add regdate date;
alter table dept2 drop column CLERK;
insert into dept2 values(40,'CLERK', 10, to_date('20220614','yyyymmdd'));
INSERT ALL -- 한번에 여러개 데이터를 넣을 때 사용
INTO DEPT2 VALUES(60, 'A', 10, sysdate)
INTO DEPT2 VALUES(70, 'A', 20, sysdate)
INTO DEPT2 VALUES(80, 'A', 30, sysdate)
INTO DEPT2 VALUES(90, 'A', 40, sysdate)
select* from dual;