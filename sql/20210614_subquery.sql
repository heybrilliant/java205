-- 2021.06.14

-- sub Query 

-- 스칼라 부속질의 : select절 이후에 사용 
-- 단일행, 단일열 값이 사용된다 (반드시 값 하나)

select o.custid, (select name from customer c where o.custid = c.custid) as name
from orders o
;

-- emp 테이블만 사용해서 사원이름, 부서이름 출력 
select e.ename, (select d.dname from dept d where e.deptno=d.deptno) as dname
from emp e
;

-- 마당서점의 
-- 고객별
-- 판매액을 보이시오 
-- (결과는 고객이름과 고객별 판매액을 출력) -> customer & orders table
-- join
-- 고객이름
select c.custid, c.name
from orders o, customer c
where o.custid = c.custid
group by c.custid, c.name
;
-- 판매액
select c.custid, c.name, sum(saleprice) as "판매액"
from orders o, customer c
where o.custid = c.custid
group by c.custid, c.name
;
select * from orders;

--스칼라 부속질의 이용
select custid, 
       (select name from customer c where o.custid = c.custid) as name,
       sum(o.saleprice) as "구매액"
from orders o
group by custid;


-- 인라인 뷰  : From 절 뒤에 사용되는 부속질의, 가상테이블처럼 사용 

-- 고객번호가 2 이하인 --> customer table 이용 
-- 고객의 판매액을 보이시오 --> orders table 이용 
-- (결과는 고객이름과 고객별 판매액 출력)
select o.custid, c.name, sum(o.saleprice)
from (select * from customer where custid<=2) c, orders o 
where c.custid = o.custid
group by o.custid, c.name;


-- 중첩질의  : where 절 뒤에 사용하는 부속질의
-- 비교연산자를 이용할때는 단일행 단일열의 결과를 갖는 부속질의를 사용
-- > < = != >= <=
-- 평균급여보다 더 많은 급여를 받는 사원을 검색

select *
from emp
where sal > (select avg(sal) from emp) --> 평균급여
order by sal
;


-- 평균 주문금액 이하의 주문에 대해서 
-- 주문번호와 금액을 보이시오 --> orders
select *
from orders
where saleprice <= (select avg(saleprice) from orders)
order by saleprice
;

--평균 주문금액
select avg(saleprice) from orders;

-- 각 고객의 평균 주문금액보다 
-- 큰 금액의 주문 내역에 대해서 
-- 주문번호, 고객번호, 금액을 보이시오 

select *
from orders o1
where saleprice > 
                (select avg(saleprice) from orders o2 where o2.custid = o1.custid) -- 테이블의 행과 비교를 해줌
;               -- 행마다 바뀌어야하는 값이 있다면 o2.custid = o1.custid 와 같이 상관관계 처리를 해주어야함 

-- 평균 주문금액
select avg(saleprice) from orders;

-- 다중행 연산자 in
-- 3000이상 받는 사원이 소속된 부서(10,20번) 와 동일한 부서에서 근무하는 사원 리스트를 출력해보자 
select distinct deptno from emp where sal>=3000;
select *
from emp 
where deptno in (select distinct deptno from emp where sal>=3000)
;

-- 대한민국에 거주하는 고객에게 판매한 도서의 총 판매액을 구하시오 
select sum(saleprice)
from orders
where custid in (select custid from customer where address like '%대한민국%')
;
select custid from customer where address like '%대한민국%';

-- 3번 고객이 주문한 도서의 최고금액보다
-- 더 비싼 도서를 구입한 주문의 
-- 주문번호와 금액을 보이시오 
select orderid, saleprice
from orders
-- where saleprice > (select max(saleprice) from orders where custid = 3)
-- 이것도 가능하지만 ALL을 한번 사용해보자
where saleprice > ALL (select saleprice from orders where custid = 3)
;
-- 3번 고객이 주문한 도서의 최고 금액
select saleprice from orders where custid = 3;

-- 부서번호가 30번인 사원들의 급여 중 가장 작은값(950)보다 많은 급여를 받는 사원의 이름, 급여를 출력하는 예제
select ename, sal 
from emp
where sal > any(select sal from emp where deptno = 30)
;
--사원들의 급여 중 가장 작은값보다 많이 받는 사람 
select sal from emp where deptno = 30;


-- exists 연산자로 대한민국에 거주하는 고객에게
-- 판매한 도서의 총 판매액을 구하시오
select sum(saleprice)
from orders o
where exists (select * from customer c where o.custid = c.custid and address like '%대한민국%')
;