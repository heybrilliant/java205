package guest.domain;

import java.sql.Timestamp;

public class Message {
	
	private int messageid;
	private String guestname;
	private String password;
	private String message;
	private Timestamp regdate;
	
	public Message() {}

	public Message(int mesaageid, String guestname, String password, String message, Timestamp regdate) {
		super();
		this.messageid = mesaageid;
		this.guestname = guestname;
		this.password = password;
		this.message = message;
		this.regdate = regdate;
	}

	public Message(String guestname, String password, String message) {
		super();
		this.guestname = guestname;
		this.password = password;
		this.message = message;
	}

	public int getMesaageid() {
		return messageid;
	}

	public void setMessageid(int messageid) {
		this.messageid = messageid;
	}

	public String getGuestname() {
		return guestname;
	}

	public void setGuestname(String guestname) {
		this.guestname = guestname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}
