class Node {
  int? value;
  Node? next;
  Node({
    required this.value,
  });
}

class Stack {
  Node? top;
  int height = 0;

  Stack({required int value}) {
    Node? newNode = Node(value: value);

    top = newNode;
    height = 1;
  }

  void printStack() {
    Node? temp = top;

    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  void push({required int value}) {
    Node? newNode = Node(value: value);
    if (height == 0) {
      top = newNode;
    } else {
      newNode.next = top;
      top = newNode;
    }
    height += 1;
  }
}

void main() {
  Stack stack = Stack(value: 1);
  stack.push(value: 100);
  stack.push(value: 20);
  stack.printStack();
}
