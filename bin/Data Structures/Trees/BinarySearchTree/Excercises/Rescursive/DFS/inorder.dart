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

  List<int> dfsInOrder() {
    // Initialize an empty list to store the results.
    final List<int> results = [];

    // Define a nested function called 'traverse' that takes a 'Node' as a parameter.
    void traverse(Node? currentNode) {
      if (currentNode != null) {
        // Recursively traverse the left subtree (if it exists).
        traverse(currentNode.left);
        // Add the current node's value to the results list.
        results.add(currentNode.value);
        // Recursively traverse the right subtree (if it exists).
        traverse(currentNode.right);
      }
    }

    // Start the traversal from the 'root' node of the binary tree.
    traverse(root);
    // Return the list containing the in-order traversal results.
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

  print(binarySearchTree.dfsInOrder());
}
