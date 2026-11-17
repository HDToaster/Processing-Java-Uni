
int[][] colors;
void setup(){size(500,500);
  colors = new int[10][10];
  
  rectMode(CENTER);
  
    for (int i = 0; i <10; i++){
      for (int j = 0; j <10; j++){
    colors[i][j] = (int) random(0,255);
  }
  }
}

void draw(){
  for (int i = 0; i <10; i++){
      for (int j = 0; j <10; j++){
    zeichne(i,j);
  }
  }

}
void zeichne(int i,int j){
  fill(colors[i][j]);
  var pos = new PVector(i*50 + 25,j*50 + 25);
  var mouse = new PVector(mouseX,mouseY);
  circle(pos.x,pos.y,50);
  if (mouse.dist(pos) < 25){
    colors[i][j]+= 10;
    colors[i][j] %= 255;
}
 
  
}
