

class Square{
  
  int x;
  int y;
  Square previous;
  int distance = Integer.MAX_VALUE;
  
  Square(int ix, int iy){
    x = ix;
    y = iy;
    
  }
  
  Square(int[] pos){
    x = pos[0];
    y = pos[1];
  }
  
  String toString(){
    return (str(x) + " " + str(y));
  }
  
  int findDistance(Square squ){
    return (int) Math.sqrt((squ.y - y) * (squ.y - y) + (squ.x - x) * (squ.x - x));
  }
  
  int findDistance(Square squ, int noDiagonal){
    return abs(squ.y - y) + abs(squ.x - x);
  }
  
  boolean isBeside(Square squ){
    
    if (abs(this.x - squ.x) <= 1){
      if (abs(this.y - squ.y) <= 1) {
        return true;
      }
    }
    return false;
    
  }
  
  boolean isBeside(Square square, int noDiagonal){
    //add any int to noDiagonal to stop diagonal movement
    
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
