PImage hintergrundbild;

void setup() {
  hintergrundbild = loadImage("hintergrundbild.png");
}

void draw() {
  background(255);
  image(hintergrundbild, width/2, height/2);
}
