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

	<c:set var="number" value="100000000"/>
	
	<fmt:formatNumber value="1000000"/> <br>
	<fmt:formatNumber value="1000000" groupingUsed="false"/> <br>

	<fmt:formatNumber value="${number}"/> <br>
	<fmt:formatNumber value="${number}" type="number"/> <br>
	<!-- 숫자 표현 -->
	<fmt:formatNumber value="${number/4000000000}" type="percent"/> <br>
	<!-- 퍼센트 표현 -> 소수점 표현은 하지 않는다 -->
	<fmt:formatNumber value="${number}" type="currency"/> <br> 
	<!-- 현재 쓰고있는 운영체제 위치의 통화기호가 숫자앞에 붙는다 -->
	<fmt:formatNumber value="${number}" type="currency" currencySymbol/> <br> 

	패턴 : <fmt:formatNumber value="${number*1000}" pattern="000,000,000.00"/> <br> 
</body>
</html>