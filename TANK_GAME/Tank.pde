class Tank extends Object {
  //PVector pos;
 // boolean isPlayer = false;

  float dir;

  float turDir;
  PVector turSize;
  PVector turPos;
  float turretSpeed = 0.05f;

  float speed = 1;
  PVector hullSize;
  float hullTurnSpeed = 0.02f;

  float cannonSize=50;

  public Tank(int x, int y, PVector hullSize, PVector turSize, PVector turPos, int cannonsize) {
    super(x, y);
    pos = new PVector(x, y);
    dir = 0;
    turDir = 0;
    this.hullSize = hullSize;
    size.x = hullSize.x;
    size.y = hullSize.y;
    this.turSize = turSize;
    this.turPos = turPos;
    this.cannonSize = cannonsize;
  }


  void drawTank() {
    if(!isActive) return;
    pushMatrix();
    
    rectMode(CENTER);
    fill(100);
    strokeWeight(0);
    
    translate(pos.x, pos.y);
    rotate(radians(90));
    rotate(dir);
    
    rect(0, 0, hullSize.x, hullSize.y);
    
    fill(120);
    
    translate(turPos.x, turPos.y );
    rotate(turDir);
    
   
    rect(0, 0, turSize.x, turSize.y);

    //translate(turSize.x/2, 0);
    translate(0, -turSize.y/2);
    localGrid grid= new localGrid();
    grid.localDebugGrid();
    
    
    strokeWeight(3);
    stroke(49);
    
    line(0, 0, 0, -cannonSize);

    popMatrix();
  }

  void rotateTurret(ArrayList<Object> objects) {
    if (isPlayer) {
      if (keyPressed) {
        
        var testPos = new PVector(pos.x,pos.y);
        if (key == 'e') turDir += turretSpeed;
        if (key == 'q') turDir -= turretSpeed;

        if (key == 'a') dir -= hullTurnSpeed;
        if (key == 'd') dir += hullTurnSpeed;

        if (key == 's')
        {
          testPos.x-=cos(dir) *speed;
          testPos.y-= sin(dir)*speed;
        }
        if (key == 'w')
        {
          testPos.x+=cos(dir) *speed;
          testPos.y+= sin(dir)*speed;
        }
        
        boolean didHit = false;
        for (Object o: objects){
          rectMode(CORNER);
          if (testPos.x + size.x > o.pos.x && testPos.x < o.pos.x + o .size.x && testPos.y + size.y>o.pos.y && testPos.y < o.pos.y + o.size.y && o.isActive == true){
            didHit = true;
          }
        }
        if (!didHit){pos.x = testPos.x;pos.y = testPos.y;}
        
      }
    }
  }

  void move() {
  }


  void fire(ArrayList shellList) {
    float realAngle = dir + turDir;
    PVector spawnpos = new PVector(pos.x + cos(realAngle) * cannonSize, pos.y + sin(realAngle) * cannonSize);
    shell s = new shell(spawnpos, realAngle,isPlayer);
    shellList.add(s);
  }
  
  boolean hit(float x, float y,boolean isPlayerV){
    float sizeX = hullSize.x;
    float sizeY = hullSize.y;
    //printMatrix();
        if (x > pos.x && x < pos.x + sizeX && y > pos.y && y < pos.y + sizeY && isPlayer !=isPlayerV) {
      leben -= 1;
      println("TANK HIT (was player) " + isPlayer);
      if (leben < 0) {
        destroy();
      }
      return true;
    }
    return false;
  }

}
