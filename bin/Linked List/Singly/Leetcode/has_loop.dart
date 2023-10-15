/// [Has Loop] ( ** Interview Question)
// Implement a method called hasLoop that checks whether the list contains a loop or not.
// If the list contains a loop, the method should return true; otherwise, it should return false.

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

  bool hasLoop() {
    Node? slow = head;
    Node? fast = head;

    while (fast != null && fast.next != null) {
      slow = slow?.next;
      fast = fast.next?.next;
      if (slow == fast) {
        return true;
      }
    }
    return false;
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
  print('Has Loop: ${linkedList.hasLoop()}');
}
