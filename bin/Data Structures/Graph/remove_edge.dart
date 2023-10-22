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

  bool addEdge(String vertex1, String vertex2) {
    if (adjList[vertex1] != null && adjList[vertex2] != null) {
      adjList[vertex1]!.add(vertex2);
      adjList[vertex2]!.add(vertex1);
      return true;
    }
    return false;
  }

  bool removeEdge(String vertex1, String vertex2) {
    // Check if both vertex1 and vertex2 exist in the graph
    if (adjList[vertex1] != null && adjList[vertex2] != null) {
      // Remove vertex2 from the adjacency list of vertex1
      adjList[vertex1]!.remove(vertex2);
      // Remove vertex1 from the adjacency list of vertex2
      adjList[vertex2]!.remove(vertex1);
      // Return true to indicate that the edge was removed successfully
      return true;
    }
    // If either vertex1 or vertex2 doesn't exist, return false
    return false;
  }
}

void main() {
  Graph graph = Graph();
  graph.addVertex('A');
  graph.addVertex('B');
  graph.addVertex('C');

  graph.addEdge('A', 'B');
  graph.addEdge('A', 'C');
  graph.addEdge('B', 'C');

  graph.removeEdge('A', 'B');

  graph.printGraph();
}
