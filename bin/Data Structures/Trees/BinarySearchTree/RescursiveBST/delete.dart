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

  int? minValue(Node? currentNode) {
    while (currentNode?.left != null) {
      currentNode = currentNode?.left;
    }
    return currentNode?.value;
  }

  Node? deleteNode(Node? currentNode, int value) {
    // Base case: If the current node is null, return null (no change).
    if (currentNode == null) return null;

    // If the value to be deleted is less than the current node's value, go to the left subtree.
    if (value < currentNode.value) {
      currentNode.left = deleteNode(currentNode.left, value);
    }
    // If the value to be deleted is greater than the current node's value, go to the right subtree.
    else if (value > currentNode.value) {
      currentNode.right = deleteNode(currentNode.right, value);
    }
    // If the value to be deleted matches the current node's value:
    else {
      // Case 1: If the current node has no children, simply remove it (return null).
      if (currentNode.left == null && currentNode.right == null) {
        return null;
      }
      // Case 2: If the current node has no left child, replace it with its right child.
      else if (currentNode.left == null) {
        currentNode = currentNode.right;
      }
      // Case 3: If the current node has no right child, replace it with its left child.
      else if (currentNode.right == null) {
        currentNode = currentNode.left;
      }
      // Case 4: If the current node has both left and right children, replace it with the minimum value
      // from the right subtree and then delete that minimum value from the right subtree.
      else {
        int subTreeMin = minValue(
            currentNode.right)!; // Find the minimum value in the right subtree.
        currentNode.value =
            subTreeMin; // Replace the current node's value with the minimum value.
        currentNode.right = deleteNode(currentNode.right,
            subTreeMin); // Delete the minimum value from the right subtree.
      }
    }
    return currentNode;
  }

  void delete(int value) {
    root = deleteNode(root, value);
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

  binarySearchTree.delete(2);

  print("\nRoot:${binarySearchTree.root?.value}");
  print('\nRoot - > left:${binarySearchTree.root?.left?.value}');
  print('\nRoot - > Right:${binarySearchTree.root?.right?.value}');
}
