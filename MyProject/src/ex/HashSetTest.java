package ex;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;


public class HashSetTest {

	public static void main(String[] args) {

		// HashSet 저장공간 생성 : 
		// 인스턴스 저장, 
		// 중복 저장을 허용하지 않는다. 
		// 저장 순서를 가지지 않는다
		
		//HashSet<String> hashSet = new HashSet<String>();
		//HashSet<Integer> hashSet = new HashSet<Integer>();
		Set<SimpleNumber> hashSet = new HashSet<>();
		
		hashSet.add(new SimpleNumber(10));
		hashSet.add(new SimpleNumber(20));
		hashSet.add(new SimpleNumber(20));
		
		// 데이터 저장
		// hashSet.add("First");
		// hashSet.add("Second");
		// hashSet.add("Third");
		// hashSet.add("First"); //중복 데이터 생성
		
		// hashSet.add(1);
		// hashSet.add(2);
		// hashSet.add(1);
		// hashSet.add(2);
		// hashSet.add(3);
		
		// 데이터의 일괄 처리 
		// Iterator<String> itr = hashSet.iterator();
		Iterator<SimpleNumber> itr = hashSet.iterator();
		
		while(itr.hasNext()) { //hasNext가 요소 판단
			System.out.println(itr.next()); // 출력하면 같은 값인 First가 하나만 출력됨 -> 중복되는 데이터는 저장되지 않음
			//출력값은 순서가 유지되지 않는다!
		}
	}
}

class SimpleNumber {
	int num;
	SimpleNumber(int num) {
		this.num = num;
	}
	
	@Override
	public int hashCode() {
		return num%3; //0, 1, 2
	}
	
	@Override
	public boolean equals(Object obj) {
		boolean result = false;
		
		//obj는 null이 아니고, obj는 SimpleNumber 타입으로 형변환이 가능
		if(obj != null && obj instanceof SimpleNumber) {
			SimpleNumber sNum = (SimpleNumber) obj;
			if(this.num == sNum.num) {
				result = true;
			}
		}
		
		return result;
	}
	
	public String toString() {
		return String .valueOf(num);
	}
}
