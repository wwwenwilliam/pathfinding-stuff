

class Button {
  
  int x;
  int y;
  int lenX;
  int lenY;
  color buttonColor = color(255);
  
  Button(int ix, int iy, int ilenX, int ilenY){
    x = ix;
    y = iy;
    lenX = ilenX;
    lenY = ilenY;
  }
  
  boolean isClicked() {
    if (mouseX >= x && mouseX < x + lenX) {
      if (mouseY >= y && mouseY < y + lenY) {
        return true;
      }
    }
    return false;
  }
  
  void drawButton(String message) {
    fill(buttonColor);
    rect(x, y, lenX, lenY);
    fill(0);
    text(message, x+lenX/2, y+lenY/2);
  }
  
  
  
  
  
  
  
  
  
  
}
