use practice_sql;

-- 데이터 조작어 (DML)
-- 테이블에 레코드를 삽입, 조회, 수정, 삭제 할때 사용

-- INSERT : 테이블에 레코드를 삽입하는 명령

-- 1. 모든 컬럼에 대하여 삽입
-- INSERT INTO 테이블명 VALUES(데이터1, 데이터2, ...)
-- 테이블 구조의 컬럼 순서에 맞게 모든 데이터를 입력해야함
insert into example_table values ('데이터1', '데이터2');

-- 2. 특정 컬럼을 선택하여 삽입
-- INSERT INTO 테이블명 (컬럼명1, 컬럼명2, ...)
-- VALUES (데이터1, 데이터2, ...)
-- 지정한 컬럼의 순서와 데이터의 순서가 일치해야함
insert into example_table (example_column2) values ('선택 데이터1');

-- SELECT : 테이블에서 레코드를 조회할 때 사용하는 명령어

-- 1. 모든 데이터 조회
-- SELECT * FROM 테이블명;
select * from example_table;

-- 2. 특정 컬럼 선택 조회
-- SELECT 컬럼명1, 컬럼명2, ... FROM 테이블명;
select column1 from example_table;

-- 3. 특정 레코드 선택 조회
-- SELECT 조회할 컬럼 FROM 테이블명 WHERE 조건;
select * from example_table where column1 = '데이터1';

-- UPDATE : 테이블에서 레코드를 수정할 때 사용하는 명령어
-- UPDATE : 테이블명 SET 컬럼명1 = 데이터1, ...;
-- UPDATE 테이블명 SET 컬렴명1 = 데이터1, ... WHERE 조건;
update example_table set column1 = '수정 데이터';
update example_table set column1 = '선택 수정 데이터' where example_column2 = '데이터2';

-- DELETE : 테이블에서 레코드를 삭제할 떄 사용하는 명령어
-- DELETE FROM 테이블명 WHERE 조건
delete from example_table where column1 = '수정 데이터';

-- DELETE FROM 테이블명
DELETE FROM example_table;

create table auto_table (
	idx int primary key auto_increment,
    num int
);

insert into auto_table(num) values (0);

select * from auto_table;

delete from example_table;

delete from auto_table;
truncate table auto_table;

-- DROP TABLE : DDL 테이블 구조 전체를 제거
-- TRUNCATE TABLE : DDL 테이블 구조만 남기고 상태를 초기화
-- DELETE FROM : DML 테이블 레코드만 제거

-- INSERT INTO SELECT : 삽입 작업시에 조회 결과를 사용하여 삽입
insert into example_table 
select * from example_table where column1 is null;

-- UPDATE SELECT : 수정 작업시 조회 결과를 사용하여 수정 (수정 값에 대하여)
update example_table A set A.column1 = (
	select B.num 
    from auto_table B 
    where B.idx = 1
);

