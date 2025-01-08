#날짜: 2025/01/08
#이름: 손준오
#내용: 4장 SQL 고급

#실습 4-1
create table `Member` (
	`uid`	VARCHAR(10) primary key,
	`name`	VARCHAR(10) NOT NULL,
    `hp`	CHAR(13) UNIQUE not null,
    `pos`	VARCHAR(10) default '사원',
    `dep`	INT,
	`rdate`	DATETIME not null
);

insert into `Member` values ('a101','박혁거세','010-1234-1001', '부장',101, now());
insert into `Member` values ('a102','김유신','010-1234-1002', '차장',101, now());
insert into `Member` values ('a103','김춘추','010-1234-1003', '사원',101, now());
insert into `Member` values ('a104','장보고','010-1234-1004','대리',102, now());
insert into `Member` values ('a105','강감찬','010-1234-1005','과장',102, now());
insert into `Member` values ('a106','이성계','010-1234-1006','차장',103, now());
insert into `Member` values ('a107','정철','010-1234-1007','차장',103, now());
insert into `Member` values ('a108','이순신','010-1234-1008','부장',104, now());
insert into `Member` values ('a109','허균','010-1234-1009','부장',104, now());
insert into `Member` values ('a110','정약용','010-1234-1010','사원',105, now());
insert into `Member` values ('a111','박지원','010-1234-1011','사원',105, now());
select * from `Member`;
drop table `Meber`;



create table `Department` (
	`depNO`	int primary key,
    `name`	varchar(10) not null,
    `tel`	char(12) not null
);

insert into `Department` values(101,'영업1부','051-512-1001');
insert into `Department` values (102,'영업2부','051-512-1002');
insert into `Department` values (103,'영업3부','051-512-1003');
insert into `Department` values (104,'영업4부','051-512-1004');
insert into `Department` values (105,'영업5부','051-512-1005');
insert into `Department` values (106,'영업지원부','051-512-1006');
insert into `Department` values (107,'인사부','051-512-1007');

select * from `department`;


create table `Sales` (
	`seq`	int auto_increment primary key,
    `uid`	varchar(10) not null,
	`year`	year not null,
    `month`	tinyint not null,
    `sale`	int
);

insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a101',2018,1,'98100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a102',2018,1,'136000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a103',2018,1,'80100');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a104',2018,1,'78000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a105',2018,1,'93000');

insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a101',2018,2,'23500');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a102',2018,2,'126000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a103',2018,2,'18500');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a105',2018,2,'19000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a106',2018,2,'53000');

insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a101',2019,1,'24000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a102',2019,1,'109000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a103',2019,1,'101000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a104',2019,1,'53500');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a107',2019,1,'24000');

insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a102',2019,2,'160000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a103',2019,2,'101000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a104',2019,2,'43000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a105',2019,2,'24000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a106',2019,2,'109000');

insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a102',2020,1,'201000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a104',2020,1,'63000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a105',2020,1,'74000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a106',2020,1,'122000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a107',2020,1,'111000');

insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a102',2020,2,'120000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a103',2020,2,'93000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a104',2020,2,'84000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a105',2020,2,'180000');
insert into `Sales` (`uid`,`year`,`month`,`sale`) value ('a108',2020,2,'76000');

select * from `Sales`;

#실습 4-3
select * from `Member` where `name`= '김유신';
SELECT * FROM `Member` WHERE `pos`='차장' AND dep=101;
SELECT * FROM `Member` WHERE `pos`='차장' OR dep=101;
SELECT * FROM `Member` WHERE `name` != '김춘추';
SELECT * FROM `Member` WHERE `name` <> '김춘추';
SELECT * FROM `Member` WHERE `pos`='사원' OR `pos`='대리';
SELECT * FROM `Member` WHERE `pos` IN('사원', '대리');
SELECT * FROM `Member` WHERE `dep` IN(101, 102, 103);
SELECT * FROM `Member` WHERE `name` LIKE '%신';
SELECT * FROM `Member` WHERE `name` LIKE '김%';
SELECT * FROM `Member` WHERE `name` LIKE '김__';
SELECT * FROM `Member` WHERE `name` LIKE '_성_';
SELECT * FROM `Member` WHERE `name` LIKE '정_';
SELECT * FROM `Sales` WHERE `sale` > 50000;
SELECT * FROM `Sales` WHERE `sale` >= 50000 AND `sale` < 100000 AND `month`=1;
SELECT * FROM `Sales` WHERE `sale` BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `sale` NOT BETWEEN 50000 AND 100000;
SELECT * FROM `Sales` WHERE `year` IN(2020);
SELECT * FROM `Sales` WHERE `month` IN(1, 2);

#실습 4-4
select * from `Sales` order by `sale`;
select * from `Sales` order by `sale` ASC;
select * from `Sales` order by `sale` DESC;
SELECT * FROM `Member` ORDER BY `name`;
SELECT * FROM `Member` ORDER BY `name` DESC;
SELECT * FROM `Member` ORDER BY `rdate` ASC;
SELECT * FROM `Sales` WHERE `sale` > 50000 ORDER BY `sale` DESC;
SELECT * FROM `Sales`
WHERE `sale` > 50000
ORDER BY `year`, `month`, `sale` DESC;

#실습 4-5
select * from `Sales` LIMIT 3;
select * from `Sales` LIMIT 0, 3;
select * from `Sales` LIMIT 1, 2;
SELECT * FROM Sales LIMIT 5, 3;
SELECT * FROM Sales ORDER BY `sale` DESC LIMIT 3, 5;
SELECT * FROM Sales WHERE `sale` < 50000 ORDER BY `sale` DESC LIMIT 3;
SELECT * FROM Sales
WHERE `sale` > 50000
ORDER BY `year` DESC, `month`, `sale` DESC
LIMIT 5;

#실습 4-6
select SUM(`sale`) AS `합계`from `Sales`;
select ceiling(1.2); #올림
select ceiling(1.8);
select floor(1.2); #내림
select floor(1.8);
select round(1.2); #반올림
select round(1.8); 
select rand(); #0~1 사이 실수
select ceiling(rand() * 10); #1 ~ 10 사이 정수
select count(*) as `갯수` from `Sales`; #테이블 갯수
select left('HelloWorld', 5);
select right('HelloWorld', 5);
select substring('HelloWorld', 6,5); #6번자리에서 5개 출력
select concat('Hello', 'World');

select now();
SELECT SUM(sale) AS `합계` FROM `Sales`;
SELECT AVG(sale) AS `평균` FROM `Sales`;
SELECT MAX(sale) AS `최대값` FROM `Sales`;
SELECT MIN(sale) AS `최소값` FROM `Sales`;
SELECT CEILING(1.2);
SELECT CEILING(1.8);
SELECT FLOOR(1.2);
SELECT FLOOR(1.8);
SELECT ROUND(1.2);
SELECT ROUND(1.8);
SELECT RAND();
SELECT CEILING(RAND() * 10);
SELECT COUNT(sale) AS `갯수` FROM `Sales`;
SELECT COUNT(*) AS `갯수` FROM `Sales`;
SELECT LEFT('HelloWorld', 5);
SELECT RIGHT('HelloWorld', 5);
SELECT SUBSTRING('HelloWorld', 6, 5);
SELECT CONCAT('Hello', 'World');
SELECT CONCAT(`uid`, `name`, `hp`) FROM `member` WHERE `uid`='a108';
SELECT CURDATE();
SELECT CURTIME();
SELECT NOW();
INSERT INTO `Member` VALUES ('a112', '유관순', '010-1234-1012', '대리', 107, NOW());

#실습 4-7
SELECT SUM(sale) AS `2018년 매출의 총합` FROM `Sales`;
select sum(`sale`) as `2018년 1월 매출 총합` from `Sales` where `year`= 2018 and `month` = 1; 

#실습 4-8
select 
	sum(`sale`) as 총합,
    avg(`sale`) as 평균
from `Sales` 
		where `year`=2019 and
			`month`=2 and
            `sale` >= 50000;
        
	

#실습 4-9
select
	min(`sale`) as `최저`,
    max(`sale`) as `최고`
	from `Sales`
	where `year`=2020

