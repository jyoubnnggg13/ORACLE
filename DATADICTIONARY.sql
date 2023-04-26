-- DATA DICTIONARY : 시스템에서 자체적으로 부여한 정보 EX) 주소 ..
--                      를 확인하는 수단.


-- 딕셔너리 뷰 : 사용자가 이해 가능하도록 데이터 산출

-- 접두어 
-- DBA_XXXXXX : 데이터베이스 관리자만 접근 가능한 객체 등의 정보 조회
-- ALL_XXXXXX : 자신 계정 소유 또는 권한을 부여 받은 객체 등에 관한 정보 조회
-- USER_XXXXXX : 자신의 계정이 소유한 객체 등에 관한 정보 조회


DESC USER_TABLES;

SELECT TABLE_NAME FROM USER_TABLES ORDER BY TABLE_NAME DESC;
----------------------------------------------------------------------------------------------------------
CREATE TABLE DEPT_MISSION(
    DNO NUMBER(2),
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13)
    );

CREATE TABLE EMP_MISSION(
    ENO NUMBER(4),
    ENAME VARCHAR2(10),
    DNO NUMBER(2)
    );    
    
ALTER TABLE EMP_MISSION
MODIFY (ENAME VARCHAR2(25));
    
DESC DEPT_MISSION;
DESC EMP_MISSION;

DROP TABLE EMP_MISSION;


ALTER TABLE DEPT_MISSION
DROP COLUMN DNAME;

