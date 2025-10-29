
paddle p1;
paddle p2;

int ballX;
int ballY;

int ballSize = 15;

int ballSpeedX = 5;
int ballSpeedY = 5;

void setup() {
  size(800, 800);
  p1 = new paddle(width/2, 0);

  p2 = new paddle(width/2, height);
  p2.y -= p2.sizeY;
  ballY = height/2;
  ballX = width/2 + 100;
  
  frameRate(20);
}

void drawBall()
{
  fill(0);
  rect(ballX, ballY, ballSize, ballSize);
}

void draw() {
  background(255);
  p1.makePaddle();
  p2.makePaddle();
  moveBall();
  drawBall();
}

void moveBall()
{
  ballX += ballSpeedX;
  ballY += ballSpeedY;

  //Boundry Checks

  //right
  if (ballX + ballSize >= width) {
    ballSpeedX *= -1;
    ballX = width - ballSize-1;
  }
  //left
  if (ballX < 0) {
    ballSpeedX *= -1;
    ballX = 0;
  }
  //top
  if (ballY < 0) {
    ballSpeedY *= -1;
    ballY = 0;
  }
  //bottom
  if (ballY + ballSize > height) {
    ballSpeedY *= -1;
    ballY = height-ballSize-1;
  }
  
  // paddle Collision Checks
  int px = p1.x;
  int py = p2.y;
  
  if (
}


class paddle
{
  int x;
  int y;
  int sizeX = 80;
  int sizeY = 15;
  public paddle(int x, int y)
  {
    this.x = x;
    this.y =y;
  }
  void makePaddle() {
    fill(0);
    rect(x, y, sizeX, sizeY);
  }
}
