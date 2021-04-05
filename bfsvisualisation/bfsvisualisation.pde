import java.util.*;


Grid grid = new Grid(40, 20, new int[]{0, 0}, new int[]{30, 15});
Button bottomButton = new Button(310, 510, 180, 80);
Bfs bfs = new Bfs(grid, new int[]{0, 0}, new int[]{30, 15});
List<Square> path = new ArrayList();

void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
  background(0);
  
}


void draw(){
  background(0);
  
  grid.drawGrid(0, 0);
  bottomButton.drawButton("Random map");
  
  if (bfs.bfsStep())
    delay(50);
    
  path = bfs.findPath();
  if (path != null){
    grid.addPath(path);
  }
}


void mouseDragged(){
  grid.clearPath();
  grid.switchWall();
}



void mouseReleased(){
  if (bottomButton.isClicked()){
    grid.clearPath();
    grid.genRandomMap();
    bfs.bfsStart();
  }
}
