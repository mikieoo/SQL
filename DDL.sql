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

-- DROP : 데이터 구조(스키마)를 삭제하는 명령어
-- DROP 스키마명

-- 사용자 삭제
drop user 'developer'@'%';

-- 테이블 삭제
-- 만약 해당 테이블을 참조하고 있는 다른 테이블이 존재하면 테이블 삭제가 불가능
drop table example_table;

-- 데이터베이스 삭제
drop database practice_sql;

-- ALTER : 구조를 변경하는 명령어

-- 테이블의 컬럼 추가
alter table example_table add example_column3 varchar(10);

-- 테이블 컬럼 삭제
alter table example_table drop column example_column3;

-- 테이블 컬럼 타입 수정
alter table example_table modify column example_column2 text;

-- 테이블 컬럼 전체 수정
alter table example_table change example_column1 column1 varchar(20);

-- 데이터베이스 문자셋 변경
alter database practice_sql default character set utf8;

-- 유저 비밀번호 변경
