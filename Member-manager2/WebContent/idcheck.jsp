<%@page import="service.IdCheckService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %> <!-- 위쪽에 있는 공백이 사라짐  -->
<%
	String memberId = request.getParameter("mid");
	request.setAttribute("result", IdCheckService.getInstance().idCheck(memberId));
%>
${result}