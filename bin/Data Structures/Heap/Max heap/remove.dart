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
    heap.add(value);
    int current = heap.length - 1;

    while (current > 0 && heap[current] > heap[parent(current)]) {
      swap(current, parent(current));
      current = parent(current);
    }
  }

  /// Sinks the element at the given [index] down the max-heap to its proper position.
  /// It compares the element with its left and right children, swapping if necessary
  /// to maintain the max-heap property.
  ///
  /// [index]: The index of the element to be sunk down.
  void sinkDown(int index) {
    int maxIndex = index;
    while (true) {
      int leftIndex = leftChild(index);
      int rightIndex = rightChild(index);

      if (leftIndex < heap.length && heap[leftIndex] > heap[maxIndex]) {
        maxIndex = leftIndex;
      }

      if (rightIndex < heap.length && heap[rightIndex] > heap[maxIndex]) {
        maxIndex = rightIndex;
      }

      if (maxIndex != index) {
        swap(index, maxIndex);
        index = maxIndex;
      } else {
        return;
      }
    }
  }

  /// Removes and returns the maximum value from the max-heap. After removal, it ensures
  /// that the max-heap property is maintained by sinking the new root element down.
  ///
  /// Returns the maximum value from the max-heap, or null if the heap is empty.
  int? remove() {
    if (heap.isEmpty) {
      return null;
    }

    if (heap.length == 1) {
      return heap.removeAt(0);
    }

    int maxValue = heap[0];
    heap[0] = heap.removeLast();
    sinkDown(0);

    return maxValue;
  }
}

void main() {
  Heap heap = Heap();
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
