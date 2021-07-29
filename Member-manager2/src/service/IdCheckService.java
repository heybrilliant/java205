package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.MemberDao;
import jdbc.util.ConnectionProvider;

public class IdCheckService {

	private IdCheckService() {}
	private static IdCheckService service = new IdCheckService();
	public static IdCheckService getInstance() {
		return service;
	}
	
	public String idCheck(String memberId) {
		//String result = "N";
		
		int cnt = 0;
		
		Connection conn = null;
		MemberDao dao = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			dao = MemberDao.getInstance();
			
			cnt = dao.selectById(conn, memberId);
			// 객체로 받을 필요없이 숫자 카운트로 받아오기 -> 숫자 1 
		
			// result = cnt > 0 ? "N" : "Y" ;
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return cnt > 0 ? "N" : "Y" ;
	}
	
}
