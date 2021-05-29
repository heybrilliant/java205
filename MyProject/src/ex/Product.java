package ex;

public class Product {
	
	final int price; // final = 한번 초기화되면 변경되지 못하게 설정 (상수처리)
	int bonusPoint;
	
	Product(int price){
		this.price = price; //생성자 생성, 초기화
		bonusPoint = (int)(price/10.0);
	}
	public static void main(String[] args) {

	}

}
