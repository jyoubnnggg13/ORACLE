--join >>>>>> �� �� �̻��� ���̺��� ��ħ
-->> ���� ���� �ʿ�

SELECT * FROM EMP WHERE ENAME = '����';
SELECT * FROM DEPT WHERE DEPTNO = 20;

SELECT ENAME,DEPTNO FROM EMP ORDER BY DEPTNO ASC;

-- equi(inner) >>>> ���� >>>>>> ���ǿ� �ش����� �ʴ� �� �ҷ����� ���� 
-- >> �� �� �پ�� �� ����.

-- outer >>>>> ���ǿ� �ش����� �ʾƵ� �ҷ����� ?

--**��ȣ�� �÷��� ������ָ� �� >>>>>> ���ϸ� ������


-- ���̺��� ��Ī �ο� ����

-- ANSI JOIN ����
--SELECT (     ) FROM T1 ( ������ ���� ) T2; �� ������ ����ϸ� ��.
--EX) SELECT * FROM EMP CROSS JOIN DEPT; >> EMP�� DEPT ũ�ν� ����


-- INNER JOIN >>>>>>> ON �� ���
-->>>>>>> ON ���� ���� ���� �ۼ��ϸ� ��. WHERE���� �� �� ����

SELECT ENAME,DNAME FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE ENAME = '����';
-->>>>>>>>>>>> EMP �� DEPT�� DEPTNO�� ���� �������� INNER JOIN �� ENAME�� ������ 
--���� ������ ��ȸ

-- ���� ����ó�� �÷��� ���� �� USING �� �� ����.


-- ** OUTER JOIN [ LEFT / RIGHT / FULL ] 3���� ����
-- OUTER ���� ���� ����.

SELECT * 
FROM DEPT01 A FULL JOIN DEPT02 B ON A.DEPTNO = B.DEPTNO;

--LEFT >> ���� ���̺��� ���� >> ������ �׸��� �� ����
--RIGHT >> ������
-- FULL >> �Ѵ�


--���� 1
SELECT ENAME, HIREDATE FROM EMP INNER JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO
WHERE DEPT.DNAME = '�渮��';



--���� 2
SELECT ENAME, SAL FROM EMP INNER JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO
WHERE DEPT.LOC = '��õ';




