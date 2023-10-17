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

    if (length == 0) {
      head = newNode;
      tail = newNode;
    } else {
      tail?.next = newNode;
      tail = newNode;
    }

    length = (length ?? 0) + 1;
  }

/// Removes and returns the last node from the linked list.
/// Returns `null` if the list is empty.
Node? removeLast() {
  
  if (length == 0) return null;

  Node? temp = head;
  Node? prev = head;

  while (temp?.next != null) {
    prev = temp;
    temp = temp?.next;
  }

  tail = prev;
  tail?.next = null;

  length = (length ?? 0) - 1;

  if (length == 0) {
    head = null;
    tail = null;
  }

  return temp;
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
  print('Before remove');
  linkedList.printLinkedList();
  linkedList.removeLast();
  print('After Remove');
  linkedList.printLinkedList();
}
