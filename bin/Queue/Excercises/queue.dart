class Node {
  int value;
  Node? next;
  Node({
    required this.value,
  });
}

class Queue {
  Node? first;
  Node? last;
  int length = 0;

  Queue(int value) {
    Node? newNode = Node(value: value);

    first = newNode;
    last = newNode;
    length = 1;
  }

  void printQueue() {
    Node? temp = first;

    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }
}

void main() {
  Queue queue = Queue(10);
  queue.printQueue();
}
