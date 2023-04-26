-- DML  : 테이블 내 데이터를 조작하는 언어임.
-- ㄴ ROLLBACK이 가능함.


--SELECT : 데이터를 검색하는 역할



-----------------------------------------------------------------------------------------------------------------
--INSERT : 추가
--형식

--INSERT INTO 테이블명
--(컬럼 이름, ....)  * 명시된 컬럼에 해당하는 데이터는 기입해줘야한다.
--                  ** 반드시 모든 컬럼을 명시하여 기입할 필요 없으나 
--                  *** NOT NULL인 컬럼은 반드시 데이터가 입력되어야한다 ( 명시되지 않은 컬럼은 NULL이 입력되기 때문 ) 
--VALUES(컬럼 데이터, ..);

--CREATE TABLE DEPT01
--AS
--SELECT * FROM DEPT WHERE 1=0;     *WHERE 1=0 조건으로 구조만 복사할 수 있음.

-- * 모든 컬럼에 데이터를 입력하는 경우에는 컬럼명 명시를 생략할 수 있다
-- EX) INSERT INTO DEPT01       
--        VALUES( A, B, C);        >> 모든 컬럼에 데이터를 입력하는 경우에 사용 가능


CREATE TABLE SAM01(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR2(9),
    SAL NUMBER(7,2)
    );
    

INSERT INTO SAM01
VALUES(1000, '사과', '경찰', 1000);
INSERT INTO SAM01
VALUES(1010, '바나나', '간호사', 1500);
INSERT INTO SAM01
VALUES(1020, '오렌지', '의사', 2000);


SELECT * FROM SAM01;




-- NULL값 입력 방법
-- 특정 컬럼만 명시하여 값을 넣어준다 >> 명시되지 않은 컬럼에는 NULL 입력
-- VALUES 내에 NULL 값을 입력하고 싶은 항목에 NULL을 직접 입력해 준다 
-- NULL 말고 빈 문자열 '' 을 넣어줘도 된다.

INSERT INTO SAM01 
(EMPNO, ENAME, SAL)
VALUES(1030, '베리', 2500);

INSERT INTO SAM01 
(EMPNO, ENAME, SAL)
VALUES(1040, '망고', 25000);


-- 서브 쿼리를 활용한 데이터 입력

CREATE TABLE DEPT02
AS
SELECT * FROM DEPT WHERE 1 = 0;

INSERT INTO DEPT02
SELECT * FROM DEPT;    -- 이 경우 테이블의 구조가 같은 경우에만 사용이 가능함.


SELECT * FROM DEPT02;

INSERT INTO SAM01
SELECT EMPNO, ENAME, JOB, SAL FROM EMP WHERE DEPTNO = 10;

SELECT * FROM SAM01;
---------------------------------------------------------------------------------------
--UPDATE : 수정

--형식
--UPDATE 테이블명
--SET 컬럼1 = 값1, 컬럼2 = 값2, ...
--WHERE 조건;

-- WHERE 절이 없는 경우 해당 컬럼의 모든 행을 수정한다.


UPDATE EMP01
SET 
DEPTNO = 30;

UPDATE EMP01
SET
SAL = SAL*1.1;

SELECT * FROM EMP01;

UPDATE EMP01
SET
HIREDATE = SYSDATE;

-- 다중 컬럼 값 수정 : SET절에서 콤마를 이용하여 추가 하면 된다. 

--EX ) 
--UPDATE EMP01
--SET HIREDATE = SYSDATE, SAL = 600, COMM = 200
--WHERE ENAME = '오지호';
SELECT * FROM DEPT01;
UPDATE DEPT01
SET
LOC = 
(SELECT LOC FROM DEPT01 WHERE DEPTNO = 40) -- SET절 또한 서브쿼리 응용 가능.
WHERE
DEPTNO = 20;



--------------------------------------------------------------------------------------------------
--DELETE : 삭제

--형식
--DELETE FROM 테이블명
--WHERE 조건

-- DELETE문은 행을 삭제하는 쿼리, WHERE절을 통해 조건에 맞는 행을 삭제할 수 있음
-- WHERE절 없으면 전체 행을 삭제해버리기 때문에 주의 필요.



--* DELETE DROP TRUNCATE 의 차이
-- DELETE : 데이터는 삭제가 되지만 용량이 줄어들지 않음, 롤백 가능 
-- DROP : TABLE 자체를 삭제 , 롤백 불가능
-- TRUNCATE : 데이터 및 인덱스 전부 삭제, 용량 줄어듦, 롤백 불가능

--DDL >>>>>>>>> COMMIT, ROLLBACK 안됨
--DML >>>>>>>>> COMMIT, ROLLBACK 존재

DELETE FROM SAM01
WHERE JOB IS NULL;

SELECT * FROM SAM01; 

DELETE FROM SAM02
WHERE DEPTNO =
(SELECT DEPTNO FROM DEPT WHERE DNAME = '영업부');

SELECT * FROM SAM02;

SELECT  DISTINCT DNAME, LOC
FROM SAM02 LEFT JOIN DEPT
ON SAM02.DEPTNO = DEPT.DEPTNO;


-----------------------------------------------------------------------------------

--MERGE : 합병

