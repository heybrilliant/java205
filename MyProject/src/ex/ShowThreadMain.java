package ex;

public class ShowThreadMain {

	public static void main(String[] args) {
		
		// 스레드 인스턴스 생성
		ShowThread t1 = new ShowThread("스레드1");
		ShowThread t2 = new ShowThread("      스레드2");
		
		//스레드의 실행
		t1.start();
		t2.start();
	}

}
