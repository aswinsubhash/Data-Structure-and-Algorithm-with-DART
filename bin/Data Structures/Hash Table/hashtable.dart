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
}

void main() {
  HashTable hashTable = HashTable();

  hashTable.printTable();
}

