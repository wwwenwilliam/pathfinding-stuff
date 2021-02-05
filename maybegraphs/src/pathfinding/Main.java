package pathfinding;
import java.util.*;
//trying to represent pacman grid as a graph

public class Main {

	public static void main(String[] args) {
		int[][] grid = {
		   {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
		   {2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2},
		   {2, 1, 2, 2, 2, 1, 2, 2, 2, 2, 1, 2, 2, 2, 1, 2},
		   {2, 1, 2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2, 1, 2},
		   {2, 1, 2, 1, 2, 2, 2, 0, 0, 2, 2, 2, 1, 2, 1, 2},
		   {2, 1, 1, 1, 1, 1, 2, 1, 1, 2, 1, 1, 1, 1, 1, 2},
		   {2, 1, 2, 2, 2, 1, 2, 1, 1, 2, 1, 2, 2, 2, 1, 2},
		   {2, 1, 2, 2, 2, 3, 2, 2, 2, 2, 3, 2, 2, 2, 1, 2},
		   {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
		   {2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2},
		   {2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2},
		   {2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2},
		   {2, 1, 2, 3, 1, 2, 1, 0, 1, 1, 2, 1, 3, 2, 1, 2},
		   {2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2, 1, 2, 2, 1, 2},
		   {2, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 2},
		   {2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2},
		   };
		
		List<Square> squares = allSquares(grid);
		Graph squareGraph = new Graph(squares);
		System.out.println(squareGraph.findShortestPath(squares.get(3), squares.get(30)));
		
		
		

	}
	
	static List<Square> allSquares(int[][] grid){
		List<Square> squares = new ArrayList<>();
		for (int i=0; i<16; i++) {
			for(int j=0; j<16; j++) {
				if(grid[i][j] != 2) {
					squares.add(new Square(j, i)); //has to be flipped cuz grid was flipped
				}
			}
		}
		return squares;
	}

}

class Square{
	//equivalent to a node
	int x;
	int y;
	
	Square(int x, int y){
		this.x = x;
		this.y = y;
	}
	
	public String toString() { //debug purposes
		return x +" "+ y;
	}
	
	boolean isConnected(Square square) {
		if (square.x == x+1 && square.y == y) {
			return true;
		} else if (square.x == x-1 && square.y == y) {
			return true;
		} else if (square.x == x && square.y == y+1) {
			return true;
		} else if (square.x == x && square.y == y-1) {
			return true;
		}
		return false;
	}
}

class Graph{
	HashMap<Square, List<Square>> graphDict = new HashMap<>();
	HashMap<Square, Integer> distanceMap = new HashMap<>();
	HashMap<Square, Square> preMap = new HashMap<>();
	
	Graph(List<Square> squareList){
		
		for (Square i : squareList) {
			graphDict.put(i, new ArrayList<>());
		}
		
		//adjacency list
		for (Square square : squareList) { //could be optimized
			for(Square inner : squareList) {
				if (square.isConnected(inner)) {
					graphDict.get(square).add(inner);
				}
			}
		}
	}
	
	void bfs(Square start) {	//i think this is bfs	
		List<Square> visited = new ArrayList<>();
		List<Square> queue = new ArrayList<>(); 
		List<Square> queue2 = new ArrayList<>();
		
		distanceMap.put(start, 0);
		queue.add(start);
		visited.add(start);
		
		Square current;
		Square currentAdjSquare;
		List<Square> adjSquares;
		int distance = 1;
		
		while(queue.size() > 0 || queue2.size() > 0) {
			current = queue.get(0);
			queue.remove(0);
			adjSquares = graphDict.get(current);
			
			for(int i=0; i<adjSquares.size(); i++) {
				currentAdjSquare = adjSquares.get(i);
				if(!visited.contains(currentAdjSquare)) {
					visited.add(currentAdjSquare);
					distanceMap.put(currentAdjSquare, distance);
					preMap.put(currentAdjSquare, current);
					
					queue2.add(currentAdjSquare);
				}
			}
			
			if(queue.size() == 0) {//finish all squares at one level before moving onto the next
				queue.addAll(queue2);
				queue2.clear();
				distance++;
			}
		}
	}
	
	List<Square> findShortestPath(Square start, Square end) {
		this.bfs(start);
		List<Square> path = new ArrayList<>();
		Square current = end;
		
		for(int i=0; i<distanceMap.get(end); i++) {
			path.add(preMap.get(current));
			current = preMap.get(current);
		}
		
		return path;
	}
	
	
	
}
