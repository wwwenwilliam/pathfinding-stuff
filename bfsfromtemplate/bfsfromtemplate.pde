import java.util.*;

Grid grid = new Grid(32, 20, new int[]{0, 0}, new int[]{20, 10});
Search search = new Bfs(grid);
Button bottomButton = new Button(310, 510, 180, 80);

void setup() {
  size(800, 600);
  textAlign(CENTER, CENTER);
}


void draw(){
  background(0);
  
  grid.drawGrid(0, 0);
  bottomButton.drawButton("Find Path");
  
  if (search.isStarted()){
    search.stepFind();
    delay(50);
  }

}

//void mouseDragged(){
//  grid.clearPath();
//  grid.switchWall();
//}


void mousePressed(){
  if (bottomButton.isClicked()){
    grid.genRandomMap();
    search.startFind();
  }
}
