package aslist;
import java.util.*;
//representing graph as list of lists
//https://www.softwaretestinghelp.com/java-graph-tutorial/
public class Main {

	public static void main(String[] args) {
		List<Edge> edges = Arrays.asList(new Edge(0, 1, 2),new Edge(0, 2, 4),
                new Edge(1, 2, 4),new Edge(2, 0, 5), new Edge(2, 1, 4),
                new Edge(3, 2, 3), new Edge(4, 5, 1),new Edge(5, 4, 3));
		
		Graph graph = new Graph(edges);
		graph.printGraph();

	}

}

class Edge {
	//every edge has a origin and a destination and sometimes weight
	int from, to, weight;
	Edge(int from, int to, int weight){
		this.from = from;
		this.weight = weight;
		this.to = to;
	}
}

class Node{
	//nodes value is same as destination of an edge
	int value, weight;
    Node(int value, int weight)  {
        this.value = value;
        this.weight = weight;
    }
}

class Graph{
	ArrayList<ArrayList<Node>> graphList = new ArrayList<>();
	//node identified by index of outer list
	
	Graph(List<Edge> edges) {
		//part of init for graphList
		for(int i=0; i<edges.size(); i++) {
			graphList.add(i, new ArrayList<Node>());
		}
		
		//adding nodes based on edges
		for(Edge e : edges) {
			graphList.get(e.from).add(new Node(e.to, e.weight));
		}
	}
	
	void printGraph() {
		for(ArrayList<Node> nodes: graphList) {
			for(Node node : nodes) {
				System.out.print(node.value + (node.weight + ", "));
			}
			System.out.println();
		}
	}
}