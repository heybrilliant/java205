<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 사용자가 입력한 데이터를 받고 
	// 입력데이터의 한글처리 
	request.setCharacterEncoding("utf-8");
	
	String memberid = request.getParameter("memberid");
	String password = request.getParameter("password");
	String membername = request.getParameter("membername");
	
	
	// 2. DB 처리 : insert
	
	// 데이터베이스 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	// 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbcUrl = "jdbc:mysql://localhost:3306/ncs_project?serverTimezone=UTC";	
	String user ="root";
	String pw ="1234";
	
	conn = DriverManager.getConnection(jdbcUrl, user, pw);
	
	// PreparedStatement
	String sqlInsert = "insert into  memberlist(memberid, password, membername) values(?, ?, ?)";
	pstmt = conn.prepareStatement(sqlInsert);
	pstmt.setString(1, memberid);
	pstmt.setString(2, password);
	pstmt.setString(3, membername);

	int resultCnt = pstmt.executeUpdate();
	
	// insert -> 결과값 = int (응답을  보여줌)
			
	// 3. memberList.jsp로 이동
	
	if(resultCnt>0){
		%>
		<script>
			alert('등록되었습니다!');
			location.href = 'memList.jsp';
		</script>
		<%
	} else {
		%>
		<script>
			alert('!잘못된 입력입니다.\n!입력페이지로 이동합니다.');
			location.href = 'memberList_regForm.jsp';
		</script>
		<%
	}
%>