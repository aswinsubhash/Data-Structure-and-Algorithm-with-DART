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

  void selectionSort() {
    if (length < 2) {
      // If there are 1 or fewer elements, no sorting is needed.
      return;
    }

    Node current = head!; // Start with the head of the list.

    while (current.next != null) {
      Node? smallest = current; // Assume the current node is the smallest.
      Node? innerCurrent = current.next!; // Start from the next node.

      // Iterate through the remaining nodes to find the smallest.
      while (innerCurrent != null) {
        if (innerCurrent.value! < smallest!.value!) {
          smallest = innerCurrent; // Update if a smaller value is found.
        }
        innerCurrent = innerCurrent.next; // Move to the next node.
      }

      if (smallest != current) {
        int? temp = current.value;
        current.value = smallest?.value; // Swap the values.
        smallest?.value = temp;
      }

      current = current.next!; // Move to the next unsorted element.
    }

    tail = current; // Update the tail to the last sorted element.
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
  linkedList.selectionSort();
  print('after');
  linkedList.printLinkedList();
}
