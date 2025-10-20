// Position/Größe des Rechtecks
float x = 130;
float y = 100;
float w = 60;
float h = 40;

void setup() {
  size(300, 150);
}
float pulsestep = 0;
void draw() {
  background(0);
  stroke(255);
  noFill();
  rect(x, y, w, h);
  fill(255);
  ellipse(mouseX, mouseY,  pulsestep%6 *4,pulsestep%6 * 4); // Mauszeiger
  float frakX = width / w;
  float frakY = height / h;
 ellipse(x +   mouseX / frakX ,y + mouseY / frakY,pulsestep%6,pulsestep%6);
pulsestep += 0.2;
}
