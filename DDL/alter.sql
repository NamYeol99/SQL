select * from tab;
alter table dept add (reg_date date); -- reg_date column �߰�
alter table dept rename COLUMN REG_DATE to REG; -- reg_date -> reg�� ����
alter table dept modify REG varchar2(20); -- reg Ÿ���� date-> varchar2�� ����
alter table dept drop column reg; -- reg column ����

alter table dept set unused(dno); -- dno column �������� ���ѽ�Ŵ ������ ���������� ����
alter table dept drop unused columns; -- 

rename dept3 to dept2; -- dept3 -> dept2�� ���̺� �� ����

desc dept2;
select * from tab;

select * from user_objects where object_type = 'TABLE';