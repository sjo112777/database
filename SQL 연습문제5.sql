#날짜: 2025/01/17
#이름: 손준오
#내용: SQL 연습문제5

#실습 5-1
create database `BookStore`;
create user 'bookstore'@'%' identified by '1234';
grant all privileges on `BookStore`.* to 'bookstore'@'%';
flush privileges;

use `BookStore`;


#실습 5-2
CREATE TABLE `Customer` (
`custId`		int primary key not null auto_increment,
`name`			varchar(10) NOT NULL,
`address`		varchar(20) default null ,
`phone`			varchar(13) default null
);

CREATE TABLE `Book` (
`bookId`		int primary key not null,
`bookName`		varchar(20) NOT NULL,
`publisher`		varchar(20) not null ,
`price`			int default null
);

CREATE TABLE `Order` (
`orderId`		int primary key not null auto_increment,
`cusId`			int NOT NULL,
`bookId`		int not null ,
`salePrice`		int not null,
`orderDate`		date not null
);

#실습 5-3
INSERT INTO `Customer` (name, address, phone) VALUES 
('박지성', '영국 맨체스타', '000-5000-0001'),
('김연아', '대한민국 서울', '000-6000-0001'),
('장미란', '대한민국 강원도', '000-7000-0001'),
('추신수', '미국 클리블랜드', '000-8000-0001'),
('박세리', '대한민국 대전', null);

INSERT INTO Book (bookId, bookName, publisher, price) VALUES 
(1, '축구의 역사', '굿스포츠',7000),
(2, '축구아는 여자', '나무수',13000),
(3, '축구의 이해', '대한미디어',22000),
(4, '골프 바이블', '대한미디어',35000),
(5, '피겨 교본', '굿스포츠',8000),
(6, '역도 단계별기술', '굿스포츠',6000),
(7, '야구의 추억', '이상미디어',20000),
(8, '야구를 부탁해', '이상미디어',13000),
(9, '올림픽 이야기', '삼성당',7500),
(10, 'Olympic Champions', 'Pearson',13000);

INSERT INTO `Order` (cusId, bookId, salePrice, orderDate) VALUES 
(1, 1, 6000,'2014-07-01'),
(1, 3, 21000,'2014-07-03'),
(2, 5, 8000,'2014-07-03'),
(3, 6, 6000,'2014-07-04'),
(4, 7, 20000,'2014-07-05'),
(1, 2, 12000,'2014-07-07'),
(4, 8, 13000,'2014-07-07'),
(3, 10, 12000,'2014-07-08'),
(2, 10, 7000,'2014-07-09'),
(3, 8, 13000,'2014-07-10');

#실습 5-4
select `custId`,`name`,`address` from `Customer`;

#실습 5-5
select `bookName`,`price` from `Book`;

#실습 5-6
select `price`,`bookName` from `Book`;

#실습 5-7
select * from `Book`;

#실습 5-8
select `publisher` from `Book`;

#실습 5-9
select distinct `publisher` from `Book`; #select `publisher` from `Book` group by publisher;

#실습 5-10
select * from `Book` where `price` >= 20000;

#실습 5-11
select * from `Book` where `price` < 20000;

#실습 5-12
select * from `Book` where `price` >= 10000 and `price` <= 20000;

#실습 5-13
select * from `Book` where `price` >= 15000 and `price` <= 30000;

#실습 5-14
select * from `Book` where `bookId` in (2,3,5);

#실습 5-15
select * from `Book` where bookId%2=0;

#실습 5-16
select * from `Customer` where `name` like '박%' ;

#실습 5-17
select * from `Customer` where `address` like '대한민국 %' ;

#실습 5-18
select * from `Customer` where `phone` is not null;

#실습 5-19
select * from `Book` where `publisher` in('굿스포츠','대한미디어');

#실습 5-20
select `publisher` from `Book` where `bookName` = '축구의 역사';

#실습 5-21
select `publisher` from `Book` where `bookName` like '%축구%';

#실습 5-22
select * from `Book` where `bookname` like '_구%'; #WHERE SUBSTRING(`bookname`, 2, 1) = '구';

#실습 5-23
select * from `Book` where `price` >=20000 and `bookName`like '%축구%'; 

#실습 5-24
select * from `Book` order by `bookName` asc;

#실습 5-25
select * from `Book` order by `price` asc, `bookName` asc;

#실습 5-26
select * from `Book` order by `price` desc, `publisher` asc;

#실습 5-27
select * from `Book` order by `price`desc limit 3;

#실습 5-28
select * from `Book` order by `price`asc limit 3;

#실습 5-29
select sum(salePrice) as '총판매액' from `Order`;

#실습 5-30
select sum(salePrice)as '총판매액', avg(salePrice)as '평균값', min(salePrice) as'최저가', max(salePrice)as'최고가'   
from `Order`;

#실습 5-31
select count(orderId) as '판매건수' from `Order`;

#실습 5-32
UPDATE `Book`
SET bookName = REPLACE(`bookName`, '야구', '농구')
WHERE `bookName` LIKE '%야구%';

select * from `book`;

#실습 5-33
select cusId, count(*) as '수량' from `Order` where salePrice >= 8000 group by `cusId` having count(*) >=2;

#실습 5-34
select * from `Customer`a join `Order`b on a.custId = b. cusId order by custId asc;

#실습 5-35
select * from `Customer`a join `Order`b on a.custId = b. cusId order by custId asc;

#실습 5-36
select a.`name`, b.salePrice from `Customer`a join `Order`b on a.custId = b. cusId order by name asc;

#실습 5-37
select `name`, sum(salePrice) from `Customer`a join `Order`b on a.custId = b. cusId group by `name`;

#실습 5-38
select a.`name`, c.`bookName` from `Customer`a join `Order`b on a.custId = b. cusId join `Book`c on b.bookId= c.bookId;

#실습 5-39
select a.`name`, c.`bookName` from `Customer`a join `Order`b on a.custId = b. cusId join `Book`c on b.bookId= c.bookId 
where salePrice =20000;

#실습 5-40
select `name`,`salePrice` from `Customer`a left join `Order`b on a.custId = b. cusId left join `Book`c on b.bookId= c.bookId;

#실습 5-41
select sum(salePrice)as '총매출' from `Customer`a join `Order`b on a.custId = b. cusId where name = '김연아';

#실습 5-42
select `bookName` from `Book` order by `price` desc limit 1 ;
# select `bookName` from `Book` where `price` = (select MAX(`price`) from `Book`);


#실습 5-43
select `name` from `Customer`a left join `Order`b on a.custId = b. cusId where salePrice is null;

#실습 5-44
insert into `Book` set `bookId` = 11,
						`bookName`= '스포츠의학',
						`publisher`='한솔의학서적',
						`price` = null;

#실습 5-45
update `Customer` set `address`= '대한민국 부산' where `custId`= 5;
select *from `Customer`;

#실습 5-46
delete from `Customer` where `custId`=5;