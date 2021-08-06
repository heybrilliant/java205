package com.bitcamp.op.member.service;

import org.springframework.stereotype.Service;

import com.bitcamp.op.member.dao.MemberDao;

@Service
public class LoginService {

	MemberDao dao;
	
	public void login() {
		dao.login();
	}
	
}
