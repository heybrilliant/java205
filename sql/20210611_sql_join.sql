-- 2021.06.11

-- JOIN


-- JOIN 
-- : SQL에서 두 개 이상의 테이블을 결합해야만 원하는 결과를 얻을 수 있을 때, 한 번의 질의로 원하는 결과를 얻을 수 있는 조인 기능을 제공한다.

-- 1) CROSS JOIN
-- 특별한 키워드 없이 SELECT문의 FROM절에 원하는 테이블을 콤마(,)로 연결하여 연속하여 기술하는 것
-- 스키마의 합 : 집합의 곱 연산과 같다 
-- CROSS JOIN은 조인될 때 아무런 조건을 제시하지 않았기 때문에 두 테이블이 결합된 모든 경우의 수( ex.4개 항목 테이블-3개 항목 테이블 조인시 12개 항목 모두 출력)가 나타나기 때문에 CROSS JOIN의 결과는 아무런 의미를 갖지 못한다.
-- 따라서 JOIN의 결과가 의미를 가지려면 조인할 때 조건을 지정해야 한다.

select * -- 모든 경우의 수 (4*14 = 56개의 데이터 출력)
from emp,dept; -- 붙이고자 하는 테이블들을 콤마(,)로 연결하여 기술

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
select e.ename, e.mgr, m.ename -- 사원이름, 관리자 번호, 관리자 이름 출력
from emp e, emp m  -- 14X14 = 296개의 데이터가 나옴
where e.mgr = m.empno; -- where절 걸어주면 13개로 줄어듬
--값이 null인 경우에는 값이 출력되지 않기때문에 (+) 활용
--where e.mgr = m.empno(+); -- 필요한 쪽에 (+) 붙이면 null도 표현이 가능하다(Outer join)

