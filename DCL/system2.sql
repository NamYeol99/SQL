create role myrole;
grant create session, create table, create synonym, create view to myrole;
grant create SEQUENCE to myrole;
drop user USER2 cascade;
create user user1 IDENTIFIED by 1234 default tablespace users;
grant myrole to user1;
select * from user_role_privs;
select * from DBA_ROLE_PRIVS WHERE GRANTEE = 'USER1'; --USER1 ����ڰ� ������ �ִ� ���� Ȯ��
SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'CONNECT'; --CONNECT ���� Ȯ��
SELECT * FROM ROLE_SYS_PRIVS WHERE ROLE = 'MYROLE'; -- MYROLE ��  ���� Ȯ��

REVOKE MYROLE FROM USER1;
GRANT CONNECT TO USER1;
