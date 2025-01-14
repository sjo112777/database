#날짜: 2025/01/14
#이름: 손준오
#내용: SQL 연습문제2

#실습2-1
create database `Bank`;
create USER 'bank'@'%'identified by '1234';
grant all privileges on Bank.*to 'bank'@'%';
flush privileges;
use Bank;

#실습2-2
CREATE TABLE `bank_customer` (
`c_no`		VARCHAR(14) primary key not null,
`c_name`	VARCHAR(20) NOT NULL,
`c_dist`	int not null default 0,
`c_phone`	varchar(20) unique not null,
`c_addr`	varchar(100) default null
);

CREATE TABLE `bank_account` (
`a_no`			VARCHAR(11) primary key not null,
`a_item_dist`	VARCHAR(2) NOT NULL,
`a_item_name`	varchar(20) not null,
`a_c_no`		varchar(14) not null,
`a_balance`		int not null default 0,
`a_open_date`	datetime not null
);

CREATE TABLE `bank_transaction` (
`t_no`		int primary key not null auto_increment,
`t_a_no`	VARCHAR(11) NOT NULL,
`t_dist`	int not null,
`t_amount`	int not null default 0,
`t_datetime`datetime not null
);


insert into `bank_customer` values ('101-22-51094','부산의원',2, '051-518-1010','부산시 남구');
insert into `bank_customer` values ('220-82-52237','(주)한국전산',2, '02-134-1045','서울시 강서구');
insert into `bank_customer` values ('361-22-42687','(주)정보산업',2, '031-563-1253','경기도 광명시');
insert into `bank_customer` values ('730423-1000001','김유신',1, '010-1234-1001','경기도 수원시');
insert into `bank_customer` values ('750210-1000002','김춘추',1,'010-1234-1002', '경기도 광주시');
insert into `bank_customer` values ('830513-2000003','선덕여왕',1, '010-1234-1003','서울시 마포구');
insert into `bank_customer` values ('870830-1000004','강감찬',1,'010-1234-1004', '서울시 영등포구');
insert into `bank_customer` values ('910912-2000005','신사임당',1, '010-1234-1005','강원도 강릉시');
insert into `bank_customer` values ('941127-1000006','이순신',1, '010-1234-1006','부산시 영도구');

drop table `bank_account`;
insert into `bank_account` values ('101-11-1001','S1','자유저축예금','730423-1000001',420000,'2005-07-21');
insert into `bank_account` values ('101-11-1003','S1','자유저축예금','870830-1000004',53000,'2007-02-17');
insert into `bank_account` values ('101-11-2001','S1','자유저축예금','220-82-52237',23000000,'2003-04-14');
insert into `bank_account` values ('101-11-2002','S1','자유저축예금','361-22-42687',4201000,'2008-12-30');
insert into `bank_account` values ('101-11-2003','S1','자유저축예금','102-22-51094',8325010,'2010-06-07');
insert into `bank_account` values ('101-12-1002','S2','정기적립예금','830513-2000003',1020000,'2011-05-13');
insert into `bank_account` values ('101-13-1005','S3','주택청약예금','941127-1000006',720800,'2012-10-15');
insert into `bank_account` values ('101-21-1004','L1','고객신용대출','910912-2000005',1200500,'2009-08-25');
insert into `bank_account` values ('101-22-1006','L2','예금담보대출','730423-1000001',25000,'2013-12-11');
insert into `bank_account` values ('101-23-1007','L3','주택담보대출','750210-1000002',2700000,'2020-09-23');

insert into `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`)values ('101-11-1001',1,50000,now());
insert into `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`)values ('101-11-1003',2,120000,now());
insert into `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`)values ('101-11-2001',2,300000,now());
insert into `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`)values ('101-12-1003',1,1000000,now());
insert into `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`)values ('101-11-1001',3,0,now());
insert into `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`)values ('101-13-1005',1,200000,now());
insert into `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`)values ('101-11-1001',1,450000,now());
insert into `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`)values ('101-11-2002',2,32000,now());
insert into `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`)values ('101-11-2003',3,0,now());
insert into `bank_transaction` (`t_a_no`,`t_dist`,`t_amount`,`t_datetime`)values ('101-11-1003',1,75000,now());



#실습2-3
#실습2-4
SELECT * from `bank_account`;

#실습2-5
SELECT * from `bank_customer`;

#실습2-6
select * from `bank_transaction`;

#실습2-7
SELECT `c_name`,`c_no` from `bank_customer`;

#실습2-8
select `a_item_dist`,`a_item_name` from `bank_account`;

#실습2-9
select distinct `a_item_dist`, `a_item_name` from `bank_account`;

#실습2-10
select * from `bank_account` where `a_item_name` = '자유저축예금' and `a_balance` >=1000000;

#실습2-11
select *from `bank_customer` where `c_addr` like '경기도 ___';

#실습2-12
select *from `bank_customer` where `c_dist` >= 2;

#실습2-13
select *from `bank_transaction` where `t_dist`= 1;

#실습2-14
select *from `bank_transaction` where `t_dist` = 2 order by `t_amount` desc;

#실습2-15
select sum(`t_amount`) as'입금총합', avg(`t_amount`) as '입금평균'  FROM `bank_transaction` WHERE `t_dist`=1;

#실습2-16
select  MAX(`t_amount`)  AS '큰금액', min(`t_amount`) as '작은 금액'
FROM `bank_transaction`
WHERE `t_dist`=2;

#실습2-17
select * from `bank_account` where `a_item_name` = '자유저축예금' order by `a_balance` desc;

#실습2-18
SELECT * FROM `bank_account` WHERE `a_item_name` = '자유저축예금'
ORDER BY  `a_balance` DESC limit 1;

#실습2-19
SELECT * FROM `bank_transaction` where t_dist <3
ORDER BY `t_dist`, `t_amount` DESC;

#실습2-20
SELECT
COUNT(if(t_dist=1, 1 , null)) AS `입금 건수`,
COUNT(if(t_dist=2, 1 , null)) AS `출금 건수`,
COUNT(if(t_dist=3, 1 , null)) AS `조회 건수`
FROM `bank_transaction`;

#실습2-21
SELECT
	`t_dist`,
CASE
	when (`t_dist` = 1) THEN '입금'
    when (`t_dist` = 2) then '출금'
    when (`t_dist` = 3) then '조회'
END AS `type`,
	`t_a_no`,
	`t_amount`
FROM `bank_transaction`;

#실습2-22
SELECT t_dist, COUNT(`t_no`) FROM `bank_transaction` group by `t_dist`;

#실습2-23
SELECT `t_a_no`, `t_dist`, SUM(`t_amount`)
FROM `bank_transaction`
WHERE `t_dist` = 1
group by `t_a_no`;

#실습2-24
SELECT
`t_a_no`,
`t_dist`,
SUM(`t_amount`) AS `합계`
FROM `bank_transaction`
WHERE `t_dist` = 1
group by `t_a_no`
having `합계` >=100000
ORDER BY `합계` desc;

#실습2-25
SELECT * FROM `bank_account` AS a
join `bank_customer` as b
on a.a_c_no = b.c_no;

SELECT * FROM `bank_account` a, `bank_customer` b 
where a.a_c_no = b.c_no;

#실습2-26
SELECT 
	`a_no` AS `계좌번호`, 
	`a_item_name` AS `계좌이름`,
	`c_no` AS `주민번호(사업자번호)`,
	`c_name` AS `고객명`,
	`a_balance` AS `현재잔액` 
FROM `bank_account` AS a
JOIN `bank_customer` as b
ON a.a_c_no = b.c_no;

#실습2-27
SELECT * FROM `bank_transaction` AS a
 JOIN `bank_account` AS b
 ON a.t_a_no = b.a_no;
 
#실습2-28
SELECT 
 `t_no` AS `거래번호`,
 `t_a_no` AS `계좌번호`,
 `a_c_no` AS `고객번호(주민번호)`,
 `t_dist` AS `거래구분`,
 `t_amount` AS `거래금액`,
 `t_datetime` AS `거래일자`
 FROM `bank_account` AS a
 JOIN `bank_transaction` AS b
ON a.a_no = b.t_a_no;

#실습2-29
SELECT
 `t_no`,
 `a_no`,
 `c_no`,
 `t_dist`,
 `a_item_name`,
 `c_name`,
 `t_amount`,
 `t_datetime`
FROM `bank_transaction` AS a
JOIN `bank_account` AS b ON a.t_a_no = b.a_no
JOIN `bank_customer` AS c ON b.a_c_no = c.c_no
WHERE `t_dist` = 1
ORDER BY `t_amount` DESC;

#실습2-30
#Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'bank.a.t_no' which is not functionally dependent on columns in GROUP BY clause; this is incompatible with sql_mode=only_full_group_by	0.000 sec
SELECT @@sql_mode;
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

SELECT
 `t_no`,
 `a_no`,
 `c_no`,
 `t_dist`,
 `a_item_name`,
 `c_name`,COUNT(`t_no`) AS `거래건수`
FROM `bank_transaction` AS a
JOIN `bank_account` AS b ON a.t_a_no = b.a_no
JOIN `bank_customer` AS c ON b.a_c_no = c.c_no
WHERE `t_dist` IN(1, 2) AND `c_dist` = 1
GROUP BY `c_no`
ORDER BY `t_dist` DESC;
