class Node {
  int value;
  Node? left;
  Node? right;
  Node({
    required this.value,
  });
}

class BinarySearchTree {
  Node? root;

  bool insert(int value) {
    Node? newNode = Node(value: value);

    if (root == null) {
      root = newNode;
      return true;
    }
    Node? temp = root;

    while (true) {
      if (newNode.value == temp!.value) return false;
      if (newNode.value < temp.value) {
        if (temp.left == null) {
          temp.left = newNode;
          return true;
        }
        temp = temp.left;
      } else {
        if (temp.right == null) {
          temp.right = newNode;
          return true;
        }
        temp = temp.right;
      }
    }
  }

  bool contains(int value) {
    Node? temp = root;
    while (temp != null) {
      if (value < temp.value) {
        temp = temp.left;
      } else if (value > temp.value) {
        temp = temp.right;
      } else {
        return true;
      }
    }
    return false;
  }
}

void main() {
  BinarySearchTree binarySearchTree = BinarySearchTree();

  binarySearchTree.insert(47);
  binarySearchTree.insert(21);
  binarySearchTree.insert(76);
  binarySearchTree.insert(18);
  binarySearchTree.insert(52);
  binarySearchTree.insert(82);
  binarySearchTree.insert(27);

  print('Contains: ${binarySearchTree.contains(21)}');
}
