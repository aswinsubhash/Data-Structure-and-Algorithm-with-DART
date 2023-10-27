class QuickSort {
  static void swap(List<int> array, int firstIndex, int secondIndex) {
    int temp = array[firstIndex];
    array[firstIndex] = array[secondIndex];
    array[secondIndex] = temp;
  }

// Function to pivot and partition an array around a selected pivot element.
  static int pivot(List<int> array, int pivotIndex, int endIndex) {
    // Initialize the swapIndex as the pivotIndex.
    int swapIndex = pivotIndex;

    // Iterate through the elements from pivotIndex + 1 to endIndex.
    for (int i = pivotIndex + 1; i <= endIndex; i++) {
      // If the current element is smaller than the pivot element, swap it.
      if (array[i] < array[pivotIndex]) {
        swapIndex++; // Increment the swapIndex.
        swap(array, swapIndex, i); // Swap the elements at swapIndex and i.
      }
    }

    // After all swaps, move the pivot element to its correct position.
    swap(array, pivotIndex, swapIndex);

    // Return the final position of the pivot element.
    return swapIndex;
  }

// Quick Sort algorithm to sort an integer list.
  static void quickSort(List<int> array, int left, int right) {
    // Base case: If the left index is less than the right index, continue sorting.
    if (left < right) {
      // Find the pivot index to partition the array.
      int pivotIndex = pivot(array, left, right);

      // Recursively sort the left and right subarrays.
      quickSort(array, left, pivotIndex - 1); // Sort the left subarray.
      quickSort(array, pivotIndex + 1, right); // Sort the right subarray.
    }
  }
}

void main() {
  List<int> myArray = [4, 6, 1, 7, 3, 2, 5];

  QuickSort.quickSort(myArray, 0, 6);

  print(myArray);
}
