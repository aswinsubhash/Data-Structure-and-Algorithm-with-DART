/// This class represents a node in a linked list.
/// Each node contains a value and a reference to the next node.
class Node {
  final int value;
  Node? next;

  Node({
    required this.value,
  });
}

/// This class represents a basic singly linked list.
/// It has a head, tail, and length, and provides methods to work with the list.
class LinkedList {
  Node? head;
  Node? tail;
  int? length;

  /// Constructs a new [LinkedList] with an initial value.
  LinkedList(int value) {
    Node newNode = Node(value: value);
    head = newNode;
    tail = newNode;
    length = 1;
  }

  /// Prints the values of the linked list.
  void printLinkedList() {
    Node? temp = head;

    while (temp != null) {
      print(temp.value);
      temp = temp.next; // Move to the next node in the list.
    }
  }

  void getHead() {
    print("Head: ${head?.value}");
  }

  void getTail() {
    print("Tail: ${tail?.value}");
  }

  void getLenght(){
    print("Length: $length");
  }
}

void main() {
  LinkedList linkedList = LinkedList(4);
  linkedList.getHead();
  linkedList.getTail();
  linkedList.getLenght();
  linkedList.printLinkedList();
}
