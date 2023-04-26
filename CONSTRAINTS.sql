-- ���� ����


-- ������ ���Ἲ ���� ����

--NOT NULL : NULL ��� X
--UNIQUE : �ߺ��� ��� X
--PRIMARY KEY : NULL ��� X, �ߺ��� ��� X
--FOREIGN KEY : �����Ǵ� ���̺��� �÷��� ���� �����ϸ� ���
--CHECK : ������ �������� ���

DESC DEPT;
SELECT * FROM DEPT;

INSERT INTO DEPT
VALUES(NULL,'TEST','TEST');



-- �ܷ�Ű (FOREIGN KEY) : �ٸ� ���̺��� �⺻Ű�� �����Ͽ� �ܷ�Ű�� ����.
-- �����ϴ� ���� : ���� �ִ� �����͸� ����� �� ����.

--�������� Ȯ���� DATA DICTIONARY ���� �� �� ����.
DESC USER_CONSTRAINTS;

SELECT * FROM USER_CONSTRAINTS where table_name = 'USERTABLE';
--CONSTRAINT_TYPE �� 4���� P(PRIMARY KEY) R(FOREIGN KEY) U(UNIQUE) C(CHECK/NOT NULL)�̴�.

-- � �÷��� �ɷ��ִ��� ������ USER_CONS_COLUMNS Ȱ��
SELECT * FROM USER_CONS_COLUMNS;

DROP TABLE EMP03;

CREATE TABLE EMP03
AS
SELECT EMPNO,ENAME,JOB,DEPTNO FROM EMP WHERE 1=0;

INSERT INTO EMP03
VALUES('','','������',30);

SELECT * FROM EMP03;


DROP TABLE EMP04;

CREATE TABLE EMP04(
    EMPNO NUMBER(4) NOT NULL,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2)
    );
    
INSERT INTO EMP04
VALUES('','','������',30);         -- ���� �߻� : NOT NULL ���������� �ֱ� ����.


-- FOREIGN KEY(FK)
--�ܷ�Ű�� �Ǳ� ���� ���� : UNIQUE �Ǵ� �⺻ Ű
--���� �ο� ��� >>>>>>>>>> REFERENCES ���̺��(�÷���) 


INSERT INTO EMP
(EMPNO, ENAME, DEPTNO)              
VALUES(8000,'',66);         --�ܷ� Ű�� DEPTNO�� �θ� �÷��� �������� �ʴ� ���̹Ƿ� ������ �߻��Ѵ�.


-- CHECK : �ԷµǴ� ���� üũ�Ͽ� ������ ��

CREATE TABLE EMP08(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    SAL NUMBER(7,2) CHECK (SAL BETWEEN 200 AND 1000),
    GENDER VARCHAR2(1) CHECK (GENDER IN('M','F')),
    DEPTNO NUMBER(2) REFERENCES DEPT(DEPTNO)
    );
    
    DESC EMP08;
    
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP08';
    

-- DEFAULT : �ƹ� ���� �Է� ������ ���� ������ �� �Է�

-- ���̺���, �÷����� �ΰ��� ���� ���� ���� �ο��� �� ����.

--���̺� �������� �������� �ο��ϴ� ���
--* NOT NULL �� ������ �÷��������� �ۿ� �ο� ����

CREATE TABLE EMP10(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9) UNIQUE,
    DEPTNO NUMBER(4) REFERENCES DEPT(DEPTNO)
    );
    
DESC EMP10;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP10';

--���̺� ���� �ο�
--CONSTRAINT �������Ǹ� ����, .... �� Ȱ��
-- �̸� ���� �� >>>>>>>>> ������ ������� , ���� �ӽ÷� ����ϴ� ��쿡�� ���ص� ��� X


-- �̹� ������ ���̺� �������� �߰��ϱ�
-- ALTER ��ɾ�� ADD ���� �� ����.
-- DROP, MODIFY �� ���������� ��� ����


--���� ���� ��Ȱ��ȭ


--CASCADE >>>>>>>>>>>>>> �ܷ� Ű�� ���������� �Ǿ����� �� �θ� ���̺��� ���� ������
--                            ��Ȱ��ȭ �� �ڽ� ���̺����� ��Ȱ��ȭ �Ǵ� �ɼ�
