int x = 0;

void draw() {
  background(255);
  ellipse(width / 2, x, 20, 20);
  x++;

  if (x > width / 2) {
    x = width / 2;
  }
}
