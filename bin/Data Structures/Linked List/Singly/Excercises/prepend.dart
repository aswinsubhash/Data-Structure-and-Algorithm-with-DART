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

/// Prepends a new node with the given [value] to the beginning of the linked list. 
/// If the linked list is empty, set both head and tail to the new node.   
/// If the linked list is not empty, set the new node's 'next' to the current head,
/// and update the head to the new node. 
void prepend(int value) {

  Node newNode = Node(value: value);


  if (length == 0) {
    head = newNode;
    tail = newNode;
  } else {

    newNode.next = head;
    head = newNode;
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
  print('Before prepend');
  linkedList.printLinkedList();
  linkedList.prepend(10);
  print('After prepend');
  linkedList.printLinkedList();
}
