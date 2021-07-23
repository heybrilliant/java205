<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

	${members} <br><hr>
	${members[0]} <br><hr>
	${members[1]} / ${members[1].name} <br>
	<!-- ${members[1].name} => 공백출력 -->
	
	<c:out value="${members[0].name}"/>
	
	<c:out value="${members[1].name}" escapeXml="false">
		<span style="color:red;">입력된 정보 없음</span>	
	</c:out>
	<!-- <c:out value=""/>으로 쓰면 단일행으로 이용할 수 있다 -->
	
</body>
</html>