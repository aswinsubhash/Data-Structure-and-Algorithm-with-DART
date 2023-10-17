class Stack<T> {
  final List<T> _stackList = [];

  bool isEmpty() {
    return _stackList.isEmpty;
  }

  void printStack() {
    for (int i = _stackList.length - 1; i >= 0; i--) {
      print(_stackList[i]);
    }
  }

  T? peek() {
    if (isEmpty()) {
      return null;
    } else {
      return _stackList.last;
    }
  }

  void push(T value) {
    _stackList.add(value);
  }

  T? pop() {
    if (isEmpty()) {
      return null;
    } else {
      return _stackList.removeLast();
    }
  }
}

class QueueWithStacks<T> {
  Stack<T?> stack1 = Stack<T>();
  Stack<T?> stack2 = Stack<T>();

  void printQueue() {
    stack1.printStack();
  }

  bool isEmpty() {
    return stack1.isEmpty();
  }

  void enqueue(T value) {
    // Transfer elements from stack1 to stack2
    while (!stack1.isEmpty()) {
      stack2.push(stack1.pop());
    }
    // Push the new value onto stack1
    stack1.push(value);
    // Transfer elements back from stack2 to stack1
    while (!stack2.isEmpty()) {
      stack1.push(stack2.pop());
    }
  }

  T? dequeue() {
    if (isEmpty()) {
      return null;
    } else {
      // Remove and return the front of the queue
      return stack1.pop();
    }
  }
}

void main() {
  QueueWithStacks<int> queue = QueueWithStacks<int>();

  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  queue.dequeue();
  queue.printQueue();
}
