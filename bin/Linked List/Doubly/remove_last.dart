class Node {
  int value;
  Node? next;
  Node? prev;

  Node({
    required this.value,
  });
}

class DoublyLinkedList {
  Node? head;
  Node? tail;
  int length = 0;

  DoublyLinkedList({required int value}) {
    Node? newNode = Node(value: value);
    head = newNode;
    tail = newNode;
    length = 1;
  }

  void printLinkedList() {
    Node? temp = head;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  void append(int value) {
    Node? newNode = Node(value: value);

    if (length == 0) {
      head = newNode;
      tail = newNode;
    } else {
      tail?.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
    length += 1;
  }

  Node? removeLast() {
    if (length == 0) return null;
    Node? temp = tail;

    if (length == 1) {
      head = null;
      tail = null;
    } else {
      tail = tail?.prev;
      tail?.next = null;
      temp?.prev = null;
    }
    length -= 1;
    return temp;
  }
}

void main() {
  DoublyLinkedList doublyLinkedList = DoublyLinkedList(value: 1);
  doublyLinkedList.append(100);
  doublyLinkedList.append(100);
  doublyLinkedList.removeLast();
  doublyLinkedList.printLinkedList();
}
