<%@page import="java.sql.SQLException"%>
<%@page import="jdbc.ConnectionProvider"%>
<%@page import="dept.domain.DeptDao"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//사용자가 전달하는 부서번호 받기
	String deptno = request.getParameter("deptno");
	//out.println(deptno);

	// 전달받은 부서번호로 부서정보를 가져온다 -> 처리-> Dept-> 공유
	// 1. 드라이버 로드 : 서블릿 클래스 Loader에서 드라이버 로드 
	// Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 연결
	// 2. DB 연결
	Connection conn = null; // 초기화의 이유 -> jsp 코드는 서블릿의 메소드, 초기화해주는 게 맞음
	DeptDao dao = null;

	try {
		conn = ConnectionProvider.getConnetion();
		dao = DeptDao.getInstance();

		// 부서정보를 form_view.jsp로 전달(공유)
		request.setAttribute("dept", dao.selectByDeptno(conn, Integer.parseInt(deptno)));
	} catch (SQLException e) {
		e.printStackTrace();
	}

	// jdbcUrl
	String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
	String user = "bit";
	String pw = "bit";

	conn = DriverManager.getConnection(jdbcUrl, user, pw);

	Dept dept = null;

	String sqlSelect = "select * from dept where deptno=? ";
	pstmt = conn.prepareStatement(sqlSelect);
	pstmt.setInt(1, Integer.parseInt(deptno));

	rs = pstmt.executeQuery();

	if (rs.next()) {
		dept = new Dept();
		dept.setDeptno(rs.getInt("deptno"));
		dept.setDname(rs.getString("dname"));
		dept.setloc(rs.getString("loc"));
	}


	// 전달받은 부서번호로 부서정보로 가져온다
%>
<jsp:forward page="form_view.jsp" />