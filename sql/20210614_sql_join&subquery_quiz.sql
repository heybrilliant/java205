-- 2021.06.14
-- JOIN & SUB QUERY

-- 1. 마당서점의 고객이 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
-- (5) 박지성이 구매한 도서의 출판사 수
    -- equi -> 동일한 bookid로 추출
    select count(publisher)
    from book, orders
    where book.bookid = orders.bookid and custid = 1
    ;

-- (6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매 가격의 차이
    select b.bookname, (price - saleprice) as "pricegap"
    from book b, orders o
    where o.bookid = b.bookid and o.custid = 1 
    ;
    
-- (7) 박지성이 구매하지 않은 도서의 이름
    select bookname
    from book b
    where bookid not in (select bookid from orders where custid = 1)
    ;
    -- orders.custid = 1인 bookid를 출력  
    
-- 2. 마당서점의 운영자와 경영자가 요구하는 다음 질문에 대해 SQL 문을 작성하시오.
-- (8) 주문하지 않은 고객의 이름(부속질의사용)
    select name
    from customer c
    where c.custid not in (select custid from orders)
    ;
    
-- (9) 주문금액의 총액과 주문의 평균금액
    select sum(saleprice) as "total", avg(saleprice) as "avgsaleprice"
    from orders
    ;
    
-- (10) 고객의 이름과 고객별 구매액
    select name, sum(saleprice)
    from orders o, customer c
    where c.custid = o.custid
    group by name
    ;

-- (11) 고객의 이름과 고객이 구매한 도서목록
    select c.name, b.bookname
    from customer c, book b, orders o
    where c.custid = o.custid and b.bookid = o.bookid 
    order by name, bookname
    ;
    
-- (12) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문
    select *
    from orders o, book b
    where o.bookid = b.bookid 
    and b.price - o.saleprice = (select max(b2.price - o2.saleprice) from orders o2, book b2 where o2.bookid = b2.bookid)
    ;
    
-- (13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
    select name
    from orders o, customer c
    where o.custid = c.custid
    group by name
    having avg(saleprice) > (select avg(saleprice) from orders)
    ;
    
    -- /  도서판매액 평균 select avg(saleprice) from orders  
    
-- 3. 마당서점에서 다음의 심화된 질문에 대해 SQL 문을 작성하시오.
-- (1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
    select c.name
    from customer c natural join orders o natural join book b
    where b.publisher in (select publisher from orders o2, book b2 where b2.bookid = o2.bookid and c.name = '박지성')
    and c.name != '박지성'
    ;
    
    -- 박지성이 구매한 도서의 출판사 
    select publisher from orders o2, book b2 where b2.bookid = o2.bookid and custid=1
    ;

-- (2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
    select name
    from customer natural join orders natural join book
    group by name
    having count(distinct publisher)>=2
    ;
