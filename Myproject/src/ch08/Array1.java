package ch08;

import java.util.Scanner;

public class Array1 {	
	public static int maxValue(int[] arr) {
		int max = arr[0];
		for (int i = 0; i < arr.length; i++) {
			if( max < arr[i]) {
				max = arr[i];
			} 
		}	return max;
	}
	public static int minValue(int[] arr) {
		int min = arr[0];
		for (int i = 0; i < arr.length; i++) {
			if( min > arr[i]) {
				min = arr[i];
			} 
		}	return min;
	}

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		int[] arr = new int[10];  // 크기가 10인 배열 arr 생성
		
		for(int i = 1; i <= 10; i++) {
			System.out.printf("배열의 값을 입력해주세요. %d.", i);
			arr[i-1] = scanner.nextInt();
		}
		System.out.println("입력하신 배열의 최대값은 : " + maxValue(arr) + "입니다.");
		System.out.println("입력하신 배열의 최소값은 : " + minValue(arr) + "입니다.");
	}
}
