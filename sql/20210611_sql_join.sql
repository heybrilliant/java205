-- 2021.06.11

-- JOIN

-- 1) CROSS JOIN
-- 스키마의 합 : 집합의 곱 연산과 같다 

select * -- 모든 경우의 수 (4*14 = 56개의 데이터 출력)
from emp,dept;

select *
from emp, dept
where emp.deptno = dept.deptno; -- 공통컬럼(EQUI JOIN)
-- 같은 것만 추리면 14개의 데이터값만 나옴 
-- 외래키와 기본키를 서로 비교해서 처리

-- 이름이 SCOTT인 사람의  : where e.ename = 'SCOTT' ( e.ename에 e.은 생략가능 -> ename만 써도된다)
-- 부서명을 출력해봅시다
-- 출력해야하는 컬럼을 가지는 테이블을 확인해보자
-- 이름 : emp / 부서명  : dept
select e.ename, d.dname, d.deptno
from emp e, dept d
where e.deptno = d.deptno -- and ename = 'SCOTT';
order by d.dname, e.ename; -- 부서가 같으면 이름 순서대로 정렬

-- self join : 자기자신을 조인(참조)
-- emp -> mgr 컬럼이 emp.empno 참조 
select e.ename, e.mgr, m.ename
from emp e, emp m  -- 14X14 = 296개의 데이터가 나옴
where e.mgr = m.empno; -- where절 걸어주면 13개로 줄어듬
--where e.mgr = m.empno(+); -- 필요한 쪽에 (+) 붙이면 null도 표현이 가능하다(Outer join)

