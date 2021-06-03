package ex.infomanager3;

import java.io.File;

public class FileMove {

	public static void main(String[] args) {

		// File myFile = new File("C:\\myjava", "origin.pdf"); 같은 맥락
		File myFile = new File("C:"+ File.separator +"myjava"+ File.separator +"origin.pdf");
		System.out.println(myFile);
		
		if(!myFile.exists()) {
			System.out.println("파일이 존재하지 않습니다."); // 파일이 없으면 이동할 수 없음
			System.out.println("프로그램을 종료합니다.");
			return;
		} 
		
		// 새로운 폴더를 생성 : 경로부터 생성 -> 폴더 생성
		File newDir = new File("c:\\yourjava"); // 경로정보 만듬 파일은 아직 없음
		System.out.println("1. exist ?? --> " + newDir.exists());
		
		// 폴더가 이미 있으면 만들고 없으면 안만들기 
		if(!newDir.exists()) {
			newDir.exists();
			// 폴더 생성
			newDir.mkdir();
			System.out.println("2. exist ?? --> " + newDir.exists());
		}
		
		System.out.println(myFile.getName());
		
		// 이동할 경로와 파일 이름
		File newFile = new File(newDir, myFile.getName()); // 아직 파일 없다 이동할 경로와 파일이름을 정의한것
		// 이동
		myFile.renameTo(newFile);
		
		if(newFile.exists()) {
			System.out.println("파일 이동 성공");
		} else {
			System.out.println("파일 이동 실패");
		}
		
	}

}
