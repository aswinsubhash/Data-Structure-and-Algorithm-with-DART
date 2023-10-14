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

/// Removes and returns the first node from the linked list.
/// Returns `null` if the list is empty.
Node? removeFirst() {

  if (length == 0) return null;

  Node? temp = head;
  head = head?.next;
  temp?.next = null;
  length = (length ?? 0) - 1;

  if (length == 0) {
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
  linkedList.append(4);
  linkedList.append(5);
  print('Before Remove First');
  linkedList.printLinkedList();
  linkedList.removeFirst();
  print('After Remove First');
  linkedList.printLinkedList();
}
