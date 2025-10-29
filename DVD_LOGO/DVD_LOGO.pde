

void setup()
{
  size(800, 600);
  frameRate(20);
  xPos = width / 2 + 100;
  yPos = height - 100;

  sprite =loadImage(path);
  sprite.resize(50, 50);
  sprite.filter(INVERT);
  
}
PImage sprite;
String path = "dvd-logo-png-19252.png";

float xPos;
float yPos;
float xSpeed = 1;
float ySpeed = 1;
int dvdSize = 40;
float speedMult = 5;
void draw()
{
  sprite =loadImage(path);
  sprite.resize(50, 50);
  sprite.filter(INVERT); 
  moveDVD();
  drawDVD();
}



void drawDVD() {


  //HERE
  //rectMode(CENTER);
  float div = width / 255;



  //PImage spriteTemp = sprite.tint(int(xPos),20,int(yPos));
  //PImage temp = loadImage(path);
  //temp.resize();
  PImage temp = sprite;
  int dimensions = sprite.width * sprite.height;
  temp.loadPixels();
  
  
  
  for (int i=0; i < dimensions;i+=1)
{
  
  
  if (temp.pixels[i] >= color(253) && temp.pixels[i] < 50){
    temp.pixels[i] = color(xPos / 3, 255 - xPos / 3 - yPos/3 ,yPos / 3);
  }
}temp.updatePixels();
  image(temp, xPos, yPos);
}
void moveDVD()
{
  println(str(xPos) + " x | y " + str(yPos));
  println(str(xSpeed) + " x | y " + str(ySpeed));
  xPos += xSpeed * speedMult;
  yPos += ySpeed * speedMult;
  //right x >
  if (xPos + dvdSize >= width)
  {
    xSpeed *= -1;
    xPos = width - dvdSize;
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
  if (yPos+dvdSize >= height)
  {
    ySpeed *= -1;
    yPos = height-dvdSize;
  }
}
