/// Array: [Find Longest String ]( ** Interview Question)
/// Write a method that, given an array of strings, finds and returns the longest string in the array.
/// If there are multiple strings with the same maximum length, return the first one encountered.

String? findLongestString(List<String> strings) {
  if (strings.isEmpty) {
    // Handle the case where the array is empty.
    return null;
  }

  String longest = strings[0]; // Initialize with the first string.

  for (int i = 1; i < strings.length; i++) {
    if (strings[i].length > longest.length) {
      longest = strings[i];
    }
  }

  return longest;
}

void main() {
  List<String> strings = ["apple", "banana", "date", "fig"];
  String? longestString = findLongestString(strings);
  if (longestString != null) {
    print("Longest string: $longestString");
  } else {
    print("Array is empty.");
  }
}
