
int x = 20;
int y = 20;
boolean isDragged = false;

int xoffset=0;
int yoffset=0;

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
       xoffset=mouseX -x;
       yoffset=mouseY -y;
      
    }

    

    if (isDragged)
    {
      x = mouseX - xoffset;
      y = mouseY - yoffset;
    }
  }
  if (!mousePressed) {
      isDragged = false;
    }
  ellipse(x,y,20,20);
}
