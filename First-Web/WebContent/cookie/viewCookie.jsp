<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.getCookies();
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

	<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length>0){
		for(int i = 0; i < cookies.length; i++){
			// getName() : 쿠키의 이름 반환
			String name = cookies[i].getName();
			// getValue() : 쿠키의 값을 반환
			String value = cookies[i].getValue();
			
			// 필요한 시점에 cname이라는 쿠키이름을 가진 쿠키값을 찾아 실행
			if(name.equals("cname")){
				out.println("<h1>"+name+" = "+value+"</h1>");
			}
		}
	}
	
	%>

	<a href="editCookie.jsp">쿠키 수정</a>
	<a href="deleteCookie.jsp">쿠키 삭제</a>
</body>
</html>