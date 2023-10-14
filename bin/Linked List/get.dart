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

/// Retrieves and returns the node at the specified [index] in the linked list.
/// Returns `null` if the index is out of bounds.
Node? get(int index) {
  // Check if the provided index is out of bounds or if the list is empty.
  if (index < 0 || index >= (length ?? 0)) return null;

  Node? temp = head;
  for (int i = 0; i < index; i++) {
    temp = temp?.next;
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
  linkedList.append(4);
  linkedList.append(5);
  linkedList.printLinkedList();
  print('When get applied: ${linkedList.get(1)?.value}');
}
