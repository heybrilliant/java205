<%@page import="java.util.ArrayList"%>
<%@page import="dept.domain.Dept"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// dept_list.jsp -> 요청을 받고 처리

	// 1. 드라이버 로드
	Class.forName("com.mysql.cj.jdbc.Driver"); // mysql 연결
	// 2. DB 연결
	Connection conn = null; // 초기화의 이유 -> jsp 코드는 서블릿의 메소드, 초기화해주는 게 맞음
	Statement stmt = null;
	ResultSet rs = null;	
	
	// jdbcUrl
	String jdbcUrl ="jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
	String user = "bit";
	String pw = "bit";

	conn = DriverManager.getConnection(jdbcUrl, user, pw);
	
	// 3. Statement
	stmt = conn.createStatement();
	
	// sql 생성
	String sqlSelect = "select * from dept";
	
	// 4. ResultSet
	rs = stmt.executeQuery(sqlSelect); //executeQuery -> ResultSet 반환 
	
	// 5. List<Dept> <- 결과
	List<Dept> deptList = new ArrayList<Dept>();
	
	while(rs.next()){
		// List에 객체 추가 
		deptList.add(
				new Dept(
						rs.getInt("deptno"), 
						rs.getString("dname"),
						rs.getString("loc")
						)
				);
	}
	
	out.println(deptList);
	
	// 6. 결과 데이터를 request의 속성에 저장 -> 데이터를 공유(전달)
	request.setAttribute("result",deptList);
%>

<jsp:forward page="list_view.jsp"/> <!-- view의 역할만 한다  = 데이터 출력하는 역할만 한다 -->
    