CREATE SEQUENCE USER_SEQ START WITH 1 INCREMENT BY 1;   --시퀀스 생성 쿼리

DROP SEQUENCE USER_SEQ;

--2. 회원 테이블을 생성하시오. [ userTable ]
--* 필드
--1. 회원번호(숫자)		userNo PK 시퀀스
--2. 회원ID(문자-20)		userId 필수 중복 안 됨
--3. 회원비밀번호(문자-20)	userPw 필수
--4. 회원연락처(문자-20)	userTel 중복 안 됨
--5. 회원멤버쉽(문자-10)	userMembership gold / silver / bronze 중 하나
--6. 회원이메일(문자-20)	userEmail 중복 안 됨
--7. 회원포인트(숫자)		userPoint 기본 1000점
--8. 회원가입일(날짜)		joinDate 기본 현재 날짜


CREATE TABLE userTable(
    userNo number(10),
    userId varchar2(20) not null,
    userPw varchar2(20) not null,
    userTel varchar2(20),
    userMembership varchar2(10) CHECK (userMembership in ('gold','silver','bronze')),
    userEmail varchar2(20),
    userPoint number(10) DEFAULT 1000 ,
    joinDate Date DEFAULT SYSDATE ,
    CONSTRAINT PK_USER PRIMARY KEY(userNo),
    CONSTRAINT id_u unique(userId),
    CONSTRAINT tel_u unique(userTel),
    CONSTRAINT email_u unique (userEmail)
    );
DESC USERTABLE;    

insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id01', '1111', '010-1111-1111', 'gold', 'id01@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id02', '1111', '010-1111-2222', 'silver', 'id02@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id03', '1111', '010-1111-3333', 'bronze', 'id03@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id04', '1111', '010-1111-4444', 'gold', 'id04@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id05', '1111', '010-1111-5555', 'silver', 'id05@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id06', '1111', '010-1111-6666', 'bronze', 'id06@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id07', '1111', '010-1111-7777', 'gold', 'id07@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id08', '1111', '010-1111-8888', 'silver', 'id08@aa.com');
insert into userTable (userNo, userId, userPw, userTel, userMembership, userEmail) values (user_seq.nextval, 'id09', '1111', '010-1111-9999', 'bronze', 'id09@aa.com');


DROP TABLE USERTABLE;
SELECT * FROM USERTABLE;

--1) userNo 이 5 이상인 회원을 검색하시오.
--2) userNo 이 3 ~ 7 사이인 회원을 검색하시오.
--3) userTel 마지막 4자리가 '5555' 인 회원을 검색하시오.
--4) userMembership 이 'gold' 인 회원의 userPoint 평균을 출력하시오. 
--5) userId 가 'id03' 인 회원의 joinDate 를 '2019/10/28/'로 수정하시오.
--6) userMembership 이 'gold' 인 회원들의 userPoint 를 모두 3배 증가시키시오.
--7) userId 가 'id08' 인 회원의 userPw 를 '2222'로 수정하시오.
--8) userMembership 이 'bronze' 인 회원들 중에서 userPoint 가 1000 이상인 회원들의 userMembership 을 'silver'로 수정하시오.
--9) userNo 가 5 인 회원을 삭제하시오.

SELECT * FROM USERTABLE WHERE USERNO >= 5;

SELECT * FROM USERTABLE WHERE USERNO BETWEEN 3 AND 7;

SELECT * FROM USERTABLE WHERE USERTEL LIKE '%6666';
SELECT * FROM USERTABLE WHERE SUBSTR(USERTEL, -4,4) = '6666';   --LIKE말고 SUBSTR 활용

SELECT USERMEMBERSHIP, avg(userpoint)  -- 모든 등급의 평균 포인트
FROM USERTABLE 
GROUP BY USERMEMBERSHIP;

UPDATE USERTABLE
SET JOINDATE = '19/10/28'
WHERE USERID = 'id03';

update usertable
set userpoint = userpoint*3
where usermembership = 'gold';

update usertable
set userpw = '2222'
where userid = 'id08';

update usertable
set usermembership = 'silver'
where
(usermembership = 'bronze' and userpoint >= 1000);

delete from usertable
where userno = 5;

select * from usertable;