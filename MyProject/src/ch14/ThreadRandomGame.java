package ch14;

import java.util.Random;
import java.util.Scanner;

public class ThreadRandomGame {

	public static void main(String[] args) {
		
		Scanner scanner = new Scanner(System.in);
		
		System.out.println("1 ~ 100 사이의 숫자를 맞추세요.");
		
		Random random = new Random();
		int num = random.nextInt(100);
		System.out.println("랜덤 숫자 : " + num);
		
		CountDownThread downThread = new CountDownThread();
		downThread.start();
		
		while (true) {
			System.out.println("숫자를 입력해주세요.");
			int userNum = Integer.parseInt(scanner.nextLine());
			if (userNum>num) {
				System.out.println("높은 숫자입니다. 더 낮은 숫자를 입력해주세요.");
			} else if (userNum<num) {
				System.out.println("낮은 숫자입니다. 더 높은 숫자를 입력해주세요.");
			} else {
				System.out.println("정답입니다!");
				System.out.println("게임을 종료합니다.");
				System.exit(0);
			}
		}
	}

}

class CountDownThread extends Thread {

	
	@Override
	public void run() {
		for (int i =0; i < 30; i++) {
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		System.out.println("시간 초과입니다.");
		System.exit(0);
	}
}
