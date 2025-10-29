char keyLast;
int offset;
void setup(){
  background(0);
frameRate(1);
}
void draw(){
  background(0);
  text(frameCount-offset, 50,30);
}


void keyPressed(){
  background(0);
  keyLast = key;
text(keyLast,50,50);
}

void mouseClicked(){
offset = frameCount;
  background(0);
  text(0, 50,30);
}
