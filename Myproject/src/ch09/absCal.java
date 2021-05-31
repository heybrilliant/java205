package ch09;

abstract class absCal implements Calculator{ // 인터페이스를 상속하는 추상클래스
//	long n1, n2;
	
	public abstract long add(long n1, long n2);
	public abstract long substract (long n1, long n2);
	public abstract long multiply(long n1, long n2);
	
	public abstract double divide(double n1, double n2);
	 
}


