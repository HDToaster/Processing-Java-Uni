float x=0;
float y=0;
float dx,dy;
float spd=1;
//color c= new color(255,0,0);
color c= color(255,255,255);
void setup()
{
  
  size(200,200);
  background(0);
  init();
}


void draw()
{
  background(0);
  x+=dx;
  y+=dy;
  if (x>180){ x=180; dx*=-1;c= color(255,255,0);}
  if (x<20){ x=20; dx*=-1;c= color(255,255,0);}
  if (y>180){ y=180; dy*=-1; c= color(0,255,0);}
  if (y<20){ y=20; dy*=-1;c= color(0,255,0);}
  fill(c);
  circle(x,y,40);
}

void init()
{
  dx=random(-5,5);
  dy=random(-5,5);
  //x=random(40,160);
  //y=random(40,160);
  x=100;
  y=100;
}
void keyPressed()
{
init();
}
