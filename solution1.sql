--문제 1

SELECT MAX(SAL), MIN(SAL), ROUND(AVG(SAL),3), SUM(SAL) FROM EMP;


--문제 2 

SELECT JOB, MAX(SAL), MIN(SAL), SUM(SAL), ROUND(AVG(SAL)) FROM EMP GROUP BY JOB;


--문제 3

SELECT JOB, COUNT(EMPNO) FROM EMP GROUP BY JOB;

-- 문제 4

SELECT COUNT(EMPNO) FROM EMP WHERE MGR IS NOT NULL;

-- 문제 5

SELECT MAX(SAL) - MIN(SAL) FROM EMP;

--문제 6
SELECT JOB, MIN(SAL) FROM EMP GROUP BY JOB;

--문제 7

SELECT DEPTNO, COUNT(EMPNO), ROUND(AVG(SAL),2) FROM EMP GROUP BY DEPTNO
ORDER BY DEPTNO ASC;

-- 문제 8
SELECT DEPTNO "부서 번호" ,
DECODE(DEPTNO, 10, '경리부',
            20, '인사부',
            30, '영업부',
            40, '전산부')
            부서명 ,
DECODE(DEPTNO, 10, '서울',
            20, '인천',
            30, '용인',
            40, '수원')
            지역명 , 
COUNT(EMPNO) "직원수", 
ROUND(AVG(SAL),2) "평균 급여" 
FROM EMP GROUP BY DEPTNO
ORDER BY DEPTNO ASC;
        
SELECT * FROM DEPT;

