package ch09;

public class absCal2 extends absCal implements Calculator {
	public static void main(String[] args) {
		CalResult cr = new CalResult();
		long n1 = 0;
		long n2 = 0;
		
		cr.add(n1, n2);
		cr.substract(n1, n2);
		cr.multiply(n1, n2);
		cr.divide(n1, n2);
	}

	@Override
	public long add(long n1, long n2) {
		return  n1 + n2;
	}

	@Override
	public long substract(long n1, long n2) {
		return n1 - n2;
	}

	@Override
	public long multiply(long n1, long n2) {
		return n1 * n2;
	}

	@Override
	public double divide(double n1, double n2) {
		return n1 / n2;
	}
}
