-- VIEW >>>>>>>> 가상 테이블
-- >>>>>>>> 기본 테이블의 파생 테이블임
-- EX) SELECT 하여 특정 컬럼만 뽑아내서 나온 테이블은 기본 테이블이 아니라 가상 테이블임.

-- 테이블 내용 복사 시 제약조건은 복사가 되지 않는다. ( NOT NULL 조건 제외 )

CREATE TABLE DEPT_COPY
AS
SELECT * FROM DEPT;

DESC DEPT_COPY;
DESC DEPT;

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME IN ( 'DEPT','DEPT_COPY');
--> 결과를 확인해보면 PRIMARY KEY는 복사가 안되어있는 것을 확인할 수 있다.

--뷰 정의하기
-- CREATE VIEW VIEWNAME                이게 기본형태이며 여러가지 옵션 존재.
-- AS
-- SUBQUERY ( EX) SELECT .... )

-- CREATE OR REPLACE VIEW 를 이용하면 구조의 수정이 가능해진다
-- CREATE 만 사용하면 불가능

-------------------------------------------------------------------------------------
-- FORCE : 기본 테이블 존재 상관없이 뷰 생성


-- WITH CHECK OPTION : 뷰의 범위 내에서 UPDATE 또는 INSERT 가능
-- WITH READ ONLY : 조회만 가능 즉, SELECT 문 만 사용 가능함.
-- 이 옵션들이 생략돼있으면 모든 것 가능.


-- VIEW의 사용 이유 : 번거로운 SELECT문을 자주 조회해야하는 경우에 뷰 TABLE 자체로
--                     저장하여 쉽게 조회를 할 수 있음.


--예시

CREATE TABLE EMP_COPY
AS
SELECT * FROM EMP;


CREATE VIEW EMP_VIEW30          --뷰 생성 쿼리
AS
SELECT EMPNO,ENAME,DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30;

SELECT * FROM EMP_VIEW30; -- 이와 같이 간단하게 조회가능

-------------------------------------------------------------------------------------
-- 권한 없을 때
-- CONN SYSTEM/PASSWORD                    시스템 계정에 접속하여
-- GRANT CREATE VIEW TO USER                권한 부여

CREATE VIEW EMP_VIEW20
AS
SELECT EMPNO,ENAME,DEPTNO,MGR
FROM EMP_COPY
WHERE DEPTNO = 20;

SELECT * FROM EMP_VIEW20;

SELECT VIEW_NAME, TEXT FROM USER_VIEWS;   -- VIEW 내부에 어떤 내용이 들어가 있는지 확인 가능 
--VIEW는 실질적으로 데이터를 저장하지 않고 SELECT문을 문자열 형태로 저장함.

INSERT INTO EMP_VIEW30
VALUES(1111,'AAA',30);      --INSERT를 VIEW에 적용했지만 기본 TABLE인 
--                                  EMP_COPY에 데이터가 입력된다.                                                

SELECT * FROM EMP_VIEW30;
SELECT * FROM EMP_COPY; 


---------------------------------------------------------------------------------------

--단순 뷰 : 테이블 1, 그룹함수/DISTINCT 사용 불가, DML 사용 가능 
--복잡 뷰 : 다중 테이블, 그룹함수/DISTINCT 사용 가능, DML 사용 불가능


INSERT INTO EMP_VIEW30
VALUES(8000,'김천사',30);

SELECT * FROM EMP_VIEW30;

UPDATE EMP_VIEW30
SET EMPNO = 2222
WHERE ENAME = 'AAA';

DELETE EMP_VIEW30
WHERE EMPNO = 2222;

CREATE OR REPLACE
VIEW EMP_VIEW(사원번호,사원명,급여,부서번호) --컬럼명 지정가능
AS
SELECT EMPNO,ENAME,SAL,DEPTNO
FROM EMP_COPY;

SELECT * FROM EMP_VIEW  -- 지정해주면 원래의 컬럼명을 상속받지 않아서 별칭을 사용해야함.
WHERE 부서번호 = 30;

CREATE VIEW VIEW_SAL
AS
SELECT DEPTNO,SUM(SAL) AS "SalSum", AVG(SAL) AS "SalAvg"
FROM EMP_COPY
GROUP BY DEPTNO;


SELECT * FROM VIEW_SAL
ORDER BY DEPTNO ASC;

-- 기본 테이블에 입력할 수 없는 형태의 데이터가 되어버리면 조작 불가
-- 예 ) 그룹화,DISTINCT,NOTNULL등의 제약조건

CREATE VIEW EMP_DEPT            --조인을 한 SELECT문 또한 VIEW로 작성 가능.
AS
SELECT EMPNO, ENAME, SAL, DEPT.DEPTNO, DNAME ,LOC
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO
ORDER BY EMPNO DESC;


SELECT * FROM EMP_DEPT; --위의 SELECT쿼리를 뷰로 만들어 간단하게 질의 결과 얻을 수 있음.


CREATE VIEW  SAL_VIEW
AS
SELECT DNAME, MAX(SAL) "MAX_SAL", MIN(SAL) "MIN_SAL"    -- 컬럼명 지정 필요 ?? 
FROM EMP INNER JOIN DEPT
ON EMP.DEPTNO = DEPT.DEPTNO
GROUP BY DNAME;

SELECT * FROM SAL_VIEW;

DROP VIEW SAL_VIEW;
DROP VIEW EMP_VIEW30;


CREATE OR REPLACE VIEW EMP_VIEW30
AS
SELECT EMPNO, ENAME, SAL, COMM, DEPTNO
FROM EMP_COPY
WHERE DEPTNO = 30;


SELECT * FROM EMP_VIEW30;
--------------------------------------------------------------------------------------------------
CREATE OR REPLACE FORCE VIEW EMPLOYEES_VIEW       -- EMPLOYEES라는 테이블이 존재하지 않기 때문에
AS                                          -- 오류 발생, 강제 생성을 위해서는 FORCE옵션 써야함. 
SELECT EMPNO, ENAME, DEPTNO
FROM EMPLOYEES
WHERE DEPTNO = 30;


-------------------------------------------------------------------------------------------------
-- WITH CHECK : 특정 컬럼에 값에 대한 제약을 주는 옵션
-- READ ONLY : SELECT만 가능하게 함, 마지막에 WITH READ ONLY만 붙여주면 됨.



-- 인라인 뷰 ( ROWNUM 활용 ) , ROWNUM >> 데이터가 테이블에 입력된 순서 ?? 
-- 위에서부터 N개 뽑을 때 

SELECT  ROWNUM, EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;


-- ROWNUM의 재설정이 필요함
CREATE OR REPLACE VIEW VIEW_HIRE        -- 새로운 VIEW를 만들어 
AS                                      -- 데이터를 다시 입력
SELECT EMPNO, ENAME, HIREDATE
FROM EMP
ORDER BY HIREDATE;


SELECT ROWNUM, EMPNO, ENAME, HIREDATE      -- ROWNUM이 재정렬된 것을 알 수 있음.
FROM VIEW_HIRE                              -- 정렬된 ROWNUM 을 이용하면 TOP N 뽑을 수 있음.
WHERE ROWNUM <= 5;


--인라인 뷰 >>>>>> FROM 절에 서브쿼리를 위치하여 테이블 처럼 사용하는 것

SELECT ROWNUM, EMPNO, ENAME, HIREDATE
FROM (SELECT EMPNO, ENAME, HIREDATE
        FROM EMP                        -- FROM 절 내에 필요한 테이블 서브쿼리로 작성 후
        ORDER BY HIREDATE)              -- 그 FROM절을 SELECT 하면 ROWNUM 재정렬됨.
WHERE ROWNUM <= 5;


-- 문제 3 
SELECT ROWNUM RANKING, EMPNO, ENAME, SAL
FROM(SELECT EMPNO, ENAME, SAL
        FROM EMP
        ORDER BY SAL DESC)
WHERE ROWNUM <= 3 ;










