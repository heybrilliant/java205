package ex.io;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class StringReader {

	public static void main(String[] args) {
		
		try {
			BufferedReader in = new BufferedReader(new FileReader("String.txt")); // 읽어오기 위해서는 완성된 파일이 있어야함
			
			// 행들 하나하나씩 읽어올때 넣어줄 임시변수
			String str = null;
			
			while(true) {
				
				str = in.readLine(); // 라인단위로 읽어온다 
				
				if(str == null) {
					break;
				}
				System.out.println(str);
			
			}
			in.close();
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		}
	
		
	}

