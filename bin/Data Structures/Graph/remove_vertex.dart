class Graph {
  Map<String, List<String>> adjList = {};

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
    if (adjList[vertex1] != null && adjList[vertex2] != null) {
      adjList[vertex1]!.remove(vertex2);
      adjList[vertex2]!.remove(vertex1);
      return true;
    }
    return false;
  }

  bool removeVertex(String vertex) {
    if (adjList[vertex] == null) {
      return false;
    }
    // Iterate through the adjacency list of the vertex
    for (String otherVertex in adjList[vertex]!) {
      // Remove the 'vertex' from the adjacency list of 'otherVertex'
      adjList[otherVertex]!.remove(vertex);
    }

    // Remove 'vertex' from the graph
    adjList.remove(vertex);
    return true;
  }
}

void main() {
  Graph graph = Graph();
  graph.addVertex('A');
  graph.addVertex('B');
  graph.addVertex('C');
  graph.addVertex('D');

  graph.addEdge('A', 'B');
  graph.addEdge('A', 'C');
  graph.addEdge('A', 'D');
  graph.addEdge('B', 'D');
  graph.addEdge('C', 'D');

graph.removeVertex('D');
  graph.printGraph();
}
