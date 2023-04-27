-- VIEW >>>>>>>> ���� ���̺�
-- >>>>>>>> �⺻ ���̺��� �Ļ� ���̺���
-- EX) SELECT �Ͽ� Ư�� �÷��� �̾Ƴ��� ���� ���̺��� �⺻ ���̺��� �ƴ϶� ���� ���̺���.

-- ���̺� ���� ���� �� ���������� ���簡 ���� �ʴ´�. ( NOT NULL ���� ���� )

CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPT;

DESC DEPT_COPY;
DESC DEPT;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME IN ( 'DEPT','DEPT_COPY');
--> ����� Ȯ���غ��� PRIMARY KEY�� ���簡 �ȵǾ��ִ� ���� Ȯ���� �� �ִ�.

--�� �����ϱ�
-- CREATE VIEW VIEWNAME                �̰� �⺻�����̸� �������� �ɼ� ����.
-- AS
-- SUBQUERY ( EX) SELECT .... )

-- CREATE OR REPLACE VIEW �� �̿��ϸ� ������ ������ ����������
-- CREATE �� ����ϸ� �Ұ���

-------------------------------------------------------------------------------------
-- FORCE : �⺻ ���̺� ���� ������� �� ����


-- WITH CHECK OPTION : ���� ���� ������ UPDATE �Ǵ� INSERT ����
-- WITH READ ONLY : ��ȸ�� ���� ��, SELECT �� �� ��� ������.
-- �� �ɼǵ��� ������������ ��� �� ����.


-- VIEW�� ��� ���� : ���ŷο� SELECT���� ���� ��ȸ�ؾ��ϴ� ��쿡 �� TABLE ��ü��
--                     �����Ͽ� ���� ��ȸ�� �� �� ����.


--����

CREATE TABLE EMP_COPY
AS
SELECT * FROM EMP;


CREATE VIEW EMP_VIEW30          --�� ���� ����
AS
SELECT EMPNO,ENAME,DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30;

SELECT * FROM EMP_VIEW30; -- �̿� ���� �����ϰ� ��ȸ����

-------------------------------------------------------------------------------------
-- ���� ���� ��
-- CONN SYSTEM/PASSWORD                    �ý��� ������ �����Ͽ�
-- GRANT CREATE VIEW TO USER                ���� �ο�

CREATE VIEW EMP_VIEW20
AS
SELECT EMPNO,ENAME,DEPTNO,MGR
FROM EMP_COPY
WHERE DEPTNO = 20;

SELECT * FROM EMP_VIEW20;

SELECT VIEW_NAME, TEXT FROM USER_VIEWS;   -- VIEW ���ο� � ������ �� �ִ��� Ȯ�� ���� 
--VIEW�� ���������� �����͸� �������� �ʰ� SELECT���� ���ڿ� ���·� ������.

INSERT INTO EMP_VIEW30
VALUES(1111,'AAA',30);      --INSERT�� VIEW�� ���������� �⺻ TABLE�� 
--                                  EMP_COPY�� �����Ͱ� �Էµȴ�.                                                

SELECT * FROM EMP_VIEW30;
SELECT * FROM EMP_COPY; 


---------------------------------------------------------------------------------------

--�ܼ� �� : ���̺� 1, �׷��Լ�/DISTINCT ��� �Ұ�, DML ��� ���� 
--���� �� : ���� ���̺�, �׷��Լ�/DISTINCT ��� ����, DML ��� �Ұ���


INSERT INTO EMP_VIEW30
VALUES(8000,'��õ��',30);

SELECT * FROM EMP_VIEW30;

UPDATE EMP_VIEW30
SET EMPNO = 2222
WHERE ENAME = 'AAA';

DELETE EMP_VIEW30
WHERE EMPNO = 2222;

CREATE OR REPLACE
VIEW EMP_VIEW(�����ȣ,�����,�޿�,�μ���ȣ) --�÷��� ��������
AS
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP_COPY;

SELECT * FROM EMP_VIEW  -- �������ָ� ������ �÷����� ��ӹ��� �ʾƼ� ��Ī�� ����ؾ���.
WHERE �μ���ȣ = 30;

CREATE VIEW VIEW_SAL
AS
SELECT DEPTNO,SUM(SAL) AS "SalSum", AVG(SAL) AS "SalAvg"
FROM EMP_COPY
GROUP BY DEPTNO;


SELECT * FROM VIEW_SAL
ORDER BY DEPTNO ASC;

-- �⺻ ���̺� �Է��� �� ���� ������ �����Ͱ� �Ǿ������ ���� �Ұ�
-- �� ) �׷�ȭ,DISTINCT,NOTNULL���� ��������

CREATE VIEW EMP_DEPT            --������ �� SELECT�� ���� VIEW�� �ۼ� ����.
AS
SELECT EMPNO, ENAME, SAL, DEPT.DEPTNO, DNAME ,LOC
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO DESC;


SELECT * FROM EMP_DEPT; --���� SELECT������ ��� ����� �����ϰ� ���� ��� ���� �� ����.


CREATE VIEW  SAL_VIEW
AS
SELECT DNAME, MAX(SAL) "MAX_SAL", MIN(SAL) "MIN_SAL"    -- �÷��� ���� �ʿ� ?? 
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO
GROUP BY DNAME;

SELECT * FROM SAL_VIEW;

DROP VIEW SAL_VIEW;
DROP VIEW EMP_VIEW30;


CREATE OR REPLACE VIEW EMP_VIEW30
AS
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30;


SELECT * FROM EMP_VIEW30;
--------------------------------------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW EMPLOYEES_VIEW       -- EMPLOYEES��� ���̺��� �������� �ʱ� ������
AS                                          -- ���� �߻�, ���� ������ ���ؼ��� FORCE�ɼ� �����. 
SELECT EMPNO, ENAME, DEPTNO
FROM EMPLOYEES
WHERE DEPTNO = 30;


-------------------------------------------------------------------------------------------------
-- WITH CHECK : Ư�� �÷��� ���� ���� ������ �ִ� �ɼ�
-- READ ONLY : SELECT�� �����ϰ� ��, �������� WITH READ ONLY�� �ٿ��ָ� ��.



-- �ζ��� �� ( ROWNUM Ȱ�� ) , ROWNUM >> �����Ͱ� ���̺� �Էµ� ���� ?? 
-- ���������� N�� ���� �� 

SELECT  ROWNUM, EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;


-- ROWNUM�� �缳���� �ʿ���
CREATE OR REPLACE VIEW VIEW_HIRE        -- ���ο� VIEW�� ����� 
AS                                      -- �����͸� �ٽ� �Է�
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;


SELECT ROWNUM, EMPNO, ENAME, HIREDATE      -- ROWNUM�� �����ĵ� ���� �� �� ����.
FROM VIEW_HIRE                              -- ���ĵ� ROWNUM �� �̿��ϸ� TOP N ���� �� ����.
WHERE ROWNUM <= 5;


--�ζ��� �� >>>>>> FROM ���� ���������� ��ġ�Ͽ� ���̺� ó�� ����ϴ� ��

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM (SELECT EMPNO, ENAME, HIREDATE
        FROM EMP                        -- FROM �� ���� �ʿ��� ���̺� ���������� �ۼ� ��
        ORDER BY HIREDATE)              -- �� FROM���� SELECT �ϸ� ROWNUM �����ĵ�.
WHERE ROWNUM <= 5;


-- ���� 3 
SELECT ROWNUM RANKING, EMPNO, ENAME, SAL
FROM(SELECT EMPNO, ENAME, SAL
        FROM EMP
        ORDER BY SAL DESC)
WHERE ROWNUM <= 3 ;










