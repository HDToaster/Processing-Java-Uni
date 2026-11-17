void setup()
{
  rectMode(CENTER);
  
  //one();
  //two();
  //three();
  //four();
  //five();
  //six();
  
}

void draw()
{
  //seven();
  eight();

}

void eight()
{
  background(25);
  translate(50,50);
  
  rotate(rot/50);
  rect(0,0,25,25);
  rot+=1;
  translate(50,0);
  circle(0,0,25);
}

void one()
{
  background(0);
  fill(255);
  
  translate(50,50);
  rotate(radians(45));
  rect(0,0,50,50);
}

void two()
{
  background(25);
  translate(50,50);
  rect(0,0,50,50);
  rotate(radians(45));
  rect(0,0,50,50);
}

void three(){
 background(25);
 rectMode(CORNER);
 for (int i=0;i<6;i++)
 {
   //pushMatrix();
   rect(5,5,80,80);
   scale(2);
   //popMatrix();
 }
}
void four()
{
  rectMode(CORNER);
  background(25);
  rotate(radians(45));
  translate(50,0);
  rect(0,0,25,25);
  translate(40,0);
  scale(0.5);
  rect(0,0,25,25);
}
void five()
{
  background(25);
  translate(50,50);
  int am=6;
  float rad= 360/am;
  for (int i = 0; i < am; i++)
  {
    pushMatrix();
    rotate(degrees(rad));
    rect(0,0,50,50);
  }
    for (int i = 0; i < am; i++)
  {
    popMatrix();
  }
  rect(0,0,50,50);
}

void six()
{
  background(25);
  translate(50,50);
  rect(0,0,15,15);
  for (int i = height; i >= 0; i-=5 )
  {
    rect(0,0,i,i);
  }
  
  for (int i=height;i >0;i-=5){
    rect(0,0,100,100);
    scale(0.9);
  }
}
float rot=0;
void seven()
{
  background(25);
  translate(50,50);
  rotate(rot);
  rot+=0.1;
  rect(0,0,50,50);
}
