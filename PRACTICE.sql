CREATE SEQUENCE USER_SEQ START WITH 1 INCREMENT BY 1;   --������ ���� ����

DROP SEQUENCE USER_SEQ;

--2. ȸ�� ���̺��� �����Ͻÿ�. [ userTable ]
--* �ʵ�
--1. ȸ����ȣ(����)		userNo PK ������
--2. ȸ��ID(����-20)		userId �ʼ� �ߺ� �� ��
--3. ȸ����й�ȣ(����-20)	userPw �ʼ�
--4. ȸ������ó(����-20)	userTel �ߺ� �� ��
--5. ȸ�������(����-10)	userMembership gold / silver / bronze �� �ϳ�
--6. ȸ���̸���(����-20)	userEmail �ߺ� �� ��
--7. ȸ������Ʈ(����)		userPoint �⺻ 1000��
--8. ȸ��������(��¥)		joinDate �⺻ ���� ��¥


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

--1) userNo �� 5 �̻��� ȸ���� �˻��Ͻÿ�.
--2) userNo �� 3 ~ 7 ������ ȸ���� �˻��Ͻÿ�.
--3) userTel ������ 4�ڸ��� '5555' �� ȸ���� �˻��Ͻÿ�.
--4) userMembership �� 'gold' �� ȸ���� userPoint ����� ����Ͻÿ�. 
--5) userId �� 'id03' �� ȸ���� joinDate �� '2019/10/28/'�� �����Ͻÿ�.
--6) userMembership �� 'gold' �� ȸ������ userPoint �� ��� 3�� ������Ű�ÿ�.
--7) userId �� 'id08' �� ȸ���� userPw �� '2222'�� �����Ͻÿ�.
--8) userMembership �� 'bronze' �� ȸ���� �߿��� userPoint �� 1000 �̻��� ȸ������ userMembership �� 'silver'�� �����Ͻÿ�.
--9) userNo �� 5 �� ȸ���� �����Ͻÿ�.

SELECT * FROM USERTABLE WHERE USERNO >= 5;

SELECT * FROM USERTABLE WHERE USERNO BETWEEN 3 AND 7;

SELECT * FROM USERTABLE WHERE USERTEL LIKE '%6666';
SELECT * FROM USERTABLE WHERE SUBSTR(USERTEL, -4,4) = '6666';   --LIKE���� SUBSTR Ȱ��

SELECT USERMEMBERSHIP, avg(userpoint)  -- ��� ����� ��� ����Ʈ
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