package member.service;

import member.dao.Dao;
import member.domain.Member;

public class ChangePasswordService {

	private Dao dao;
	
	// dao 주입을 위한 setter 
	public void setDao(Dao dao) {
		this.dao = dao;
	}
	
	// 기본생성자 정의 
	public ChangePasswordService() {}
	
	public ChangePasswordService(Dao dao) {
		this.dao = dao;
		System.out.println("ChangePasswordService 인스턴스 생성!");
		
	}
	
	public void changePassword(String email, String oldPw, String newPw) throws Exception {
		
		System.out.println("change : " + email);
		
		Member member = dao.selectByEmail(email);
		
		if(member == null) {
			throw new Exception("존재하지 않는 회원입니다.");
		} 
		
		member.changePassword(oldPw, newPw);
		
		dao.update(member);
		
	}
	
	
}
