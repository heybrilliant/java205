package cal;

public class Calculator {

	public int add(int num1, int num2) {
		return num1+num2;
	}
	
	public int substract(int num1, int num2) {
		return num1 - num2;
	}
	
	public int multi(int num1, int num2) {
		return num1 * num2;
	}
	
	public int divide(int num1, int num2) {
		return num1 / num2;
	}
	
	public static void main(String[] args) {
		Calculator cal = new Calculator();
		
		// 덧셈테스트 
		System.out.println(cal.add(10, 2)); // 기대값 12
		// 뺄셈테스트
		System.out.println(cal.substract(10, 2)); // 기대값 8
		// 곱셈테스트
		System.out.println(cal.multi(10, 2)); // 기대값 20
		// 나눗셈테스트 
		System.out.println(cal.divide(10, 2)); // 기대값 5
		
		
	}
	
	
}
