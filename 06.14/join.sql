select * from loc, department;
select eno, ename, e.dno, dname from employee e, department d where e.dno = d.dno;
select eno, ename, e.dno ,dname from employee e join department d on e.dno=d.dno and ename='KING';

select eno, ename, dno, dname from employee natural join department;
select eno, ename, dno ,dname from employee join department using(dno);
--eno, ename, dno ,dname, loc ,cityname
select eno,ename,e.dno,dname,d.loc,cityname from employee e, department d, loc l where e.dno = d.dno and d.loc=l.loc;
select eno, ename, dno, dname, loc, cityname from employee natural join department natural join loc;
select eno, ename, e.dno, dname, d.loc, cityname from employee e inner join department d  on (e.dno=d.dno) join loc l on(d.loc=l.loc);
select eno, ename, dno, dname, loc, cityname from employee join department using(dno) inner join loc using(loc);




