use practice_sql;

-- 거래내역 테이블
-- 거래번호 정수
-- 거래일자 날짜
-- 거래구분 가변문자열 10
-- 내역 장문의 문자열
-- 금액 정수
-- 세금 정수
-- 비고 장문의 문자열

create table transaction (
	transaction_number int, 
    transaction_date date,
    transasction_type varchar(10),
    breakdown text,
    amount int,
    tax int, 
    note text
);

insert into transaction values (1, '2024-07-10', '구매', '기타자재', 1000000, 0, null); 
insert into transaction values (2, '2024-07-10', '판매', '영양재', 700070, 70000, '종합 비타민'); 
insert into transaction values (3, '2024-07-12', '판매', '영양재', 12000000, 1200000, '종합 비타민'); 
insert into transaction values (4, '2024-07-13', '구매', '책상', 4000000, 0, '4개 구매'); 
insert into transaction values (5, '2024-07-13', '구매', '노트북', 1000000, 0, '4대 구매'); 
insert into transaction values (6, '2024-07-17', '판매', '의약외품', 2000000, 200000, '소염진통제'); 
insert into transaction values (7, '2024-07-18', '구매', '기타자재', 1000000, 0, '볼펜 및 노트'); 
insert into transaction values (8, '2024-07-19', '판매', '의약외품', 1500000, 150000, '소염진통제'); 
insert into transaction values (9, '2024-07-20', '판매', '의료기구', 8000000, 800000, '휠체어'); 
insert into transaction values (10, '2024-07-21', '판매', '영양제', 4000000, 400000, '종합 비타민'); 


update transaction set amount = 700000 where transaction_number = 2;

-- 연산자

-- 산술 연산자
-- +, -, *, /, %
select amount + tax, breakdown from transaction;

-- 비교 연산자 (where 절에서 자주 사용)
-- 원하는 레코드를 정확히 조회하는데 중요한 역할을 함

-- = : 좌항이 우항과 같으면 true
select * from transaction where transasction_type = '구매';

-- <>, != : 좌항이 우항과 다르면 true
select * from transaction where transasction_type <> '구매';
select * from transaction where transasction_type != '구매';

-- < : 좌항이 우항보다 작으면 true
-- <= : 좌항이 우항보다 작거나 같으면 true
select * from transaction where amount < 1000000;

select * from transaction where amount <= 1000000;

-- > : 좌항이 우항보다 크면 true
-- >= : 좌항이 우항보다 크거나 같으면 true
select * from transaction where amount > 1200000;
select * from transaction where amount >= 1200000;

alter table transaction add complete boolean;

update transaction set complete = true where (transaction_number % 3) = 1;

update transaction set complete = false where (transaction_number % 3) = 2;

select * from transaction;

update transaction set note = null where transaction_number = 6;

-- <=> : 좌항과 우항이 모두 null 이면 true
select * from transaction where note <=> complete;

-- IS : 좌항이 우항과 같으면 true (키워드)
-- IS NOT : 좌항이 우항이 다르면 true (키워드)
select * from transaction where complete is true;
select * from transaction where complete is null;
select * from transaction where complete is not null;

-- BETWEEN a AND b : 좌항이 a보다 크거나 같으면서 b보다 작거나 같으면 true
-- NOT BETWEEN a AND b : 좌항이 a보다 작거나 b보다 크면 true
select * from transaction where transaction_date between '2024-07-15' and '2024-07-20';
select * from transaction where transaction_date not between '2024-07-15' and '2024-07-20';

-- IN() : 주어진 리스트 중에 하나라도 일치하면 true
-- NOT IN() : 주어진 리스트 중에 하나라도 일치하지 않으면 true
select * from transaction where breakdown in('노트북', '책상');

-- 논리연산자

-- AND (&&) : 좌항과 우항이 모두 true이면 true
select * from transaction where transasction_type = '판매' and amount >= 1500000;

-- OR (||) : 좌항과 우항 중 하나라도 true이면 true
select * from transaction where transaction_date >= '2024-07-15' or transasction_type = '판매';

-- XOR : 좌항과 우항이 서로 다르면 true
select * from transaction where transaction_date >= '2024-07-15' xor transasction_type = '판매';

-- LIKE 연산자 : 문자열을 패턴을 기준으로 비교하고자 할 때 사용
-- % : 임의의 개수(0 ~ 무한대)의 문자 표현
-- _ : 임의의 한 개 문자를 표현
select * from transaction where transaction_date like '2024-07-%';

-- 언더바 하나면 하나의 문자만 날짜는 2자리니까 언더바를 두개 해야됨
select * from transaction where transaction_date like '2024-07-__';

select * from transaction where breakdown like '의%';

select * from transaction where transaction_date like '%10';

select * from transaction where transaction_date like '2024-__-13';

-- 정렬
-- ORDER BY : 조회 결과를 특정 컬럼 기준으로 정렬
-- ASC : 오름차순 정렬 / DESC : 내림차순 정렬
select * from transaction order by amount asc;
select * from transaction order by amount desc;
select * from transaction order by tax, amount desc;
select * from transaction order by amount desc, tax;

-- 중복 제거
-- DISTINCT : SELECT 결과 테이블에서 컬럼의 조합의 중복을 제거하여 출력
select distinct breakdown from transaction;
select distinct breakdown, amount from transaction;





