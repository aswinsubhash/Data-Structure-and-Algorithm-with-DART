// Find Middle Node ( ** Interview Question)
// Implement a method called findMiddleNode that returns the middle node of the linked list.
// If the list has an even number of nodes, the method should return the second middle node.

// Method signature:

// public Node findMiddleNode()




// Example:

// LinkedList myList = new LinkedList(1);
// myList.append(2);
// myList.append(3);
// myList.append(4);
// myList.append(5);
// Node middleNode = myList.findMiddleNode();
// System.out.println(middleNode.value); // Output: 3
 
// myList.append(6);
// middleNode = myList.findMiddleNode();
// System.out.println(middleNode.value); // Output: 4


// When the linked list has an odd number of nodes, like 1 -> 2 -> 3 -> 4 -> 5, the function will find the exact middle node. In this case, it will return the node containing the value 3.

// When the linked list has an even number of nodes, there will be two middle nodes. The findMiddleNode function will return the second of these two middle nodes.

// For example, if the linked list is 1 -> 2 -> 3 -> 4 -> 5 -> 6, the two middle nodes are 3 and 4. The function will return the node containing the value 4.



// Note:
// In this problem, you should use the slow and fast pointer technique (also known as Floyd's Tortoise and Hare algorithm) to find the middle element of the linked list efficiently.
// The key idea is to have two pointers, one that moves twice as fast as the other. By the time the fast pointer reaches the end of the linked list, the slow pointer will be at the middle.

// DO NOT use the length attribute in your solution.


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

  Node? findMiddleNode() {
    Node? slow = head;
    Node? fast = head;

    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
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
  print('Middle node is: ${linkedList.findMiddleNode()?.value}');
}
