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

  /// Reverses the order of nodes in the linked list.
  void reverse() {
    Node? temp = head;
    Node? before;
    Node? after =
        temp?.next; // Initialize a pointer to the next node after 'temp'.

    head = tail;
    tail = temp;

    for (int i = 0; i < (length ?? 0); i++) {
      after = temp?.next;
      temp?.next =
          before; // Reverse the 'next' pointer to point to the previous node.

      // Move 'before' and 'temp' pointers forward.
      before = temp;
      temp = after;
    }
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
  print('Before reverse');
  linkedList.printLinkedList();
  print('After reverse \n-------------');
  linkedList.reverse();
  linkedList.printLinkedList();
}
