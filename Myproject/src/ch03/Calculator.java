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

	long plus(int a, int b) {
//		long result = a + b; // int에 넘치는 값 또한 받아주기 위해 long 타입으로 선언
//		return result;
		return (long)a + b; // 더 간결한 코드, b는 자동형변환 일어남
	}
	
	long minus(int a, int b) {
		return (long)a - b;
	}
	
	long multi(int a, int b) {
		return (long)a * b;
	}
	
	float div(int a, int b) {
		return (float)a / b; // (float)int / int -> int
	}
	
	// 대문자 이름 -> 대문자 시작 케멀 케이스
	// 변수 이름 -> 소문자 시작 케멀 케이스 
	// 상수 이름 -> 모두 대문자 
	// 안지켜도 에러가 뜨진않지만 클래스와 변수 등을 알아보기위한 암묵적인 약속임
	
	double pi = 3.14d;
	float pi2 = 3.14f;
	final float PI3= 3.14f; // final : 한번 변수값을 정해두면(한 번 대입한 후) 변하지 않게 함 = 상수로 만든다(상수는 대문자)
	
	float circle1(float r) {
		return 2 * PI3 * r; // int * float * float
	}
	
	float circle2(float r) {
		return PI3 * r * r; 
	}
	
	public static void main(String[] args) {

		// Scanner : 자원을 프로그램으로 받아오는 역할 
		

		Calculator cal = new Calculator();
		System.out.println(cal.PI3);

		Scanner scanner = new Scanner(System.in);
		System.out.println("정수 a를 입력하세요.");
		int a = scanner.nextInt();
		System.out.println("정수 b를 입력하세요.");
		int b = scanner.nextInt();
		
		System.out.println(a + " + " + b + " = " + cal.plus(a, b));
		System.out.println(a + " - " + b + " = " + cal.minus(a, b));
		System.out.println(a + " * " + b + " = " + cal.multi(a, b));
		System.out.println(a + " / " + b + " = " + cal.div(a, b));

		System.out.println("반지름 길이 r을 입력하세요.");
		float r = scanner.nextFloat();
		
		System.out.println("입력받은 반지름의 길이는 "+ r + "입니다.");
		System.out.println("반지름이 " + r + "인 원의 둘레는 " + cal.circle1(r) + "입니다.");
		System.out.println("반지름이 " + r + "인 원의 넓이는 " + cal.circle2(r) + "입니다.");

	}

}
