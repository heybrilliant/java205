package ch08;

public class Array3 {

	public static void renew(int[][] arr) {
		
		int[][] newArr = new int[arr.length][arr[0].length];
		for (int i = 0; i < arr.length; i++) {
			for (int j = 0; j < arr[i].length; j++) {
				if (i == arr.length-1) {
					newArr[0][j] = arr[i][j];
				} else {
					newArr[i+1][j] = arr[i][j];
				}
			}
		}
		
		for (int i = 0; i < newArr.length; i++) {
			for (int j = 0; j < newArr[i].length; j++) {
				System.out.print(newArr[i][j] + " ");
			}
			System.out.println();
		}
	}

	public static void main(String[] args) {
		int[][] arr2 = new int[3][];

		arr2[0] = new int[] { 1, 2, 3, 10};
		arr2[1] = new int[] { 4, 5, 6, 11};
		arr2[2] = new int[] { 7, 8, 9, 12};
		renew(arr2);
		System.out.println();
	}
}
