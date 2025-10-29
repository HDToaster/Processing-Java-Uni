PVector pos = new PVector(4,0);

PVector vec = new PVector(1,1);

int size = 15;

void setup(){
  pos.y = size /2;
  pos.x = size/2;
  
  
}

void draw(){
  
  background(0);
  pos.x += vec.x;
  pos.y += vec.y;
  
  //collision Checking
  var h = size/2;
  if (pos.x + h > width) vec.x*=-1;
  if (pos.x < 0)vec.x*=-1;
  if (pos.y + h > height)vec.y*=-1;
  if (pos.y - h < 0) vec.y*=-1;
  
  
  
  rectMode(CENTER);
  noStroke();
  fill(255,255,0);
  ellipse(pos.x,pos.y,size,size);
  stroke(255,0,0);
  
  PVector tvec = new PVector(vec.x,vec.y);
  tvec.mult(10);
  line(pos.x,pos.y,pos.x+tvec.x,pos.y+tvec.y);
  
  text(""+vec,20,20);
  
}
void keyPressed()

{
if (keyCode == LEFT) vec.x--;
if (keyCode == RIGHT)vec.x++;
if (keyCode == UP)vec.y--;
if (keyCode == DOWN)vec.y++;
}
