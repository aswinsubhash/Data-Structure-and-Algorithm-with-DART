class Node {
  int value;
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

  Node? get(int index) {
    if (index < 0 || index >= (length ?? 0)) return null;

    Node? temp = head;
    for (int i = 0; i < index; i++) {
      temp = temp?.next;
    }
    return temp;
  }

  /// Sets the value of the node at the specified [index] to the provided [value].
  /// Returns `true` if the index is valid and the value is set; otherwise, returns `false`.
  bool set(int index, int value) {
    Node? temp = get(index);

    if (temp != null) {
      temp.value = value;
      return true;
    }

    return false;
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
  print('Before set');
  linkedList.printLinkedList();
  print('After set: ${linkedList.set(2, 10)}');
}
