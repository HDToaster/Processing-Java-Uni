floater[] floaters;

class floater
{
  float x,y,spd;
  boolean horizontal;
  floater(boolean horizontal)
  {
    this.horizontal=horizontal;
    x=random(0,width);
    y=random(0,height);
    spd=random(-1,1);
  }
  
  void drawself()
  {
    rect(x,y,20,20);
  }
  void updateself()
  {
    
    
    if (mousePressed)
    {
      if (mouseX>x && mouseX<x+20 && mouseY>y && mouseY<y+20)
      {
        //spd*=-1;
        horizontal= !horizontal;
      }
    }
    
    if (horizontal) x+=spd;
    else y+=spd;
    if (x+20>100)
    {
      spd*=-1;
      x=80;
    }
    if (x<0)
    {
      x=0;
      spd*=-1;
    }
    if (y+20>100)
    {
      spd*=-1;
      y=80;
    }
    if (y<0)
    {
      y=0;
      spd*=-1;
    }
  }
}

void setup()
{
  floaters=new floater[6];
  
  for (int i=0; i<floaters.length; i++)
  {
    if (i>floaters.length/2 ){ floaters[i]=new floater(false); }
    else { floaters[i]=new floater(true); }
  }
}

void draw()
{
  background(0);
  for (floater fl: floaters)
  {
    fl.updateself();
    fl.drawself();
  }
}
