package ch02;

public class Member {

	int num; // 인스턴스 변수

	public static void main(String[] args) {
		System.out.println("안녕하세요 신은경입니다.");

		// 변수선언
		// 데이터 타입 식별 이름
		// 데이터 타입 -> 내가 다루어야하는 데이터의 특징에 의해 결정
		// 기본형 타입 8가지 -> 정수형, 실수형, boolean, 문자 (표현할 수 있는 문자의 범위가 다름)

		// ① String 타입의 이름을 저장할 수 있는 변수 name을 정의해봅시다.
		String name = "신은경";

		// ② int 타입의 나이를 저장할 수 있는 변수 age를 정의해봅시다.
		int age = 30;

		// ③ double 타입의 키를 저장할 수 있는 변수 height를 정의해봅시다.
		double height = 161.2d;
		
		// ④ boolean 타입의 JAVA책의 보유 여부를 저장할 수 있는 변수 hasBook를 정의해봅시다.
		boolean hasBook = false;
		
		
		// ⑤ 이름과 나이, 키, 책의 보유 여부를 출력해봅시다.
		System.out.println("저의 이름은 "+name); 
		System.out.println("키는 "+ height + "cm 입니다.");
		System.out.println("제 나이는 "+ age +"살 입니다.");
		System.out.println("책의 보유 여부 : " + hasBook	); //String + boolean
	
		if(hasBook) {
			System.out.println("책 있어요!");
		} else {
			System.out.println("책 없어요!");
		}
	}

}
