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

-- GROUP BY : �׷� �Լ��� � �÷� ���� �������� �׷� �Լ��� ������ ��쿡 ����.
--SELECT �÷���, �׷��Լ�
--FROM ���̺��
--WHERE ����
--GROUP BY �÷���;
--�� �������� ��� ��.

SELECT DEPTNO FROM EMP GROUP BY DEPTNO;        --DEPTNO�� �������� �׷����
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO ASC ;
SELECT DEPTNO, ENAME, SAL FROM EMP ORDER BY DEPTNO ASC;

SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB;
SELECT JOB, SUM(SAL) FROM EMP GROUP BY JOB ORDER BY SUM(SAL) DESC;

SELECT * FROM EMP;
-- HAVING >>>>>>>>>> GROUP BY ������
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO HAVING AVG(SAL) >= 500;
-->> DEPTNO �������� �׷��� ���� ���� ����� HAVING ���ǿ� �ش��ϴ� ���븸 ��� 
--** ������ �߿���
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;
SELECT DEPTNO, AVG(SAL) FROM EMP WHERE SAL > 300 GROUP BY DEPTNO;
-->>>> SAL �� 300 �ʰ��ϴ� �������� DEPTNO �׷�ȭ �� ������
SELECT DEPTNO, MAX(SAL), MIN(SAL) FROM EMP GROUP BY DEPTNO 
HAVING MAX(SAL) <= 500;




