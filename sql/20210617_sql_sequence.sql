-- 2021.06.17

-- 시퀀스 : 숫자를 생성하는 객체 
-- 설정을 통해 일련번호를 생성 -> 기본키가 대리키인 경우 입력되는 값으로 사용 


-- dept table 복사 -> deptno에 들어갈 데이터 시퀀스 생성 -> insert 테스트
drop table dept03;

create table dept03
as select * from dept where 1 = 0;
select * from dept03;

-- 시퀀스 생성
create sequence dept_deptno_seq
start with 10   -- 시작지점
increment by 10 -- 증가단위 
; -- 10에서 시작하고 10씩 증가한다

-- dept03에 저장
-- insert into dept03 values (10, 'dev', 'seoul'); -- 부서번호를 생성할때마다 계속 증가시켜줘야함 -> 시퀀스 사용
insert into dept03 values (dept_deptno_seq.nextval, 'dev', 'seoul');
select * from dept03;