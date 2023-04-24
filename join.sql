--join >>>>>> 두 개 이상의 테이블을 합침
-->> 공통 조건 필요

SELECT * FROM EMP WHERE ENAME = '김사랑';
SELECT * FROM DEPT WHERE DEPTNO = 20;

SELECT ENAME,DEPTNO FROM EMP ORDER BY DEPTNO ASC;

-- equi(inner) >>>> 같음 >>>>>> 조건에 해당하지 않는 건 불러오지 않음 
-- >> 행 수 줄어들 수 있음.

-- outer >>>>> 조건에 해당하지 않아도 불러오기 ?

--**모호한 컬럼만 명시해주면 됨 >>>>>> 안하면 오류남


-- 테이블에도 별칭 부여 가능

-- ANSI JOIN 형태
--SELECT (     ) FROM T1 ( 조인의 종류 ) T2; 의 구조로 사용하면 됨.
--EX) SELECT * FROM EMP CROSS JOIN DEPT; >> EMP와 DEPT 크로스 조인


-- INNER JOIN >>>>>>> ON 절 사용
-->>>>>>> ON 절에 조인 조건 작성하면 됨. WHERE에는 그 외 조건

SELECT ENAME,DNAME FROM EMP INNER JOIN DEPT ON EMP.DEPTNO = DEPT.DEPTNO
WHERE ENAME = '김사랑';
-->>>>>>>>>>>> EMP 와 DEPT를 DEPTNO가 같은 조건으로 INNER JOIN 후 ENAME이 김사랑인 
--행의 정보를 조회

-- 위의 예시처럼 컬럼명 같을 시 USING 쓸 수 있음.


-- ** OUTER JOIN [ LEFT / RIGHT / FULL ] 3가지 존재
-- OUTER 문구 생략 가능.

SELECT * 
FROM DEPT01 A FULL JOIN DEPT02 B ON A.DEPTNO = B.DEPTNO;

--LEFT >> 왼쪽 테이블이 기준 >> 왼쪽의 항목은 다 나옴
--RIGHT >> 오른쪽
-- FULL >> 둘다


--문제 1
SELECT ENAME, HIREDATE FROM EMP INNER JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO
WHERE DEPT.DNAME = '경리부';



--문제 2
SELECT ENAME, SAL FROM EMP INNER JOIN DEPT 
ON EMP.DEPTNO = DEPT.DEPTNO
WHERE DEPT.LOC = '인천';




