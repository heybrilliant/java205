<%@page import="java.util.ArrayList"%>
<%@page import="member.Member"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	List<Member> members = new ArrayList<Member>();
	members.add(new Member("testid01","1111","name01"));
	members.add(new Member("testid02","2222",null));
	members.add(new Member("testid03","3333","name03"));
	members.add(new Member("testid04","4444","name04"));
	members.add(new Member("testid05","5555",null));
	members.add(new Member("testid06","6666",null));
	members.add(new Member("testid07","7777","name07"));
	members.add(new Member("testid08","8888",null));
	members.add(new Member("testid09","9999","name09"));
	members.add(new Member("testid10","0000","name10"));
	
	session.setAttribute("members", members);
	
%>
    