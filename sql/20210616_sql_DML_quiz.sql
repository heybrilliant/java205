-- 2021.06.16
-- DML Quiz 

--  앞에서 생성한 전화번호부 테이블을 기준으로 DML 을 작성해봅시다.
-- 1. phoneInfo_basic 테이블의 SELECT, UPDATE, DELETE, INSERT 하는 SQL
desc phoneInfo_basic;

-- insert
insert into phoneInfo_basic(idx, fr_name, fr_phonenumber, fr_email, fr_address, fr_regdate) 
values (1, '신하나', '010-1234-5678', '1111@gmail.com', '경기도 부천시', '210616');
insert into phoneInfo_basic(idx, fr_name, fr_phonenumber, fr_email, fr_address, fr_regdate) 
values (2, '고둘째', '010-1122-3344', '2222@gmail.com', '제주도 제주시', '920508');
insert into phoneInfo_basic(idx, fr_name, fr_phonenumber, fr_email, fr_address, fr_regdate) 
values (3, '한셋째', '010-7788-9999', '3333@gmail.com', '경기도 부천시', '921207');
insert into phoneInfo_basic(idx, fr_name, fr_phonenumber, fr_email, fr_address, fr_regdate) 
values (4, '송넷째', '010-0000-0000', '4444@gmail.com', '경기도 안양시', '920818');
insert into phoneInfo_basic(idx, fr_name, fr_phonenumber, fr_email, fr_address, fr_regdate) 
values (5, '유다섯', '010-5555-0828', '5555@gmail.com', '경기도 수원시', '940828');

-- select
select * from phoneInfo_basic ;

-- update
-- 이름이 신하나인 친구의 전화번호와 주소 업데이트 
update phoneInfo_basic
set fr_phonenumber = '010-1234-5390', fr_regdate = '210101'
where fr_name = '신하나';

-- delete
-- 주소가 경기도 부천시인 친구의 데이터 삭제 
delete from phoneinfo_basic
where fr_address = '경기도 부천시';

-- 2. phoneinfo_univ 테이블의 SELECT, UPDATE, DELETE, INSERT 하는 SQL
desc phoneInfo_univ;


-- insert
insert into phoneInfo_univ (idx, fr_u_major, fr_u_year, fr_ref)
values (1,'생명공학', 4, 2); 
insert into phoneInfo_univ (idx, fr_u_major, fr_u_year, fr_ref)
values (2,'문예창작', 2, 3);


-- select 
select * from phoneInfo_univ;

select * 
from phoneInfo_basic pb, phoneInfo_univ pu
where pb.idx = pu.fr_ref;

-- update 
-- 전공과 학년을 수정, idx 또는 왜래키 
update phoneInfo_univ
set fr_u_major = 'computer', fr_u_year = 4
where idx = 3
;

-- delete
delete from phoneInfo_univ
where fr_u_year = 4
;

-- 3. phoneinfo_com 테이블의 SELECT, UPDATE, DELETE, INSERT 하는 SQL

desc phoneInfo_com;

-- insert
insert into phoneInfo_com (idx, fr_c_company, fr_ref)
values (1, 'HK', 4); 
insert into phoneInfo_com (idx, fr_c_company, fr_ref)
values (2,'Oracle',5);

-- select 
select * from phoneInfo_com;

select *
from phoneInfo_basic pb , phoneInfo_com pc
where pb.idx = pc.fr_ref;

-- update
update phoneInfo_com
set fr_c_company = sm.ent
where fr_ref = 5
;

-- delete 
delete from phoneInfo_com
where fr_ref = 4;


