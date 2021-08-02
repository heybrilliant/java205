package member.domain;

import java.util.Date;

public class Member {

		private int id;
		private String email;
		private String password;
		private String name;
		private Date regtDate;
		
		public Member(int id, String email, String password, String name, Date regtDate) {
			this.id = id;
			this.email = email;
			this.password = password;
			this.name = name;
			this.regtDate = regtDate;
		}

		public int getId() {
			return id;
		}

		public void setId(int id) {
			this.id = id;
		}
		
		public String getEmail() {
			return email;
		}

		public String getPassword() {
			return password;
		}

		public String getName() {
			return name;
		}

		public Date getRegtDate() {
			return regtDate;
		}
		
		// 비밀번호 변경 메소드 
		public void changePassword(String oldPw, String newPw) throws Exception {

			if(password.equals(oldPw)) {
				password = newPw; //대입
			} else {
				throw new Exception("비밀번호 불일치");
			}
		}
		
	
	
}
