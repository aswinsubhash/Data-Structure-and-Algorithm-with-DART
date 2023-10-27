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
