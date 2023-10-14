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

  /// Appends a new node with the given [value] to the end of the linked list.
  /// If the linked list is empty, set both head and tail to the new node.
  /// If the linked list is not empty, update the current tail's 'next' to the new node,
  /// and set the new node as the new tail.
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
}

void main() {
  LinkedList linkedList = LinkedList(1);
  linkedList.append(4);
  linkedList.append(5);
  linkedList.append(6);
  linkedList.append(7);
  linkedList.append(8);
  linkedList.printLinkedList();
}
