select * from dept2;
DESC DEPT2;
insert into dept2 values(10,'ACCOUNTING', 40); -- column �߰�
insert into dept2 (DNO,DNAME) values(20,'RESEARCH');
insert into dept2 (DNO) values(30);
alter table dept2 modify dno not null; -- ���༺ null X
insert into dept2 select * from department;
rollback; -- ���� commit �� �������� �����Ѵ�.
commit; -- �ڵ� commit �Ǵ°�� : sql*plus�� ���� ����� ���, DDL�� DCL ��ɹ��� ����� ���
alter table  dept2 add regdate date;
alter table dept2 drop column CLERK;
insert into dept2 values(40,'CLERK', 10, to_date('20220614','yyyymmdd'));
INSERT ALL -- �ѹ��� ������ �����͸� ���� �� ���
INTO DEPT2 VALUES(60, 'A', 10, sysdate)
INTO DEPT2 VALUES(70, 'A', 20, sysdate)
INTO DEPT2 VALUES(80, 'A', 30, sysdate)
INTO DEPT2 VALUES(90, 'A', 40, sysdate)
select* from dual;