

void setup() {
  size(200, 200);
}



void draw() {
  background(70);
  
  
  //2.5a mitte
  line (0,0,mouseX,mouseY);
  
  float distance = sqrt(pow(mouseX,2)+pow(mouseY,2));
  fill(200);
  ellipse(mouseX /2,mouseY/2,20,20);
  fill(255);
  ellipse(mouseX ,mouseY,20,20);
  
  
  //2.5b
  
  fill(255);
  ellipse(mouseX,mouseY,20,20);
  fill(0);
  int localVarX = width-mouseX;
  int localVarY = height-mouseY;
  ellipse(localVarX,localVarY,20,20);
  
  
  //2.5c
  int scale =32;
  background(255);
  fill(0);

  rect(0,mouseY,scale,height);
  rect(scale *2 + scale /5,mouseY,scale*2,height);
  rect(scale *5 + (scale /5)*2 ,mouseY,scale,height);
  
  fill(255);
  strokeWeight(1);
  rect(scale-scale/2,height-mouseY,scale * 2,height);
  rect(scale*4 -scale/3.5, height-mouseY,scale*2,height);
  
  
  
  
}


  
