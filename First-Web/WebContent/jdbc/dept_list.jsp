<%@page import="jdbc.util.ConnectionProvider"%>
<%@page import="jdbc.util.jdbcUtil"%>
<%@page import="java.sql.SQLException"%>
<%@page import="dept.domain.DeptDao"%>
<%@page import="dept.domain.Dept"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// dept_list.jsp -> 요청을 받고 처리 -> 결과 데이터를 객체속성에 저장 -> view 지정

	// 1. 드라이버 로드 : 서블릿 클래스 Loader에서 드라이버 로드 
	// Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 연결
	
	// 2. DB 연결
	Connection conn = null; // 초기화의 이유 -> jsp 코드는 서블릿의 메소드, 초기화해주는 게 맞음
	DeptDao dao = DeptDao.getInstance();
	
	try{
		conn = ConnectionProvider.getConnection();
		
		// 6. 결과 데이터를 request의 속성에 저장 -> 데이터를 공유(전달)
		request.setAttribute("result",dao.getDeptList(conn));
		
	} catch (SQLException e){
		e.printStackTrace();
	} catch (Exception e){
		e.printStackTrace();
	} finally {
		jdbcUtil.close(conn);
	}
	
	
	
	// jdbcUrl
	String jdbcUrl ="jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
	String user = "bit";
	String pw = "bit";

	
	
	out.println(deptList);
	
	
	
	
%>

<jsp:forward page="list_view.jsp"/> <!-- view의 역할만 한다  = 데이터 출력하는 역할만 한다 -->
    