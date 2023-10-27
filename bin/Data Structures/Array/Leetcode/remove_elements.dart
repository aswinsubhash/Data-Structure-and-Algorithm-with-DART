int removeElement(List<int> nums, int val) {
  int newIndex = 0;

  for (int i = 0; i < nums.length; i++) {
    if (nums[i] != val) {
      nums[newIndex] = nums[i];
      newIndex++;
    }
  }

  while (newIndex < nums.length) {
    nums.removeLast(); // Remove the elements beyond the new length.
  }

  return newIndex;
}

void main() {
  List<int> nums = [3, 2, 2, 3];
  int val = 3;

 removeElement(nums, val);

  print("New length of the array: ${nums.length}");
  print("Updated array: $nums");
}
