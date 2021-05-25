package ch04;

import java.util.*;

public class Member {
	void vaccinCheck(int birthYear) {
//		int age = 2021 - birthYear - 1; // 나이 연산
		
		int age = ageCal(birthYear);	
		boolean check1 = age < 15 || age >= 65;
		boolean check2 = !(age >= 15 && age < 65);

		System.out.println(check1);
		System.out.println(check2);

		if (check1) {
			System.out.println("무료예방접종이 가능합니다.");
		} else {
			System.out.println("무료접종 대상이 아닙니다.");
		}
	}

	void checkUp(int birthYear) {
		int age = 2021 - birthYear - 1;
		boolean check1 = birthYear % 2 == 0 && 2021 % 2 == 0 || birthYear % 2 == 1 && 2021 % 2 == 1;
		boolean check2 = birthYear % 2 == 2021 % 2;
		if (age >= 20 && check2) {
			System.out.println("무료 건강검진 대상입니다.");
			if (age >= 40) {
				System.out.println("암 검사 대상자입니다.");
			}
		} else {
			System.out.println("무료 건강검진 대상이 아닙니다.");
		}
	}
	// 태어난 년도를 입력하면 나이를 반환하는 메소드
	int ageCal(int year) {
//		int currentYear = Calendar.getInstance().get(Calendar.YEAR); // Calendar 시간 날짜 등의 정보를 가지고 있는 클래스(참조변수) 
		return Calendar.getInstance().get(Calendar.YEAR)-year-1;
	}
	
	
	public static void main(String[] args) {

		// ① 독감예방 접종이 가능한지 여부를 확인하는 메소드를 정의합니다.
		// - 매개변수로 태어난 해(년도)를 전달받습니다.

		Scanner scanner = new Scanner(System.in);
		System.out.println("태어난 연도를 입력해주세요. :");
		int birthYear = scanner.nextInt();
		System.out.println();

		Member member = new Member();

		member.vaccinCheck(birthYear);
		member.checkUp(birthYear);

	}

}
