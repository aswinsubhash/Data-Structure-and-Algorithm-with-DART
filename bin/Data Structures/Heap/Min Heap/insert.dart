class MinHeap {
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
    heap.add(value);
    int current = heap.length - 1;

    while (current > 0 && heap[current] < heap[parent(current)]) { // Change the comparison here
      swap(current, parent(current));
      current = parent(current);
    }
  }
}

void main() {
  MinHeap heap = MinHeap();
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
