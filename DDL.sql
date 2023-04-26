-- DDL



-- CREATE ����

--CREATE TABLE ���̺�� (
--    COLUMN_NAME1 DATA_TYPE ��������
--    COLUMN_NAME2 DATA_TYPE ��������
--    )

-- ROWID
-- ���� ��ġ�� �����ϴ� �ּҰ�
SELECT ROWID, ENAME, EMPNO FROM EMP;



--���� 1 --------------------------------------------------------------------------------------

CREATE TABLE TABLE1(
    EMPNO VARCHAR2(20),
    ENAME VARCHAR2(14),
    HEIGHT NUMBER(5,1),
    ADDRESS VARCHAR2(100),
    PHONE VARCHAR2(20)
    );
    
-- ���� ������ ����Ͽ� �̹� �����ϴ� ���̺�� ���� ������ ���̺� ���� ����-------------------------------
CREATE TABLE EMP02
AS
SELECT * FROM EMP;
--  ���ϴ� �÷� �Ǵ� �ุ ���������� �����ؼ� ���� ����

CREATE TABLE EMP03
AS
SELECT EMPNO,ENAME FROM EMP;

CREATE TABLE EMP04
AS
SELECT * FROM EMP WHERE DEPTNO = 10;


SELECT * FROM EMP02;

SELECT * FROM EMP03;

SELECT * FROM EMP04;

-- �����͸� �����ϰ� ���̺� ������ ���� ���� �����ϴ�.
-- WHERE 1=0 ���� Ȱ��

CREATE TABLE EMP05
AS
SELECT * FROM EMP WHERE 1=0;  --->> WHERE������ �����ϴ� �׸��� �����Ƿ� �����ʹ� ���簡 ���� �ʴ´�.


SELECT * FROM EMP05;

CREATE TABLE EMP06
AS
SELECT EMPNO, ENAME, SAL FROM EMP;


SELECT * FROM EMP06;


-- ���̺� ���� >>>>>>>>>>> �÷��� ��ȭ�� �ǹ�.------------------------------------------

--ALTER TABLE ���̺� ��
--ADD (�÷��� ������ Ÿ��, );   >>>>> ��ȣ ���� ���� 

ALTER TABLE EMP01
ADD (JOB VARCHAR2(9));

SELECT * FROM EMP01;

DESC EMP01; -- ���̺� ���� ���� ����
----------------------------------------------------------------------------------------

--ALTER TABLE ���̺� ��
--MODIFY (�÷��� ������ Ÿ��, ... );
-- �����ϴ� �÷��� ������ Ÿ���̳� ������� ���� ������ �� ���.
-- �÷��� ������ Ư���� ��찡 �ƴ� ������ ����� ���ϵ��� �ϴ� ���� ����.
-- ���谡 �߿�.

ALTER TABLE EMP01
MODIFY (JOB VARCHAR2(30));

DESC EMP01;
----------------------------------------------------------------------------------------

--�÷� ����
--DROP ��ɾ� ���
--������ ADD�� MODIFY�� �����ϴ�

--ALTER TABLE ���̺� ��
--DROP COLUMN �÷� ��
ALTER TABLE EMP01
DROP COLUMN JOB;

DESC EMP01;


----------------------------------------------------------------------------------------

-- SET UNUSED
-- �� �ɼ��� �����ϸ� Į���� �����ϴ� ���� �ƴ� ����� ������ �� �ִ�.


--���̺� ����
--DROP TABLE ���̺� ��

DROP TABLE EMP01;


-- TRUNCATE >>>>>>>>>>> ��� ������ ����.
-- >>>>> ���� ������ �ʱ� ���·� �����
-- ROLLBACK �Ұ���
-- ������ ��ü����
--����
--TRUNCATE TABLE ���̺� ��

TRUNCATE TABLE EMP06;

SELECT * FROM EMP06; -- ��� : ���� �ʱ� ������ ���̺�

-- DELETE �� TRUNCATE �� �ٸ�.

--RENAME �����̸� TO ���̸� : ���̺�� ����

