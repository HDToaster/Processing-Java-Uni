int x = 0;
int size = 0;
void draw() {
  background(255);
  ellipse(x, 50, 20+size, 20+size);
  x++;
  x++;

  if (x > width) {
    x = 0;
    size +=6;
    if ((size + 20 ) > width){size = 0;} 
  }
  
  
  if (mouseX >= width /2){
    fill(0);
    rectMode(CENTER);
    rect(mouseX,mouseY,20,20);
  }else{
    fill(255);
    rectMode(CENTER);
    ellipse(mouseX,mouseY,20,20);
  }
}

int chance=20;
void mousePressed(){
int rand = int(random(100));
print(rand);
if (100- chance < rand){println("WON!");}else{println("loose...");}
}
