class Graph {
  Map<String, List<String>> adjList = {};

  Map<String, List<String>> getAdjList() {
    return adjList;
  }

  void printGraph() {
    print(adjList);
  }

  bool addVertex(String vertex) {
    if (adjList[vertex] == null) {
      adjList[vertex] = [];
      return true;
    }
    return false;
  }
}

void main() {
  Graph graph = Graph();
  graph.addVertex('A');
  graph.addVertex('B');
  graph.printGraph();
}