# 주석
-- 주석 

-- 데이터 정의어 (DDL)
-- 데이터베이스, 테이블, 사용자 등(스키마)을 정의하는데 사용되는 언어

-- CREATE : 구조를 생성하는 명령
-- CREATE 생성할구조 구조이름 [... 구조의 정의];

-- 데이터베이스 생성
create database practice_sql;

-- 데이터베이스 사용 : 데이터베이스 작업을 수행하기 전에 반드시 작업할 데이터베이스를 선택해야함
use practice_sql;

-- 테이블 생성
create table example_table (
	example_column1 int, 
    example_column2 boolean
);

-- 컬럼 데이터 타입
 create table data_type (
	-- INT : 정수 타입
    int_column int,
    -- DOUBLE : 실수 타입
    double_column double,
    -- FLOAT: 실수 타입
    float_column float,
    -- BOOLEAN : 논리 타입
    boolean_column boolean,
    -- VARCHAR(문자열 길이) : 가변길이 문자열
    string_column varchar(10),
    -- TEXT : 단순 장문 문자열
    text_column text,
    -- DATE : 날짜
    date_colmn date,
	-- DATETIME : 날짜 및 시간
    datetime_column datetime
);

-- 사용자 생성
-- CREATE USER '사용자명'@'접속IP' IDENTIFIED BY '비밀번호';
CREATE USER 'developer'@'127.0.0.1' identified by 'P!ssw0rd';
create user 'developer'@'192.168.1.101' identified by 'P!ssw0rd';
create user 'developer'@'%' identified by 'P!ssw0rd';
