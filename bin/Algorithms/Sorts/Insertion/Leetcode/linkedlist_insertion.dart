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

  void insertionSort() {
    if (length < 2) {
      // If there are 1 or fewer elements, the list is already sorted.
      return;
    }

    // Initialize the sorted and unsorted lists.
    Node? sortedListHead = head!;
    Node? unsortedListHead = head?.next;
    sortedListHead.next = null;

    // Iterate through the unsorted part of the list.
    while (unsortedListHead != null) {
      Node? current = unsortedListHead;
      unsortedListHead = unsortedListHead.next;

      // If the current node's value is less than the sorted list's head, insert at the beginning.
      if (current.value! < sortedListHead!.value!) {
        current.next = sortedListHead;
        sortedListHead = current;
      } else {
        // Search for the appropriate position to insert in the sorted list.
        Node? searchPointer = sortedListHead;
        while (searchPointer!.next != null &&
            current.value! > searchPointer.next!.value!) {
          searchPointer = searchPointer.next;
        }
        current.next = searchPointer.next;
        searchPointer.next = current;
      }
    }

    // Update the head and tail pointers.
    head = sortedListHead;
    Node? temp = head;
    while (temp!.next != null) {
      temp = temp.next;
    }
    tail = temp;
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
  linkedList.insertionSort();
  print('after');
  linkedList.printLinkedList();
}
