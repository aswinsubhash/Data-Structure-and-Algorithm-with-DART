/// LL: [Remove Duplicates] ( ** Interview Question)
// You are given a singly linked list that contains integer values, where some of these values may be duplicated.

// Note: this linked list class does NOT have a tail which will make this method easier to implement.

// Your task is to implement a method called removeDuplicates() within the LinkedList class that removes all duplicate values from the list.

// Your method should not create a new list, but rather modify the existing list in-place, preserving the relative order of the nodes.

// You can implement the removeDuplicates() method in two different ways:



// Using a Set (HashSet) - This approach will have a time complexity of O(n), where n is the number of nodes in the linked list. 
// You are allowed to use the provided Set data structure in your implementation.

// Without using a Set - This approach will have a time complexity of O(n^2), where n is the number of nodes in the linked list. 
// You are not allowed to use any additional data structures for this implementation.



// Here is the method signature you need to implement:

// public void removeDuplicates() {
//     // Your implementation goes here
// }


// Example:

// Input:

// LinkedList: 1 -> 2 -> 3 -> 1 -> 4 -> 2 -> 5

// Output:

// LinkedList: 1 -> 2 -> 3 -> 4 -> 5


class Node {
  final int value;
  Node? next;

  Node({
    required this.value,
  });
}

class LinkedList {
  Node? head;
  Node? tail;
  int? length;

  LinkedList(int value) {
    Node newNode = Node(value: value);
    head = newNode;
    tail = newNode;
    length = 1;
  }
  void append(int value) {
    Node newNode = Node(value: value);

    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail?.next = newNode;
      tail = newNode;
    }

    length = (length ?? 0) + 1;
  }

  void printLinkedList() {
    Node? temp = head;

    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

// without using a Set
  void removeDuplicates() {

    Node? current = head;

    while (current != null) {
      // Initialize a pointer 'runner' for checking duplicates, starting from 'current'.
      Node? runner = current;

      while (runner?.next != null) {
        // Check if the value of the next node is equal to the value of 'current'.
        if (runner?.next?.value == current.value) {
          runner?.next = runner.next?.next;
          // Decrease the length (assuming it's a count of nodes) to reflect the removal.
          length = (length ?? 0) - 1;
        } else {
          // If no duplicate is found, move the 'runner' pointer to the next node.
          runner = runner?.next;
        }
      }
      // Move the 'current' pointer to the next node to check for duplicates in the next set of nodes.
      current = current.next;
    }
  }
}

void main() {
  LinkedList linkedList = LinkedList(1);
  linkedList.append(2);
  linkedList.append(3);
  linkedList.append(1);
  linkedList.append(4);
  linkedList.append(2);
  linkedList.printLinkedList();
  linkedList.removeDuplicates();
  print('-------------------');
  linkedList.printLinkedList();
}
