package dept;

import java.awt.RadialGradientPaint;
import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DeptDao {

	// 싱글톤 패턴 : 여러개의 인스턴스를 생성하지 못하도록 하는 디자인 패턴
	// 1. 외부 클래스 또는 인스턴스에서 해당 클래스로 인스턴스를 생성하지 못하도록 처리 
	private DeptDao() { // private = 외부에서 접근이 불가능하다 -> 생성자 호출이 불가능하다 -> 인스턴스 생성이 불가능하다 
	}
	
	// 2. 클래스 내부에서 인스턴스를 만들고
	static private DeptDao dao = new DeptDao();	
	
	// 3. 메소드를 통해서 반환하도록 처리 
	public static DeptDao getInstance() { // 미리 인스턴스로 static
		return dao;
	} 
	
	
	// 1. 전체 데이터 검색 기능
	// 반환 타입은 List<Dept>
	// 매개변수 - Connection 객체가 필요 : Statement 객체 만들기 위함
	ArrayList<Dept> getDeptList(Connection conn) {

		ArrayList<Dept> list = null;

		// 데이터 베이스의 테이블 이용 select 의 결과물 => list 저장
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			String sql = "select * from dept order by deptno";

			// 결과 알아오기
			rs = stmt.executeQuery(sql);

			list = new ArrayList<>();

			// 데이터를 Dept 객체로 생성 -> list에 저장
			while (rs.next()) {
				list.add(new Dept(rs.getInt(1), rs.getString(2), rs.getString(3)));
			}

		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} finally {

			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (stmt != null) {
				try {
					stmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return list;
	}

	// 2. DEPT 테이블에 데이터를 저장하는 메소드
	// 반영 횟수 반환
	// 사용자로부터 데이터 받기 -> Dept 객체로 받기
	int insertDept(Connection conn, Dept dept) {

		int result = 0;

		// 전달받은 Dept 객체의 데이터로 Dept 테이블에 저장 -> 결과 값을 반환
		PreparedStatement pstmt = null;

		try {
			String sql = "insert into dept values (DEPT01_DEPTNO_SEQ.nextval, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept.getDname());
			pstmt.setString(2, dept.getLoc());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return result;
	}

	// 3.DEPT 테이블의 데이터 수정 메소드
	// 반영된 행의 개수 반환
	// 사용자로부터 데이터를 받아서 처리 -> Dept 객체
	int editDept(Connection conn, Dept dept) {

		int result = 0;

		// 전달받은 Dept 객체의 데이터로 Dept 테이블에 저장 -> 결과 값을 반환
		PreparedStatement pstmt = null;

		try {
			String sql = "update dept set dname = ?, loc = ? where deptno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dept.getDname());
			pstmt.setString(2, dept.getLoc());
			pstmt.setInt(3, dept.getDeptno());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return result;
	}
	
	// 4. DEPT 테이블의 데이터 삭제
	// 삭제된 행의 개수를 반환
	// 사용자로부터 deptno 받아서 처리한다 
	int deleteDept(Connection conn, int deptno) {
		
		int result = 0;
		
		// 데이터베이스 처리 sql 
		PreparedStatement pstmt = null;
		
		try {
			String sql = "delete from dept where deptno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, deptno);
			
			result = pstmt.executeUpdate(); 
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		
		return result;
		
	}
	
	
}
