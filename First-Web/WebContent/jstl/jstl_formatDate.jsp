<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
</script>
</head>
<body>

<%
	request.setAttribute("now", new java.util.Date());
%>

	${now} <br>
	
	
	<h3>날짜</h3>
	<fmt:formatDate value="${now}"/> <br>
	<!-- 년, 월, 일만 출력됨! -->
	
	<fmt:formatDate value="${now}" type="date"/> <br>
	<!-- ㅇㅇㅇㅇ.ㅇㅇ.ㅇㅇ 로 출력 -->
	
	<fmt:formatDate value="${now}" type="date" dateStyle="full"/> <br>
	<!-- ㅇㅇㅇㅇ년 ㅇㅇ월 ㅇㅇ일 ㅇ요일 로 출력 -->
	
	<fmt:formatDate value="${now}" type="date" dateStyle="short"/> <br>
	<!-- ㅇㅇ.ㅇㅇ.ㅇㅇ 로 출력 -->
	
	<h3>시간</h3>
	<fmt:formatDate value="${now}" type="time"/> <br>
	<!-- 오후 ㅇㅇ:ㅇㅇ:ㅇㅇ // 오전오후 시:분:초 // 출력 -->
	
	<fmt:formatDate value="${now}" type="time" timeStyle="full"/> <br>
	<!-- 오후 ㅇㅇ시 ㅇㅇ분 ㅇㅇ초 KST 출력 -->
	
	<fmt:formatDate value="${now}" type="time" timeStyle="short"/> <br>
	<!-- 오후 ㅇㅇ:ㅇㅇ // 오전오후 시:분  // 출력 -->
	
	<h3>both</h3>
	<fmt:formatDate value="${now}" type="both"/> <br>
	<!-- 둘 다 출력! ㅇㅇㅇㅇ.ㅇㅇ.ㅇㅇ 오후 ㅇㅇ:ㅇㅇ:ㅇㅇ //년.월.일 오전오후 시:분:초 // 출력 -->	

	<fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/> <br>
	<!-- 2021년 7월 23일 금요일 오후 5시 09분 50초 KST 출력 -->
	
	<fmt:formatDate value="${now}" type="both" dateStyle="short" timeStyle="short"/> <br>
	<!-- 21. 7. 23 오후 5:09 출력 -->
	
	<h3>패턴</h3>
	<fmt:formatDate value="${now}" pattern ="z a h:mm"/><br>
	<!-- KST 오후 5:11 -->
	
	<fmt:formatDate value="${now}" pattern ="hh:mm:ss"/><br>
	<!-- 05:11:53 -->
	
	<fmt:formatDate value="${now}" pattern ="yyyy-MM-dd h:mm"/><br>
	<!-- 월 표현 : MM 대문자 / 분 표현 : mm 소문자 -->
	<!-- 2021-07-23 5:11 -->
		
	<fmt:formatDate value="${now}" pattern ="yyyy.MM.dd h:mm"/><br>
	<!-- 2021.07.23 5:12 -->
	
	<fmt:formatDate value="${now}" pattern ="yyyy.MM.dd a h:mm" timeZone="HongKong"/><br>	
	<!-- 2021.07.23 오전 8:13 -->
	
	<fmt:formatDate value="${now}" pattern ="yyyy.MM.dd a h:mm" timeZone="Canada"/><br>	
	<!-- 2021.07.23 오전 8:13 -->
	
	
	<%-- 
	<fmt:timeZone value="나라"></fmt:timeZone>
	로 감싸주면 그 나라의 시간이 출력된다
	--%>
	
	
	
</body>
</html>