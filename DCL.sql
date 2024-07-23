use practice_sql;

-- 데이터 제어어 (DCL)
-- 사용자에게 스키마에 대한 권한 부여 및 회수에 사용

-- GRANT : 특정 사용자에게 스키마에 대한 권한을 부여하는 명령어
-- GRANT 권한리스트 ON 데이터베이스.테이블 TO 유저이름@접근위치;
grant select, insert on practice_sql.example_table to 'developer'@'127.0.0.1';
grant all on *.* to 'developer'@'127.0.0.1';

-- REVOKE : 특정 사용자에게 스키마에 대한 권한을 회수하는 명령어
-- REVOKE 권한리스트 ON 데이터베이스.테이블 FROM 유저이름@접근위치;
revoke all on *.* from 'developer'@'127.0.0.1';