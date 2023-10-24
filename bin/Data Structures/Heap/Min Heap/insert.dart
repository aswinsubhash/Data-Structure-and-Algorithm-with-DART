class Heap {
  List<int> heap = [];

  List<int> getHeap() {
    return List<int>.from(heap);
  }

  int leftChild(int index) {
    return 2 * index + 1;
  }

  int rightChild(int index) {
    return 2 * index + 2;
  }

  int parent(int index) {
    return (index - 1) ~/ 2;
  }

  void swap(int index1, int index2) {
    int temp = heap[index1];
    heap[index1] = heap[index2];
    heap[index2] = temp;
  }

  void insert(int value) {
    // Add the new value to the end of the heap
    heap.add(value);

    // Set the current index to the last element
    int current = heap.length - 1;

    // While the current element is not the root and is greater than its parent
    while (current > 0 && heap[current] > heap[parent(current)]) {
      // Swap the current element with its parent
      swap(current, parent(current));

      // Update the current index to its parent's index
      current = parent(current);
    }
  }
}

void main() {
  Heap heap = Heap();
  heap.insert(99);
  heap.insert(72);
  heap.insert(61);
  heap.insert(58);

  print(heap.getHeap());

  heap.insert(100);
  print(heap.getHeap());

  heap.insert(75);
  print(heap.getHeap());
}
