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

  Node? get(int index) {
    if (index < 0 || index >= (length ?? 0)) return null;

    Node? temp = head;
    for (int i = 0; i < index; i++) {
      temp = temp?.next;
    }
    return temp;
  }

  Node? remove(int index) {
    if (index < 0 || index >= (length ?? 0)) return null;
    if (index == 0) return removeFirst();
    if (index == (length ?? 0) - 1) return removeLast();

    Node? prev = get(index - 1);
    Node? temp = prev?.next;

    prev?.next = temp?.next;
    temp?.next = null;
    length = (length ?? 0) - 1;

    return temp;
  }

  void searchAndRemove(int value) {
    Node? temp = head;
    Node? prev;

    while (temp != null && temp.value != value) {
      prev = temp;
      temp = temp.next;
    }
    prev?.next = temp?.next;
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
  linkedList.append(2);
  print('Before Remove First');
  linkedList.printLinkedList();
  //linkedList.remove(1);
  linkedList.searchAndRemove(1);
  print('After Remove');
  linkedList.printLinkedList();
}
