int points = 0;

int bx;
int by;

int bSpeed = 10;
int bSize = 15;

int tx;
int ty;
int tSpeed = 4;

int tGap = 100;


color c;


void setup(){
  size(800,800);
  randomBallPos();
  tx = height-20;
  ty = width / 2 - tGap/2;
  frameRate(10);
}

void draw(){
background(255);
drawSprites();}

void drawSprites()
{
  fill(0);
  rect(bx,by,bSize,bSize);
  move();
  //Gate Draw
  stroke(c);
  strokeWeight(2);
  line(tx,0,tx,ty);
  line(tx, ty+ tGap,tx,height);
  
  
  
  stroke(0);
  text("Points : " + points,10,10);
}

void move()
{
  var dir = 0;
  if(keyPressed){
    if (keyCode == LEFT)dir = -1;
    if (keyCode == RIGHT)dir = 1;
  }
  
  ty += dir * tSpeed;
  
  if (ty <= 0 )ty = 0;
  if (ty >= height) ty = height;
  
  
  bx += bSpeed;
  if (bx > width){
    points+=1;
    randomBallPos();
  }
  
  //Line collision
  
  if (by<ty && bx + 2 + bSize > tx){
  randomBallPos();
  c = #BC0F0F;
  points-=1;
  }else
  if (by>ty + tGap && bx + 2 + bSize > tx){
  randomBallPos();
  c= #BC0F0F;
  points-=1;
  }
  else{c = color(0,0,0);}
}
void randomBallPos()
{
  by = (int) random(0,height);
  bx = 0;
}
