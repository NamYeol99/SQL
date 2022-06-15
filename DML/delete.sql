delete dept2 where  dno = 90;
select * from dept2;
create table dept3 as select * from department;
select * from dept3;
rollback;
