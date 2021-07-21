<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    
    //DB에 있는 데이터를 삭제 
    int resultCnt= 0;
    
    //2. DB처리 : insert
    Connection conn = null;
    DeptDao dao = DeptDao.getInstance();
    
    try{
    conn= ConnectionProvider.getConnection();
    
    resultCnt = dao.deleteDept(conn, Integer.parseInt(deptno));
    } catch (SQLException e ){
    	e.printStackTrace();
    }
 %>