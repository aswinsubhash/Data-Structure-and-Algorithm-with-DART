class InsertionSort {
  static void insertionSort(List<int> array) {
    for (int i = 1; i < array.length; i++) {
      int temp = array[i];
      int j = i - 1;
      while (j > -1 && temp < array[j]) {
        array[j + 1] = array[j];
        array[j] = temp;
        j--;
      }
    }
  }
}

void main() {
  List<int> array = [4, 2, 6, 5, 1, 3];

  print('Array before Sorting:\n$array');

  InsertionSort.insertionSort(array);

  print('Array after Sorting:\n$array');
}
