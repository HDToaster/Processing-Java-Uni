float x;
float y;

float angle;

float radius = 25;


void setup(){

size(800,800);
x = 50;
y = 50;}

void draw(){
  background(255);
  
  if (keyPressed  ){
  if (key == 'a')angle-=0.1f;
  if (key == 'd')angle+=0.1f;
  
  if ( key == 'w'){
    float newX = x+ cos(angle);
    float newY = y+ sin(angle);
    
    if (newX + radius/ 2 < width && newX-radius / 2 > 0 && newY + radius/ 2 < height && newY - radius/ 2 >0){
    x = newX;
    y = newY;
  }
  
  }
  
  
  }
  
  drawRoomba();
}


void drawRoomba(){
  circle(x,y,radius);
  
  translate(x,y);
  rotate(angle);
  circle(10,0,10);
}
