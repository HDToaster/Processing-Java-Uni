class Drop
{
  int x;
  int y;
  int size = 15;
  color dropColor;
  int speed = 1;
  
  Drop(){
    setRandom();
  }
  
  int move(){
    y += speed;
    if (y > height){
      setRandom();
      return 0;
    }
    return -1;
  }
  void drawDrop(){
  fill(dropColor);
  ellipse(x,y,size,size);
  }
  
  void setRandom(){
    x = (int) random(0,width);
    y = 0 - (int) random(0,height);
    dropColor = (int) random (0,256);
  }
}
