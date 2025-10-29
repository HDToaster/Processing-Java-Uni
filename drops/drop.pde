public class drop
{
  int x;
  int y;
  int speed = 5;
  int size = 20;
  color Color; 
  
  public drop(){
    randomStats();
  }
  
  public drop(int height)
  {
    x =(int) random(0,width);
    y = 0+size - (int) random(0,20+ height);
    Color = (int) random(256);
  }
  void move(){
    y += speed;
    if (y -size > height){
      randomStats();
    }
  }
  
 public void drawDrop()
{
  fill(Color);
  ellipse(x,y,size,size);
}

void randomStats(){
y = 0 - (int) random(0,20 );
      x =(int) random(0,width);
      Color = (int) random(256);
}
}
