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

    while (current > 0 && heap[current] < heap[parent(current)]) {
      // Change the comparison here
      swap(current, parent(current));
      current = parent(current);
    }
  }

  void sinkDown(int index) {
    int minIndex = index;
    while (true) {
      int leftIndex = leftChild(index);
      int rightIndex = rightChild(index);

      if (leftIndex < heap.length && heap[leftIndex] < heap[minIndex]) {
        // Change the comparison here
        minIndex = leftIndex;
      }

      if (rightIndex < heap.length && heap[rightIndex] < heap[minIndex]) {
        // Change the comparison here
        minIndex = rightIndex;
      }

      if (minIndex != index) {
        swap(index, minIndex);
        index = minIndex;
      } else {
        return;
      }
    }
  }

  int? remove() {
    if (heap.isEmpty) {
      return null;
    }

    if (heap.length == 1) {
      return heap.removeAt(0);
    }

    int minValue = heap[0];
    heap[0] = heap.removeLast();
    sinkDown(0);

    return minValue;
  }
}

void main() {
  MinHeap heap = MinHeap();
  heap.insert(95);
  heap.insert(75);
  heap.insert(80);
  heap.insert(55);
  heap.insert(60);
  heap.insert(50);
  heap.insert(65);

  print(heap.getHeap());

  heap.remove();

  print(heap.getHeap());

  heap.remove();

  print(heap.getHeap());
}
