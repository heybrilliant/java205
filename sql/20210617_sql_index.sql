-- 2021.06.17

-- INDEX 
-- 검색을 빠르게 하기 위한 객체 
-- 물리적인 저장 공간이 필요 
-- 생성하는데 시간이 필요하다
-- 너무 많은 인덱스는 DML작업이 많은 경우 성능 저하가 온다 

-- emp01 테이블을 복사 -> 튜플(row)들을 계속해서 복사 
drop table emp01;
create table emp01
as select * from emp;

insert into emp01 select * from emp;
select * from emp01;
insert into emp01(empno, ename) values (0000, 'gana');

-- emp01 테이블에 ename 컬럼을 index 설정
create index index_emp01_ename
on emp01(ename) 
;