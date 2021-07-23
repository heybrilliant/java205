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

	<h3>
	<c:url value="/index.jsp" var="urlIndex"/>
	${urlIndex}
	
	<br>
	<!-- 출력하면  /First-Web/index.jsp 가 출력됨  Context의 경로가 /앞에 뜸 -->
	<c:url value="index.jsp" var="urlIndex"/>
	<!-- / 슬래쉬하나의 차이로  index.jsp 만 출력됨 -->
	${urlIndex}
	
	<br>
	<c:url value="index.jsp"/>
	<!-- index.jsp 만 출력됨 -->
	
	<br>
	<a href="<c:url value="/index.jsp"/>">홈으로 가기</a>
	
	<br>
	<c:url value="index.jsp" var="homeURL">
		<c:param name="type">main</c:param>
		<c:param name="index">1</c:param>
	</c:url>
	
	<a href="${homeURL}">${homeURL}</a>
	<!-- Context 경로 + url 경로 + type=main&index=1 경로 생성 -->
	 
	</h3>
</body>
</html>