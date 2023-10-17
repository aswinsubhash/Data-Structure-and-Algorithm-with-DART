class Stack<T> {
  final List<T> _stackList = [];

  List<T> get stackList => _stackList;

  bool isEmpty() {
    return _stackList.isEmpty;
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

bool isBalancedParentheses(String parentheses) {
  Stack<String> stack = Stack<String>();
  for (int i = 0; i < parentheses.length; i++) {
    if (parentheses[i] == '(') {
      stack.push('(');
    }

    /// If the current character is a closing parenthesis, check if the stack is empty or
    /// if the top element of the stack is not an opening parenthesis. If either of these
    /// conditions is true, return false, because the parentheses are not balanced.
    else if (parentheses[i] == ')') {
      if (stack.isEmpty() || stack.pop() != '(') {
        return false;
      }
    }
  }

  /// After iterating through all the characters in the input string, check if the stack is
  /// empty. If the stack is empty, return true, because all the opening parentheses have been
  /// matched with closing parentheses. Otherwise, return false, because there are still some
  /// opening parentheses left on the stack that have not been matched with closing parentheses.
  return stack.isEmpty();
}

void main() {
  String testString1 = "((()))";
  String testString2 = "(()()())";
  String testString3 = "()()())";

  print("Is '$testString1' balanced: ${isBalancedParentheses(testString1)}");
  print("Is '$testString2' balanced: ${isBalancedParentheses(testString2)}");
  print("Is '$testString3' balanced: ${isBalancedParentheses(testString3)}");
}
