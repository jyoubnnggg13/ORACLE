-- DATA DICTIONARY : �ý��ۿ��� ��ü������ �ο��� ���� EX) �ּ� ..
--                      �� Ȯ���ϴ� ����.


-- ��ųʸ� �� : ����ڰ� ���� �����ϵ��� ������ ����

-- ���ξ� 
-- DBA_XXXXXX : �����ͺ��̽� �����ڸ� ���� ������ ��ü ���� ���� ��ȸ
-- ALL_XXXXXX : �ڽ� ���� ���� �Ǵ� ������ �ο� ���� ��ü � ���� ���� ��ȸ
-- USER_XXXXXX : �ڽ��� ������ ������ ��ü � ���� ���� ��ȸ


DESC USER_TABLES;

SELECT TABLE_NAME FROM USER_TABLES ORDER BY TABLE_NAME DESC;
----------------------------------------------------------------------------------------------------------
CREATE TABLE DEPT_MISSION(
    DNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
    );

CREATE TABLE EMP_MISSION(
    ENO NUMBER(4),
    ENAME VARCHAR2(10),
    DNO NUMBER(2)
    );    
    
ALTER TABLE EMP_MISSION
MODIFY (ENAME VARCHAR2(25));
    
DESC DEPT_MISSION;
DESC EMP_MISSION;

DROP TABLE EMP_MISSION;


ALTER TABLE DEPT_MISSION
DROP COLUMN DNAME;

