package ch06;

public class Student {
//	Student 클래스를 정의해봅시다. 
//	① 학생이름, 국어점수, 영어점수, 수학점수를 저장하는 변수를 정의 합니다.
//	② 변수는 캡슐화를 합니다. getter/setter 메소드를 정의합니다.
//	③ 총점과 평균을 구해 결과를 반환하는 메소드를 정의합니다.

	private String name;
	private int korScore, engScore, mathScore;

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKorScore() {
		return korScore;
	}
	public void setKorScore(int korScore) {
		this.korScore = korScore;
	}
	public int getEngScore() {
		return engScore;
	}
	public void setEngScore(int engScore) {
		this.engScore = engScore;
	}
	public int getMathScore() {
		return mathScore;
	}
	public void setMathScore(int mathScore) {
		this.mathScore = mathScore;
	}

	int sum() {
		return korScore + engScore + mathScore;
	}
	double avr() { 
		return (korScore + engScore + mathScore) / 3;
	}
	
	Student(String name, int korScore, int engScore, int mathScore) {
		this.name = name;
		this.korScore = korScore;
		this.engScore = engScore;
		this.mathScore = mathScore;
	}
	
	public static void main(String[] args) {
//		main()메소드에 아래 내용을 정의해봅시다. 
//		① Student 타입의 배열을 선언하고, 요소 10개를 저장할 수 있는 배열 인스턴스를 생성해 봅시다.
//		② Student 타입의 인스턴스를 생성하고 배열에 저장하는 코드를 정의해봅시다.
//		③ 배열에 저장된 Student 타입의 인스턴스의 메소드를 이용해서 모든 데이터를 출력해봅시다.
		
		Student[] student = new Student[10];
		student[0] = new Student("김에이", 10, 10, 10);
		student[1] = new Student("김비", 20, 20, 20);
		student[2] = new Student("김씨", 30, 30, 30);
		student[3] = new Student("김디", 40, 40, 40);
		student[4] = new Student("김이", 50, 50, 50);
		student[5] = new Student("김에프", 60, 60, 60);
		student[6] = new Student("김쥐", 70, 70, 70);
		student[7] = new Student("김에이치", 80, 80, 80);
		student[8] = new Student("김아이", 90, 90, 90);
		student[9] = new Student("김제이", 100, 100, 100);
				
		for(int i = 0; i < student.length; i++ ) {
		System.out.println(student[i].getName()+ "학생의 총점은 "+ student[i].sum() +"점 입니다.");
		System.out.println(student[i].getName()+ "학생의 평균은 "+ student[i].avr() +"점 입니다.");
		
		}
	}
}
