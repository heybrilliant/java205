package com.bitcamp.app.member.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.app.member.mapper.MemberMapper;

@Service
public class IdCheckService {

	
	// MemberDao dao;
	
	//@Autowired
	//private JdbcTemplateMemberDao dao;
	
	//@Autowired
	//private mybatisMemberDao dao;
	
	private MemberMapper dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	public String idCheck(String id) {
		
		String result ="Y";
		//Connection conn = null;

		// 인터페이스의 매퍼 Dao생성
		dao = template.getMapper(MemberMapper.class);
		
		/*
		 * try { // conn = ConnectionProvider.getConnection(); if(dao.selectById(id) >
		 * 0) { result = "N"; }
		 * 
		 * } catch (SQLException e) { e.printStackTrace(); }
		 */
		
		return result;
	}
	
}
