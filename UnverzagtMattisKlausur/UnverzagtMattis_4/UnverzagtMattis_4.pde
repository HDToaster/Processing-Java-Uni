
smiley[] smileys= new smiley[5];
void setup()
{
  size(400,400);
  for (int i=0;i <smileys.length;i++)
  {
    smileys[i] = new smiley();
  }
}

void draw()
{
  background(20);
  for (var s: smileys)
  {
    s.drawSelf();
  }
}


class smiley
{
  
  
  float x,y;
  int state=0;
  
  smiley()
  {
  randomPos();
  }
  
  void randomPos()
  {
    this.x=random(0,width);
    this.y=-40 -random(0,150);
    this.state=0;
  }
  
  void drawSelf()
  {
    int s=state%3;
    println(s);
    if (s==0){fill(255,255,0);} // happy
    if (s==1){fill(0,0,255);} // neutral
    if (s==2){fill(255,0,0);} // not happy
    circle(x,y,40);
    
    
    if (s==0){arc(x,y+4,20,5,0,PI);} // happy
    if (s==1){line(x-10,y,x+15,y);} // neutral
    if (s==2){arc(x,y+4,20,5,PI,0);}
    
    fill(0);
    circle(x-3,y-10,2);
    circle(x+5,y-10,2);
    
    y+=1;
    
    
    if (y>height+40)
    {
      randomPos();
    }
  }
  
  void pressed()
  {
    float dist = sqrt( pow((x-mouseX),2) + pow((y-mouseY),2) );
    if (dist<=20)
    {
      state+=1;
    }
    
    
  }
}

void mousePressed()
{
  for (var s: smileys)
  {
     s.pressed();
  }
}
