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

    List<int> keyChars = key.codeUnits;

    for (int i = 0; i < keyChars.length; i++) {
      int asciiValue = keyChars[i];

      hash = (hash + asciiValue * 23) % dataMap!.length;
    }

    return hash;
  }

  void set(String key, int value) {
    int index = hash(key);
    Node newNode = Node(key: key, value: value);

    if (dataMap?[index] == null) {
      dataMap?[index] = newNode;
    } else {
      Node? temp = dataMap?[index];

      if (temp!.key == key) {
        temp.value += value;
        return;
      }

      while (temp?.next != null) {
        temp = temp?.next;

        if (temp?.key == key) {
          temp?.value += value;
          return;
        }
      }

      temp?.next = newNode;
    }
  }

  int get(String key) {
    int index = hash(key);
    Node? temp = dataMap?[index];

    while (temp != null) {
      if (temp.key == key) {
        return temp.value;
      }
      temp = temp.next;
    }
    return 0;
  }

  List<String?> keys() {
    List<String?> allKeys = [];

    for (int i = 0; i < dataMap!.length; i++) {
      Node? temp = dataMap?[i];

      while (temp != null) {
        allKeys.add(temp.key); // Add the key to the list of keys.
        temp = temp.next;
      }
    }

    return allKeys;
  }
}

void main() {
  HashTable hashTable = HashTable();

  hashTable.set("nails", 100);
  hashTable.set("tile", 50);
  hashTable.set("lumber", 80);

  print(hashTable.get('lumber'));
  print(hashTable.get('botls'));
}
