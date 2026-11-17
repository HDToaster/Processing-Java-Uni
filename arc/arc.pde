
float x,y;
void setup()
{
  size(800,800);
  x=0;
  y=0;
  noStroke();
}

void draw()
{
  background(0);
  arc(20,300,20,20,x,y);
  
  
}

void keyPressed()
{
  if (key=='d') {x+=0.2;}
  if (key=='a') {x-=0.2;}
  if (key=='w') {y+=0.2;}
  if (key=='s') {y-=0.2;}
  if (key==' ') {x=0;y=0;}
  println("x:"+x);
  println("y:"+y);
}
