void setup()
{
  size(300,300);
 stroke(255);
 noFill();
}
float c=0;
int mult=1;

float cSmollSquare=1;
float cBigSquare=1;
void draw()
{
  background(0);
  
  translate(150,150);
 
  c+=0.1*mult;
  rotate(c);
 
  //triangle(0,0,25,-25,50,0);
  //triangle(-25,0,0,25,25,0);
  triangle(-25,25,0,0,25,25);
  
  pushMatrix();
  translate(25,25);
  rotate(cSmollSquare);
  rect(0,0,10,10);
  popMatrix();
  
  translate(-25,25);
  rotate(cBigSquare);
  rect(0,0,20,20);
}

void keyPressed()
{
  if (key=='1') 
  {
    cSmollSquare+=0.2;
  }
    if (key=='2') 
  {
    cBigSquare+=0.2;
  }
  if (key==' ')
  {
    mult*=-1;
  }
}
