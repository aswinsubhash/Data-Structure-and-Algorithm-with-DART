/// Array: [Remove Duplicate]s ( ** Interview Question)
/// The task is to write a method named removeDuplicates, 
/// that removes all duplicate occurrences of integers from a sorted array in-place such that each unique element appears only once.
/// The relative order of the elements should be kept the same.
/// The method also needs to return the new length of the array after duplicates have been removed.
///  It's important to note that the array is passed by reference to the function, 
/// which means modification to the array will be known to the caller as well.


int removeDuplicates(List<int> nums) {
  if (nums.isEmpty) {
    return 0; // Empty array has no duplicates.
  }

  int uniqueIndex = 0; // Initialize a pointer for unique elements.

  for (int i = 1; i < nums.length; i++) {
    if (nums[i] != nums[uniqueIndex]) {
      uniqueIndex++;
      nums[uniqueIndex] = nums[i]; // Store the unique element.
    }
  }

  // Reduce the length of the array to match the new length.
  while (nums.length > uniqueIndex + 1) {
    nums.removeLast();
  }

  return uniqueIndex + 1; // Return the new length of the modified array.
}

void main() {
  List<int> nums = [1, 1, 2, 2, 2, 3, 4, 4, 5];
 removeDuplicates(nums);
  print("New length: ${nums.length}");
  print("Modified array: $nums");
}
