package ex;

public class BuyerMain extends Buyer {

	public static void main(String[] args) {
		// 구매자 객체 생성
		Buyer buyer = new Buyer();
		
		// 제품 객체 생성
		Tv tv = new Tv(1000);
		Computer computer = new Computer(300);
		
		// 구매
		buyer.buy(tv);
		buyer.buy(computer);
		buyer.buy(tv);
		buyer.buy(computer);

		
		// 결과 지표 
//		System.out.println("현재 소지한 금액은 " + buyer.money + "원 입니다.");
//		System.out.println("현재 보유한 보너스 포인트는 " +buyer.bonusPoint + "점 입니다.");
		// 구매 지표 출력 
		buyer.summary();
	}

}
