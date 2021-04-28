import java.util.SortedMap;

class Astar extends BaseSearch{
  
  Map<Integer, ArrayList<Square>> valueMap = new HashMap();
  
  Astar(Grid igrid){
    super(igrid);
  }
  
  void startFind(){
    super.startFind();
    
    
    
    
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
    
    //find lowest cost squares, put in queue
    
    
    
  }
  
  int findScore(Square squ){
    return (int) (squ.findDistance(start) + squ.findDistance(goal));
  }
  
  
  
  
}
