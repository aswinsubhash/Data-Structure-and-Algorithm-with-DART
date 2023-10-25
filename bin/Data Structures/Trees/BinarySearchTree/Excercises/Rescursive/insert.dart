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
    // Base case: If the current node is null, create a new node with the given value.
    if (currentNode == null) return Node(value: value);

    // If the value to be inserted is less than the current node's value, go to the left subtree.
    if (value < currentNode.value) {
      currentNode.left = rInsert(currentNode.left, value);
    }
    // If the value to be inserted is greater than the current node's value, go to the right subtree.
    else if (value > currentNode.value) {
      currentNode.right = rInsert(currentNode.right, value);
    }

    // Return the current node, which may have been updated with new child nodes.
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
