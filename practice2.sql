--1. å ���̺��� �����Ͻÿ�. [ book ]
--* �ʵ�
--1. å��ȣ(����)		bookid PK
--2. å�̸�(����-50)		bookname
--3. ���ǻ�(����-50)		publisher
--4. ����(����)		price
--
--2. �� ���̺��� �����Ͻÿ� [ customer ]
--* �ʵ�
--1. ����ȣ(����)		customerid PK
--2. �̸�(����-20)		name
--3. �ּ�(����-50)		address
--4. ��ȭ��ȣ(����-20)	phone
--
--3. �ֹ� ���̺��� �����Ͻÿ� [ orders ]
--* �ʵ�
--1. �ֹ���ȣ(����)		orderid PK
--2. ����ȣ(����)		customerid FK
--3. å��ȣ(����)		bookid FK
--4. �ǸŰ���(����)		saleprice
--5. �ֹ�����(��¥)		orderdate

create table book(
    bookid number(7),
    bookname varchar2(50),
    publisher varchar2(50),
    price number(10),
    constraint PK_ID primary key(bookid)
    );
    
    ALTER TABLE BOOK
    RENAME CONSTRAINT PK_ID         -- �̸� ����
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
    
insert into book values (1, '�౸�ǿ���', '�½�����', 7000);
insert into book values (2, '�౸�ƴ¿���', '������', 13000);
insert into book values (3, '�౸������', '���ѹ̵��', 22000);
insert into book values (4, '�������̺�', '���ѹ̵��', 35000);
insert into book values (5, '�ǰܱ���', '�½�����', 6000);
insert into book values (6, '�����ܰ躰���', '�½�����', 6000);
insert into book values (7, '�߱����߾�', '�̻�̵��', 20000);
insert into book values (8, '�߱�����Ź��', '�̻�̵��', 13000);
insert into book values (9, '�ø����̾߱�', '�Ｚ��', 7500);
insert into book values (10, '�ø���è�Ǿ�', '�Ǿ', 13000);

insert into customer values (1, '������', '���� ��ü����', '010-0000-0000');
insert into customer values (2, '�迬��', '���ѹα� ����', '010-1111-1111');
insert into customer values (3, '��̶�', '���ѹα� ������', '010-2222-2222');
insert into customer values (4, '�߽ż�', '�̱� �ػ罺', '010-4444-4444');
insert into customer values (5, '�ڼ���', '���ѹα� ����', '010-5555-5555');

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


-- bookid�� 1�� å�� �̸��� ����Ͻÿ�.
select * from book where bookid = 1;

--5. ������ 20000�� �̻��� å�� �̸��� ��� ����Ͻÿ�
select bookname from book where price >= 20000;

--6. ���ǻ� �ߺ��� �����Ͽ� ����Ͻÿ�.
select distinct publisher from book ;

--7. �� �Ǹŵ� å�� ������ ���ϰ�, �÷����� '���Ǹž�'���� ����Ͻÿ�.
select sum(saleprice) "�� �Ǹž�" from orders;

SELECT SUM(PRICE)
FROM BOOK
WHERE BOOKID IN
(SELECT BOOKID FROM ORDERS);

--8. �������� �� ���ž��� ���Ͻÿ�.
select sum(saleprice) "�� ���ž�"
from orders inner join customer
on orders.customerid = customer.customerid
where name = '������';

SELECT SUM(SALEPRICE) "�� ���ž�"          -- �������� Ȱ��
FROM ORDERS
WHERE CUSTOMERID =
(SELECT CUSTOMERID FROM CUSTOMER WHERE NAME = '������');

--9. �������� ������ ���� ���� ���Ͻÿ�.
select count(orderid) "���� ���� ��"
from orders inner join customer
on orders.customerid = customer.customerid
where name = '������';

SELECT COUNT(ORDERID) "���� ���� ��"           -- �������� Ȱ��
FROM ORDERS
WHERE CUSTOMERID =
(SELECT CUSTOMERID FROM CUSTOMER WHERE NAME = '������');

--10. 2014�� 7�� 4�Ϻ��� 7�� 7�� ���̿� �ֹ� ���� �ֹ� ������ ����Ͻÿ�. (+@ �Ⱓ ���� ���� ���)
select ORDERID, CUSTOMERID, BOOKID, SALEPRICE
from orders
where orderdate between '14/07/04' and '14/07/07';

--11. �ֹ��� ���� ���� ���� �̸��� ����Ͻÿ�.
select name
from customer left join orders
on customer.customerid = orders.customerid
where orderid is null;

select name                 -- ���� ���� Ȱ��
from customer
where customerid not in
(select customerid from orders);       
-- orders�� ���� customerid�� �ش��ϴ� ����� ���� Ȱ���ϸ� ��.

--12. �������� ������ ������ ���ǻ� ��(�ߺ�����)�� ����Ͻÿ�.
select count(distinct publisher) "���ǻ� ��"        -- �������� + ���� Ȱ��
from orders inner join book
on orders.bookid = book.bookid
where customerid =
(select customerid from customer where name = '������');

select count(distinct publisher) "���ǻ� ��"    -- ���� join Ȱ��
from orders inner join book
on orders.bookid = book.bookid
            inner join customer
            on orders.customerid = customer.customerid
where name = '������';

select count(distinct publisher) "���ǻ� ��"            -- ������������ Ȱ��
from book
where bookid in (
select bookid from orders where customerid =
( select customerid from customer where name = '������')
);
--13. ���� ��� �̸��� ����  �� ���ž��� �Բ� ����Ͻÿ�.
select name, sum(saleprice) "�� ���ž�", count(bookid) "���� ����" 
from customer left join orders
on customer.customerid = orders.customerid
group by name;

--13-1. ���� ������ �ִ� ���� �̸��� ���� �� ���ž��� �Բ� ����Ͻÿ�.
select name, sum(saleprice) "�� ���ž�"
from customer inner join orders
on customer.customerid = orders.customerid
group by name;

--13-2. ���� ��� �̸��� ���� �� ���ž��� �Բ� ����ϵ� ���� ������ ���� ���� ���� �ݾ��� 0���� ����Ͻÿ�.
select name, nvl(sum(saleprice), 0) "�� ���ž�"
from customer left join orders
on customer.customerid = orders.customerid
group by name; 