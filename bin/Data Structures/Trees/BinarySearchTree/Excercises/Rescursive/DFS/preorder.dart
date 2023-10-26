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

  List<int> dfsPreOrder() {
    final List<int> results = [];

    // Define a recursive function called traverse.
    void traverse(Node? currentNode) {
      if (currentNode != null) {
        // If the current node is not null, add its value to the results list.
        results.add(currentNode.value);

        // Recursively call traverse on the left subtree (if it exists).
        traverse(currentNode.left);

        // Recursively call traverse on the right subtree (if it exists).
        traverse(currentNode.right);
      }
    }

    // Start the traversal from the root of the binary search tree.
    traverse(root);

    // Return the results list containing the pre-order traversal of the tree.
    return results;
  }
}

void main() {
  BinarySearchTree binarySearchTree = BinarySearchTree();

  binarySearchTree.insert(47);
  binarySearchTree.insert(21);
  binarySearchTree.insert(76);
  binarySearchTree.insert(18);
  binarySearchTree.insert(27);
  binarySearchTree.insert(52);
  binarySearchTree.insert(82);

  print(binarySearchTree.dfsPreOrder());
}
