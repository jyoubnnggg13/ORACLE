--1. 책 테이블을 생성하시오. [ book ]
--* 필드
--1. 책번호(숫자)		bookid PK
--2. 책이름(문자-50)		bookname
--3. 출판사(문자-50)		publisher
--4. 가격(숫자)		price
--
--2. 고객 테이블을 생성하시오 [ customer ]
--* 필드
--1. 고객번호(숫자)		customerid PK
--2. 이름(문자-20)		name
--3. 주소(문자-50)		address
--4. 전화번호(문자-20)	phone
--
--3. 주문 테이블을 생성하시오 [ orders ]
--* 필드
--1. 주문번호(숫자)		orderid PK
--2. 고객번호(숫자)		customerid FK
--3. 책번호(숫자)		bookid FK
--4. 판매가격(숫자)		saleprice
--5. 주문일자(날짜)		orderdate

create table book(
    bookid number(7),
    bookname varchar2(50),
    publisher varchar2(50),
    price number(10),
    constraint PK_ID primary key(bookid)
    );
    
    ALTER TABLE BOOK
    RENAME CONSTRAINT PK_ID         -- 이름 변경
    TO PK_BOOKID;

create table customer(
    customerid number(7),
    name varchar2(20),
    address varchar2(50),
    phone varchar2(20),
    constraint PK_customerID primary key(customerid)
    );
    
    
create table orders(
    orderid number(7),
    customerid number(7),
    bookid number(7),
    saleprice number(10),
    orderdate date,
    constraint PK_order primary key(orderid),
    constraint FK_customer foreign key(customerid)
    references customer(customerid),
    constraint FK_book foreign key(bookid)
    references book(bookid)
    );
    
    desc orders;
    SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME IN ( 'BOOK','ORDERS','CUSTOMER' );
    
    ALTER TABLE ORDERS
    RENAME CONSTRAINT PK_ORDER
    TO PK_ORDERID;
    
    ----------------------------------------------------------------------------------
    
insert into book values (1, '축구의역사', '굿스포츠', 7000);
insert into book values (2, '축구아는여자', '나무수', 13000);
insert into book values (3, '축구의이해', '대한미디어', 22000);
insert into book values (4, '골프바이블', '대한미디어', 35000);
insert into book values (5, '피겨교본', '굿스포츠', 6000);
insert into book values (6, '역도단계별기술', '굿스포츠', 6000);
insert into book values (7, '야구의추억', '이상미디어', 20000);
insert into book values (8, '야구를부탁해', '이상미디어', 13000);
insert into book values (9, '올림픽이야기', '삼성당', 7500);
insert into book values (10, '올림픽챔피언', '피어슨', 13000);

insert into customer values (1, '박지성', '영국 맨체스터', '010-0000-0000');
insert into customer values (2, '김연아', '대한민국 서울', '010-1111-1111');
insert into customer values (3, '장미란', '대한민국 강원도', '010-2222-2222');
insert into customer values (4, '추신수', '미국 텍사스', '010-4444-4444');
insert into customer values (5, '박세리', '대한민국 대전', '010-5555-5555');

insert into orders values (1, 1, 1, 6000, '2014-07-01');
insert into orders values (2, 1, 3, 21000, '2014-07-03');
insert into orders values (3, 2, 5, 8000, '2014-07-03');
insert into orders values (4, 3, 6, 6000, '2014-07-04');
insert into orders values (5, 4, 7, 20000, '2014-07-07');
insert into orders values (6, 1, 2, 12000, '2014-07-07');
insert into orders values (7, 4, 8, 13000, '2014-07-07');
insert into orders values (8, 3, 10, 12000, '2014-07-08');
insert into orders values (9, 2, 10, 7000, '2014-07-09');
insert into orders values (10, 3, 8, 13000, '2014-07-10');
    
select * from book;
select * from customer;
select * from orders;


-- bookid가 1인 책의 이름을 출력하시오.
select * from book where bookid = 1;

--5. 가격이 20000원 이상인 책의 이름을 모두 출력하시오
select bookname from book where price >= 20000;

--6. 출판사 중복을 제거하여 출력하시오.
select distinct publisher from book ;

--7. 총 판매된 책의 가격을 구하고, 컬럼명을 '총판매액'으로 출력하시오.
select sum(saleprice) "총 판매액" from orders;

SELECT SUM(PRICE)
FROM BOOK
WHERE BOOKID IN
(SELECT BOOKID FROM ORDERS);

--8. 박지성의 총 구매액을 구하시오.
select sum(saleprice) "총 구매액"
from orders inner join customer
on orders.customerid = customer.customerid
where name = '박지성';

SELECT SUM(SALEPRICE) "총 구매액"          -- 서브쿼리 활용
FROM ORDERS
WHERE CUSTOMERID =
(SELECT CUSTOMERID FROM CUSTOMER WHERE NAME = '박지성');

--9. 박지성의 구매한 도서 수를 구하시오.
select count(orderid) "구매 도서 수"
from orders inner join customer
on orders.customerid = customer.customerid
where name = '박지성';

SELECT COUNT(ORDERID) "구매 도서 수"           -- 서브쿼리 활용
FROM ORDERS
WHERE CUSTOMERID =
(SELECT CUSTOMERID FROM CUSTOMER WHERE NAME = '박지성');

--10. 2014년 7월 4일부터 7월 7일 사이에 주문 받은 주문 정보를 출력하시오. (+@ 기간 제외 정보 출력)
select ORDERID, CUSTOMERID, BOOKID, SALEPRICE
from orders
where orderdate between '14/07/04' and '14/07/07';

--11. 주문한 적이 없는 고객의 이름을 출력하시오.
select name
from customer left join orders
on customer.customerid = orders.customerid
where orderid is null;

select name                 -- 서브 쿼리 활용
from customer
where customerid not in
(select customerid from orders);       
-- orders에 없는 customerid에 해당하는 사람는 조건 활용하면 됨.

--12. 박지성이 구매한 도서의 출판사 수(중복없이)를 출력하시오.
select count(distinct publisher) "출판사 수"        -- 서브쿼리 + 조인 활용
from orders inner join book
on orders.bookid = book.bookid
where customerid =
(select customerid from customer where name = '박지성');

select count(distinct publisher) "출판사 수"    -- 다중 join 활용
from orders inner join book
on orders.bookid = book.bookid
            inner join customer
            on orders.customerid = customer.customerid
where name = '박지성';

select count(distinct publisher) "출판사 수"            -- 서브쿼리만을 활용
from book
where bookid in (
select bookid from orders where customerid =
( select customerid from customer where name = '박지성')
);
--13. 고객의 모든 이름과 고객별  총 구매액을 함께 출력하시오.
select name, sum(saleprice) "총 구매액", count(bookid) "구매 수량" 
from customer left join orders
on customer.customerid = orders.customerid
group by name;

--13-1. 구매 내역이 있는 고객의 이름과 고객별 총 구매액을 함께 출력하시오.
select name, sum(saleprice) "총 구매액"
from customer inner join orders
on customer.customerid = orders.customerid
group by name;

--13-2. 고객의 모든 이름과 고객별 총 구매액을 함께 출력하되 구매 내역이 없는 고객의 구매 금액은 0으로 출력하시오.
select name, nvl(sum(saleprice), 0) "총 구매액"
from customer left join orders
on customer.customerid = orders.customerid
group by name; 