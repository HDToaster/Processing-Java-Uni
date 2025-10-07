void setup(){
  size(800,800);
  background(255);
  noStroke();
  
  
}

void draw()
{
if (mousePressed == true && mouseButton == LEFT)
  {
    
    fill(mouseX,20,mouseY);
    circle(mouseX,mouseY,20);
    
    
    fill(pmouseX,20,pmouseY);
    circle(pmouseX,pmouseY,20);
  }
  
  if (mousePressed == true && mouseButton == RIGHT)
  {
    
    fill(0,20,0);
    circle(mouseX,mouseY,20);
    
    

  }
}

void keyPressed()
{
  if (key == ' '){
    background(255);
  }
}
