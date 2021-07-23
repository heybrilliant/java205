<%@page import="member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("name","신은경");
 	session.setAttribute("name","가나다");
 	application.setAttribute("name","AAA");
 	
 	Member mem = new Member();
 	mem.setId("shin");
 	mem.setName("신은경");
 	mem.setPw("1234");
 	
 	session.setAttribute("member", mem);
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

	표현식 : <%= request.getAttribute("name") %> <br>
	표현언어1 : ${requestScope.name} <br>
	
	내장객체의 표현식이 생략되었을때의 규칙<br>
	1. pageScope의 속성을 찾는다 -> 2.requestScope -> 3. sessionScope -> 4. applicationScope 순서대로 찾는다
	<br><br>
	표현언어2 : ${name} <br>
	표현언어3 : ${sessionScope.name} <br>
	표현언어4 : ${applicationScope.name} <br>

	<hr>
	표현식 사용 param.code : <%= request.getParameter("code") %><br>
	표현언어 사용 param.code : ${param.code} <br><br>
	
	표현식은 값이 없을경우 null을 출력하는데 <br>
	표현언어는 값이 없을경우 공백(아무것도 출력X)을 출력한다
	
	<hr>
	표현식 pageContext : <%= pageContext.getRequest().getServletContext().getContextPath() %> <br>
	표현언어 pageContext : ${pageContext.request.requestURL}<br>
	${pageContext.request.requestURI}<br><!-- 경로만 표현 -->
	${pageContext.request.contextPath}<br><!-- pageContext만 표현 -->
	
	<br>
	${true} / ${false} / ${100} / ${'신은경'} / ${null}	<!-- null이 들어오면 아무것도 출력하지 않는다! -->
	
	<hr>
	${member} / ${member.id} <br>
	<%= session.getAttribute("member") %> / <%= ((Member)session.getAttribute("member")).getId() %>
</body>
</html>