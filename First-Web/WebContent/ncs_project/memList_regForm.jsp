<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 부서 등록을 위한 JSP 파일
%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>

</style>
</head>
<body>
	<h1>멤버 회원가입</h1>
	<hr>
	<form action="regmem.jsp" method="post">
	<table>
		<tr>
			<td>아이디</td>
			<td><input type="text" name="memberid" required></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="password" required></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" name="membername" required></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" value="등록">
				<input type="reset">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>