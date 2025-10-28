class Tank{
  PVector pos;
  float dir;
  
  PVector turDir;
   PVector turSize;
   PVector turPos;
  
  PVector hullSize;
  
  float cannonSize=5;
  
  public Tank(int x,  int y,PVector hullSize,PVector turSize,PVector turPos,int cannonsize){
    pos = new PVector(x,y);
    dir = 0;
    turDir = new PVector();
    this.hullSize = hullSize;
    this.turSize = turSize;
    this.turPos = turPos;
    this.cannonSize = cannonsize;
  }
  
  
  void drawTank(){
  fill(100);
  rect(pos.x,pos.y,hullSize.x,hullSize.y);
  fill(120);
  rect(pos.x+turPos.x,pos.y+turPos.y,turSize.x,turSize.y);
  line(
  }
  
}
