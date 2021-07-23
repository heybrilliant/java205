package domain;

public class Member {
	
	private int idx;
	private String memberId;
	private String password;
	private String memberName;
}
	// Member -> LoginInfo로 반환해주는 메소드 
	public LoginInfo toLoginInfo() {
		return new LoginInfo(this.idx, this.memberid, this.membername)
	}