package ex.infomanager;

public class UnivFriend extends Friend {

	// 대학 친구는 전공 정보를 가진다.
	String major;

	public UnivFriend(String name, String phoneNumber, String address, String major) {
		super(name, phoneNumber, address);
		this.major = major;
	}

	@Override // 이거 써주면 오버라이드 규칙에 안맞으면 알려줌
	public void showData() {
		super.showData();
		System.out.println("전공 : " + major);
	}

	@Override
	public void showBasicData() {
		super.showBasicData();
		System.out.println("이름 : " + name);
		System.out.println("전화 : " + phoneNumber);
		System.out.println("전공 : " + major);
	}

}
