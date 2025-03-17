# 날짜: 2025/01/06
# 이름: 손준오
# 내용: 1장 데이터베이스 설치와 생성

# 실습 1-1
CREATE DATABASE `StudyDB`;
DROP DATABASE `StudyDB`;

# 실습 1-2
CREATE USER 'sjo112777'@'%'identified by '1234';
GRANT ALL privileges on studyDB.* to 'sjo112777'@'%';
flush privileges;

# 실습 1-3
alter user 'sjo112777'@'%' identified by 'abc1234';
drop user 'sjo112777'@'%';
flush privileges;