import java.util.SortedMap;

class Astar extends BaseSearch{
  
  Map<Integer, ArrayList<Square>> valueMap = new HashMap();
  
  Astar(Grid igrid){
    super(igrid);
  }
  
  void startFind(){
    super.startFind();
    valueMap = new HashMap();
  }
  
  void stepFind(){
    //give all queued things a value
    for (Square squ : queue){
      if (!valueMap.containsValue(squ)){
        int currentScore = findScore(squ);
        if(!valueMap.containsKey(currentScore)){
          valueMap.put(currentScore, new ArrayList());
        }
        valueMap.get(currentScore).add(squ);
      }
    }
    
    //find lowest cost squares, put in priority queue
    int minValue = Collections.min(valueMap.keySet());
    ArrayList<Square> pQueue = valueMap.get(minValue);
    valueMap.remove(minValue);
    
    //visit each square in pQueue, queue adj squares
    for (Square squ : pQueue) {
      visited.add(squ);
      queue.remove(squ);
      
      if (squ == goal){
        started = false;
        Square path = squ.previous;
        while (path != start){
          grid.setGridSpot(path.x, path.y, 3);
          path = path.previous;
          println(path);
        }
      }
      
      for (Square adjSqu : adjSquares.get(squ)){
        if (!(visited.contains(adjSqu) || queue.contains(adjSqu))){
          queue.add(adjSqu);
        }
        if (adjSqu.distance > (squ.distance + 1)){
          adjSqu.previous = squ;
          adjSqu.distance = squ.distance + 1;
        }
      }
    }
    
    //update graphics
    for (Square squ : queue) {
      if (squ != start && squ != goal){
        grid.setGridSpot(squ.x, squ.y, 2);
      }
    }
    
    
  }
  
  int findScore(Square squ){
    return (int) (squ.findDistance(start) + squ.findDistance(goal));
  }
  
  
  
  
}
