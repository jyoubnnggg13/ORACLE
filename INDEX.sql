-- INDEX >>>>>>>>>>> å���� ?  >>>>>>>> �˻��ӵ� ����

-- ����
-- ���� ����


-- ����
-- �߰������ʿ�, ������ �����۾��� ���� �Ͼ�� ������ ���� ����




DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT * FROM EMP;


SELECT TABLE_NAME, INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN ('EMP','EMP01');
-- ����� EMP01���� �������� ���� ���簡 �Ǿ����� �ʱ� ������ ������ EMP���̺��� 
-- �⺻ Ű�� �Ҵ�Ǵ� �ε��� ����





INSERT INTO EMP01 SELECT * FROM EMP01;

INSERT INTO EMP01 (EMPNO, ENAME)
VALUES(1111,'ȫ�浿');

SET TIMING ON;


SELECT DISTINCT EMPNO, ENAME
FROM EMP01
WHERE ENAME = 'ȫ�浿';

--�ε��� ���� ����
--CREATE INDEX �ε�����
--ON ���̺��(�÷���)

CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);

DROP INDEX IDX_EMP01_ENAME;



--------------------------------------------------------------------------------------

--�ε����� ����ؾ� �ϴ� ���                           �ȵǴ� ���

-- ���� ���� ���� ��                               ���� ���� ���� ��
-- WHERE���� �ش� �÷��� ���� ���� ��              WHERE���� �ش� �÷��� ���� ��� �ȵ� ��
-- �˻� ����� ��ü�� 2~4%�� ��                       �˻� ����� 10~15%�� ���� �� ��
--                                               �ش� ���̺� DML �۾��� ���� ���





