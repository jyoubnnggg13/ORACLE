-- DDL



-- CREATE 형식

--CREATE TABLE 테이블명 (
--    COLUMN_NAME1 DATA_TYPE 제약조건
--    COLUMN_NAME2 DATA_TYPE 제약조건
--    )

-- ROWID
-- 행의 위치를 지정하는 주소값
SELECT ROWID, ENAME, EMPNO FROM EMP;



--문제 1 --------------------------------------------------------------------------------------

CREATE TABLE TABLE1(
    EMPNO VARCHAR2(20),
    ENAME VARCHAR2(14),
    HEIGHT NUMBER(5,1),
    ADDRESS VARCHAR2(100),
    PHONE VARCHAR2(20)
    );
    
-- 서브 쿼리를 사용하여 이미 존재하는 테이블과 동일 구조의 테이블 생성 가능-------------------------------
CREATE TABLE EMP02
AS
SELECT * FROM EMP;
--  원하는 컬럼 또는 행만 선택적으로 복사해서 생성 가능

CREATE TABLE EMP03
AS
SELECT EMPNO,ENAME FROM EMP;

CREATE TABLE EMP04
AS
SELECT * FROM EMP WHERE DEPTNO = 10;


SELECT * FROM EMP02;

SELECT * FROM EMP03;

SELECT * FROM EMP04;

-- 데이터를 제외하고 테이블 구조만 복사 또한 가능하다.
-- WHERE 1=0 조건 활용

CREATE TABLE EMP05
AS
SELECT * FROM EMP WHERE 1=0;  --->> WHERE조건을 만족하는 항목이 없으므로 데이터는 복사가 되지 않는다.


SELECT * FROM EMP05;

CREATE TABLE EMP06
AS
SELECT EMPNO, ENAME, SAL FROM EMP;


SELECT * FROM EMP06;


-- 테이블 수정 >>>>>>>>>>> 컬럼의 변화를 의미.------------------------------------------

--ALTER TABLE 테이블 명
--ADD (컬럼명 데이터 타입, );   >>>>> 괄호 생략 가능 

ALTER TABLE EMP01
ADD (JOB VARCHAR2(9));

SELECT * FROM EMP01;

DESC EMP01; -- 테이블 구조 보는 쿼리
----------------------------------------------------------------------------------------

--ALTER TABLE 테이블 명
--MODIFY (컬럼명 데이터 타입, ... );
-- 존재하는 컬럼의 데이터 타입이나 제약사항 등을 변경할 때 사용.
-- 컬럼의 수정은 특별한 경우가 아닐 때에는 사용을 피하도록 하는 것이 좋음.
-- 설계가 중요.

ALTER TABLE EMP01
MODIFY (JOB VARCHAR2(30));

DESC EMP01;
----------------------------------------------------------------------------------------

--컬럼 삭제
--DROP 명령어 사용
--형식은 ADD와 MODIFY와 동일하다

--ALTER TABLE 테이블 명
--DROP COLUMN 컬럼 명
ALTER TABLE EMP01
DROP COLUMN JOB;

DESC EMP01;


----------------------------------------------------------------------------------------

-- SET UNUSED
-- 이 옵션을 지정하면 칼럼을 삭제하는 것이 아닌 사용을 제한할 수 있다.


--테이블 삭제
--DROP TABLE 테이블 명

DROP TABLE EMP01;


-- TRUNCATE >>>>>>>>>>> 모든 데이터 삭제.
-- >>>>> 최초 생성된 초기 상태로 만든다
-- ROLLBACK 불가능
-- 무조건 전체삭제
--형식
--TRUNCATE TABLE 테이블 명

TRUNCATE TABLE EMP06;

SELECT * FROM EMP06; -- 결과 : 생성 초기 상태의 테이블

-- DELETE 와 TRUNCATE 는 다름.

--RENAME 원래이름 TO 새이름 : 테이블명 변경

