package com.bitcamp.app.member.domain;

import org.springframework.web.multipart.MultipartFile;

public class MemberRegRequest {

	private String memberid;
	private String password;
	private String membername;
	private MultipartFile photo;
	
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
	public MultipartFile getPhoto() {
		return photo;
	}
	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}
	
	@Override
	public String toString() {
		return "MemberRegRequest [memberid=" + memberid + ", password=" + password + ", membername=" + membername
				+ ", photo=" + photo.getOriginalFilename() + "]";
	}
	
	//멀티 파일의 업로드 업데이트한 파일의 이름을 가져올 수 있음
	// MemberRegRequest -> Dao 전달할때 멤버객체 받도록 처리했음 -> Member 객체로 바꾸는 메소드를 만들것임
	
	public Member toMember() {
		return new Member(0, memberid, password, membername, null, null);
	}
	
}
