-- 2021.06.10

-- 특정 데이터 검색 : 행 검색 > 컬럼 선택
-- 10번 부서의 사원 리스트를 출력 
-- 10번 부서 => where dept=10

select *
from emp
where deptno=10
;

-- 이름이 'SCOTT'인 사원을 출력
SELECT *
FROM EMP
WHERE ENAME='SCOTT'
;

SELECT *
FROM EMP
WHERE ENAME='scott'
;
-- 소문자 scott은 결과값 나오지 않음 (데이터값은 대소문자를 구별한다)

-- 날짜타입의 데이터 비교시에도 작은 따옴표를 이용해야 한다 

select * from emp where hiredate= 96/11/17; -- 에러
select * from emp where hiredate= '96/11/17';

-- 논리연산자 : and, or, not
-- 논리연산자 1) AND
-- 10번 부서의 관리자(manager)를 찾아 출력
select * from emp 
where deptno=10 and job='MANAGER';

-- 논리연산자 2) OR
-- 10번 부서의 직원들과 관리자들의 리스트를 출력
select * from emp 
where deptno = 10 or job = 'MANAGER';

-- 논리연산자 3) NOT
-- 10번 부서의 직원을 제외한 나머지 직원들을 출력 
-- 20번 또는 30번 또는 40번 등등 
select * from emp where deptno=20 or deptno=30 or deptno=40; 
-- 이렇게 해도 되지만 너무 길고 복잡하니까!
select * from emp where not deptno=10;
-- 논리부정연산자 사용해주면 쉽고 편리하게 출력 가능

-- 범위연산을 할 때 -> 논리연산자 이용도 가능함 & between A and B
-- between A and B : A 이상 B 이하

-- ex)2000 이상 3000 이하의 급여를 받는 직원의 리스트를 출력
select ename, sal, job from emp where sal >= 2000 and sal <= 3000;
-- 이렇게 연산자 사용해서 출력도 가능하고 
select ename, job, sal, sal*1.1 as upsal from emp where sal between 2000 and 3000;

-- between 연산자는 날짜형, 문자형의 연산도 가능함
-- 1981년에 입사한 사원들의 리스트를 출력
select * from emp 
where Hiredate >= '1981/01/01' and Hiredate <= '1981/12/31'
order by hiredate;
-- asc : 오름차순 (작은순부터) desc : 내림차순 (큰 숫자부터)
-- 혹은
select * from emp 
where hiredate between '1981/01/01' and '1981/12/31';

-- 연산자 in -> 여러개의 or 연산자 사용시 대체 사용 가능하다
-- 커미션이 300 또는 500 또는 1400
select * from emp where comm=300 or comm=500 or comm=1400;
-- 이렇게 출력도 가능하고 
select * from emp where comm in(300, 500, 1400);
-- 이렇게 in 연산자를 이용해서 간단하게도 출력가능하다 
-- in 연산자 () 안에 다른 SQL함수들을 입력해서 출력도 가능하다

-- 패턴검색: 키워드 검색 많이 사용(게시판 등)
-- 컬럼 like '%'
-- ename like 'F%' -> F로 시작하는 모든 문자열을 찾는 것
-- ename like '%F' -> F로 끝나는 모든 문자열을 찾는 것
-- ename like '%F%' -> F를 포함하는 모든 문자열을 찾는 것
-- ex) 'java'단어를 포함하는지 검색하기 위해서는 : title like '%java%' 로 검색하기 

-- F로 시작하는 이름을 가진 사원을 검색하기
select * from emp 
where ename like 'F%';

-- 이름에 LA가 들어가는 사원 검색하기
select * from emp 
where ename like '%LA%';

-- 자리수 패턴 : 컬럼의 값이 자리수가 정해져 있고 값에 패턴이 있는 경우 
-- 사원 이름의 두 번째 문자에 A를 포함하는 사원의 리스트를 출력하기 
select * from emp
where ename like '_A%';
