

class Grid {
  int[][] squares;
  int lenX;
  int lenY;
  
  Grid(int ilenX, int ilenY, int[] start, int[] goal){
    lenX = ilenX;
    lenY = ilenY;
    squares = new int[lenX][lenY];
    
    squares[start[0]][start[1]] = 4;
    squares[goal[0]][goal[1]] = 5;
  }
  
  int getlenX() {
    return lenX;
  }
  
  int getlenY() {
    return lenY;
  }
  
  int[][] getSquares(){
    return squares;
  }
  
  int getGridSpot(int x, int y){
    return squares[x][y];
  }
  
  void setGridSpot(int x, int y, int thing){
    squares[x][y] = thing;
  }
  
  void visitSpot(int x, int y){
    if (squares[x][y] == 0){
      squares[x][y] = 2;
    }
  }
  
  void clearImportantPoints(){
    for(int i=0; i<lenX; i++){
      for(int j=0; j<lenY; j++){
        if (squares[i][j] == 4 || squares[i][j] == 5){
          squares[i][j] = 0;
        }
      }
    }
  }

  
  void drawGrid(int x, int y) {
    //draws grid to screen
    int gridNum;
    for(int i=0; i<lenX; i++){
      for(int j=0; j<lenY; j++){
        gridNum = squares[i][j];
        
        switch(gridNum) {
          case 0:
            //none
            fill(255);
            break;
          case 1:
            //wall
            fill(50);
            break;
          case 2:
            //visited
            fill(100);
            break;
          case 3:
            //path
            fill(0, 0, 255);
            break;
          case 4:
            //start
            fill(0, 255, 0);
            break;
          case 5:
            //goal
            fill(255, 0, 0);
            break;
        }
        square(x+i*10, y+j*10, 10);
      }
    }
  }
  
  void switchWall(){
    //makes or deletes wall
    int x = mouseX/10;
    int y = mouseY/10;
    
    try {
      if (mouseButton == RIGHT)
        squares[x][y] = 0;
      else if (mouseButton == LEFT)
        squares[x][y] = 1;
    } catch (ArrayIndexOutOfBoundsException e) {
      //mouse out of range
    }
      
  }
  
  void addPath(List<Square> path){
    for (Square position : path){
      if (squares[position.x][position.y] == 0 || squares[position.x][position.y] == 2)
        squares[position.x][position.y] = 3;
    }
  }
  
  void clearPath(){
    for(int i=0; i<lenX; i++){
      for(int j=0; j<lenY; j++){
        if (squares[i][j] == 3 || squares[i][j] == 2)
          squares[i][j] = 0;
      }
    }
    
  }
  
  void clearWalls(){
    for(int i=0; i<lenX; i++){
      for(int j=0; j<lenY; j++){
        if (squares[i][j] == 1)
          squares[i][j] = 0;
      }
    }
    
  }
  
  void genRandomMap(){
    this.clearWalls();
    for(int i=0; i<lenX; i++){
      for(int j=0; j<lenY; j++){
        if (squares[i][j] == 0 || squares[i][j] == 3) {
          if (random(0, 100) > 75)
            squares[i][j] = 1;
        }
      }
    }
    
  }
  
}
