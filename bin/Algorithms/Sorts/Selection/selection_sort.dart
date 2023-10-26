class SelectionSort {
  static void selectionSort(List<int> array) {
    for (int i = 0; i < array.length; i++) {
      int minIndex = i;
      for (int j = i + 1; j < array.length; j++) {
        if (array[j] < array[minIndex]) {
          minIndex = j;
        }
      }
      if (i != minIndex) {
        int temp = array[i];
        array[i] = array[minIndex];
        array[minIndex] = temp;
      }
    }
  }
}

void main() {
  List<int> array = [4, 2, 6, 5, 1, 3];

  print('Array before Sorting:\n$array');

  SelectionSort.selectionSort(array);

  print('Array after Sorting:\n$array');
}
