/// [Find Kth Node From End] ( ** Interview Question)

// Implement a method called findKthFromEnd that returns the k-th node from the end of the list.
// If the list has fewer than k nodes, the method should return null.

// Note: This implementation of the Linked List class does not have the length attribute.

// Method signature:

// public Node findKthFromEnd(int k)

// Example:

// LinkedList myList = new LinkedList(1);
// myList.append(2);
// myList.append(3);
// myList.append(4);
// myList.append(5);

// Node result = myList.findKthFromEnd(2); // Output: Node with value 4

// result = myList.findKthFromEnd(5); // Output: Node with value 1

// result = myList.findKthFromEnd(6); // Output: null

// Note:

// In this problem, you should use the two-pointer technique to efficiently find the k-th node from the end of the linked list.

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

  Node? findKthFromEnd(int k) {
    Node? slow = head;
    Node? fast = head;

    for (int i = 0; i < k; i++) {
      if (fast == null) return null;

      fast = fast.next;
    }
    while (fast != null) {
      slow = slow?.next;
      fast = fast.next;
    }
    return slow;
  }

  void printLinkedList() {
    Node? temp = head;

    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}

void main() {
  LinkedList linkedList = LinkedList(1);
  linkedList.append(2);
  linkedList.append(3);
  linkedList.append(4);
  linkedList.append(5);
  linkedList.append(6);
  linkedList.printLinkedList();
  print('Kth Element from the last is: ${linkedList.findKthFromEnd(2)?.value}');
}
