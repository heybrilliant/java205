package jdbc.util;

import java.util.StringTokenizer;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import sun.util.locale.StringTokenIterator;

public class JdbcListener implements ServletContextListener {


	@Override
	public void contextInitialized(ServletContextEvent sce) {

		System.out.println("Listener 진입!");
		
		try {
		ServletContext context = sce.getServletContext();
		String drivers = context.getInitParameter("jdbcdriver");
		
		StringTokenizer tokenizer = new StringTokenizer(drivers, ",");
		while(tokenizer.hasMoreElements()) {
			String jdbcDriver = tokenizer.nextToken();
			// 드라이버 로드
			Class.forName(jdbcDriver);
			System.out.println("드라이버 로드 성공!");
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
	

	@Override
	public void contextDestroyed(ServletContextEvent sce) {

	}

}
