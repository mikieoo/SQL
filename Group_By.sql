use practice_sql;

create table sale (
	sequence_number int primary key auto_increment,
    date date,
    amount int,
    employee_number int
);

insert into sale(date, amount, employee_number) values ('2024-07-01', 100000, 1);
insert into sale(date, amount, employee_number) values ('2024-07-01', 120000, 2);
insert into sale(date, amount, employee_number) values ('2024-07-01', 60000, 3);
insert into sale(date, amount, employee_number) values ('2024-07-03', 200000, 1);
insert into sale(date, amount, employee_number) values ('2024-07-03', 170000, 3);
insert into sale(date, amount, employee_number) values ('2024-07-06', 100000, 2);
insert into sale(date, amount, employee_number) values ('2024-07-06', 160000, 3);
insert into sale(date, amount, employee_number) values ('2024-07-07', 80000, 1);
insert into sale(date, amount, employee_number) values ('2024-07-08', 90000, 2);
insert into sale(date, amount, employee_number) values ('2024-07-08', 110000, 3);

-- 집계 함수 : 여러 행의 레코드를 종합하여 하나의 결과값을 반환

-- COUNT() : 특정 조건에 해당하는 레코드의 개수를 반환