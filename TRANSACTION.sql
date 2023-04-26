-- TRANSACTION                  >> 변경이 일어날 때 까지의 명령 ?
-- * 데이터 처리의 한 단위 >> 한 커밋부터 다음 커밋까지? 
-- ROLLBACK 시 마지막 커밋 했던 시점으로 돌아온다.



DELETE FROM DEPT02
WHERE DEPTNO = 40;

ROLLBACK;

SELECT * FROM DEPT02;

CREATE TABLE DEPT03             -->> DDL 에서는 자동 커밋 때문에 롤백이 불가능한 것을
AS                                     -- 볼 수 있다
SELECT * FROM DEPT;

ROLLBACK;

DROP TABLE DEPT03;              -- 마찬가지



-- SAVEPOINT   :  SAVEPOINT를 저장해서 SAVEPOINT 로 롤백을 할 수도 있음
-- 명령어 : ROLLBACK TO 세이브포인트 이름
-- 만드는 형식 : SAVEPOINT 세이브포인트 이름

SELECT * FROM DEPT02;

DELETE FROM DEPT02
WHERE DEPTNO = 30;

SAVEPOINT C1;

DELETE FROM DEPT02
WHERE DEPTNO = 20;

SAVEPOINT C2;

DELETE FROM DEPT02
WHERE DEPTNO = 10;

SELECT *            -- C1 : 저장한 시점    C2 : 저장한 시점  그냥 ROLLBACK : 마지막 커밋
FROM DEPT02;
ROLLBACK