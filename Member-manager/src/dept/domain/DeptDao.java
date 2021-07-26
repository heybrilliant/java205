package dept.domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dept.domain.Dept;
import jdbc.util.jdbcUtil;

public class DeptDao {

	// 싱글톤 패턴
	// 1. 인스턴스 생성을 막는다!-> 생성자 통해서
	private DeptDao() {
	}

	// 2. 클래스 내부에서 인스턴스를 생성!
	private static DeptDao dao = new DeptDao();

	// 3. 외부에서 참조값을 반환 받을 수 있는 메소드
	public static DeptDao getInstance() {
		return dao == null ? new DeptDao() : dao;
	}

	public List<Dept> getDeptList(Connection conn) {
		Statement stmt = null;
		ResultSet rs = null;
		List<Dept> list = null;

		DeptDao dao = new DeptDao();

		// 3. Statement
		try {
			stmt = conn.createStatement();

			// sql 생성
			String sqlSelect = "select * from dept";

			// 4. ResultSet
			rs = stmt.executeQuery(sqlSelect); // executeQuery -> ResultSet 반환

			// 5. List<Dept> <- 결과
			List<Dept> deptList = new ArrayList<Dept>();

			while (rs.next()) {
				// List에 객체 추가
				list.add(new Dept(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(stmt);
		}
		return list;
	}

}

	public int insertDept(Connection conn, Dept dept) {
		int resultCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "insert into dept values(?,?,?)";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, dept.getDeptno());
			pstmt.setString(2, dept.getDname());
			pstmt.setString(3, dept.getLoc());

			resultCnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(pstmt);
		}

		return resultCnt;
	}

	public int deleteDept(Connection conn, int deptno) {
		int resultCnt = 0;
		PreparedStatement pstmt = null;

		String sql = "delete from dept where deptno=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);

			resultCnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(pstmt);
		}
		return resultCnt;
	}

	public Dept selectByDeptno(Connection conn, int deptno) {

		Dept dept = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from dept where deptno=?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				dept = new Dept(rs.getInt(1), rs.getString(2), rs.getString(3));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
		}
		return dept;
	}

}

	public int updateDept(Connection conn, Dept dept) {
		int resultCnt = 0;
		PreparedStatement pstmt = null;
		
		String sql = "update dept set dname=?, loc=? where deptno=?";

	try {
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, dept.getDname());
		pstmt.setString(2, dept.getLoc());
		pstmt.setInt(3, dept.getDeptno());
		
	} catch(SQLException e) {
		e.printStackTrace();
	} finally {
		jdbcUtil.close(rs);
		jdbcUtil.close(pstmt);
	}
	
	
	
	}
}