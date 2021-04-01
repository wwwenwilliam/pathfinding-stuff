
Grid grid = new Grid(40, 20, new int[]{0, 0}, new int[]{30, 15});
Button bottomButton = new Button(310, 510, 180, 80);

void setup() {
  size(800, 600);
  
}


void draw(){
  background(0);
  
  grid.drawGrid(0, 0);
  bottomButton.drawButton();
  
  

}

void mouseDragged(){
  grid.switchWall();
}
