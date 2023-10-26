import 'dart:collection';

import '../../../Queue/Leetcode/dequeue_with_stack.dart';

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
    Node? currentNode = root;

    Queue<Node?> queue = Queue();

    List<int> results = [];

    if (currentNode != null) {
      queue.add(currentNode);
    }

    while (queue.isNotEmpty) {
      currentNode = queue.removeFirst();

      results.add(currentNode!.value);

      if (currentNode.left != null) {
        queue.add(currentNode.left);
      }

      if (currentNode.right != null) {
        queue.add(currentNode.right);
      }
    }

    return results;
  }

  int? kthSmallest(int k) {
    Stack<Node> stack = Stack(); // Initialize a stack for iterative traversal.
    Node? node = root; // Start with the root node.

    while (!stack.isEmpty() || node != null) {
      // Traverse the left subtree and push nodes onto the stack.
      while (node != null) {
        stack.push(node);
        node = node.left;
      }
      // Pop the top node from the stack.
      node = stack.pop();
      k -= 1; // Decrement k.
      if (k == 0) {
        return node?.value; // If k is 0, we found the kth smallest element.
      }
      node = node?.right; // Move to the right subtree.
    }
    return null; // If k is not found, return null (k out of range).
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

  print(binarySearchTree.kthSmallest(4));
}
