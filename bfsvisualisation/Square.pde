


class Square {
  
  int x;
  int y;
  Square previous;
  
  Square(int ix, int iy){
    x = ix;
    y = iy;
    
  }
  
  String toString(){
    return (str(x) + " " + str(y));
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
