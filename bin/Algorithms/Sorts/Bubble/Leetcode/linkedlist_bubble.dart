class Node {
  int? value;
  Node? next;

  Node({
    required this.value,
  });
}

class LinkedList {
  Node? head;
  Node? tail;
  int length = 0;

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

    length += 1;
  }

  void printLinkedList() {
    Node? temp = head;

    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  void bubbleSort() {
    if (length < 2) {
      // If there are 1 or fewer elements, no sorting is needed.
      return;
    }

    Node? sortedUntil;

    // Iterate until the last sorted element, which initially is null.
    while (sortedUntil != head!.next) {
      Node? current = head;

      // Iterate through the unsorted part of the list.
      while (current!.next != sortedUntil) {
        Node? nextNode = current.next;

        // Compare the current and next node values and swap if necessary.
        if (current.value! > nextNode!.value!) {
          int? temp = current.value;
          current.value = nextNode.value;
          nextNode.value = temp;
        }
        current = current.next; // Move to the next node.
      }
      sortedUntil = current; // Mark the last sorted element.
    }
  }
}

void main() {
  LinkedList linkedList = LinkedList(4);
  linkedList.append(2);
  linkedList.append(6);
  linkedList.append(5);
  linkedList.append(1);
  linkedList.append(3);
  print('before');
  linkedList.printLinkedList();
  linkedList.bubbleSort();
  print('after');
  linkedList.printLinkedList();
}
