
int punkte = 0;
int leben = 5;

int x;
int y;
int paddleSize = 100;
int paddleSpeed = 5;
int inputDirection = 0;

Drop[] drops;
int dropAmount = 5;
void setup() {
  size(400, 400);
  drops = new Drop[dropAmount];
  for (int i = 0; i < dropAmount; i++) {
    drops[i] = new Drop();
  }
  y = height - 20;
}

void draw() {
  background(255);
  for (int i = 0; i < dropAmount; i++) {
    var result = drops[i].move();
    if (x == -1)
    {
      leben -= 1;
    }
    drops[i].drawDrop();

    var px = drops[i].x;
    var py = drops[i].y;
    var psize = drops[i].size;
    
    if (px +psize > x && px - psize < x +paddleSize && py + psize/2> y)
  {
    drops[i].y = height + (int) random(50);
    punkte += 5;
  }
  }


  drawUI();
  rect(x, y, paddleSize, 10);

  if (keyPressed)
  {
    if (keyCode == LEFT)
    {
      inputDirection = -1;
    } else if (keyCode == RIGHT) {
      inputDirection = 1;
    } else {
      inputDirection = 0;
    }

    x += inputDirection * paddleSpeed;
  }
}


void drawUI() {
  fill(0);
  text("Punkte : " + punkte, 10, 10);
  text("Leben : "+ leben, width /2, 10);
}
