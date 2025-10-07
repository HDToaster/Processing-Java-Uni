


void setup() {
  fullScreen();

  println("hello World");
  //PImage img = loadImage("background_2.png");

  //background(img);  color(155, 23, 70);
}
int off = 0;



void draw() {
  background(0);
  fill(100, 100, 100, 100);
  rect(0, 0, 500, 500);

  fill(255);
  ellipse(mouseX, mouseY, 20, 20);
  
  textSize(23);
  fill(255,0,255);
  text(str(mouseX) + " , " + str(mouseY), mouseX + 10, mouseY + 30);
  for (int x = 0; x < width; x++)
  {
    off ++;
    if (x % 50 == 0)
    {
      line(x, 100 + off, x, 159 * off);

      text(str(x), x, 100, 100, 100);
    }
  }
}
