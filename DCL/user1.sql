SELECT * FROM TAB;
SELECT * FROM TEST;
INSERT INTO TEST VALUES('HELLO');
CREATE TABLE TEST2(MEMO VARCHAR2(200));
grant select on user1.test to user2; -- 자신의 객체를 조회할 수 있는 권한 부여
grant select on user1.test to public; -- 모든 사용자에게 권한 부여
revoke select on user1.test from user2; -- 권한 삭제
SELECT * FROM SESSION_PRIVS; -- 권한보기
select * from utest;