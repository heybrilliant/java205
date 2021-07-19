<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 핵심 처리  */
	String[] list = {"손흥민","이강민","황의조"};

	// view 페이지에 선수리스트(결과)를 공유해줘야 함 
	request.setAttribute("player", list);
%>
<jsp:forward page="list_view.jsp"/>





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

</body>
</html>