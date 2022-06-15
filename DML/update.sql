
update dept2 set dname = 'MANAGER' where dno = 60; -- dno가 60인 dname을 CLERK으로 변경
update dept2 set dname = 'CLERK' where dno = 30;
update dept2 set dname = 'DEVELOPER' where dno in(
    select dno from dept2 where dname = 'A');
update dept2 set loc = 10 where loc is null;
update dept2 set regdate = sysdate where regdate is null;

select * from dept2;