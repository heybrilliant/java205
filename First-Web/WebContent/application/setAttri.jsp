<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	application.setAttribute("name", "Shin");
    	application.setAttribute("age",30); // 30 -> auto Boxing, int 타입의 형태로 변환해서 값이 들어감
    %>
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
	<h1>application 속성에 데이터를 저장했습니다</h1>
	<h3><a href="attrView.jsp">application 속성 확인</a></h3>
</body>
</html>