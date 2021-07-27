package jdbc.util;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.sun.jndi.ldap.Connection;

public class MemberDao {

}

public Member selectByIdPw(Connection conn, String id, String pw) {

	
	
	ResultSet rs = null;
	
	String sql = "select * from ncs_project where memberid="test" and password="test";"

	try {		
		pstmt = conn.preparedStatement(sql);
		pstmt.setString(1,id);
		pstmt.setString(2,pw);
	
		if(rs.next()) {
			member = new Member();
			member.setIdx(rs.getInt("idx"));
			member.setMemberid(rs.getString("memberid"));
			member.setPassword(rs.getString("password"));
			member.setMembername(rs.getString("membername"));
			member.setRegdate(rs.getTimestamp("regdate"))
		}
	
	} catch (SQLException e) {
		e.printStackTrace();
	}finally {
		jdbcUtil.close(rs);
		jdbcUtil.close(pstmt);
	}
}