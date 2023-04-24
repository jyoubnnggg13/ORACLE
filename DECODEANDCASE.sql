-- 형 변환 함수

TO_CHAR(DATE, 'YYYY/MM/DD');

-- 날짜 >>>>>>> 문자
SELECT ENAME , TO_CHAR(HIREDATE, 'YY/MON/DD DY')입사일 FROM EMP ORDER BY
HIREDATE ASC;

SELECT HIREDATE, TO_CHAR(HIREDATE, 'YY/MM/DD DY') FROM EMP;

SELECT SYSDATE, TO_CHAR(SYSDATE, 'YYYY-MM-DD') FROM DUAL;

-- 문자 >>>>>> 날짜
SELECT ENAME, HIREDATE FROM EMP WHERE HIREDATE = TO_DATE('20040108','YYYYMMDD');

SELECT TRUNC(SYSDATE - TO_DATE('2023/01/01','YYYY/MM/DD')) FROM DUAL;

-- 문자 >>>>>>>>> 숫자
SELECT TO_NUMBER('20000','99999') - TO_NUMBER('10000','9999999')
  FROM DUAL;

-- SWITCH문과 같은 기능
--DECODE(표현식, 조건1, 결과1,
   --             조건2, 결과2,
 --               기본결과 N
--                )


-- DECODE 예시
SELECT ENAME, DEPTNO, DECODE(DEPTNO, 10, 'ACCOUNTING',
                                    20, 'RESEARCH',
                                    30, 'SALES',
                                    40, 'OPERATIONS')
                                    부서명
                                    FROM EMP;
                                    
                                    
                                    
-- CASE >>>>>> IF ELSE 와 유사 구조임

-- CASE 표현식 WHEN 조건1 THEN 결과1
--               WHEN 조건2 THEN 결과2
 --               ELSE 결과 N
                
--            END

--예시
SELECT ENAME, DEPTNO, CASE
WHEN DEPTNO=10 THEN 'ACCOUNTING'
WHEN DEPTNO=20 THEN 'RESEARCHING'
WHEN DEPTNO=30 THEN 'SALES'
WHEN DEPTNO=40 THEN 'OPERATIONS'
END
부서명
FROM EMP;

--NVL
-- NULL 값을 치환하는 함수  ** 컬럼 내 값이 바뀌는게 아님

SELECT * FROM EMP;
SELECT EMPNO,ENAME, SAL*12+NVL(COMM, 0) FROM EMP;
--문제1
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, SUBSTR('YYMMDD',3,2)) = '10';
--문제2
SELECT * FROM EMP WHERE TO_CHAR(HIREDATE, SUBSTR('YYYYMMDD',1,4)) = '2003';
--문제3
SELECT * FROM EMP WHERE SUBSTR(ENAME, -1,1) = '기';
SELECT * FROM EMP WHERE ENAME LIKE '%기';
--문제4
SELECT EMPNO 사원번호, ENAME 이름, JOB 직급, SAL 급여, 
            DECODE(JOB, '부장', SAL*1.05,
                        '과장', SAL*1.1,
                        '대리', SAL*1.15,
                        '사원', SAL*1.2,
                        SAL)
                        "인상급여(UPSAL)"
                        FROM EMP;
  
SELECT EMPNO, ENAME, JOB, SAL, 
CASE
WHEN JOB = '부장' THEN SAL*1.05
WHEN JOB = '과장' THEN SAL*1.1
WHEN JOB = '대리' THEN SAL*1.15
WHEN JOB = '사원' THEN SAL*1.2
ELSE SAL
END
인상급여
FROM EMP;
                        
--문제5
SELECT ENAME, HIREDATE 입사일,TO_CHAR(HIREDATE, 'YYYY/MON/DD')변경입사일 FROM EMP
ORDER BY HIREDATE ASC;

                        
