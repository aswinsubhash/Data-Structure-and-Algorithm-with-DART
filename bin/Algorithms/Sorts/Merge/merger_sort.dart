class MergeSort {
  static List<int> merge(List<int> array1, List<int> array2) {
    // Create a new list with enough capacity to hold all elements from both arrays.
    List<int> combined = List.filled(array1.length + array2.length, 0);
    int index = 0; // Initialize an index to keep track of the combined array.
    int i = 0; // Initialize an index for array1.
    int j = 0; // Initialize an index for array2.

    // Compare elements from both arrays and merge them in sorted order.
    while (i < array1.length && j < array2.length) {
      if (array1[i] < array2[j]) {
        combined[index] = array1[i];
        index++;
        i++;
      } else {
        combined[index] = array2[j];
        index++;
        j++;
      }
    }

    // If there are remaining elements in array1, add them to the combined array.
    while (i < array1.length) {
      combined[index] = array1[i];
      index++;
      i++;
    }

    // If there are remaining elements in array2, add them to the combined array.
    while (j < array2.length) {
      combined[index] = array2[j];
      index++;
      j++;
    }

    return combined; // Return the merged and sorted array.
  }

  static List<int> mergeSort(List<int> array) {
    if (array.length == 1) return array;

    int midIndex = array.length ~/ 2;
    List<int> left = mergeSort(array.sublist(0, midIndex));
    List<int> right = mergeSort(array.sublist(midIndex));

    return merge(left, right);
  }
}

void main() {
  List<int> originalArray = [3, 1, 4, 2, 9, 5];
  List<int> sortedArray = MergeSort.mergeSort(originalArray);

  print('\nOriginal Array: $originalArray');
  print('\nSorted Array: $sortedArray');
}
