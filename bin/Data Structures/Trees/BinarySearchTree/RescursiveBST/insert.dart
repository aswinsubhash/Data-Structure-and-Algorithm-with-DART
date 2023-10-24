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

  Node rInsert(Node? currentNode, int value) {
    if (currentNode == null) return Node(value: value);

    if (value < currentNode.value) {
      currentNode.left = rInsert(currentNode.left, value);
    } else if (value > currentNode.value) {
      currentNode.right = rInsert(currentNode.right, value);
    }
    return currentNode;
  }

  void insert(int value) {
    root ??= Node(value: value);
    rInsert(root, value);
  }
}

void main() {
  BinarySearchTree binarySearchTree = BinarySearchTree();

  binarySearchTree.insert(2);
  binarySearchTree.insert(1);
  binarySearchTree.insert(3);

  print("\nRoot:${binarySearchTree.root?.value}");
  print('\nRoot - > left:${binarySearchTree.root?.left?.value}');
  print('\nRoot - > Right:${binarySearchTree.root?.right?.value}');
}
