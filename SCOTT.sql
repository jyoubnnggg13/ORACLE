DESC EMP
-- DESC�� ���̺� ������ Ȯ���ϱ� ���� ��ɾ�
DESC DEPT





-- NUMBER(��ü �ڸ� ��, �Ҽ��� �Ʒ� �ڸ� ��)
-- EX)  NUMBER(2)   >>>  2�ڸ� �Ҽ��� �ݿø� 
--      NUMBER(7,2) >>> 7�ڸ� �Ҽ��� 2��° ����


-- DATE  ��¥ �����͸� �����ϱ� ���� ���� ( YY/MM/DD�� �⺻ )
-- 19/12/14 >>> 2019�� 12�� 14��


-- CHAR : ���� ���� ���� �����͸� �����ϱ� ���� �ڷ���
-- VARCHAR2 : ���� ���� ���� ������ �����ϱ� ���� �ڷ���
-- EX ) VARCHAR2(20) >>> 20���� �ִ� �������� ���� ���� ��� �˾Ƽ� �پ��
-- ** 20���� �Ѵ� ���ڴ� ������ �Ұ����ϴ�.


-- SELECT [DISTINT] {*, COLUMN[ALIAS]} FROM ���̺��;
-- ��ȣ ������ �ɼ��� 
-- SELECT * FROM DEPT >>>>>>>>>>>> DEPT TABLE�� �ִ� ��� �÷��� ��ȸ.
--SELECT DEPTNO, DNAME FROM dept; >>>>>>>>>>>> DEPT���̺� �� DEPTNO, DNAME�÷��� 
--��ȸ



SELECT EMPNO,SAL FROM EMP;
SELECT * FROM EMP;

SELECT * FROM DEPT;


SELECT ENAME, SAL, JOB, COMM, SAL*12, SAL*12+COMM FROM EMP;
--NULL�� ���� �Ұ���, ��� �� > NULL

SELECT ENAME, SAL, JOB, COMM, SAL*12, SAL*12+NVL(COMM, 0) ���� FROM EMP;
-- NVL(COMM, 0) >>>>>>>> NULL �� ��� 0�� �������. 
-- NVL(A, B) >>>>>>> A���� NULL �̶�� B�� ġȯ���ش�.

SELECT ENAME AS "�̸�" FROM EMP;
-- AS >>> �÷��� �ӽ÷� �ٲ� ����ϱ� ���� 
-- ���� ����  EX) �÷��� ���� ��Ī ���ֱ⸸ �ص� ���� ��.

SELECT ENAME name FROM EMP;
-- NAME���� �÷����� ��µ�.
SELECT ENAME "name" FROM EMP;
-- ��ҹ��� ������ ""�� �����ϸ� ������ ����.


--���� �� �÷� ���� �� ����ϴ� CONCATENATION�� ������ ||�� ����.
SELECT ENAME || ' ===> ' || JOB || ' : ' || SAL FROM EMP;


SELECT DEPTNO FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP; -- �ߺ��� �������ִ� Ű������.

-- ����1
SELECT ENAME, SAL, HIREDATE FROM EMP;

SELECT DEPTNO �μ���ȣ, DNAME �μ��� FROM DEPT;

