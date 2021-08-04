<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h1>Spring MVC</h1>
	<hr>
	<ul>
		<li><a href="<c:url value="/hello"/>">/hello</a></li>
		<li><a href="<c:url value="/member/loginform"/>">/member/loginForm</a></li>
		<li><a href="<c:url value="/member/regform"/>">/member/regForm</a></li>
		<li><a href="<c:url value="/order/order"/>">/order/order</a></li>
	</ul>
</body>
</html>