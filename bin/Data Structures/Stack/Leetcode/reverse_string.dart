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

  bool isEmpty() {
    return _stackList.isEmpty;
  }

  T? pop() {
    if (_stackList.isEmpty) return null;
    return stackList.removeLast();
  }

  String? reversedString(String string) {
    Stack<String> stack = Stack<String>();
    String reversedString = '';

    for (int i = 0; i < string.length; i++) {
      stack.push(string[i]);
    }

    while (!stack.isEmpty()) {
      reversedString += stack.pop()!;
    }

    return reversedString;
  }

}

  void main() {
  String inputString = "ASWIN";
  String reversed = Stack().reversedString(inputString)!;
  print("Original String: $inputString");
  print("Reversed String: $reversed");
}
