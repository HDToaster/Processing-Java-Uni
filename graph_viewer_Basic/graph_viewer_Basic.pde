
float scale = 2.0f;
float offset = 100f;

float xOffset;
void setup() {
  size(800, 800);

}

void draw() {
  
  background(0);
  if (mousePressed) {
    if (mouseButton == LEFT)scale+=0.3f;
    if (mouseButton == RIGHT)scale-=0.3f;
    
  }
  
  if (keyPressed){
    if (keyCode == LEFT)xOffset++;
    if (keyCode == RIGHT)xOffset--;
  }
  drawFunk();
  text("Scale: " + scale + " offset: "+ offset, 20, 20);
}



float function1(float x) {
  try {
    return 20* (sqrt(x)) * scale + offset ;
  }
  catch(ArithmeticException e) {
    e.printStackTrace();
    println(" Note at " + x);
    return 0;
  }
}


void drawFunk(){
  for (int i = 0; i < width; i++) {
    fill(255);
    ellipse(i, function1(i + xOffset),scale/ 100 +4,scale/ 100 + 4);
  }
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  offset+=e * 2;
  println(e);
}
