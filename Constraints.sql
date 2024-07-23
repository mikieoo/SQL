use practice_sql;

-- 제약조건 : 데이터베이스 테이블 컬럼의 삽입, 수정, 삭제 시 적용되는 규칙

-- NOT NULL 제약조건 : 해당 컬럼의 null을 포함하지 못하도록 제약
create table not_null_table (
	null_column int,
    not_null_column int not null
);

-- NOT NULL 제약조건이 걸린 컬럼에 값을 지정하지 않음
insert into not_null_table(null_column) values(1);
-- NOT NULL 제약조건이 걸린 컬럼에 null을 지정함
insert into not_null_table values (null, null);

insert into not_null_table values (1, 1);
insert into not_null_table values (null, 2);
insert into not_null_table(not_null_column) values (2);

select * from not_null_table;

-- NOT NULL 제약조건이 걸린 컬럼은 null로 수정할 수 없음
-- (INSERT, UPDATE)
update not_null_table set not_null_column = null;

-- UNIQUE 제약조건 : 해당 컬럼에 중복된 데이터를 포함할 수 없도록 하는 제약
create table unique_table (
	unique_column int unique,
    not_unique_column int
);

insert into unique_table values (1, 1);
-- UNIQUE로 지정된 컬럼은 중복된 데이터를 삽입할 수 없음
insert into unique_table values (1, 1);
insert into unique_table values (2, 1);

select * from unique_table;

-- UNIQUE로 지정된 컬럼은 중복된 데이터로 수정할 수 없음
update unique_table set unique_column = 3;
update unique_table set unique_column = 1 where unique_column = 2;

-- NOT NULL + UNIQUE = 후보키
-- 후보키 : 테이블에서 각 레코드를 고유하게 식별할 수 있는 속성
-- 기본키 : 테이블에서 각 레코드를 고유하게 식별하기 위해 
-- 대체키 : 후보키에서 기본키를 제외한 나머지 속성들

-- PRIMARY KEY 제약조건 : 특정 컬럼을 기본키로 지정
-- (INSERT, UPDATE)
create table key_table (
	primary_column int primary key,
    surrogate_column int not null unique
);

-- PRIMARY KEY 제약조건은 NOT NULL, UNIQUE 제약조건을 모두 가지고 있음
-- (자신 테이블 INSERT, UPDATE)
insert into key_table values (1, null);
insert into key_table (surrogate_column) values (1);
insert into key_table values (1, 1);
insert into key_table values (1, 2);

-- PRIMARY KEY 제약조건을 두 개 이상 지정 불가능
create table composite_table (
	primary1 int primary key,
    primary2 int primary key
);

create table composite_table (
	primary1 int,
    primary2 int,
    constraint primary_key primary key (primary1, primary2)
);

-- FOREIGN KEY 제약조건 : 특정 컬럼을 다른 테이블 혹은 같은 테이블의 기본 키 컬럼과 연결하는 제약
-- FOREIGN KEY 제약조건을 특정 컬럼에 적용할 때는 반드시 데이터 타입이 참조하고자하는 컬럼의 일치해야함
create table foreign_table (
	primary1 int primary key,
    foreign1 int,
    constraint foreign_key foreign key(foreign1)
    references key_table(primary_column)
);

insert into foreign_table values (1, 0);
insert into foreign_table values (1, 1);

select * from foreign_table;