-- 20210616

--  view 

-- 자주 사용되는 
-- 30번 부서에 소속된 사원들의 사번과 이름과 부서번호를 출력하기 위한
-- select문을 하나의 뷰로 정의해 봅시다.

create or replace view emp_view30 -- 뷰객체를 생성 -> 1. 이 뷰를 select 해서 실행하면
as 
select empno, ename, deptno -- 2. 이 셀렉트문을 실행한 결과를 반환해줌
from emp                    --
where deptno = 30           --
;  -- 결과 : View EMP_VIEW30이(가) 생성되었습니다.

select * from emp_view30; -- view에 있는 서브쿼리의 결과가 반환됨

select * from emp_view30
where ename = 'JAMES';

-- view 삭제
drop view emp_view30;

-- 인라인뷰를 이용한 TOP3 구하기 
select rownum, ename -- 컬럼명에 rownum 추가 
from emp
order by hiredate
; -- smith가 1등

select rownum, ename, hiredate
from (select * from emp order by hiredate desc)
where rownum < 6
; -- adams가 1등 -> abc순으로 나열 


--selct * from emp order by hiredate

create or replace view view_HIR
as
select * from emp order by hiredate;

select rownum, ename, hiredate from wiew_hir;

select rownum, ename, hiredate from  view_hir
where rownum <6 
order by ename;

-- sequence : 번호 재생기
create sequence pi_idx_pk;

select pi_idx_pk.nextval
from dual; -- 할 때마다 정해진 숫자만큼 증가

select pi_idx_pk.currval
from dual; -- 할 때마다 새롭게 만듬 (값이 동일)

