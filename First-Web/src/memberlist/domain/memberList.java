package memberlist.domain;

import java.sql.Timestamp;

public class memberList {
	// 데이터 저장용 클래스 
	
	private int idx;
	private String memberid;
	private String password;
	private String membername;
	private Timestamp regdate;
	
	public memberList(int idx, String memberid, String password, String membername, Timestamp regdate) {
		super();
		this.idx = idx;
		this.memberid = memberid;
		this.password = password;
		this.membername = membername;
		this.regdate = regdate;
	}
	
	public memberList() {
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "memberList [idx=" + idx + ", memberid=" + memberid + ", password=" + password + ", membername="
				+ membername + ", regdate=" + regdate + "]";
	}
	
}
