import 'dart:collection';

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

  List<int> bfs() {
    // Start at the root of the tree
    Node? currentNode = root;

    // Create a queue to store nodes to visit
    Queue<Node?> queue = Queue();

    // Create a list to store the results (node values in BFS order)
    List<int> results = [];

    // If the tree is not empty, add the root to the queue
    if (currentNode != null) {
      queue.add(currentNode);
    }

    // Process nodes in the queue
    while (queue.isNotEmpty) {
      // Remove the first node from the queue
      currentNode = queue.removeFirst();

      // Add the value of the current node to the results
      results.add(currentNode!.value);

      // If there's a left child, add it to the queue
      if (currentNode.left != null) {
        queue.add(currentNode.left);
      }

      // If there's a right child, add it to the queue
      if (currentNode.right != null) {
        queue.add(currentNode.right);
      }
    }

    // Return the results (BFS traversal of the tree)
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

  print(binarySearchTree.bfs());
}
