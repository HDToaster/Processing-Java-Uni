

void setup()
{
  size(800,800);
  frameRate(10);
  xPos = width / 2 + 50;
  yPos = height / 2;
  
  sprite =loadImage(path);
  sprite.resize(50,50);
}
PImage sprite;
String path = "dvd-logo-png-19252.png";

float xPos;
float yPos;
float xSpeed = 1;
float ySpeed = 1;
float speedMult = 5;
void draw()
{
  
  drawDVD();
  
}

void drawDVD(){
  moveDVD();
  
  //HERE
  //rectMode(CENTER);
  float div = width / 255;
  tint(xPos * div, 0.0f, yPos / div,255);
  image(sprite, xPos, yPos);
  
 
}
void moveDVD()
{
  println(str(xPos) + " x | y " + str(yPos));
  println(str(xSpeed) + " x | y " + str(ySpeed));
  xPos += xSpeed * speedMult;
  yPos += ySpeed * speedMult;
  //right x >
  if (xPos >= width)
  {
    xSpeed *= -1;
    xPos = width;
  }
  
  //left x < 0
  if (xPos <= 0)
    {
  xSpeed *= -1;
    xPos = 0;
  }
  //top
  if (yPos <= 0)
    {
  ySpeed *= -1;
    yPos = 0;
  }
  //bottom y > height
  if (yPos >= height)
    {
  ySpeed *= -1;
    yPos = height;
  }
}
