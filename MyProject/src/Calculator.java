
public class Calculator {
	void plus(int n1, int n2) {
		System.out.println(n1 + n2);
	}
	
	void minus(int n1, int n2) {
		System.out.println(n1 - n2);
	}
	
	void multi(int n1, int n2) {
		System.out.println(n1 * n2);
	}
	
	void div(int n1, int n2) {
		System.out.println(n1 / n2);
	}
	
	public static void main(String[] args) {
		
		// 인스턴스 생성 -> 클래스의 정의가 필요 (필요한 변수, 필요한 메소드)
		// 클래스이름 참조변수 = new 클래스이름  
		
		Calculator cal = new Calculator();
		
		cal.plus(10, 20);
		cal.minus(20, 10);
		cal.div(10, 3);
		cal.multi(2, 5);
		
	}
}
