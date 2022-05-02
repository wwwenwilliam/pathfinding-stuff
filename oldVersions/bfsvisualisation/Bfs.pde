

class Bfs {
  
  int[][] walls;
  List<Square> squares;
  Square start;
  Square goal;
  Grid display;
  List<Square> queue = new ArrayList();
  List<Square> visited = new ArrayList();
  boolean started = false;
  boolean searched = false;
  
  
  Bfs(Grid idisplay, int[] istart, int[] igoal){
    
    display = idisplay;
    int[][] grid = display.squares;
    walls = new int[grid.length][grid[0].length];
    squares = new ArrayList();
    
    this.findWalls(grid);
    
    Square temp;
    for (int i=0; i<grid.length; i++) {
      for (int j=0; j<grid[i].length; j++){
        temp = new Square(i, j);
        squares.add(temp);
        if (i == istart[0] && j == istart[1]){
          start = temp;
        } else if (i == igoal[0] && j == igoal[1]){
          goal = temp;
        }
      }
    }
    
  }
  
  boolean isStarted(){
    return started;
  }
  
  void findWalls(int[][] grid){
    for (int i=0; i<grid.length; i++) {
      for (int j=0; j<grid[i].length; j++){
        if (grid[i][j] == 1){
          walls[i][j] = 1;
        } else {
          walls[i][j] = 0;
        }
      }
    }
    
  }
  
  void randomiseStart(){
    start = squares.get(int(random(0, squares.size()/2)));
    display.setGridSpot(start.x, start.y, 4);
  }
  
  void randomiseGoal(){
    goal = squares.get(int(random(squares.size()/2, squares.size())));
    display.setGridSpot(goal.x, goal.y, 5);
  }
  
  //processing only updates screen @ end of draw
  boolean bfsStart(){
    if (!(started)){
      queue.clear();
      visited.clear();
      
      queue.add(start);
      started = true;
      searched = false;
      
      this.findWalls(display.squares);
      return true;
    } else {
      return false;
    }
  }
  
  boolean bfsStep(){
    if (queue.size() == 0){
      started = false;
      return false;
    }
    if (started){
      int counter = queue.size();
      Square squ;
      for (int i=0; i<counter; i++) {
        squ = queue.get(0);
        //visit square
        visited.add(squ);
        display.visitSpot(squ.x, squ.y);
        //check goal
        if (squ == goal){
          started = false;
          searched = true;
          return false;
        }
        //queue adj squares
        for (Square square : squares){
          if (squ.isBeside(square, 1) && !(visited.contains(square)) && !(queue.contains(square))){
            if (walls[square.x][square.y] == 0){
              queue.add(square);
              square.previous = squ;
            }
          }
        }
        //pop current square
        queue.remove(0);
      }
    }
    return true;
  }
  
  List<Square> findPath(){
    List<Square> path = null;
    if (searched){
      path = new ArrayList();
      Square next = goal;
      while (next != null && next != start){
        path.add(next);
        next = next.previous;
      }
    }
    return path;
  }
    
}
  
  
