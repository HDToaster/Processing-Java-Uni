
class box

{
  int x;
  int y;
  int size;
  int maxX = 200;
  int minX = 20;
  int desiredX;

  void open() {
    int desiredX = maxX;
  }
  void close() {
    int desiredX = minX;
  }
  
  void drawBox(){
    fill(0);
    line(0,y,x,y);
    line(x,y,x,y+size);
    line(0,y+size,x,y+size);
  }
  
  void moveBox(){
    if (desiredX > x){
      x--;
    }
    if (desiredX < x){
      x++;
    }
  }
}


void setup() {
  y = 20;
}

void draw()
{
  if (mousePressed)
  {
  }
}
