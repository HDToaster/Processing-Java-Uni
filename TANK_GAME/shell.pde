class shell extends Object{
  //PVector pos;
  float angle;
  PVector size;
  float speed = 2;
  //boolean isPlayer=false;
  localGrid grid;
  public shell(PVector pos, float angle,boolean isPlayer){
    this.pos = new PVector(pos.x,pos.y);
    this.angle = angle;
    this.isPlayer = isPlayer;
    grid = new localGrid();
    size = new PVector(3,10);
    //println("new shell angle : " + angle + " in radians : " + radians(angle));
  }
  
  void draws(){
    pushMatrix();
    fill(#FAB956);
    strokeWeight(0);
    float newX =pos.x +cos(angle) * speed;
    float newY =pos.y +sin(angle) * speed;
    pos.x = newX;
    pos.y = newY;
    
    translate(newX,newY);
    
    rotate(radians(90));
   //rotate(radians(angle));
    
    rotate(angle);
    rect(0,0,size.x,size.y);
    
    grid.localDebugGrid();
    popMatrix();
  }
}
