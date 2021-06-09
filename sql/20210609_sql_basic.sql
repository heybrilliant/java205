-- 2021.06.09
-- SQL Basic

-- 계정 HR이 보유한 테이블 객체 리스트
select * from tab;

-- 테이블의 정보를 검색: 컬럼의 이름, null의 유무, 타입, 사이즈
desc dept;
desc emp;

-- 데이터 조회를 위한 명령 : Select
-- Select {컬럼명, ...., *} from 테이블이름; (세미콜론 꼭!)

-- select * from emp;

-- 필요한 컬럼을 출력
-- select 컬럼명, 컬럼명 from 테이블이름;
-- 사원의 이름 = empno, 사원명 = ename -> 사원의 사원번호와 사원이름을 출력

select empno, ename, sal from emp;

-- select 컬럼의 산술연산이 가능 : 컬럼과 숫자의 연산도 가능, 컬럼과 컬럼간의 산술연산도 가능
-- 사원이름, 월급여, 연봉계산 결과값 (sal * 12)

select ename, sal, sal*12 as ysal from emp;

select sal, comm, sal*comm, sal*12, sal/10 
from emp;


-- 사원의 이름, 직급, 급여, 커미션, 연봉(월급*12), 연봉(월급*12*커미션)

select ename, job, sal, comm, sal*12 as ysal1, sal*12+nvl(comm,0) as ysal2
from emp;

-- 개선 : null값을 0으로 치환해서 연산
-- nvl(컬럼이름, 기본값) :  컬럼의 값이 null일때 기본값으로 치환해줌


-- 컬럼과 문자열을 붙이는 연산 || 이용
-- sql에서 문자열을 표현할 때는 작은 따옴표 '' 이용

select ename || ' is a ' || job
from emp;