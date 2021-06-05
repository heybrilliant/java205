package ex;

import java.net.MalformedURLException;
import java.net.URL;

public class UrlTest {

	public static void main(String[] args) {

		String urlStr = "https://cafe.naver.com/bitcamp205";
		
		try {
			URL url = new URL(urlStr); //url클래스만들때 포맷에 맞지않으면 예외가 발생함 
			
			System.out.println("Protocol : " + url.getProtocol());
			System.out.println("Host name : " + url.getHost());
			System.out.println("Port Num : " + url.getPort());
			System.out.println("Default Port Num : " + url.getDefaultPort());
			System.out.println("Query : " + url.getQuery());
			System.out.println("Path : " + url.getPath());
			System.out.println("File : " + url.getFile());
		
			
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}

}
