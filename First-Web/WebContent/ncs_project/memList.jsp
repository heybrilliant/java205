<%@page import="memberlist.domain.memberList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	// memList.jsp -> 요청을 받고 처리하는 역할

	// 1. 드라이버 로드 
	Class.forName("com.mysql.cj.jdbc.Driver");
	
	// 2. DB 연결
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	//jdbcUrl
	String jdbcUrl = "jdbc:mysql://localhost:3306/ncs_project?serverTimezone=UTC";	
	String user ="root";
	String pw ="1234";
	
	conn = DriverManager.getConnection(jdbcUrl, user, pw);
	
	// 3. Statement 
	stmt = conn.createStatement();
	
	// sql
	String sqlSelect = "select * from memberlist";
	
	// 4. ResultSet
	rs = stmt.executeQuery(sqlSelect);
	
	// 5. List<memberlist> <- 결과
	List<memberList> memList = new ArrayList<memberList>();
	
	while(rs.next()){
		// List에 객체 추가
		memList.add(new memberList(rs.getInt("idx"), rs.getString("memberid"), rs.getString("password"), rs.getString("membername"), rs.getTimestamp("regdate")));
	}
	
	out.println(memList);
	
	// 6. 결과 데이터 request의 속성에 저장 -> 데이터 공유(전달)
	request.setAttribute("result", memList);
%>    

<jsp:forward page="memList_view.jsp"/>
<!-- memList_view.jsp : view의 역할만 하도록 함-->