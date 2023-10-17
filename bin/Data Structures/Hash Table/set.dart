class Node {
  String? key;
  int value;
  Node? next;
  Node({
    required this.value,
    required this.key,
  });
}

class HashTable {
  int size = 7;
  List<Node?>? dataMap;

  HashTable() {
    dataMap = List<Node?>.filled(size, null);
  }

  void printTable() {
    for (int i = 0; i < dataMap!.length; i++) {
      print("$i:");
      if (dataMap?[i] != null) {
        Node? temp = dataMap?[i];
        while (temp != null) {
          print("   {${temp.key}, ${temp.value}}");
          temp = temp.next;
        }
      }
    }
  }

  int hash(String key) {
    int hash = 0;
    // Convert the key into a list of ASCII values.
    List<int> keyChars = key.codeUnits;

    // Iterate through the ASCII values of the characters in the key.
    for (int i = 0; i < keyChars.length; i++) {
      int asciiValue =
          keyChars[i]; // Get the ASCII value of the current character.

      // Update the hash using a simple formula: (hash + (ASCII value * 23)) modulo the hash table size.
      hash = (hash + asciiValue * 23) % dataMap!.length;
    }

    return hash;
  }

  void set(String key, int value) {
    int index = hash(key); // Calculate the index using the hash function.
    Node newNode = Node(key: key, value: value);

    // If there's no existing node at the calculated index:
    if (dataMap?[index] == null) {
      dataMap?[index] =
          newNode; // Set the new node as the first node at the index.
    } else {
      Node? temp = dataMap?[index]; // Get the first node at the index.

      if (temp!.key == key) {
        // If the first node has the same key as the provided key:
        temp.value += value; // Update the value of the existing node.
        return; // Exit the method since the update is done.
      }

      while (temp?.next != null) {
        // Iterate through the linked list to find the node with the same key.
        temp = temp?.next;

        if (temp?.key == key) {
          // If a node with the same key is found:
          temp?.value += value; // Update the value of the existing node.
          return; // Exit the method since the update is done.
        }
      }

      // If no existing node with the same key is found in the linked list:
      temp?.next = newNode; // Add the new node to the end of the linked list.
    }
  }
}

void main() {
  HashTable hashTable = HashTable();

  hashTable.set("nails", 100);
  hashTable.set("tile", 50);
  hashTable.set("lumber", 80);

  hashTable.set("bolts", 200);
  hashTable.set("screws", 140);

  hashTable.printTable();
}
