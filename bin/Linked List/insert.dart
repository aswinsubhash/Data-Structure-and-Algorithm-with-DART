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

  Node? get(int index) {
    if (index < 0 || index >= (length ?? 0)) return null;

    Node? temp = head;
    for (int i = 0; i < index; i++) {
      temp = temp?.next;
    }
    return temp;
  }

/// Inserts a new node with the provided [value] at the specified [index] in the linked list.
/// Returns `true` if the insertion is successful, `false` if the index is out of bounds.
bool insert(int index, int value) {
  // Check if the provided index is out of bounds.
  if (index < 0 || index > (length ?? 0)) return false;

  if (index == 0) {
    prepend(value);
    return true;
  }
  if (index == length) {
    append(value);
    return true;
  }

  Node? newNode = Node(value: value);

  Node? temp = get(index - 1);

  newNode.next = temp?.next;
  temp?.next = newNode;

  length = (length ?? 0) + 1;

  return true;
}

bool insertAfterValue(int targetValue, int value) {
  Node? temp = head;

  while (temp != null && temp.value != targetValue) {
    temp = temp.next;
  }

  if (temp != null) {
    Node newNode = Node(value: value);
    newNode.next = temp.next;
    temp.next = newNode;

    // If the target value was the tail, update the tail.
    if (temp == tail) {
      tail = newNode;
    }

    length = (length ?? 0) + 1;
    return true;
  } else {
    print('Target value not found');
    return false; // Target value not found in the list.
  }
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
  print('Befor insert');
  linkedList.printLinkedList();
  print('After insert');
  linkedList.insertAfterValue(6, 111);
  linkedList.printLinkedList();
 
  
}
