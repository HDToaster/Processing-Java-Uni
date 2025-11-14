//TANK 2D GAME



//NOTE :

//Ternäerer Operator
//BEDINGUNG ? FALL1 : FALL2

Tank[] tanks = {
  new Tank(800  / 2, 800 / 2, new PVector(20, 40), new PVector(10, 20), new PVector(0, 0), 1),
  new Tank(670, 800 / 2, new PVector(20, 40), new PVector(10, 20), new PVector(0, 0), 15)
};

ArrayList<shell> shells = new ArrayList<shell>();
ArrayList<Object> objects = new ArrayList<Object>();


void setup() {
  size(800, 800);
  frameRate(60);
  //printMatrix();
  
  tanks[0].isPlayer = true;
  tanks[1].isPlayer = false;

  //Random Shells
  for (int i = 0; i < 4; i++) {

    shell s = new shell(new PVector(random(width), random(height)), random(360),false);
    shells.add(s);
  }
  for (Tank t : tanks){
    objects.add(t);
  }
  objects.add(new Haus(10,20));
  objects.add(new Haus(300,200));
  objects.add(new Haus(800,200));
  objects.add(new Haus(600,200));
  objects.add(new Haus(300,800));
  objects.add(new Haus(531,450));


 pushMatrix();
}


void draw() {

  background(229);
  
  
  
  //PLAYER INPUT
  for (Tank t : tanks) {
    t.rotateTurret(objects);
    t.move();
    t.drawTank();
  }


//MOVE SHELLS

  for (shell s : shells) {
    if(!s.isActive){
      continue;
    }
    //SHELL COLLISION
    for (Object o : objects) {
          if(!o.isActive){
      continue;
    }
      var res = o.hit(s.pos.x,s.pos.y,s.isPlayer);
      
      
      
      if (res){
        
        
        s.speed = 0;
        s.isActive = false;
        
        
      }
      
    
    s.draws();
  }}
  
  
  //OBECJT CALLS
  for (Object o : objects) {
    o.drawObj();
  }
}

void mousePressed() {
  tanks[0].fire(shells);
}
