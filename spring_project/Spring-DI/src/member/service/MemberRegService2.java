package member.service;

import java.util.Date;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import member.dao.Dao;
import member.domain.Member;
import member.domain.RegRequest;

public class MemberRegService2 {
	
	
	//@Autowired
	//@Qualifier("member1")
	@Resource(name = "guestDao")
	
	private Dao dao;

	public void regMember(RegRequest request) throws Exception {
		
		// 중복 이메일을 체크하고 예외를 발생시키는 메소드 
		Member member = dao.selectByEmail(request.getEmail());	
		
		if(member != null) {
			throw new Exception("중복 이메일입니다!");
		}
		
		Member newMember = new Member(
				0, 
				request.getEmail(), 
				request.getPassword(), 
				request.getName(), 
				new Date());
		
		dao.insert(newMember);
	}
	
	
}
