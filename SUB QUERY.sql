-- ���� ����

-->> SELECT �ȿ� ���Ե� SELECT ��
-- �񱳿����� �����ʿ� ���, ��ȣ�� ������� ��.

SELECT DNAME FROM DEPT WHERE DEPTNO = (
SELECT DEPTNO FROM EMP WHERE ENAME = '����'); -->>>>>>>> ��� DEPTNO : 20


-- ������ ���� �μ����� �ٹ��ϴ� ����� �̸��� �μ� ��ȣ ����ϴ� ����
SELECT ENAME, DEPTNO FROM EMP WHERE DEPTNO = 
(SELECT DEPTNO FROM EMP WHERE ENAME = '����');


-- ������ ������ ������ ���� ��� ���
SELECT * FROM EMP WHERE JOB = 
(SELECT JOB FROM EMP WHERE ENAME = '����');


SELECT ENAME, SAL FROM EMP WHERE SAL >= 
(SELECT SAL FROM EMP WHERE ENAME = '����');

-- '����'���� �ٹ��ϴ� ����� �̸�, �޿��� ����Ͻÿ�.
-- �������� Ȱ��
SELECT ENAME, SAL FROM EMP WHERE DEPTNO =
(SELECT DEPTNO FROM DEPT WHERE LOC = '����');

-- JOIN Ȱ��
SELECT ENAME, SAL 
FROM EMP INNER JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO 
WHERE LOC = '����';


SELECT ENAME,SAL 
FROM EMP 
WHERE MGR =
(SELECT EMPNO FROM EMP WHERE ENAME = '�嵿��');


-- ���� �� ���� ����

SELECT ENAME,SAL, DEPTNO
FROM EMP
WHERE DEPTNO IN
(SELECT DISTINCT DEPTNO FROM EMP WHERE SAL >= 400);
-- ���������� ������ ���� ���� ���� �� �� �ִ�.


SELECT ENAME, SAL
FROM EMP
WHERE SAL > ALL
(SELECT SAL FROM EMP WHERE DEPTNO = 30);
-- ALL �� ��� ���� ��ġ�� �� ���̴�.



SELECT ENAME, SAL
FROM EMP
WHERE SAL > ANY
(SELECT SAL FROM EMP WHERE DEPTNO = 30);
-- ANY �� �ϳ� �̻� ��ġ�ϸ� ����.

-- ** ���� �� ���������� �ظ��ϸ� ������ �ʴ� ���� ����.

-- GROUP BY�� ���� Ȱ���� ����
SELECT *
FROM EMP
WHERE SAL + NVL(COMM, 0) IN
(SELECT MAX(SAL + NVL(COMM, 0)) FROM EMP GROUP BY DEPTNO);


SELECT *
FROM DEPT
WHERE DEPTNO IN    
(SELECT DISTINCT DEPTNO FROM EMP WHERE JOB = '����');
-->> �����̶�� ������ ���� ����� DEPTNO�� �� �ϳ��� ���� ���
-->> �� �μ��� ��ȣ �̸� ���� ���


--�����Լ�
SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > 
(SELECT MAX(SAL) FROM EMP WHERE JOB = '����'); -- ��� �� 1��

-- ALL ������ ���
SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > ALL
(SELECT SAL FROM EMP WHERE JOB = '����'); -- ��� �� 3�� 

-- ANY
SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > ANY
(SELECT SAL FROM EMP WHERE JOB = '����');

--����
SELECT ENAME, SAL, JOB
FROM EMP
WHERE SAL > 
(SELECT MIN(SAL) FROM EMP WHERE JOB = '����');