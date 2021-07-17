<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>AAA</h1>
</body>
</html>
<%-- <jsp:include page="BB.jsp"></jsp:include> --%>
	<jsp:forward page="footer.jsp">
		<jsp:param name="email" value="test@gmail.com/">
		<jsp:param name="name" value="000-0000-0000" />
	</jsp:forward>