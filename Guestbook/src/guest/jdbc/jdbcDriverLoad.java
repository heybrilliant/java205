package guest.jdbc;

import javax.management.RuntimeErrorException;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class jdbcDriverLoad extends HttpServlet{

	@Override
	public void init(ServletConfig config) throws ServletException {

		String jdbcDriver = config.getInitParameter("jdbcDriver");
		
		try {
			jdbcDriver = jdbcDriver == null ? "com.mysql.cj.jdbc.Driver" : jdbcDriver;
			Class.forName(jdbcDriver);
			System.out.println("mysql Driver load...!!!");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}

}
