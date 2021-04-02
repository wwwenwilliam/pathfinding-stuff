
Grid grid = new Grid(40, 20, new int[]{0, 0}, new int[]{30, 15});
Button bottomButton = new Button(310, 510, 180, 80);
List<int[]> path = new ArrayList();

void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  
}


void draw(){
  background(0);
  
  grid.drawGrid(0, 0);
  bottomButton.drawButton("Find Path");
  
  //path = null;
  grid.addPath(path);

}

void mouseDragged(){
  grid.clearPath();
  grid.switchWall();
}

/*
void mousePressed(){
  if (bottomButton.isClicked()){
    grid.clearPath();
    path = null;
    grid.addPath(path);
  }
}
*/
