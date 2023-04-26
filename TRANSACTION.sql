-- TRANSACTION                  >> ������ �Ͼ �� ������ ��� ?
-- * ������ ó���� �� ���� >> �� Ŀ�Ժ��� ���� Ŀ�Ա���? 
-- ROLLBACK �� ������ Ŀ�� �ߴ� �������� ���ƿ´�.



DELETE FROM DEPT02
WHERE DEPTNO = 40;

ROLLBACK;

SELECT * FROM DEPT02;

CREATE TABLE DEPT03             -->> DDL ������ �ڵ� Ŀ�� ������ �ѹ��� �Ұ����� ����
AS                                     -- �� �� �ִ�
SELECT * FROM DEPT;

ROLLBACK;

DROP TABLE DEPT03;              -- ��������



-- SAVEPOINT   :  SAVEPOINT�� �����ؼ� SAVEPOINT �� �ѹ��� �� ���� ����
-- ��ɾ� : ROLLBACK TO ���̺�����Ʈ �̸�
-- ����� ���� : SAVEPOINT ���̺�����Ʈ �̸�

SELECT * FROM DEPT02;

DELETE FROM DEPT02
WHERE DEPTNO = 30;

SAVEPOINT C1;

DELETE FROM DEPT02
WHERE DEPTNO = 20;

SAVEPOINT C2;

DELETE FROM DEPT02
WHERE DEPTNO = 10;

SELECT *            -- C1 : ������ ����    C2 : ������ ����  �׳� ROLLBACK : ������ Ŀ��
FROM DEPT02;
ROLLBACK