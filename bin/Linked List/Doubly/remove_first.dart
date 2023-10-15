class Node {
  int value;
  Node? next;
  Node? prev;

  Node({
    required this.value,
  });
}

class DoublyLinkedList {
  Node? head;
  Node? tail;
  int length = 0;

  DoublyLinkedList({required int value}) {
    Node? newNode = Node(value: value);
    head = newNode;
    tail = newNode;
    length = 1;
  }

  void printLinkedList() {
    Node? temp = head;
    while (temp != null) {
      print(temp.value);
      temp = temp.next;
    }
  }

  void append(int value) {
    Node? newNode = Node(value: value);

    if (length == 0) {
      head = newNode;
      tail = newNode;
    } else {
      tail?.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
    length += 1;
  }

  Node? removeFirst(){
    if(length == 0) return null;

    Node? temp = head;

    if(length == 1){
      head = null;
      tail = null;
    }else{
      head = head?.next;
      head?.prev = null;
      temp?.next = null;
    }
    length -= 1;
    return temp;
  }
}

void main() {
  DoublyLinkedList doublyLinkedList = DoublyLinkedList(value: 1);
  doublyLinkedList.append(100);
  doublyLinkedList.removeFirst();
  doublyLinkedList.printLinkedList();
}
