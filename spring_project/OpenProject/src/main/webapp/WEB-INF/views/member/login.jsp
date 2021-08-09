<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <c:if test="${loginInfo eq null}"> --%>
<c:if test="${not loginChk}"> <!-- 윗 방식도 <- 이방식도 둘 다 가능함 =loginInfo가 null값이면 or loginChk가 ture이면 -->
<script>
	alert("! 아이디 또는 비밀번호가 일치하지 않습니다.");
	history.go(-1);
</script>
</c:if>

<c:if test="${loginChk}"> <!-- 로그인 일때와 아닐때  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Open Project : 로그인</title>

<%@ include file="/WEB-INF/views/frame/metaheader.jsp" %>

</head>
<body>

<%@ include file="/WEB-INF/views/frame/header.jsp" %>

<%@ include file="/WEB-INF/views/frame/nav.jsp" %>

	<!-- 콘텐츠영역 -->
	
	<div id="content">
		<h2>Login</h2>
		<hr>
		<h2>
			${loginInfo}
		</h2>
	</div>
</body>
</html>
</c:if>