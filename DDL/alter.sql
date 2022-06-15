select * from tab;
alter table dept add (reg_date date); -- reg_date column 추가
alter table dept rename COLUMN REG_DATE to REG; -- reg_date -> reg로 변경
alter table dept modify REG varchar2(20); -- reg 타입을 date-> varchar2로 변경
alter table dept drop column reg; -- reg column 제거

alter table dept set unused(dno); -- dno column 논리적으로 제한시킴 실제로 삭제되지는 않음
alter table dept drop unused columns; -- 

rename dept3 to dept2; -- dept3 -> dept2로 테이블 명 변경

desc dept2;
select * from tab;

select * from user_objects where object_type = 'TABLE';