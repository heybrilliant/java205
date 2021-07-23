<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<nav>
		<ul>
			<li><a href="<%= request.getContextPath() %>/regForm.jsp">회원가입</a></li>
			<li><a href="<%= request.getContextPath() %>/login.jsp">로그인</a></li>
			<li><a href="<%= request.getContextPath() %>/member_list.jsp">회원리스트</a></li>
			<li><a href="<%= request.getContextPath() %>/logout.jsp">로그 아웃</a></li>
			<li><a href="<%= request.getContextPath() %>/mypage.jsp">My Page</a></li>
		</ul>
	</nav>