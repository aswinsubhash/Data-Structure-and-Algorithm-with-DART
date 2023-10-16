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

  void prepend(int value) {
    Node? newNode = Node(value: value);

    if (length == 0) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head?.prev = newNode;
      head = newNode;
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

  bool insert(int index, int value) {
    if (index < 0 || index > length) return false;

    if (index == 0) {
      prepend(value);
      return true;
    }

    if (index == length) {
      append(value);
      return true;
    }
    Node newNode = Node(value: value);

    Node? before = get(index - 1);
    Node? after = before?.next;

    newNode.prev = before;
    newNode.next = after;

    before?.next = newNode;
    after?.prev = newNode;

    length += 1;
    return true;
  }
}

void main() {
  DoublyLinkedList doublyLinkedList = DoublyLinkedList(value: 1);
  doublyLinkedList.append(100);
  doublyLinkedList.append(6);
  doublyLinkedList.printLinkedList();
  doublyLinkedList.insert(2, 777);
  print('-----------------------');
  doublyLinkedList.printLinkedList();
}
