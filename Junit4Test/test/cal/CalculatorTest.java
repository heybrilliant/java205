package cal;

import static org.junit.Assert.*;

import java.sql.SQLException;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;



public class CalculatorTest {

	//Calculator cal = new Calculator();
	Calculator cal; // 변수 선언
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		System.out.println("@BeforeClass");
		
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		System.out.println("@AfterClass");
	}

	@Before // test할때마다 인스턴스가 생성되서 실행되는 습성
	public void setUp() throws Exception {
		System.out.println("@Before");
		cal = new Calculator();
	}

	@After
	public void tearDown() throws Exception {
		System.out.println("@After");
	}

	@Test
	public void testAdd() {
		System.out.println("testAdd()");
		Calculator cal = new Calculator();
		
		assertEquals("add() 메소드 테스트", 12, cal.add(10, 2));
		
		// System.out.println(cal.add(10, 2));
		//fail("Not yet implemented");
		
	}

	@Test
	public void testSubstract() {
		System.out.println("testSubstract()");
		assertEquals("substract() 메소드 테스트", 8, cal.substract(10, 2) );
		//fail("Not yet implemented");
	}

	@Test
	public void testMulti() {
		System.out.println("testMulti()");
		assertEquals("multi() 메소드 테스트", 20, cal.multi(10, 2));
		//fail("Not yet implemented");
	}

	@Test
	public void testDivide() {
		System.out.println("testDivide()");
		assertEquals("devide()메소드 테스트",5,cal.divide(10, 2));
		//fail("Not yet implemented");
	}

	// 예외 타입을 비교해서 테스트
	// 직접 작성할때는 @Test를 붙여주면 junit으로 테스트가 된다 
	@Test(expected = RuntimeException.class) 
	public void test1() {
		System.out.println("@Test 실행 중 예외타입을 테스트");
		throw new RuntimeException();
	}
	
	@Test(expected = SQLException.class) 
	public void test2() throws SQLException {
		System.out.println("@Test 실행 중 예외타입을 테스트");
		//throw new ArithmeticException();
		throw new SQLException();
	}
	
	@Test(timeout = 1) // 1/1000 초 를 벗어나면 false, 1/1000초 안에 실행되면 true
	public void test3() {
		System.out.println("@Test 테스트 중 허용시간 ms안에 실행이 완료되는지 테스트");
		cal.add(100, 200);
		cal.add(10, 2);
	}
	
	@Test
	public void test4() {
		// fail("테스트 미실행"); ->에러 
		// assertTrue("메소드의 반환값이 boolean인 경우 사용", true);
		// assertNull(null); // 결과값이 null 일때 true
		assertNull("메소드의 실행 값이 null이 예상되는 경우", new Object());
		assertNotNull("메소드의 실행 값이 null이 아닌 값이 예상되는 경우", null);
		// same은 equals와 비슷
	}
	
	@Test
	public void test5() {
		assertNull("Null"); // 결과값이 null 일때 true
		// 결과값 : expected null, but was:<Null>
	}
	
	@Test
	public void test6() {
		// same은 equals와 비슷
		assertSame("같은 값일 경우 ", 1, 2); // 에러 // ("같은 값일 경우 ", 1, 1) 이면 true
		assertNotSame("다른 값일 경우 ", 1, 2); // true 
	}

	@Test
	public void test7() {
		assertTrue("메소드의 반환값이 true를 예상할 때", true);
		// assertTrue("메소드의 반환값이 true를 예상할 때", false);-> error
	}
	
	
}
