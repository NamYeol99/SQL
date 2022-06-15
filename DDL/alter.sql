select * from tab;
alter table dept add (reg_date date); -- reg_date column 추가
alter table dept rename COLUMN REG_DATE to REG; -- reg_date -> reg로 변경
alter table dept modify REG varchar2(20); -- reg 타입을 date-> varchar2로 변경
alter table dept drop column reg; -- reg column 제거

alter table dept set unused(dno); -- dno column 제거 
alter table dept drop unused columns; -- 

desc dept;