--2021.06.15

--DDL : 데이터 정의어

-- 테이블 생성 : create table
-- 테이블 수정 : alter table
-- 테이블 삭제 : drop table

-- create table ( 
--            컬럼이름 타입(사이즈) 제약조건 정의,
--            ... ,
-- )

-- create table ( 
--            컬럼이름 타입(사이즈), 
--            ... ,
--            제약조건 정의,
--            ....
-- )

-- 사원테이블과 유사한 구조의
-- 사원번호, 사원이름, 급여 3개의 칼럼으로 구성된 
-- EMP01 테이블을 생성해봅시다.

create table EMP01(
    empno number(4), -- 사원번호
    ename VARCHAR2(20), -- 사원이름
    sal number(6,2)
);

-- 서브쿼리를 이용해서 기존 테이블의 구조를 복사하고 해당 튜플도 복사 
create table emp02
as
select * from emp
;

select * from emp02
; -- emp의 튜플이 전부 똑같이 들어간걸 확인할 수 있음
-- 내용은 전부 가져오나 제약조건은 가져오지 않는다(pk 등은 가져오지 않음)
-- > 똑같이 만드려면 복사 후 alter 복사table(수정)으로 제약조건을 추가해줘야한다

create table emp03
as
select empno, ename, sal from emp 
;

select * from emp03;

create table emp04
as
select * from emp where deptno=30
;

select * from emp04;

create table emp05
as
select * from emp where 1=2
;

select * from emp05; -- false 값을 가지므로 구조만 복사해온다


-- 테이블의 변경 : alter table
-- alter table (테이블이름) add
-- alter table (테이블이름) modify
-- alter table (테이블이름) drop

--emp01 테이블에 job컬럼을 추가해보자
alter table emp01
add(job varchar2(9))
;
desc emp01;

-- emp01 테이블의 job컬럼의 사이즈를 수정해보자 9 -> 30
alter table emp01 
modify (job varchar2(30)) -- 바꾸고자 하는 컬럼의 정의가 누락되면 안된다. 전부 정의해줘야함 만약 제약조건이 있다면 제약조건도!
;
alter table emp01 
modify (job varchar2(130) not null)
;

-- emp01 테이블의 job컬럼을 삭제해보자
alter table emp01
drop column job
;

-- 테이블 삭제
drop table emp06; -- 없는 테이블 오류:"table or view does not exist"
drop table emp02;

select * from emp02;


-- 모든 행을 삭제하는 turncate : 롤백이 되지 않는다 ( 전으로 돌아갈 수 없다)
TRUNCATE table emp02;

-- 테이블의 이름 변경 -> rename 현재 이름 to 새로운 이름
rename emp01 to test;

drop table emp02;


create table emp02
as
select empno, ename, job, sal from emp where 1=0 -- 무조건 false값나오게 설정해서 틀만 가져오가
;

-- not null
-- 필수 입력을 요구하는 컬럼이 있다면 null값이 저장되지 못하도록 제약조건을 설정해야함 
-- 형식 : column_name data_type not null 
-- ex) ename varchar2(15) not null 

insert into emp02(empno, ename, sal, job, deptno)
            values(1000, 'SON' ,10000 ,'MANAGER', 50);
insert into emp02 values(null, null, 'MANAGER', 10000);

select * from emp02;

desc emp02;

-- unique
-- 특정 칼럼에 대해 자료가 중복되지 않게 하는 것
-- 지정된 칼럼에는 유일한 값이 수록되게 함
-- 칼럼명 자료형 unique 순으로 기술

create table emp03(
empno number(4) unique,
ename varchar2(10) not null) --만약 not null 이면서 unique라면 not null unique 순으로 기재
;

-- 만약 not null 이면서 unique라면 primary key로 지정해줄 수 있음
-- primary key : not null 이면서 unique -> 다른 칼럼과 중복되지 않으면서도 null이 아닌 값으로 다른 칼럼과 식별가능한 키가 될 수 있다 (식별키)

-- check
-- 저장 가능한 데이터 값의 범위나 조건을 지정하여 설정한 값만 허용하는 것
-- 입력되는 값을 체크하여 설정된 값 이외의 값이 들어오면 오류 메시지와 함께 명령이 수행되지 못하게 하는 것
-- ex) check sal number(6) check (sal >500); or check (gender in('M', 'F');


-- 컬럼 레벨에서 제약 사항 정의
create table emp02( 
    empno number(4) constraint emp02_empno_fk primary key,    -- not null unique,
    ename varchar2(20) constraint emp02_ename_nn not null,
    sal number(6,2) constraint emp02_sal_ck check (sal >500 and sal <5000),
    job varchar2(20) default '미지정',
    deptno number constraint emp02_deptno_fk references dept(deptno)
);
 drop table emp03;
 desc dept;
 
 
 -- 테이블 레벨에서 제약사항 정의
 create table emp03( 
    empno number(4), -- constraint emp02_empno_fk primary key,    -- not null unique,
    ename varchar2(20) constraint emp03_ename_nn not null, -- not null 제약은 column 레벨에서만 정의가능
    sal number(6,2) constraint emp03_sal_ck check (sal > 500 and sal < 5000),
    job varchar2(20), -- default '미지정',
    deptno number, -- constraint emp02_deptno_fk references dept(deptno)
    ------------------------------------------------------------------------
    -- 제약 정의
    constraint emp03_empno_pk primary key (empno), -- pk 제약
    --constraint emp02_ename_nn not null, -- not null 제약은 column 레벨에서만 정의가능
    --constraint emp03_sal_check 
    constraint emp03_deptno foreign key (deptno) references dept(deptno)
);
 