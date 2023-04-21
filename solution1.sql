--���� 1

SELECT MAX(SAL), MIN(SAL), ROUND(AVG(SAL),3), SUM(SAL) FROM EMP;


--���� 2 

SELECT JOB, MAX(SAL), MIN(SAL), SUM(SAL), ROUND(AVG(SAL)) FROM EMP GROUP BY JOB;


--���� 3

SELECT JOB, COUNT(EMPNO) FROM EMP GROUP BY JOB;

-- ���� 4

SELECT COUNT(EMPNO) FROM EMP WHERE MGR IS NOT NULL;

-- ���� 5

SELECT MAX(SAL) - MIN(SAL) FROM EMP;

--���� 6
SELECT JOB, MIN(SAL) FROM EMP GROUP BY JOB;

--���� 7

SELECT DEPTNO, COUNT(EMPNO), ROUND(AVG(SAL),2) FROM EMP GROUP BY DEPTNO
ORDER BY DEPTNO ASC;

-- ���� 8
SELECT DEPTNO "�μ� ��ȣ" ,
DECODE(DEPTNO, 10, '�渮��',
            20, '�λ��',
            30, '������',
            40, '�����')
            �μ��� ,
DECODE(DEPTNO, 10, '����',
            20, '��õ',
            30, '����',
            40, '����')
            ������ , 
COUNT(EMPNO) "������", 
ROUND(AVG(SAL),2) "��� �޿�" 
FROM EMP GROUP BY DEPTNO
ORDER BY DEPTNO ASC;
        
SELECT * FROM DEPT;

