
class Bfs extends BaseSearch{
  
  Bfs(Grid grid){
    super(grid);
  }
  
  void stepFind(){
    
    ArrayList<Square> toAdd = new ArrayList();
    for(Square squ : queue){
      visited.add(squ);
      
      if(squ == goal){
        started = false;
        Square last = squ;
        while (last != start) {
          last = last.previous;
          if(last == start)
            continue;
          grid.setGridSpot(last.x, last.y, 3);
        };
        return;
      }
      
      for(Square adj : adjSquares.get(squ)){
        if(!(visited.contains(adj) || queue.contains(adj) || toAdd.contains(adj))){
          adj.previous = squ;
          toAdd.add(adj);
        }
      }
      
      if(squ != start)
        grid.setGridSpot(squ.x, squ.y, 2);
    }
    
    queue.clear();
    queue = toAdd;
    
  }
  
  
  
  
}
