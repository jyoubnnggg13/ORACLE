--�׷� �Լ�
--**�Ϲ� �÷��� ���� ����� �Ұ����ϴ�.**


--SUM : ��
--AVG : ���
--COUNT : �� ����
--MAX : �ִ밪
--MIN : �ּҰ�


SELECT ENAME, COMM FROM EMP WHERE COMM IS NOT NULL;
SELECT SUM(COMM) "Ŀ�̼� ����" FROM EMP WHERE COMM IS NOT NULL;
SELECT SUM(COMM) "Ŀ�̼� ����" FROM EMP;
SELECT * FROM EMP;

SELECT MAX(SAL) FROM emp;
SELECT MIN(SAL) FROM emp;
SELECT ROUND(AVG(SAL),2) FROM emp;  --�ݿø�

SELECT COMM FROM EMP;
SELECT COUNT(*), COUNT(COMM) FROM EMP;    --NULL�� ���� X      ��� : 4

SELECT COUNT(DISTINCT JOB) FROM EMP;    -- JOB �� ���Ͽ� �ߺ� ���� �� COUNT
--                                                ��� : 6