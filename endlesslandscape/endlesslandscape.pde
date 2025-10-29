int x1;
int y1;

int x2;
int y2;

int x3;
int y3;

int offset = width;

void setup() {

  y1 = int(random(0, height));

  y2 = int(random(0, height));

  y3 = int(random(0, height));

  x1 = 1;
  x2 = width +1;
  x3 = width * 2 +1;
}

void draw() {
  background(0);
  stroke(255);
  line(x1, y1, x2, y2);
  line(x2, y2, x3, y3);


  if (x1 == 0) {
    y3 = int(random(0, height));
    x3 = width * 2;
  }
  if (x2 == 0){
    x1 = 0;
    y1 = y2;
    x2 = x3;
    y2 = y3;
    y3 = int(random(0, height));
    x3 = width * 2;
    
  }
  

  /*
  if (x1 == 0){
   x3 = width*2;
   y3 = int(random(0,height));
   
   var temp = x1;
   var tempy = y1;
   x1 = x3;
   y1 = y3;
   
   
   }
   if (x2  == 0){
   x1 = width*2;
   y1 = int(random(0,height));
   }
   if (x3  == 0){
   x2 = width*2;
   x2 = int(random(0,height));
   }
   
   x1--;
   x2--;
   x3--;
   */

  if (mousePressed) {
    x1--;
    x2--;
    x3--;
  }
}

void keyPressed() {
  y1 = int(random(0, height));

  y2 = int(random(0, height));

  y3 = int(random(0, height));

  x1 = 0;
  x2 = width;
  x3 = width * 2;
}
