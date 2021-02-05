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
		
		
		

	}
	
	static List<Square> allSquares(int[][] grid){
		List<Square> squares = new ArrayList<>();
		for (int i=0; i<16; i++) {
			for(int j=0; j<16; j++) {
				if(grid[i][j] == 1 || grid[i][j] == 3) {
					squares.add(new Square(j, i));
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
	
	//List<Square> findShortestPath() 
	
	
	
}
