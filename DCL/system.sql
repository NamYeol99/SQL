-- 11g 버전까지만 
create user user1 IDENTIFIED by 1234 default tablespace users;

-- 12C 이후부터는
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE; --아이디에 C##_계정명 을 안붙이기 위함
create user user1 IDENTIFIED by 1234 default tablespace users;
select * from DBA_users where username = 'DB7';
grant create session to USER1;
grant create table to user1; -- 테이블 만드는 권한
grant resource to user1;
grant connect, resource to user1;

CREATE TABLESPACE MYSPACE DATAFILE 'MY_SPACE' SIZE 2048M AUTOEXTEND ON NEXT 4M
MAXSIZE UNLIMITED LOGGING PERMANENT EXTENT MANAGEMENT LOCAL AUTOALLOCATE BLOCKSIZE 8K SEGMENT SPACE
MANAGEMENT MANUAL FLASHBACK ON;

ALTER USER USER1 DEFAULT TABLESPACE MYSPACE;
    
select * from DBA_users where username = 'USER1';
SELECT * FROM USER_TABLESPACES;


create user user2 IDENTIFIED by 1234; 
select * from dba_users where username = 'USER2'; -- DEFAULT_TABLESPACE = SYSTEM
ALTER USER USER2 DEFAULT TABLESPACE USERS;
select * from dba_users where username = 'USER2';

SELECT * FROM DB7.department;

drop user "USER2" CASCADE; -- 유저 삭제
DROP TABLESPACE MYSPACE CASCADE; --TABLESPACE 삭제
ALTER USER USER1 DEFAULT TABLESPACE USERS; -- TABLESPACE 변경
SELECT * FROM USER_TAB_PRIVS_RECD;
grant create session, resource to user2;
revoke resource from user2;
grant create SYNONYM to user2;
create public SYNONYM utest for user1.test; --SYSTEM이 모두가 사용하는 별칭 생성
select * from utest;
drop public synonym utest
SELECT * FROM SESSION_PRIVS;
