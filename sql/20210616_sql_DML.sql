--2021.06.16

-- DML : 테이블의 내용 추가, 수정, 삭제 

-- 테스트 테이블 생성 
create table dept01
as 
select * from dept where 1=0; -- 언제나 false이기 때문에 테이블 구조만 가져오기 가능

-- 데이터 입력 : 행 단위의 입력 
-- : INSERT INTO 테이블명 (컬럼 이름,...) VALUES (데이터,...)
-- 정의된 입력하고자 하는 컬럼과 입력 데이터의 개수는 일치해야 한다. 
-- 컬럼의 도메인과 입력데이터의 타입이 일치해야 한다. 
-- 기본키와 같이 NOT NULL인 경우 컬럼을 생략할 수 없다 

desc dept01;
select * from dept01;

-- 10번 부서 개발팀 서울 위치 - 데이터 입력
insert into dept01 (deptno, dname, loc) 
values (10, '개발팀', '서울');

-- 에러의 종류 
insert into dept01 (deptno, dname) 
values (10, '개발팀', '서울'); -- 에러 : "too many values" 컬럼 < 데이터 

insert into dept01 (deptno, dname, loc) 
values (10, '개발팀'); -- 에러 : "not enough values" 컬럼 > 데이터

insert into dept01 (deptno, dname, loc) 
values ('삼십', '개발팀', '서울'); -- 에러 : invalid number : 숫자 데이터타입에 글자 데이터가 들어간 에러 
-- deptno에 '30'의 데이터는 삽입 가능함 : SQL에서 실행될 때 내부적으로 숫자로 자동형변환 되어서 입력됨 

insert into dept (dname, loc) 
values ('개발팀', '서울'); -- 에러 cannot insert NULL into ("HR"."DEPT"."DEPTNO")

-- 데이터 저장할 컬럼 기술을 생략할 수 있다 
-- 모든 컬럼의 데이터를 입력할 때 생략 가능
-- values 절의 데이터의 순서는 -> 테이블이 생성될 때 정의된 컬럼의 순서 
-- : desc 테이블명 
desc dept01;

insert into dept01 values (20, '마케팅','부산');

desc orders;

insert into orders (orderid, custid, bookid) values (100, 6, 11);
-- 에러 : value larger than specified precision allowed for this column
insert into orders (orderid, custid, bookid) values (11, 6, 11);
-- 에러 : integrity constraint (HR.SYS_C007008) violated - parent key not found 잘못된 데이터 입력, 부모키 X


-- 서브쿼리를 이용한 데이터 입력
drop table dept02;
create table dept02 
as select * from dept where 0=1;
select * from dept02;

-- 데이터 입력
insert into dept02
select * from dept 
; -- 중복 삽입 가능 : 3번 실행하면 총 12개 행이 삽입됨

insert into dept02
select * from dept02  
; -- 자기 자신의 table도 삽입가능함



-- 데이터를 변경 : 행단위로 선택하고 변경하고자 하는 컬럼을 기술 
-- : update 테이블명 set 컬럼이름=새로운 데이터, 컬럼이름=새로운 데이터, where 행을 선택하는 조건

create table dept03
as select * from dept
;
select * from dept03
;

-- 모든 부서의 위치를 SEOUL로 이동하고자 한다 
update dept03 
set loc = 'SEOUL'
;   -- where 절은 필요하지 않음 -> why? 모든 절(모든 loc행)을 수정해야하기 때문

-- 10번 부서의 위치를 PUSAN으로 이동, 부서명칭도 DEV 로 변경하고자 함 
update dept03
set loc = 'PUSAN', dname = 'DEV' -- 바뀌는 열의 순서는 상관없음 dname이 더 먼저 위치한 열이지만 set에서는 그런 순서 상관 X
where deptno = 10;

update dept03
set loc = 'PUSAN', dname = null
where deptno = 10;
-- dname에 null값이 위치하게 됨/ 만약 dname 데이터가 not null이라면 null이 위치할 수 없기 때문에 error 발생


-- emp01을 새롭게 생성하고 데이터 update해보기 
drop table emp01;
create table emp01 
as select * from emp;
desc emp;

select * from emp01;

-- 1. 모든 사원의 부서번호를 30번으로 수정합시다. 
update emp01 
set deptno = 30; -- 모든 사원의 부서번호 이므로 where절 필요X

-- 2. 모든 사원의 급여를 10% 인상시킵시다. 
update emp01
set sal = sal * 1.1; -- 모든 사원의 부서번호 이므로 where절 필요X

-- 3. 모든 사원의 입사일을 오늘로 수정하기 
update emp01
set hiredate = sysdate;
rollback;
-- 부서번호가 10번인 사원의 부서번호를 30번으로 수정합시다 
update emp01
set deptno = 30
where deptno = 10
;

-- 급여가 3000이상인 사원만 급여를 10% 인상합시다.
update emp01
set sal = sal * 1.1
where sal >= 3000
;

-- 1981년에 입사한 사원의 입사일을 오늘로 수정합시다.
update emp01
set hiredate = sysdate
where substr(hiredate,1,2) = 81 -- '81'로 표기 가능
;

-- SCOTT 사원의 부서번호는 30번으로, 직급은 MANAGER로 한꺼번에 수정하도록 합시다
update emp01
set deptno = 30, job = 'MANAGER'
where ename = 'SCOTT'
;
rollback;

-- SCOTT 사원의 입사일자는 오늘로, 급여를 50으로 커미션을 4000으로 수정합시다.
update emp01
set hiredate = sysdate, sal = 50, comm = 4000
where ename = 'SCOTT'
;

-- 서브쿼리를 이용한 데이터 수정
-- 20번 부서의 지역명을 40번 부서의 지역명으로 변경하기 위해서 서브쿼리문 사용
truncate table dept01;

insert into dept01
select * from dept
;
select loc from dept01 where deptno = 40;

update dept01
set loc = 'BOSTON'
where deptno = 20
;


update dept01 
set loc = (select loc from dept01 where deptno = 40)
where deptno = 20
;

select * from dept01;
rollback;
-- 서브쿼리를 이용한 두개의 컬럼값 동시에 변경하기 
-- 부서번호가 20번인 부서의 이름과 지역은 RESEARCH와 DALLAS 입니다.
-- 다음은 부서번호가 20인 부서의 부서명과 지역명을 부서 번호가 40번인 부서와 동일하게 변경하시오
update dept01
set (dname, loc) = (select dname, loc
                    from dept
                    where deptno = 40)
where deptno = 20;                    

--부서번호가 20인 부서의 부서명과 지역명을 
-- 부서 번호가 10번인 부서와 동일하게 변경하시오
select * from dept01 where deptno = 10;
select * from dept01 where deptno = 20;

update dept01
set (dname, loc) = (select dname, loc from dept01 where  deptno = 10)
where deptno = 20
;


-- 데이터를 삭제 : 행 단위의 삭제 
-- : delete from 테이블이름 where 조건;
-- 마찬가지로 where절을 쓰지않으면 전체 행의 데이터가 삭제된다

-- dept01 테이블의 모든 데이터를 삭제해보자
delete from dept01;

-- 이름이 SCOTT인 사원을 삭제해보자 
delete from emp01 where ename = 'SCOTT';
select * from emp01;

-- 사원 테이블에서 부서명이 SALES인 사원을 모두 삭제해봅시다 
select deptno from dept where dname = 'SALES';
delete from emp01
where deptno = (select deptno from dept where dname = 'SALES')
;