/// LL: [Binary to Decimal] ( ** Interview Question)
// Objective:

// You have a linked list where each node represents a binary digit (0 or 1).
//The goal of the binaryToDecimal function is to convert this binary number, represented by the linked list, into its decimal equivalent.



// Function Signature:

// public int binaryToDecimal()



// How Binary to Decimal Conversion Works:

// In binary-to-decimal conversion, each position of a binary number corresponds to a specific power of 2, starting from the rightmost digit.

// The rightmost digit is multiplied by 2^0 (which equals 1).

// The next digit to the left is multiplied by 2^1 (which equals 2).

// The digit after that is multiplied by 2^2 (which equals 4). ... and so on.

// To find the decimal representation:

// Multiply each binary digit by its corresponding power of 2 value.

// Sum up all these products.



// Example Execution with Binary 101:

// Start with num = 0.

// Process 1 (from the head of the linked list): num = 0 * 2 + 1 = 1

// Process 0: num = 1 * 2 + 0 = 2

// Process 1: num = 2 * 2 + 1 = 5

// Return num, which is 5.



// Steps Involved in the Function:

// A variable num is initialized to 0, which will store our computed decimal number.

// Starting from the head of the linked list (the leftmost binary digit), iterate through each node until the end.

// For every node, double the current value of num (this is analogous to shifting in binary representation). Then, add the binary digit of the current node.

// Move to the next node and repeat until you've visited all nodes.

// Return the value in num, which now represents the decimal value of the binary number in the linked list.


class Node {
  final int value;
  Node? next;

  Node({
    required this.value,
  });
}

class LinkedList {
  Node? head;
  Node? tail;
  int? length;

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

    length = (length ?? 0) + 1;
  }

  void printLinkedList() {
    Node? temp = head;

    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  int binaryToDecimal(){
    int numbr = 0;
    Node? current = head;

    while(current != null){
      numbr = numbr * 2 + current.value;
      current = current.next;
    }
    return numbr;
  }
}

void main() {
  LinkedList linkedList = LinkedList(1);
  linkedList.append(0);
  linkedList.append(1);
  linkedList.printLinkedList();
  print('--------------');
  print(linkedList.binaryToDecimal());
}
