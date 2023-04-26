-- DML  : ���̺� �� �����͸� �����ϴ� �����.
-- �� ROLLBACK�� ������.


--SELECT : �����͸� �˻��ϴ� ����



-----------------------------------------------------------------------------------------------------------------
--INSERT : �߰�
--����

--INSERT INTO ���̺��
--(�÷� �̸�, ....)  * ��õ� �÷��� �ش��ϴ� �����ʹ� ����������Ѵ�.
--                  ** �ݵ�� ��� �÷��� ����Ͽ� ������ �ʿ� ������ 
--                  *** NOT NULL�� �÷��� �ݵ�� �����Ͱ� �ԷµǾ���Ѵ� ( ��õ��� ���� �÷��� NULL�� �ԷµǱ� ���� ) 
--VALUES(�÷� ������, ..);

--CREATE TABLE DEPT01
--AS
--SELECT * FROM DEPT WHERE 1=0;     *WHERE 1=0 �������� ������ ������ �� ����.

-- * ��� �÷��� �����͸� �Է��ϴ� ��쿡�� �÷��� ��ø� ������ �� �ִ�
-- EX) INSERT INTO DEPT01       
--        VALUES( A, B, C);        >> ��� �÷��� �����͸� �Է��ϴ� ��쿡 ��� ����


CREATE TABLE SAM01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    SAL NUMBER(7,2)
    );
    

INSERT INTO SAM01
VALUES(1000, '���', '����', 1000);
INSERT INTO SAM01
VALUES(1010, '�ٳ���', '��ȣ��', 1500);
INSERT INTO SAM01
VALUES(1020, '������', '�ǻ�', 2000);


SELECT * FROM SAM01;




-- NULL�� �Է� ���
-- Ư�� �÷��� ����Ͽ� ���� �־��ش� >> ��õ��� ���� �÷����� NULL �Է�
-- VALUES ���� NULL ���� �Է��ϰ� ���� �׸� NULL�� ���� �Է��� �ش� 
-- NULL ���� �� ���ڿ� '' �� �־��൵ �ȴ�.

INSERT INTO SAM01 
(EMPNO, ENAME, SAL)
VALUES(1030, '����', 2500);

INSERT INTO SAM01 
(EMPNO, ENAME, SAL)
VALUES(1040, '����', 25000);


-- ���� ������ Ȱ���� ������ �Է�

CREATE TABLE DEPT02
AS
SELECT * FROM DEPT WHERE 1 = 0;

INSERT INTO DEPT02
SELECT * FROM DEPT;    -- �� ��� ���̺��� ������ ���� ��쿡�� ����� ������.


SELECT * FROM DEPT02;

INSERT INTO SAM01
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO = 10;

SELECT * FROM SAM01;
---------------------------------------------------------------------------------------
--UPDATE : ����

--����
--UPDATE ���̺��
--SET �÷�1 = ��1, �÷�2 = ��2, ...
--WHERE ����;

-- WHERE ���� ���� ��� �ش� �÷��� ��� ���� �����Ѵ�.


UPDATE EMP01
SET 
DEPTNO = 30;

UPDATE EMP01
SET
SAL = SAL*1.1;

SELECT * FROM EMP01;

UPDATE EMP01
SET
HIREDATE = SYSDATE;

-- ���� �÷� �� ���� : SET������ �޸��� �̿��Ͽ� �߰� �ϸ� �ȴ�. 

--EX ) 
--UPDATE EMP01
--SET HIREDATE = SYSDATE, SAL = 600, COMM = 200
--WHERE ENAME = '����ȣ';
SELECT * FROM DEPT01;
UPDATE DEPT01
SET
LOC = 
(SELECT LOC FROM DEPT01 WHERE DEPTNO = 40) -- SET�� ���� �������� ���� ����.
WHERE
DEPTNO = 20;



--------------------------------------------------------------------------------------------------
--DELETE : ����

--����
--DELETE FROM ���̺��
--WHERE ����

-- DELETE���� ���� �����ϴ� ����, WHERE���� ���� ���ǿ� �´� ���� ������ �� ����
-- WHERE�� ������ ��ü ���� �����ع����� ������ ���� �ʿ�.



--* DELETE DROP TRUNCATE �� ����
-- DELETE : �����ʹ� ������ ������ �뷮�� �پ���� ����, �ѹ� ���� 
-- DROP : TABLE ��ü�� ���� , �ѹ� �Ұ���
-- TRUNCATE : ������ �� �ε��� ���� ����, �뷮 �پ��, �ѹ� �Ұ���

--DDL >>>>>>>>> COMMIT, ROLLBACK �ȵ�
--DML >>>>>>>>> COMMIT, ROLLBACK ����

DELETE FROM SAM01
WHERE JOB IS NULL;

SELECT * FROM SAM01; 

DELETE FROM SAM02
WHERE DEPTNO =
(SELECT DEPTNO FROM DEPT WHERE DNAME = '������');

SELECT * FROM SAM02;

SELECT  DISTINCT DNAME, LOC
FROM SAM02 LEFT JOIN DEPT
ON SAM02.DEPTNO = DEPT.DEPTNO;


-----------------------------------------------------------------------------------

--MERGE : �պ�

