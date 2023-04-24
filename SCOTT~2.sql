--그룹 함수
--**일반 컬럼과 같이 사용이 불가능하다.**


--SUM : 합
--AVG : 평균
--COUNT : 총 개수
--MAX : 최대값
--MIN : 최소값


SELECT ENAME, COMM FROM EMP WHERE COMM IS NOT NULL;
SELECT SUM(COMM) "커미션 총합" FROM EMP WHERE COMM IS NOT NULL;
SELECT SUM(COMM) "커미션 총합" FROM EMP;
SELECT * FROM EMP;

SELECT MAX(SAL) FROM emp;
SELECT MIN(SAL) FROM emp;
SELECT ROUND(AVG(SAL),2) FROM emp;  --반올림

SELECT COMM FROM EMP;
SELECT COUNT(*), COUNT(COMM) FROM EMP;    --NULL은 집계 X      결과 : 4

SELECT COUNT(DISTINCT JOB) FROM EMP;    -- JOB 에 대하여 중복 제거 후 COUNT
--                                                결과 : 6