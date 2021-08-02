package member.main;

import member.dao.GuestDao;
import member.dao.MemberDao;
import member.service.ChangePasswordService;
import member.service.MemberRegService;

public class Assembler {

	// 컨테이너 : 인스턴스를 관리한다 = 생성, 보관, 실행, 필요한 객체를 반환, 소멸
	// 조립기 클래스의 역할 
	// 각각의 인스턴스를 생성하고
	// 의존 주입을 해준다
	// 필요한 객체를 반환해주는 메소드(기능)을 가진다
	
	private MemberDao dao;
	private MemberRegService regService;
	private ChangePasswordService passwordService;

	private GuestDao gDao;
	
	public Assembler() {
		// 인스턴스를 생성 -> 의존 주입해주는 코드  
		dao =  new MemberDao();
		regService = new MemberRegService(dao);
		passwordService = new ChangePasswordService(dao);
		
		gDao = new GuestDao();
	}
	
	// 객체를 만들어두고 필요할때마다 넣어주는 방식  
	// 조립기를 통해 주입시키게 되면 싱글톤의 효과를 가지게 됨
	
	public MemberDao getDao() {
		return dao;
	}

	public MemberRegService getRegService() {
		return regService;
	}

	public ChangePasswordService getPasswordService() {
		return passwordService;
	}
	
	
}
