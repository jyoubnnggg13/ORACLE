DESC EMP
-- DESC는 테이블 구조를 확인하기 위한 명령어
DESC DEPT





-- NUMBER(전체 자리 수, 소숫점 아래 자리 수)
-- EX)  NUMBER(2)   >>>  2자리 소수점 반올림 
--      NUMBER(7,2) >>> 7자리 소수점 2번째 까지


-- DATE  날짜 데이터를 저장하기 위한 형태 ( YY/MM/DD가 기본 )
-- 19/12/14 >>> 2019년 12월 14일


-- CHAR : 고정 길이 문자 데이터를 저장하기 위한 자료형
-- VARCHAR2 : 가변 길이 문자 데이터 저장하기 위한 자료형
-- EX ) VARCHAR2(20) >>> 20개가 최대 길이지만 적게 들어올 경우 알아서 줄어듦
-- ** 20개가 넘는 문자는 저장이 불가능하다.


-- SELECT [DISTINT] {*, COLUMN[ALIAS]} FROM 테이블명;
-- 괄호 내용은 옵션임 
-- SELECT * FROM DEPT >>>>>>>>>>>> DEPT TABLE에 있는 모든 컬럼을 조회.
--SELECT DEPTNO, DNAME FROM dept; >>>>>>>>>>>> DEPT테이블 내 DEPTNO, DNAME컬럼만 
--조회



SELECT EMPNO,SAL FROM EMP;
SELECT * FROM EMP;

SELECT * FROM DEPT;


SELECT ENAME, SAL, JOB, COMM, SAL*12, SAL*12+COMM FROM EMP;
--NULL은 연산 불가능, 결과 값 > NULL

SELECT ENAME, SAL, JOB, COMM, SAL*12, SAL*12+NVL(COMM, 0) 연봉 FROM EMP;
-- NVL(COMM, 0) >>>>>>>> NULL 일 경우 0을 출력해줌. 
-- NVL(A, B) >>>>>>> A값이 NULL 이라면 B로 치환해준다.

SELECT ENAME AS "이름" FROM EMP;
-- AS >>> 컬럼명만 임시로 바꿔 출력하기 위한 
-- 생략 가능  EX) 컬럼명 옆에 별칭 써주기만 해도 적용 됨.

SELECT ENAME name FROM EMP;
-- NAME으로 컬럼명이 출력됨.
SELECT ENAME "name" FROM EMP;
-- 대소문자 구분은 ""를 생략하면 해주지 않음.


--여러 개 컬럼 연결 시 사용하는 CONCATENATION은 연산자 ||를 쓴다.
SELECT ENAME || ' ===> ' || JOB || ' : ' || SAL FROM EMP;


SELECT DEPTNO FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP; -- 중복을 제거해주는 키워드임.

-- 문제1
SELECT ENAME, SAL, HIREDATE FROM EMP;

SELECT DEPTNO 부서번호, DNAME 부서명 FROM DEPT;

