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

  Node? get(int index) {
    if (length < 0 || index >= length) return null;

    Node? temp = head;

    if (index < length / 2) {
      for (int i = 0; i < index; i++) {
        temp = temp?.next;
      }
    } else {
      temp = tail;
      for (int i = length - 1; i > index; i--) {
        temp = temp?.prev;
      }
    }
    return temp;
  }

  Node? removeFirst() {
    if (length == 0) return null;

    Node? temp = head;

    if (length == 1) {
      head = null;
      tail = null;
    } else {
      head = head?.next;
      head?.prev = null;
      temp?.next = null;
    }
    length -= 1;
    return temp;
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

  Node? remove(int index) {
    if (index < 0 || index >= length) return null;

    if (index == 0) return removeFirst();

    if (index == length - 1) removeLast();

    Node? temp = get(index);

    temp?.prev?.next = temp.next;
    temp?.next?.prev = temp.prev;
    temp?.prev = null;
    temp?.next = null;

    length -= 1;
    return temp;
  }
}

void main() {
  DoublyLinkedList doublyLinkedList = DoublyLinkedList(value: 1);
  doublyLinkedList.append(100);
  doublyLinkedList.append(50);
  doublyLinkedList.remove(1);
  doublyLinkedList.printLinkedList();
}
