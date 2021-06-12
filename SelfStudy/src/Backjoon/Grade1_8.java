package Backjoon;

import java.util.Scanner;

//단계1.입출력과 사칙연산
//문제5: 두 정수 A와 B를 입력받은 다음, A/B를 출력하는 프로그램을 작성하시오.
//첫째 줄에 A와 B가 주어진다. (0 < A, B < 10)

public class Grade1_8 { // 백준 입력시 class이름은 Main
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("정수 A를 입력하세요");
		int A = scanner.nextInt();
		System.out.println("정수 B를 입력하세요");
		int B = scanner.nextInt();
		long devide = A / B;
		System.out.println(devide);
		
		scanner.close();
	}
}