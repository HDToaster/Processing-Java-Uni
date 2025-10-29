
int x = 20;
int y = 20;
boolean isDragged = false;

int dragDist = 10;


void setup() {
  size(800, 800);
}
void draw() {
  background(0);
  if (mousePressed)
  {
    var dist = sqrt(pow(x-mouseX, 2)+pow(y-mouseY,2));
    if (dist < dragDist && !isDragged)
    {
      isDragged = true;
    }

    

    if (isDragged)
    {
      x = mouseX;
      y = mouseY;
    }
  }
  if (!mousePressed) {
      isDragged = false;
    }
  ellipse(x,y,20,20);
}
