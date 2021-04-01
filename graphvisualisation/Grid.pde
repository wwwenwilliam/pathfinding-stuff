

class Grid {
  int[][] squares;
  int lenX;
  int lenY;
  int[] start;
  int[] goal;
  
  Grid(int ilenX, int ilenY, int[] istart, int[] igoal){
    lenX = ilenX;
    lenY = ilenY;
    start = istart;
    goal = igoal;
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
            fill(50);
            break;
          case 2:
            //visited
            fill(100);
            break;
          case 3:
            //path
            fill(0, 255, 0);
            break;
          case 4:
            //start
            fill(255, 0, 0);
            break;
          case 5:
            //fill
            fill(0, 0, 255);
            break;
        }
        square(x+i*25, y+j*25, 25);
      }
    }
  }
  
  void switchWall(){
    //makes or deletes wall
    int x = mouseX/25;
    int y = mouseY/25;
    
    try {
      if (mouseButton == RIGHT)
        squares[x][y] = 0;
      else if (mouseButton == LEFT)
        squares[x][y] = 1;
    } catch (ArrayIndexOutOfBoundsException e) {
      //mouse out of range
    }
    

    
  }
  
}
