SELECT * FROM USER1.TEST; --user1 ��ü ����
create SYNONYM UTEST FOR USER1.TEST; 
select * from utest; -- SYNONYM ���

SELECT * FROM SESSION_PRIVS; -- ���Ѻ���
SELECT * FROM USER_TAB_PRIVS_RECD;