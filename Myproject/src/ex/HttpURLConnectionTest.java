package ex;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class HttpURLConnectionTest {

	public static void main(String[] args) {
		
		String urlStr = "https://news.naver.com/main/main.nhn?mode=LSD&mid=shm&sid1=105";
		
		
		try {
			URL url = new URL(urlStr);
			
			//HTTPURLConnection : url.openConnection()	
			
				HttpURLConnection hcon = (HttpURLConnection) url.openConnection();
				
				for(int i = 1; i<=8; i++) {
					System.out.print(hcon.getHeaderFieldKey(i));
					System.out.println(" : " + hcon.getHeaderField(i));
				}
				
			hcon.disconnect();
			
			
			
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
