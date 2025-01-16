#날짜:2025/01/16
#이름:손준오
#내용:SQL 연습문제4

#실습4-1
create database `Theater`;
create user 'theater'@'%' identified by '1234';
grant all privileges on `Theater`.* to 'theater'@'%';
flush privileges;

use Theater;

#실습4-2
CREATE TABLE `Movies` (
`movie_id`		int primary key not null auto_increment,
`title`			varchar(30) NOT NULL,
`genre`			varchar(10) not null,
`release_date`	date not null
);

CREATE TABLE `Customer` (
`customer_id`	int primary key not null auto_increment,
`name`		 	varchar(20) NOT NULL,
`email`		 	varchar(50) not null,
`phone`		 	char(13) not null
);

CREATE TABLE `Bookings` (
`booking_id`	int primary key not null,
`customer_id`	int NOT NULL,
`movie_id`		int not null,
`num_tickets`	int not null,
`booking_date`	datetime not null
);

drop table `Movies`;

#실습4-3
insert into `Movies` (`title`,`genre`,`release_date`)values ('쇼생크의 탈출','드라마','1994-10-14');
insert into `Movies` (`title`,`genre`,`release_date`)values ('타이타닉','로맨스','1997-03-24');
insert into `Movies` (`title`,`genre`,`release_date`)values ('탑건','액션','1987-07-16');
insert into `Movies` (`title`,`genre`,`release_date`)values ('쥬라기공원','액션','1994-02-11');
insert into `Movies` (`title`,`genre`,`release_date`)values ('글래디에이터','액션','2000-05-03');
insert into `Movies` (`title`,`genre`,`release_date`)values ('시네마천국','드라마','1995-04-12');
insert into `Movies` (`title`,`genre`,`release_date`)values ('미션임파서블','액션','1995-11-11');
insert into `Movies` (`title`,`genre`,`release_date`)values ('노트북','로맨스','2003-08-23');
insert into `Movies` (`title`,`genre`,`release_date`)values ('인터스텔라','SF','2011-05-26');
insert into `Movies` (`title`,`genre`,`release_date`)values ('아바타','SF','2010-02-10');

drop table `Customer`;
insert into `Customer` (`name`,`email`,`phone`)values ('김유신','ksy@example.com','010-1234-1001');
insert into `Customer` (`name`,`email`,`phone`)values ('김춘추','kcc@example.com','010-1234-1002');
insert into `Customer` (`name`,`email`,`phone`)values ('장보고','jbg@example.com','010-1234-1003');
insert into `Customer` (`name`,`email`,`phone`)values ('강감찬','kgc@example.com','010-1234-1004');
insert into `Customer` (`name`,`email`,`phone`)values ('이순신','lss@example.com','010-1234-1005');


insert into `Bookings` values (101,1,1,2,now());
insert into `Bookings` values (102,2,2,3,now());
insert into `Bookings` values (103,3,2,2,now());
insert into `Bookings` values (104,4,3,1,now());
insert into `Bookings` values (105,5,5,2,now());
insert into `Bookings` values (106,3,8,2,now());
insert into `Bookings` values (107,1,10,4,now());
insert into `Bookings` values (108,2,9,1,now());
insert into `Bookings` values (109,5,7,2,now());
insert into `Bookings` values (110,3,4,2,now());
insert into `Bookings` values (111,1,6,1,now());
insert into `Bookings` values (112,3,5,3,now());

#실습4-4
select title from `Movies`;

#실습4-5
select * from `Movies` where `genre` = '로맨스';

#실습4-6
SELECT
	title,
	release_date
FROM Movies 
WHERE `release_date` >= '2010-01-01' ;

#실습4-7
SELECT
	booking_id, booking_date
FROM Bookings 
WHERE `num_tickets` >=3;

#실습4-8
SELECT * FROM Bookings 
WHERE `booking_date` >= '2023-01-20';

#실습4-9
SELECT * FROM Movies 
WHERE release_date between '1990-01-01' AND '1999-12-31';

#실습4-10
SELECT * FROM Bookings
ORDER BY booking_date DESC
limit 9,3;

#실습4-11
SELECT title, release_date FROM Movies
ORDER BY release_date ASC
limit 1;

#실습4-12
SELECT
CONCAT(title, ' - ', release_date) AS movie_info
FROM Movies
WHERE `title` like '%공원'
ORDER BY release_date ASC
LIMIT 1;

#실습4-13
SELECT booking_date, title
FROM Bookings
JOIN Movies
on Bookings.movie_id = Movies.movie_id #using (`movie_id`)
WHERE customer_id = 2;

#실습4-14
SELECT
C.`name`,
C.`phone`,
B.`booking_date`,
M.`title`
FROM bookings B
JOIN Customer C ON B.customer_id = C.customer_id
JOIN Movies M ON B.movie_id = M.movie_id;

#실습4-15
select
M.genre,
AVG(B.num_tickets) AS avg_tickets
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
group by `genre`;

#실습4-16
SELECT
C.name,
AVG(B.num_tickets) AS avg_tickets
FROM Bookings B
JOIN Customer C ON B.customer_id = C.customer_id
group by `name`;

#실습4-17
SELECT
C.name,
SUM(B.num_tickets) AS `전체 예매 티켓 수`
FROM bookings B
JOIN Customer C ON B.customer_id = C.customer_id
group by `name`
ORDER BY `전체 예매 티켓 수` DESC;

#실습4-18
SELECT
B.`booking_id`,
B.`movie_id`,
C.`name`,
B.`booking_date`
FROM Bookings B
JOIN Customer C ON B.customer_id = C.customer_id
ORDER BY B.booking_date ASC
LIMIT 1;

#실습4-19
SELECT
genre, title, release_date
FROM Movies
WHERE (genre, release_date) IN (
SELECT genre, MAX(release_date)
FROM Movies
group by `genre`
);

#실습4-20
SELECT * FROM Movies
WHERE movie_id IN (
SELECT movie_id FROM Bookings
WHERE customer_id = (SELECT customer_id FROM Customer where `name`='김유신')
);

#실습4-21
SELECT `name`, `email` 
FROM `Customer`
WHERE customer_id = (
SELECT customer_id
FROM Bookings
GROUP BY customer_id
ORDER BY SUM(num_tickets) DESC
limit 1
);

#실습4-22
SELECT * FROM bookings
WHERE num_tickets > (SELECT avg(num_tickets)FROM Bookings);

#실습4-23
SELECT
M.title, SUM(B.num_tickets) AS total_tickets
FROM Bookings B
JOIN Movies M ON B.movie_id = M.movie_id
group by `title`;

#실습4-24
SELECT
c.name,
SUM(b.num_tickets) AS total_tickets,
AVG(b.num_tickets) AS avg_tickets
FROM Bookings b
JOIN Customer c ON b.customer_id = c.customer_id
group by `name`;

#실습4-25
SELECT
c.`customer_id`,
c.`name`,
c.`email`,
SUM(b.num_tickets) AS `예매 티켓수`
FROM Bookings b
JOIN Customer c ON b.customer_id = c.customer_id
group by `customer_id`
ORDER BY `예매 티켓수` DESC;

#실습4-26
SELECT
c.name,
m.title,
b.num_tickets,
b.booking_date
FROM bookings b
JOIN customer c ON b.customer_id = c.customer_id
JOIN movies m ON b.movie_id = m.movie_id
ORDER BY num_tickets DESC;

#실습4-27
SELECT
M.title,
M.genre,
SUM(B.num_tickets) AS `예매 티켓 수`,
AVG(B.num_tickets) AS `평균 티켓 수`
FROM bookings B
JOIN Movies M ON B.movie_id = M.movie_id
WHERE M.genre = '액션'
group by `title`
ORDER BY `평균 티켓 수` DESC;

#실습4-28
SELECT
B.customer_id,
C.name,
SUM(`num_tickets`) AS `ticket_total`
FROM bookings B
JOIN Customer C ON B.customer_id = C.customer_id
group by `customer_id`
ORDER BY ticket_total DESC;

#실습4-29
SELECT
B.booking_id,
B.customer_id,
B.movie_id,
MaxTickets.max_tickets
FROM Bookings B
JOIN (
SELECT movie_id, MAX(num_tickets) AS max_tickets
FROM Bookings
group by `movie_id`
) AS MaxTickets
ON B.movie_id = MaxTickets.movie_id AND B.num_tickets = MaxTickets.max_tickets;

#실습4-30
SELECT @@sql_mode;
SET SESSION sql_mode = 'STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';


SELECT
B.booking_id,
B.customer_id,
C.name,
M.title,
M.genre,
SUM(B.num_tickets) AS `예매 티켓 수`
FROM bookings B
JOIN movies M ON B.movie_id = M.movie_id
JOIN customer C ON B.customer_id = C.customer_id
GROUP BY M.title
having 
 `예매 티켓 수` = (
SELECT MAX(total_tickets)
FROM (
SELECT SUM(B2.num_tickets) AS total_tickets
FROM Bookings B2
JOIN Movies M2 ON B2.movie_id = M2.movie_id
WHERE M2.genre = M.genre
GROUP BY M2.title
) AS SelectMAX
)
ORDER BY `예매 티켓 수` DESC;
