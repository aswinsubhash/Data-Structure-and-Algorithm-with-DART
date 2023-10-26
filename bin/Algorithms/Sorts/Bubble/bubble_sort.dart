class BubbleSort {
  static void bubbleSort(List<int> array) {
    for (int i = array.length - 1; i > 0; i--) {
      for (int j = 0; j < i; j++) {
        if (array[j] > array[j + 1]) {
          int temp = array[j];
          array[j] = array[j + 1];
          array[j + 1] = temp;
        }
      }
    }
  }
}

void main() {
  List<int> array = [4, 2, 6, 5, 1, 3];

  print('Array before Sorting:\n$array');

  BubbleSort.bubbleSort(array);

  print('Array after Sorting:\n$array');
}
