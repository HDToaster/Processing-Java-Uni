
class Box
{
  int minX = 20;
  int x = minX;
  int y;
  int size = 15;
  int maxX = 200;

  int desiredX;
  
  
  Box(int y) {
    this.y = y;
    desiredX = minX;
  }

  void switchBox(){
    if (desiredX == maxX){
      close();
    }else{openB();}
  }

  void openB() {
    int desiredX = maxX;
  }
  void close() {
    int desiredX = minX;
  }

  void drawBox() {
    fill(0);
    line(0, y, x, y);
    line(x, y, x, y+size);
    line(0, y+size, x, y+size);
  }

  void moveBox() {
    if (desiredX > x) {
      x--;
    }
    if (desiredX < x) {
      x++;
    }
  }

  void testMaus() {
    var mx = mouseX;
    var my = mouseY;
    if (mx < x && my > y && my < y+size) {
      println("HIT");
      switchBox();
    }
  }
}



Box b1;
void setup() {
  b1 = new Box(20);
}

void draw()
{
  background(255);
  if (mousePressed)
  {
    
  }

  b1.drawBox();
  b1.moveBox();
}

void mousePressed(){
b1.testMaus();
}
