SELECT * FROM EMP;
-- �⺻ ����
-- SELECT ( ��ȸ�� COLUMN�� ) FROM ( ��ȸ�� ���̺� �� );


SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL <= 500;
-- WHERE �ڿ� ������ �ٿ��� ���ϴ� �����͸� ������ �� ����

SELECT EMPNO, ENAME, SAL FROM EMP WHERE ENAME = '����ȣ';
SELECT * FROM EMP WHERE ENAME = '����ȣ';
-- ���ڿ� ��ġ ���ǵ� ����

--IN ( A,B,C ) >>>>>> OR�� ���� �� ����.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL = 250 OR SAL = 300 OR SAL = 500;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL IN (250, 300, 500);
-- OR AND�� ���� �񱳿����� ���� ��� ����

--�Ʒ� �� �ڵ�� �Ȱ��� ������ �Ѵ�.
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL != 250 AND SAL != 300 AND SAL !=500;
SELECT EMPNO, ENAME, SAL FROM EMP WHERE SAL NOT IN( 250,300,500);

-- NULL�� ���  A = NULL �� ���� ��� �Ұ��� = ��� IS �� ����Ѵ�.
SELECT * FROM EMP WHERE MGR IS NULL;
SELECT * FROM EMP WHERE COMM IS NOT NULL;

SELECT EMPNO,ENAME, JOB, HIREDATE FROM EMP ORDER BY HIREDATE DESC;
-- ORDER BY �� Ȱ���� Ư�� Į���� �����Ͽ� ����� �� ����


SELECT DEPTNO, EMPNO, ENAME, JOB, HIREDATE FROM EMP ORDER BY DEPTNO ASC, 
HIREDATE ASC;
-- DEPTNO ���� ���� �� ���� ��쿡 HIREDATE�� �������� �����Ѵ�.

SELECT
    * FROM EMP WHERE HIREDATE > '04/01/01';
    
SELECT EMPNO,ENAME, SAL FROM EMP WHERE SAL BETWEEN 300 AND 500;
-- BETWEEN >>>>>>>>300 �̻� 500 ����

SELECT * FROM DEPT;

SELECT ENAME, SAL FROM EMP WHERE DEPTNO = 20 ORDER BY SAL DESC;
-- FROM / WHERE / ORDER BY >> �⺻���� ASC �̴�.





