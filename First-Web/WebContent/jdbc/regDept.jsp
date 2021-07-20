<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// 1. 사용자가 입력한 데이터를 받고 
	
	// 입력 데이터의 한글처리 (필수!)
	request.setCharacterEncoding("utf-8");
	
	String deptno = request.getParameter("deptno");
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");

	int resultCnt = 0;
	
	// 2. DB 처리 : insert

	// 데이터베이스 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	
	try{
	// 커넥션 연결
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
	String user = "bit";
	String pw = "bit";
	
	conn = DriverManager.getConnection(jdbcUrl, user, pw);
	
	// PreparedStatement
	String sqlInsert = "insert into dept values(?, ?, ?)";
	pstmt = conn.prepareStatement(sqlInsert);
	pstmt.setInt(1, Integer.parseInt(deptno));
	pstmt.setString(2, dname);
	pstmt.setString(3, loc);
	
	resultCnt = pstmt.executeUpdate();
	
	out.println(resultCnt);
	
	// insert -> int
	
	// 3. dept_list.jsp 이동
	// response.sendRedirect("dept_list.jsp");
	} catch (Exception e){
		
	}
	
	
	if(resultCnt > 0){
		%>
		<script>
			alert('등록되었습니다.');
			location.href = 'dept_list.jsp';
		</script>
		<%
	} else {
		%>
		<script>
			alert('! 오류가 발생하였습니다. \n! 입력페이지로 다시 이동합니다.');
			// location.href = 'dept_regForm.jsp'; // 새로운 페이지를 로드함 = 빈칸, 아예 새 페이지
			window.history.go(-1); // 바로 이전 페이지로 돌아가는 메소드	 = 바로 직전 페이지 = 내가 입력한 입력값도 그대로 남아있는 그 페이지!!	
		</script>
		<%
	}
%>
