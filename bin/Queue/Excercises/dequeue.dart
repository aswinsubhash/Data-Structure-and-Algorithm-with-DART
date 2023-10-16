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

  void enqueue(int value) {
    Node newNode = Node(value: value);

    if (length == 0) {
      first = newNode;
      last = newNode;
    } else {
      last?.next = newNode;
      last = newNode;
    }
    length++;
  }

  Node? dequeue() {
    if (length == 0) return null;

    Node? temp = first;

    if (length == 1) {
      first = null;
      last = null;
    } else {
      first = first?.next;
      temp?.next = null;
    }
    length -= 1;
    return temp;
  }
}

void main() {
  Queue queue = Queue(10);
  queue.enqueue(111);
  queue.enqueue(110);
  queue.dequeue();
  queue.printQueue();
}
