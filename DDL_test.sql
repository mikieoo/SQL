-- 카타르 아시안컵 데이터베이스

-- 참가팀(국) (국가명, 조, 감독, 피파랭킹)
-- 선수 (이름, 나이, 포지션, 등번호, 국가)
-- 경기장 (경기장 이름, 수용인원, 주소)
-- 심판 (이름, 나이, 국적, 포지션)

-- 1. 카타르 아시안컵 데이터베이스 생성
-- qatar_asian_cup
create database qatar_asian_cup;

-- 2. 개발자 계정 생성
-- 사용자명 : qatar_developer / 접근위치 : 모든 곳에서 접근 가능 / 비밀번호 : qatar123
create user 'qatar_developer'@'%' identified by 'qatar123';
use qatar_asian_cup;

-- 3. 테이블 생성
-- 1. 참가국 : country (name[가변문자열 30], group_name[가변문자열 5], manager[가변문자열 30], ranking[정수])
create table country (
	name varchar(30),
    group_name varchar(5),
    manager varchar(30),
    ranking int
);

-- 2. 선수 : player (name[가변문자열 30], age[정수], position[가변문자열 10], back_num[정수], country[가변문자열 30])
create table player (
	name varchar(30),
    age int,
    position varchar(10),
    back_num int,
    country varchar(30)
);

-- 3. 경기장 : stadium (name[가변문자열 50], volume[정수], address[문자열])
create table stadium (
	name varchar(50),
    volunme int,
    address text
);

-- 4. 심판 : referee (name[가변문자열 30], age[정수], country[가변문자열 30], position[가변문자열 10])
create table referee (
	name varchar(30),
    age int,
    country varchar(30),
    position varchar(10)
);
