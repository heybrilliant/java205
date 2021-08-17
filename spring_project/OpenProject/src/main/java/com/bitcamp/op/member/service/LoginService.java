package com.bitcamp.op.member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.op.jdbc.ConnectionProvider;
import com.bitcamp.op.member.dao.Dao;
import com.bitcamp.op.member.dao.JdbcTemplateMemberDao;
import com.bitcamp.op.member.dao.mybatisMemberDao;
import com.bitcamp.op.member.domain.Member;

@Service
public class LoginService {

	//@Autowired
	//MemberDao dao;
	
	//@Autowired
	// private JdbcTemplateMemberDao dao;
	
	//@Autowired
	//private mybatisMemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	
	private Dao dao;
	
	public boolean login(
			String id, 
			String pw, 
			String reid, 
			HttpSession session, 
			HttpServletResponse response) {
		
		boolean loginChk = false;
		
		// Connection conn = null;
		
		//인터페이스 Dao 구현체 Mapper
		dao = template.getMapper(Dao.class);
		
		System.out.println("인터페이스 dao 매퍼 생성");

		//conn = ConnectionProvider.getConnection();
			
			// 전달받은 id와 pw로 DB에서 검색
			// -> 있다면 로그인 처리해야하고 = true return , 
			// 없다면 이전으로 돌아갈 수있는 false 처리해서 돌아가기 (return)
			Member member = dao.selectByIdPw(id, pw);
			
			// 받아온 값 비교 
			if(member != null) {
				// 로그인 처리되어야 함
				session.setAttribute("loginInfo", member.toLoginInfo());
				
				loginChk = true;
			}
			
		
		// 아이디 저장을 위한 Cookie 설정 필요
		if(reid != null && reid.length() > 0) {
			Cookie cookie = new Cookie("reid", reid);
			cookie.setPath("/"); // localhost로 들어오는 값을 다 쿠키로 만들어줌
			cookie.setMaxAge(60*60*24*365); // 쿠키의 생명주기 -> 초단위 -> 지금 설정해준건 1년단위
		
			response.addCookie(cookie);
		} else {
			Cookie cookie = new Cookie("reid", reid);
			cookie.setPath("/"); // localhost로 들어오는 값을 다 쿠키로 만들어줌
			cookie.setMaxAge(0); // 쿠키의 생명주기 -> 초단위 -> 지금 설정해준건 1년단위
		
			response.addCookie(cookie);
		}

		return loginChk;
	}
	
}
