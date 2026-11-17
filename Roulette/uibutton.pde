class UIButton
{
  int x;
  int y;
  int h;
  int w;
  color c;
  color altC=color(75);
  color nC;
  UIButton(int x, int y, int h, int w,color c)
  {
     this.x=x;
     this.y=y;
     this.h=h;
     this.w=w;
     this.nC=c;
  }
  
  void drawButton()
  {
    fill(c);
    rect(x,y,h,w);
  }
  boolean isPressed()
  {
    
    if (mouseX>x &&mouseX < x+w && mouseY>y&& mouseY<y+h && mousePressed)
    {
      this.c =  altC;
      drawButton();
      return true;
    }this.c=nC;
    drawButton();
    return false;
  }
}
