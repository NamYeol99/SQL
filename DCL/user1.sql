SELECT * FROM TAB;
SELECT * FROM TEST;
INSERT INTO TEST VALUES('HELLO');
CREATE TABLE TEST2(MEMO VARCHAR2(200));
grant select on user1.test to user2; -- �ڽ��� ��ü�� ��ȸ�� �� �ִ� ���� �ο�
grant select on user1.test to public; -- ��� ����ڿ��� ���� �ο�
revoke select on user1.test from user2; -- ���� ����
SELECT * FROM SESSION_PRIVS; -- ���Ѻ���
select * from utest;