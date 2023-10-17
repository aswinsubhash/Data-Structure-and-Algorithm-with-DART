class Stack<T> {
  final List<T> _stackList = [];

  List<T> get stackList => _stackList;

  void printStack() {
    for (int i = _stackList.length - 1; i >= 0; i--) {
      print(_stackList[i]);
    }
  }

  void push(T value) {
    _stackList.add(value);
  }

  T? pop() {
    if (_stackList.isEmpty) return null;
    return stackList.removeAt(stackList.length - 1);
  }
}

void main() {
  Stack stack = Stack();
  stack.push(100);
  stack.push(101);
  stack.push(111);
  stack.printStack();
  stack.pop();
  print('----------------');
  stack.printStack();
}
