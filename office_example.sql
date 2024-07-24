-- 데이터베이스 생성
-- officetel
create database officetel;

use officetel;

-- 이메일 인증 테이블
create table email_auth (
	email varchar(100) primary key
    check(email regexp '^[a-zA-Z0-9]+@([-.]?[a-zA-Z0-9])*\.[a-zA-Z]{2,4}$'),
    auth_number varchar(4) not null check(auth_number regexp '^[0-9]{4}$')
);


-- 회원 테이블 (user)
-- - 아이디 [id varchar(20) primary key]
-- - 비밀번호 [password varchar(255) not null]
-- - 이메일 [email varchar(100) not null unique]
-- - 가입경로 [join_path varchar(5) not null default 'home']
-- - 권한 [role varchar(6) not null default 'normal']
-- - 이메일 관계 [constraint user_email_fk foreign key (email) references email_auth (email)]
create table user (
	id varchar(20) primary key,
    password varchar(255) not null,
    email varchar(100) not null unique,
    join_path varchar(5) not null default 'HOME',
    role varchar(6) not null default 'NORMAL',
    constraint user_email_fk foreign key (email) references email_auth (email)
);

-- 게시물 테이블 (board)
-- - 접수번호 [receipt_number int primary key auto_increment]
-- - 제목 [title varchar(50) not null]
-- - 상태 [status boolean not null default false]
-- - 작성자 [writer_id varchar(20) not null]
-- - 작성일 [write_date date not null default now()]
-- - 조회수 [view_count int not null default 0]
-- - 내용 [contents varchar(1000) not null]
-- - 답글 [reply text]
-- - 작성자 관계 [writer_fk foreign key (writer_id) references user (id)]
create table board (
	receipt_number int primary key auto_increment,
    title varchar(50) not null,
    status boolean not null default false,
    writer_id varchar(20) not null,
    write_date datetime not null default now(),
    view_count int not null default 0,
    contents varchar(1000) not null,
    reply text,
    constraint writer_fk foreign key (writer_id) references user (id)
);

-- 로그인
select * from user where id = 'qwer1234' and password = 'qwer1234';

-- 아이디 중복확인
select * from user where id = 'qwer1234';

-- 이메일 인증
insert into email_auth values ('qwer1234@qwer.com', '0123');

-- 이메일 인증확인
select * from email_auth 
where email = 'qwer1234@qwer.com' and auth_number = '0123';

-- 회원가입 
insert into user(id, password, email) values ('qwer1234', 'qwer1234', 'qwer1234@qwer.com');

-- 게시물 리스트
select receipt_number, status, title, writer_id, write_date, view_count 
from board where title like '%열%'
order by receipt_number desc 
limit 0, 10; -- (page_number * 10), 10

-- 게시물 작성
insert into board (title, contents, writer_id)
values ('열두번째 게시물', '안녕하세요', 'qwer1234');

-- 게시물 상세 보기
update board set view_count = view_count + 1
where receipt_number = 1;

select receipt_number, title, writer_id, write_date, view_count, contents, reply
from board where receipt_number = 1;

-- 답글 작성
update board set reply = '반갑습니다.', status = true
where receipt_number = 1;

-- 게시물 수정
update board set title = '게시물 수정', contents = '안녕하세요'
where receipt_number = 1;

-- 게시물 삭제
delete from board where receipt_number = 1;


