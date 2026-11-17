int botS=60;
float x, y;
float rot=0;

void setup()
{
  size(600, 600);
  x=width/2;
  y=height/2;
}

void draw()
{
  background(0);
  rectMode(CENTER);
  noFill();
  stroke(255);
  translate(x, y);
  rotate(degrees(rot));
  circle(0, 0, botS);
  circle(0, -20, 20);
  dGrid();
  if (keyPressed){
    float oldX=x;
    float oldY=y;
  if (key == 'w')
  {
    x+=sin(degrees(rot)) *3;
   y-=cos(degrees(rot))*3;
  }
  if (key == 's')
  {
       x-=sin(degrees(rot))*3;
   y+=cos(degrees(rot))*3;
  }
  if (key == 'd')
  {
    rot+=0.1;
  }
  if (key == 'a')
  {
    rot-=0.1;
  }

  if (x+botS/2 > width)
  {
    x=oldX;
  }
    if (x< width)
  {
    x=oldX;
  }
    if (y+botS/2 > height)
  {
    y=oldY;
  }
      if (y+botS/2< 0)
  {
    y=oldY;
  }
}
  
}

void keyPressed(KeyEvent e)
{
  println("rot : ", (rot));
  println("rot : ", degrees(rot));
  println("sin(rot : ", sin(rot));
  println("cos(rot : ", cos(rot));
  println("x ", x);
  println("y ", y);
  
}

void dGrid()
{
  int gs=50;
  for (int i =-gs; i <gs; i+=6) {
    for (int j =-gs; j <gs; j+=6) {
      line(-gs, j, gs, j);
    }
  }
}
