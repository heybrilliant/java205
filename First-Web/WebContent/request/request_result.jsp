<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 사용자가 전달한 데이터의 한글 처리
	request.setCharacterEncoding("utf-8");

	String userName = request.getParameter("username");
	String job = request.getParameter("job");
	/* 이름이 같은 여러 데이터 받아주기 = interests */
	String[] interests = request.getParameterValues("interests");
	
	request.setAttribute("userName", userName);
	request.setAttribute("job", job);
	request.setAttribute("age", 30); // 30은 auto Boxing이 된다
	
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
	<h1>request Form Test : Result</h1>
	<hr>
	<table border=1px>
		<tr>
			<td>이름</td>
			<td><%= userName %></td>
		</tr>
		<tr>
			<td>직업</td>
			<td><%= job %></td>
		</tr>
		<tr>
			<td>관심사항</td>
			<td>
			<%
			if(interests != null && interests.length > 0) {
				for(int i = 0; i < interests.length; i++){
					out.println(interests[i]+"<br>");
				}
			}
			%>
			</td>
		</tr>
		
		<tr>
			<td></td>
			<td>
				<jsp:include page="view.jsp"/>
			</td>
		</tr>

	</table>
</body>
</html>