package ex.infomanager2;

public class HighFriend extends Friend {

	// 고교 친구는 직장 정보를 추가적으로 가진다.
	String work;

	public HighFriend(String name, String phoneNumber, String address, String work) {
		super(name, phoneNumber, address);
		this.work = work;

	}

	@Override
	public void showData() {
		super.showData(); // 원래 가지고있던 메소드 기능에
		System.out.println("직업 : " + work); // 원하는 기능을 추가한 것
	}

	@Override
	public void showBasicData() {
//		super.showBasicData();
		System.out.println("이름: " + name);
		System.out.println("전화: " + phoneNumber);
	}

}
