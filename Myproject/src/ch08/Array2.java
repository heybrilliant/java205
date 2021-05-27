package ch08;

public class Array2 {

	public static void addOneDArr(int[] arr, int add) {
		for (int i = 0; i < arr.length; i++)
			arr[i] += add;
	}

	public static void addTwoDArr(int[][] arr, int add) {

		for (int i = 0; i < arr.length; i++) {
//			for (int j = 0; j < arr.length; j++) {
				addOneDArr(arr[i], add);
			}
		}
//	}

	public static void main(String[] args) {
		int[][] arr = new int[][] { 
				{ 1, 2, 3, 4 }, 
				{ 5, 6, 7, 8 } 
				};

		System.out.println("증가 후 배열 : ");
		addTwoDArr(arr, 3);
			for (int i = 0; i < arr.length; i++) {
				for (int j = 0; j < arr[i].length; j++) {
					System.out.print(arr[i][j] + " ");
				}
				System.out.println();
		}

	}
}
