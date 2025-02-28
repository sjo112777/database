#날짜: 2025/01/13
#이름: 손준오
#내용: SQL 연습문제1

#실습 1-1
create database `Shop`;
create user 'shop'@'%' identified by '1234';
grant all privileges on Shop.* to 'shop'@'%';
flush privileges;

#실습 1-2
drop table `Customer`;
CREATE TABLE `Customer` (
`컬럼명(한글)`	VARCHAR(20),
`영문명`		VARCHAR(20),
`데이터유형`	VARCHAR(13),
`길이`		VARCHAR(10),
`NULL허용`	VARCHAR(20),
`기본값`		VARCHAR(20)
);



drop table `Product`;
CREATE TABLE `Product` (
`컬럼명(한글)`	VARCHAR(20),
`영문명`		VARCHAR(20),
`데이터유형`	VARCHAR(13),
`길이`		VARCHAR(10),
`NULL허용`	VARCHAR(20),
`기본값`		VARCHAR(20)
);


drop table `Order`;
CREATE TABLE `Order` (
`컬럼명(한글)`	VARCHAR(20),
`영문명`		VARCHAR(20),
`데이터유형`	VARCHAR(13),
`길이`		VARCHAR(10),
`NULL허용`	VARCHAR(20),
`기본값`		VARCHAR(20)
);





#실습 1-3

drop table `Customer`;
CREATE TABLE `Customer` (
`cusuid`	VARCHAR(10) primary key not null,
`name`	VARCHAR(10) NOT NULL,
`hp`	VARCHAR(13) UNIQUE,
`addr`	varchar(100),
`rdate`DATETIME not null
);


insert into `Customer` values ('c101','김유신','010-1234-1001', '김해시 봉황동',curdate());
insert into `Customer` values ('c102','김춘추','010-1234-1002', '경주시 보문동',curdate());
insert into `Customer` values ('c103','장보고','010-1234-1003', '완도군 청산면',curdate());
insert into `Customer` values ('c104','강감찬','010-1234-1004', '서울시 마포구',curdate());
insert into `Customer` values ('c105','이성계',NULL,NULL, curdate());
insert into `Customer` values ('c106','정철','010-1234-1006', '경기도 용인시',curdate());
insert into `Customer` values ('c107','허준',NULL,NULL, curdate());
insert into `Customer` values ('c108','이순신','010-1234-1008', '서울시 영등포구',curdate());
insert into `Customer` values ('c109','송상현','010-1234-1009', '부산시 동래구',curdate());
insert into `Customer` values ('c110','정약용','010-1234-1010', '경기도광주시 봉황동',curdate());

drop table `Product`;
CREATE TABLE `Product` (
`prodNo`	int primary key not null,
`prodName`	VARCHAR(10) NOT NULL,
`stock`	INT not null default 0,
`price`	INT,
`company` VARCHAR (20) not null
);

insert into `Product` values (1,'새우깡',5000,1500,'농심');
insert into `Product` values (2,'초코파이',2500,2500,'오리온');
insert into `Product` values (3,'포카칩',3600,1700,'오리온');
insert into `Product` values (4,'양파링',1250,1800,'농심');
insert into `Product` values (5,'죠리퐁','2200',NULL,'크라운');
insert into `Product` values (6,'마가렛트',3500,3500,'롯데');
insert into `Product` values (7,'뿌셔뿌셔',1650,1200,'오뚜기');

drop table `Order`;
create table `Order` (
`orderNo`	int primary key auto_increment,
`orderId`	varchar(10) NOT NULL,
`orderProduct`	 int not null,
`orderCount`	INT not null default 1,
`orderDate` DATETIME not null
);

insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)values ('c102',3,2,now());
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)values ('c101',4,1,now());
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)values ('c108',1,1,now());
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)values ('c109',6,5,now());
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)values ('c102',2,1,now());
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)values ('c101',7,3,now());
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)values ('c110',1,2,now());
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)values ('c104',2,4,now());
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)values ('c102',1,3,now());
insert into `Order` (`orderId`,`orderProduct`,`orderCount`,`orderDate`)values ('c107',6,1,now());

select * from `Order`;

#실습 1-4
select * from `Customer` ;

#실습 1-5
select `cusuid`,`name`,`hp` from `Customer` ;

#실습 1-6
select * from `Product`;

#실습 1-7
select `company` from `Product`;

#실습 1-8
select distinct `company` from `product`;

#실습 1-9
select `prodName`, `price` from `product`;

#실습 1-10
select `prodName`, `price` + 500  as '조정단가'  from `product`;

#실습 1-11
select `prodName`, `stock`, `price` from `Product` where `company`='오리온';

#실습 1-12
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderID` = 'c102';

#실습 1-13
select `orderProduct`, `orderCount`, `orderDate` from `Order` where `orderId` = 'c102' and orderCount >=2;

#실습 1-14
select * from `Product` where `price` >=1000 and `price` <=2000;

#실습 1-15
select `cusuid`, `name`,`hp`,`addr` from `Customer` where `name` like '김__';

#실습 1-16
select `cusuid`, `name`, `hp`,`addr` from `Customer` where `name` like '__';

#실습 1-17
select *from `Customer` where `hp`  is null;

#실습 1-18
select * from `Customer` where `addr` is not null;

#실습 1-19
select * from `Customer` order by `rdate` desc;

#실습 1-20
select * from `Order` where `orderCount` >= 3 order by `orderCount` desc, `orderProduct`asc ;

#실습 1-21
select avg(`price`) from `Product` ;

#실습 1-22
select sum(`stock`) as'재고량 합계' from `Product` where `company` = '농심';

#실습 1-23
select Count(*) as '고객수' from `Customer`;

#실습 1-24
select count(distinct`company`) as `제조업체수` from `Product`;

#실습 1-25
select `orderProduct` as '주문 상품번호' , SUM(`orderCount`) as '총 주문수량' from `Order` group by `orderProduct`;

#실습 1-26
select `company` as `제조업체`, count(*) as `제품 수`, MAX(`price`) as '최고가' from `product` group by `company` order by`제조업체`;  

#실습 1-27
select `company` as `제조업체`, count(*) as `제품 수`, MAX(`price`) as '최고가' from `product` group by `company` having `제품 수` >= 2;

#실습 1-28
select `orderProduct`, `orderId`, SUM(`orderCount`) as `총 주문수량` from `Order`
group by `orderProduct`, `orderId`
order by `orderProduct`;

#실습 1-29
select a.orderId, b.prodName From `Order` as a 
join `Product` as b
on a.orderProduct = b.prodNo
where `orderId` = 'c102';

#실습 1-30
select 
	`orderid`, `name`, `prodName`, `orderDate` 
from `Order` as a
JOIN `Customer` AS b ON a.orderId = b.cusuid
JOIN `Product` AS c ON a.orderProduct = c.prodNo
#where substr(`orderDate`, 1, 10) = now();
where `orderDate` like now();