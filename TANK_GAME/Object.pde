class Object{
  PVector pos = new PVector();
  PVector size = new PVector();
  float angle;
  
  int leben;
  boolean isPlayer = false;
  Object(float x, float y){pos.x = x; pos.y = y;}
  Object(){}
  
  boolean isActive = true;
  
  
  void drawObj(){}
  
  void destroy(){isActive= false;}
  
  boolean hit(float x, float y,boolean isPlayer){
    
    return false;
  }
 
  
  float distance(float x, float y){
    PVector p = new PVector(x,y);
    return new PVector(pos.x,pos.y).dist(p);
  }

}
