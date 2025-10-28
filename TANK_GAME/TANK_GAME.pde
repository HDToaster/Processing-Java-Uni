//TANK 2D GAME

Tank[] tanks = {
  new Tank(30,50,new PVector(20,40),new PVector(10,20),new PVector(5,10))
};

void setup(){
size(800,800);
}

void draw(){
tanks[0].drawTank();}
