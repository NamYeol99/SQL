select * from tab;
alter table dept add (reg_date date); -- reg_date column �߰�
alter table dept rename COLUMN REG_DATE to REG; -- reg_date -> reg�� ����
alter table dept modify REG varchar2(20); -- reg Ÿ���� date-> varchar2�� ����
alter table dept drop column reg; -- reg column ����

alter table dept set unused(dno); -- dno column ���� 
alter table dept drop unused columns; -- 

desc dept;