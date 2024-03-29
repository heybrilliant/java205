-- 2021.06.14


-- 32. EQUI 조인을 사용하여 SCOTT 사원의 부서번호와 부서 이름을 출력하시오.
    select emp.ename, dept.deptno, dept.dname
    from emp, dept
    where emp.deptno = dept.deptno
    and ename = 'SCOTT';
    
-- 33. INNER JOIN과 ON 연산자를 사용하여 사원 이름과 함께 그 사원이 소속된 부서이름과 지역 명을 출력하시오.
    select ename, dname, loc
    from emp inner join dept
    on emp.deptno = dept.deptno;
    
-- 36. 조인과 WildCARD를 사용하여 이름에 ‘A’가 포함된 모든 사원의 이름과 부서명을 출력하시오.
    select ename, dname
    from emp, dept
    where emp.deptno = dept.deptno 
    and ename like '%A%';
    
-- 37. JOIN을 이용하여 NEW YORK에 근무하는 모든 사원의 이름, 업무, 부서번호 및 부서명을 출력하시오.
    select emp.ename, emp.job, dept.deptno, dept.dname
    from emp, dept
    where emp.deptno = dept.deptno
    and dept.loc = 'NEW YORK';
    
-- 38. SELF JOIN을 사용하여 사원의 이름 및 사원번호, 관리자 이름을 출력하시오.
    select e.ename, e.empno, mgr.ename as "관리자 이름"
    from emp e, emp mgr
    where e.mgr = mgr.empno;
    
-- 39. OUTER JOIN, SELF JOIN을 사용하여 관리자가 없는 사원을 포함하여 사원번호를 기준으로 내림차순 정렬하여 출력하시오.
     select e.ename, e.empno, mgr.ename as "관리자 이름" 
    from emp e, emp mgr
    where e.mgr = mgr.empno(+)
    order by empno desc;
    
-- 40. SELF JOIN을 사용하여 지정한 사원의 이름, 부서번호, 지정한 사원과 동일한 부서에서 근무하는 사원을 출력하시오. ( SCOTT )
    select e.ename, e.empno, e.deptno
    from emp e, emp scott
    where scott.ename = 'SCOTT'
    and scott.deptno = e.deptno
    ;
    
-- 41. SELF JOIN을 사용하여 WARD 사원보다 늦게 입사한 사원의 이름과 입사일을 출력하시오.
    select e.ename, e.hiredate
    from emp e, emp ward 
    where ward.ename = 'WARD' 
    and ward.hiredate < e.hiredate
    order by e.hiredate;
    
-- 42. SELF JOIN 을 사용하여 관리자보다 먼저 입사한 모든 사원의 이름 및 입사일을 관리자의 이름 및 입사일과 함께 출력하시오.
    select e.ename as "사원 이름", e.hiredate as "사원 입사일", mgr.ename as "관리자 이름", mgr.hiredate as "관리자 입사일"
    from emp e, emp mgr
    where e.mgr = mgr.empno
    and mgr.hiredate > e.hiredate;
