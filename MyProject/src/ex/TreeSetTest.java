package ex;

import java.util.Iterator;
import java.util.TreeSet;

public class TreeSetTest {

	public static void main(String[] args) {

		// TreeSet : 트리알고리즘 이용해서 저장 -> 정렬 (오름차순, 내림차순)
		// 정렬의 기준은 프로그래머가 정의 가능하다
		
		TreeSet<Integer> treeSet = new TreeSet<>();
		
		// 데이터 저장
		treeSet.add(1);
		treeSet.add(5);
		treeSet.add(4);
		treeSet.add(2);
		treeSet.add(1); // 중복값
		treeSet.add(3);
		treeSet.add(2); // 중복값
		
		// 정렬
		Iterator<Integer> itr = treeSet.iterator();
		
		while(itr.hasNext()) {
			System.out.println(itr.next());
		}
	}

}
