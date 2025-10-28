
PVector[] p;

int num = 0;

void setup() {
  size(800, 800);
  p = new PVector[1];
}

void draw() {
  background(0);
  for (int i = 0; i < num; i++) {
    fill(255);
    noStroke();
    circle(p[i].x, p[i].y, 15);
    if (i > 1){
      stroke(255);
      strokeWeight(1);
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
  println(num);
}

void keyPressed(){
  if (keyCode == LEFT){
    for (int i = 0; i < num; i++){
      p[i].x --;
    }
  }
  if (keyCode == RIGHT)
  {
    for (int i = 0; i < num; i++){
      p[i].x ++;
    }
  }
    if (keyCode == UP){
    for (int i = 0; i < num; i++){
      p[i].y --;
    }
  }
  if (keyCode == DOWN)
  {
    for (int i = 0; i < num; i++){
      p[i].y ++;
    }
  }
  
  if (keyCode ==BACKSPACE){
    if (num < 3){
      p[0] = null;
      num = 0;
    }else if (num >=3){
      p[num] = null;
      num--;
      num = constrain(num,0,p.length+1);
    }
    
  }
}
