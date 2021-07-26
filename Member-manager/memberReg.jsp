<%@page import="java.sql.SQLException"%>
<%@page import="dao.MemberDao"%>
<%@page import="util.ConnectionProvider"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="domain.Member" />
<<jsp:setProperty property="*" name="member" />

<%
	out.println(member);

	int result = 0;
	Connection conn = null;
	ResultSet rs = null;

	try {

		conn = ConnectionProvider.getConnection();
		dao = MemberDao.getInstance();

		result = dao.insertMember(conn, member);
	
	
	} catch (SQLException e) {
		e.printStackTrace();
	}
	
	if (result > 0) {
%>
<script>
	alert('등록되었습니다');
	location.href = '<%= request.getContextPath()%>/index.jsp';
</script>
<%
} else {
%>
<script>
	alert('! 오류발생으로 등록되지 않았습니다.\n! 입력페이지로 이동합니다.');
	window.history.go(-1);
</script>

