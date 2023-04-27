-- INDEX >>>>>>>>>>> 책갈피 ?  >>>>>>>> 검색속도 개선

-- 장점
-- 성능 개선


-- 단점
-- 추가공간필요, 데이터 변경작업이 자주 일어나면 오히려 성능 별로




DROP TABLE EMP01;

CREATE TABLE EMP01
AS
SELECT * FROM EMP;


SELECT TABLE_NAME, INDEX_NAME, COLUMN_NAME
FROM USER_IND_COLUMNS
WHERE TABLE_NAME IN ('EMP','EMP01');
-- 복사된 EMP01에는 제약조건 까지 복사가 되어있지 않기 때문에 원래의 EMP테이블에만 
-- 기본 키에 할당되는 인덱스 존재





INSERT INTO EMP01 SELECT * FROM EMP01;

INSERT INTO EMP01 (EMPNO, ENAME)
VALUES(1111,'홍길동');

SET TIMING ON;


SELECT DISTINCT EMPNO, ENAME
FROM EMP01
WHERE ENAME = '홍길동';

--인덱스 생성 형식
--CREATE INDEX 인덱스명
--ON 테이블명(컬럼명)

CREATE INDEX IDX_EMP01_ENAME
ON EMP01(ENAME);

DROP INDEX IDX_EMP01_ENAME;



--------------------------------------------------------------------------------------

--인덱스를 사용해야 하는 경우                           안되는 경우

-- 행의 수가 많을 때                               행의 수가 적을 때
-- WHERE문에 해당 컬럼이 많이 사용될 때              WHERE문에 해당 컬럼이 자주 사용 안될 때
-- 검색 결과가 전체의 2~4%일 때                       검색 결과가 10~15%를 차지 할 때
--                                               해당 테이블에 DML 작업이 많을 경우





