-- 2021.06.14

-- salgrade ddl

drop table salgrade;

CREATE TABLE SALGRADE
(GRADE NUMBER,
LOSAL NUMBER,
HISAL NUMBER);

-- 트랜잭션의 시작
INSERT INTO SALGRADE VALUES (1, 700, 1200);
INSERT INTO SALGRADE VALUES (2, 1201, 1400);
INSERT INTO SALGRADE VALUES (3, 1401, 2000);
INSERT INTO SALGRADE VALUES (4, 2001, 3000);
INSERT INTO SALGRADE VALUES (5, 3001, 9999);
-- 아직 논리적인 저장만 진행된 상태

commit;
-- 커밋 후 물리적인 저장 완료
-- rollback; -> 트랜잭션의 시작점으로 돌아감 value값이 저장되지않음


-- NON EQUI JOIN
-- 동등 비교가 아닌 크다, 작다와 같은 비교로 조인의 조건을 작성

select * from salgrade;

select e.ename, e.sal, s.grade, s.losal, s.hisal
from emp e, salgrade s -- 새로운 테이블(결과) 
-- where e.sal >= s.losal and e.sal <= s.hisal
where sal between s.losal and s.hisal
order by e.ename;

-- ANSI CROSS JOIN
select *
from emp cross join dept
;
-- 14x4행 = 56개의 결과 출력


-- EQUI JOIN

select *
from emp, dept
where emp.deptno = dept.denptno
;

select * from orders;
select * from customer;
select * from book;

select o.orderid, c.name, b.bookname
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid
order by o.orderid;

-- ANSI -> inner join
-- 오라클 EQUI JOIN 

select *
from emp, dept
where emp.deptno = dept.deptno
;

select * 
from emp e inner join dept d
on e.deptno = d.deptno
;

-- 이름이 SCOTT인 사람의 부서명을 출력하기 
select * 
from emp e inner join dept d
on e.deptno = d.deptno
where e.ename= 'SCOTT'
;

-- 비교하는 컬럼의 이름이 같을 때  using을 이용한다
-- on절을 생략하고 -> using을 이용하면 조건식을 간략하게 처리할 수 있다
select * 
from emp e inner join dept d
-- on e.deptno = d.deptno // on절 생략
using (deptno)
where e.ename= 'SCOTT'
;

-- NATURAL JOIN
select *
from emp NATURAL JOIN dept
;

--self JOIN : 자기 자신을 조인 (참조)
-- emp -> mgr 컬럼이 emp.empno 참조
select e.ename, e.empno, e.mgr , m.ename
from emp e, emp m
where e.mgr = m.empno (+) 
;

-- outer JOIN
select e.ename,e.empno, e.mgr , m.ename
from emp e,emp m
where e.mgr = m.empno(+);   -- 필요한 쪽에 (+) 붙이면 null표현가능. (아우터조인)
                            -- 표현하고자 하는 컬럼이 테이블의 반대쪽, null값을 가지는 위치에 (+)


-- [left | rihgt | Full] outer join 
select e.ename, e.mgr, m.ename as "관리자"
-- from emp e left outer join emp m
from emp m right outer join emp e 
on e.mgr = m.empno;


-- 회원별 구매내역 출력 
select c.name, count(o.orderid) as "구매횟수", avg(saleprice)
from orders o , customer c -- join 
where o.custid (+)= c.custid
group by c.name
order by c.name
;



