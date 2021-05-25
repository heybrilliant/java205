package ch03;

// ① 정수 두 개를 매개변수의 인자로 전달받아 더하기연산 후 출력하는 메소드를 정의
// ② 정수 두 개를 매개변수의 인자로 전달받아 빼기연산 후 출력하는 메소드를 정의
// ③ 정수 두 개를 매개변수의 인자로 전달받아 곱하기연산 후 출력하는 메소드를 정의
// ④ 정수 두 개를 매개변수의 인자로 전달받아 나누기연산 후 출력하는 메소드를 정의
// ⑤ 실수 반지름 하나를 매개변수의 인자로 전달받아 원의 둘레를 구해 반환하는 메소드를 반환하는 메소드를 정의
// ⑥ 실수 반지름 하나를 매개변수의 인자로 전달받아 원의 넓이를 구해 반환하는 메소드를 반환하는 메소드를 정의
// 원의 둘레 : 2 x π x r , 월의 넓이 : π x r x r
// ⑦ main() 메소드를 정의하고 각각의 메소드를 호출해서 결과를 콘솔에 출력해봅시다.
// ⑧ 콘솔에서 사용자에게 데이터를 받아 메소드를 호출할 때 사용자에게 받은 데이터를 메소드의 매개변수의 인자로 전달하는 코드를 main()
// 메소드에 추가해봅시다.

import java.util.Scanner;

public class Calculator {

	public int plus(int a, int b) {
		int plus = a + b;
		return plus;
	}
	
	public int minus(int a, int b) {
		int minus = a - b;
		return minus;
	}
	
	public int multi(int a, int b) {
		int multi = a * b;
		return multi;
	}
	
	public int div(int a, int b) {
		int div = a / b;
		return div;
	}
	
	public float circle1(float r) {
		float circle1 = (float) (2 * 3.14 * r);
		return circle1;
	}
	public float circle2(float r) {
		float circle2 = (float) (3.14 * r * r);
		return circle2;
	}
	
	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		System.out.println("정수 a를 입력하세요.");
		int a = scanner.nextInt();
		System.out.println("정수 b를 입력하세요.");
		int b = scanner.nextInt();
		
		Calculator cal = new Calculator();
		System.out.println(cal.plus(a, b));
		System.out.println(cal.minus(a, b));
		System.out.println(cal.multi(a, b));
		System.out.println(cal.div(a, b));

		System.out.println("반지름 길이 r을 입력하세요.");
		float r = scanner.nextInt();

		System.out.println("반지름이 " + r + "인 원의 둘레는 " + cal.circle1(r) + "입니다.");
		System.out.println("반지름이 " + r + "인 원의 넓이는 " + cal.circle2(r) + "입니다.");

	}

}
