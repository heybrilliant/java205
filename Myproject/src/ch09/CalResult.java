package ch09;

class CalResult extends absCal2 {


	public static void main(String[] args) {
		CalResult cr = new CalResult();
		long n1 = 10;
		long n2 = 2;
		
		System.out.println(cr.add(n1, n2));
		System.out.println(cr.substract(n1, n2));
		System.out.println(cr.multiply(n1, n2));
		System.out.println(cr.divide(n1, n2));
	}

}