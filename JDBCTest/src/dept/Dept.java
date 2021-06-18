package dept;

public class Dept {

	// 사용자 입력 Data -> Dept에 저장
	// DB Dept -> Dept에 저장 -> 배열 또는 List사용하면 편리 ex) List(Dept) 
		
	private int deptno; // 부서번호 
	private String dname; // 부서이름
	private String loc; // 부서위치
	
	public Dept (int deptno, String dname, String loc) {
		this.deptno = deptno;
		this.dname = dname;
		this.loc = loc;
	}
	
	
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String getLoc() {
		return loc;
	}
	public void setLoc(String loc) {
		this.loc = loc;
	}
	
		
}
