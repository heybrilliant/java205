package member.service;

import java.util.Date;

import member.dao.Dao;
import member.domain.Member;
import member.domain.RegRequest;

public class MemberRegService {

	//Dao dao = new MemberDao();
	// 그동안은 필요하면 new 인스턴스 생성을 통해서 주입받았음 -> 의존성 높아진다
	
	Dao dao;
	int num;
	
	// 프로퍼티 주입방식 : setter 메소드 이용, 기본생성자가 필요함
	/*
	 * public void setDao(Dao dao) { this.dao = dao;}
	 * 먼저 생성하고 -> 이후 호출 
	 */
	
	// 생성자 정의
	// 정수데이터를 받는 생성자
	
	// 기본생성자 
	public MemberRegService() {
		
	}
	
	public MemberRegService(int num) {
		//this.dao = dao;	
		System.out.println("MemberRegService 인스턴스 생성!");
	}
	
	public MemberRegService(Dao dao) {
		this.dao = dao;	
		System.out.println("MemberRegService 인스턴스 생성!");
	}
	
	public MemberRegService(Dao dao, int num) {
		this.dao = dao;	
		this.num = num;
		System.out.println("MemberRegService 인스턴스 생성!");
	}
	
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
