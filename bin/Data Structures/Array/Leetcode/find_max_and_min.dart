/// Array: [Find Max Min] ( ** Interview Question)
/// In this problem, you are given an array of integers, and the task is to write a method that finds the maximum and minimum numbers in the array.
/// The method should return these two numbers as an array with the maximum number at the first index and the minimum number at the second index.

List<int> findMaxMin(List<int> array) {
  if (array.isEmpty) {
    // Handle the case where the array is empty.
    return [];
  }

  int max = array[0]; // Initialize max with the first element.
  int min = array[0]; // Initialize min with the first element.

  for (int i = 1; i < array.length; i++) {
    if (array[i] > max) {
      max = array[i];
    } else if (array[i] < min) {
      min = array[i];
    }
  }

  return [max, min];
}

void main() {
  List<int> numbers = [3, 8, 1, 9, 4, 6, 2, 7,10];
  List<int> result = findMaxMin(numbers);
  print("Maximum: ${result[0]}, Minimum: ${result[1]}");
}
