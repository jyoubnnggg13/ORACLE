-- �� ��ȯ �Լ�

TO_CHAR(DATE, 'YYYY/MM/DD');

-- ��¥ >>>>>>> ����
SELECT ENAME , TO_CHAR(HIREDATE, 'YY/MON/DD DY')�Ի��� FROM EMP ORDER BY
HIREDATE ASC;

SELECT HIREDATE, TO_CHAR(HIREDATE, 'YY/MM/DD DY') FROM EMP;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

-- ���� >>>>>> ��¥
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE = TO_DATE('20040108','YYYYMMDD');

SELECT TRUNC(SYSDATE - TO_DATE('2023/01/01','YYYY/MM/DD')) FROM DUAL;

-- ���� >>>>>>>>> ����
SELECT TO_NUMBER('20000','99999') - TO_NUMBER('10000','9999999')
  FROM DUAL;

-- SWITCH���� ���� ���
--DECODE(ǥ����, ����1, ���1,
   --             ����2, ���2,
 --               �⺻��� N
--                )


-- DECODE ����
SELECT ENAME, DEPTNO, DECODE(DEPTNO, 10, 'ACCOUNTING',
                                    20, 'RESEARCH',
                                    30, 'SALES',
                                    40, 'OPERATIONS')
                                    �μ���
                                    FROM EMP;
                                    
                                    
                                    
-- CASE >>>>>> IF ELSE �� ���� ������

-- CASE ǥ���� WHEN ����1 THEN ���1
--               WHEN ����2 THEN ���2
 --               ELSE ��� N
                
--            END

--����
SELECT ENAME, DEPTNO, CASE
WHEN DEPTNO=10 THEN 'ACCOUNTING'
WHEN DEPTNO=20 THEN 'RESEARCHING'
WHEN DEPTNO=30 THEN 'SALES'
WHEN DEPTNO=40 THEN 'OPERATIONS'
END
�μ���
FROM EMP;

--NVL
-- NULL ���� ġȯ�ϴ� �Լ�  ** �÷� �� ���� �ٲ�°� �ƴ�

SELECT * FROM EMP;
SELECT EMPNO,ENAME, SAL*12+NVL(COMM, 0) FROM EMP;
--����1
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, SUBSTR('YYMMDD',3,2)) = '10';
--����2
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, SUBSTR('YYYYMMDD',1,4)) = '2003';
--����3
SELECT * FROM EMP WHERE SUBSTR(ENAME, -1,1) = '��';
SELECT * FROM EMP WHERE ENAME LIKE '%��';
--����4
SELECT EMPNO �����ȣ, ENAME �̸�, JOB ����, SAL �޿�, 
            DECODE(JOB, '����', SAL*1.05,
                        '����', SAL*1.1,
                        '�븮', SAL*1.15,
                        '���', SAL*1.2,
                        SAL)
                        "�λ�޿�(UPSAL)"
                        FROM EMP;
  
SELECT EMPNO, ENAME, JOB, SAL, 
CASE
WHEN JOB = '����' THEN SAL*1.05
WHEN JOB = '����' THEN SAL*1.1
WHEN JOB = '�븮' THEN SAL*1.15
WHEN JOB = '���' THEN SAL*1.2
ELSE SAL
END
�λ�޿�
FROM EMP;
                        
--����5
SELECT ENAME, HIREDATE �Ի���,TO_CHAR(HIREDATE, 'YYYY/MON/DD')�����Ի��� FROM EMP
ORDER BY HIREDATE ASC;

                        
