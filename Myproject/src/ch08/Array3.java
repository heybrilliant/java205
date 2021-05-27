package ch08;

public class Array3 {

	public static void renew(int[][] arr) {

		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				System.out.print(arr[i][j]);
				System.out.println();
			}
//			int temp = (int) (arr.length);
//			for (temp = i - 1; temp > 0; temp--) {
//				if (temp == 1) {
//					arr[temp] = arr[temp - 1];
//					arr[0] = arr[temp];
//				}
//
//				break;
//
//			}
		}
	}

	public static void main(String[] args) {
		int[][] arr2 = new int[3][];

		arr2[0] = new int[] { 1, 4, 5 };
		arr2[1] = new int[] { 3, 1 };
		arr2[2] = new int[] { 6, 2, 3 };
		renew(arr2);
		System.out.println();
	}
}
