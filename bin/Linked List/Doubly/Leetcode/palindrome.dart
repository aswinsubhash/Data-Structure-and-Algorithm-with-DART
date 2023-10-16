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

  bool isPalindrome() {
    if (length <= 1) return true;

    Node? forward = head;
    Node? backward = tail;

    for (int i = 0; i < length / 2; i++) {
      if (forward?.value != backward?.value) return false;

      forward = forward?.next;
      backward = backward?.prev;
    }
    return true;
  }
}

void main() {
  DoublyLinkedList doublyLinkedList = DoublyLinkedList(value: 1);
  doublyLinkedList.append(2);
  doublyLinkedList.append(3);
  doublyLinkedList.append(2);
  doublyLinkedList.append(1);
  doublyLinkedList.printLinkedList();
  print('Is palindrom : ${doublyLinkedList.isPalindrome()}');
}
