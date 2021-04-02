
import java.util.*;
//trying to represent pacman grid as a graph

class Bfs {
  
  List<int[]> bfs(int[][] grid, int[] start, int[] goal) {
    Square startSquare = null;
    Square goalSquare = null;
    
    List<Square> squares = allSquares(grid);
    Graph squareGraph = new Graph(squares);
    
    for (Square square : squares){
      if (square.isSelf(start))
        startSquare = square;
      if (square.isSelf(goal))
        goalSquare = square;
    }
    
    List<Square> path = squareGraph.findShortestPath(startSquare, goalSquare);
    List<int[]> outPath = new ArrayList();
    
    for (Square square : path){
      outPath.add(new int[] {square.x, square.y});
    }
    
    return outPath;
  }
  
  List<Square> allSquares(int[][] grid){
    List<Square> squares = new ArrayList();
    for (int i=0; i<grid.length; i++) {
      for(int j=0; j<grid[i].length; j++) {
        if(grid[i][j] != 1) {
          squares.add(new Square(i, j));
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
  
  Square(int[] position){
    this.x = position[0];
    this.y = position[1];
  }
  
  @Override
  public String toString() { //debug purposes
    return x +" "+ y;
  }
  
  boolean isSelf(int[] position){
    if (this.x == position[0] && this.y == position[1])
      return true;
    return false;
    
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
  HashMap<Square, List<Square>> graphDict = new HashMap();
  HashMap<Square, Integer> distanceMap = new HashMap();
  HashMap<Square, Square> preMap = new HashMap();
  
  Graph(List<Square> squareList){
    
    for (Square i : squareList) {
      graphDict.put(i, new ArrayList<Square>());
    }
    
    //adjacency list
    for (Square square : squareList) {
      for(Square inner : squareList) {
        if (square.isConnected(inner)) {
          graphDict.get(square).add(inner);
        }
      }
    }

  }
  
  void bfs(Square start, Square goal) { 
    List<Square> visited = new ArrayList();
    List<Square> queue = new ArrayList(); 
    List<Square> queue2 = new ArrayList();
    
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
      
      if(current == goal)
            return;
      
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
    this.bfs(start, end);
    List<Square> path = new ArrayList();
    Square current = end;
    
    if (!(distanceMap.containsKey(end))) {
      println("NO PATH");
      return path;
    }
    
    for(int i=0; i<distanceMap.get(end); i++) {
      path.add(preMap.get(current));
      current = preMap.get(current);
    }
    
    return path;
  }
  
  
  
}
