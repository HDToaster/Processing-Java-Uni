
PVector[] p;

int num = 0;

void setup() {
  size(800, 800);
  p = new PVector[1];
}

void draw() {
  for (int i = 0; i < num; i++) {
    circle(p[i].x, p[i].y, 15);
    if (i > 1){
      line(p[i-1].x,p[i-1].y,p[i].x,p[i].y);
    }
  }
}

void mousePressed() {
  if (num == 0) {
    p[num] = new PVector(mouseX, mouseY);

    num++;
  }

  if (p.length >= num) {
    PVector[] p2 = new PVector[num*2];
    for (int i = 0; i < num; i++) {
      p2[i] = p[i];
    }
    p = p2;
  }

  p[num] = new PVector(mouseX, mouseY);
  num++;
}
