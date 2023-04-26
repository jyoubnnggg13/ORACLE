-- 제약 조건


-- 데이터 무결성 제약 조건

--NOT NULL : NULL 허용 X
--UNIQUE : 중복값 허용 X
--PRIMARY KEY : NULL 허용 X, 중복값 허용 X
--FOREIGN KEY : 참조되는 테이블의 컬럼의 값이 존재하면 허용
--CHECK : 설정한 범위만을 허용

DESC DEPT;
SELECT * FROM DEPT;

INSERT INTO DEPT
VALUES(NULL,'TEST','TEST');



-- 외래키 (FOREIGN KEY) : 다른 테이블의 기본키를 참조하여 외래키로 설정.
-- 설정하는 이유 : 원래 있던 데이터만 사용할 수 있음.

--제약조건 확인은 DATA DICTIONARY 에서 할 수 있음.
DESC USER_CONSTRAINTS;

SELECT * FROM USER_CONSTRAINTS where table_name = 'USERTABLE';
--CONSTRAINT_TYPE 은 4가지 P(PRIMARY KEY) R(FOREIGN KEY) U(UNIQUE) C(CHECK/NOT NULL)이다.

-- 어떤 컬럼에 걸려있는지 보려면 USER_CONS_COLUMNS 활용
SELECT * FROM USER_CONS_COLUMNS;

DROP TABLE EMP03;

CREATE TABLE EMP03
AS
SELECT EMPNO,ENAME,JOB,DEPTNO FROM EMP WHERE 1=0;

INSERT INTO EMP03
VALUES('','','영업부',30);

SELECT * FROM EMP03;


DROP TABLE EMP04;

CREATE TABLE EMP04(
    EMPNO NUMBER(4) NOT NULL,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9),
    DEPTNO NUMBER(2)
    );
    
INSERT INTO EMP04
VALUES('','','영업부',30);         -- 오류 발생 : NOT NULL 제약조건이 있기 때문.


-- FOREIGN KEY(FK)
--외래키가 되기 위한 조건 : UNIQUE 또는 기본 키
--조건 부여 방법 >>>>>>>>>> REFERENCES 테이블명(컬럼명) 


INSERT INTO EMP
(EMPNO, ENAME, DEPTNO)              
VALUES(8000,'',66);         --외래 키인 DEPTNO의 부모 컬럼에 존재하지 않는 값이므로 에러가 발생한다.


-- CHECK : 입력되는 값을 체크하여 제한을 줌

CREATE TABLE EMP08(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    SAL NUMBER(7,2) CHECK (SAL BETWEEN 200 AND 1000),
    GENDER VARCHAR2(1) CHECK (GENDER IN('M','F')),
    DEPTNO NUMBER(2) REFERENCES DEPT(DEPTNO)
    );
    
    DESC EMP08;
    
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP08';
    

-- DEFAULT : 아무 값을 입력 안했을 때의 제약의 값 입력

-- 테이블레벨, 컬럼레벨 두가지 에서 제약 조건 부여할 수 있음.

--테이블 레벨에서 제약조건 부여하는 방법
--* NOT NULL 은 무조건 컬럼레벨에서 밖에 부여 못함

CREATE TABLE EMP10(
    EMPNO NUMBER(4) PRIMARY KEY,
    ENAME VARCHAR2(10) NOT NULL,
    JOB VARCHAR2(9) UNIQUE,
    DEPTNO NUMBER(4) REFERENCES DEPT(DEPTNO)
    );
    
DESC EMP10;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME = 'EMP10';

--테이블 레벨 부여
--CONSTRAINT 제약조건명 내용, .... 을 활용
-- 이름 없을 시 >>>>>>>>> 수정이 어려워짐 , 따라서 임시로 사용하는 경우에는 안해도 상관 X


-- 이미 생성된 테이블에 제약조건 추가하기
-- ALTER 명령어로 ADD 해줄 수 있음.
-- DROP, MODIFY 도 마찬가지로 사용 가능


--제약 조건 비활성화


--CASCADE >>>>>>>>>>>>>> 외래 키로 참조설정이 되어있을 때 부모 테이블의 제약 조건을
--                            비활성화 시 자식 테이블에서도 비활성화 되는 옵션
