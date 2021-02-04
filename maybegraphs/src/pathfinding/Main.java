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
	HashMap<Square, List<int[]>> graphDict = new HashMap<>();
	
	Graph(List<Square> squareList){
		
		for (Square i : squareList) {
			graphDict.put(i, new ArrayList<>());
		}
		
		for (Square square : squareList) { //could be optimized
			for(Square inner : squareList) {
				if (square.isConnected(inner)) {
					graphDict.get(square).add(new int[] {inner.x, inner.y});
				}
			}
			
		}
	}
	
	
}
